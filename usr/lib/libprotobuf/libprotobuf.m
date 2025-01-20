void wireless_diagnostics::google::protobuf::strings::Substitute( char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, std::string *a9@<X8>, __int128 a10, uint64_t a11)
{
  __int128 v11;
  a9->__r_.__value_.__r.__words[0] = 0LL;
  a9->__r_.__value_.__l.__size_ = 0LL;
  a9->__r_.__value_.__l.__cap_ = 0LL;
  *((void *)&v11 + 1) = a10;
  *(void *)&v11 = a8;
  wireless_diagnostics::google::protobuf::strings::SubstituteAndAppend( a9,  a1,  a2,  a3,  a4,  a5,  a6,  a7,  v11,  *((uint64_t *)&a10 + 1),  a11);
}

void sub_187C34040(_Unwind_Exception *exception_object)
{
}

void wireless_diagnostics::google::protobuf::strings::SubstituteAndAppend( std::string *this, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10, uint64_t a11)
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  uint64_t v33 = a3;
  v34[0] = a4;
  v34[1] = a5;
  v34[2] = a6;
  v34[3] = a7;
  v34[4] = a8;
  __int128 v35 = a9;
  uint64_t v36 = a10;
  uint64_t v37 = a11;
  uint64_t v38 = 0LL;
  int v11 = *a2;
  if (!*a2) {
    return;
  }
  uint64_t v12 = a3;
  v14 = this;
  int v15 = 0;
  LODWORD(v16) = 0;
  do
  {
    if (v11 == 36)
    {
      uint64_t v16 = (int)v16 + 1LL;
      int v17 = a2[v16];
      if ((v17 - 48) <= 9)
      {
        int v18 = *(_DWORD *)(v34[(v17 - 48) - 1] + 8);
        if (v18 != -1)
        {
          v15 += v18;
          goto LABEL_9;
        }

        wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
        wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
        wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
        wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
        uint64_t v20 = 0LL;
        do
        {
          if (*(_DWORD *)(v12 + 8) == -1) {
            break;
          }
          uint64_t v12 = v34[v20++];
        }

        while (v12);
        wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
        wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
        std::string::basic_string[abi:ne180100]<0>(v28, a2);
        wireless_diagnostics::google::protobuf::CEscape((uint64_t)v28, __p);
        wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
        wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
        wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
LABEL_36:
        if (v31 < 0) {
          operator delete(__p[0]);
        }
        if (v29 < 0) {
          operator delete(v28[0]);
        }
        wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v32);
        return;
      }

      if (v17 != 36)
      {
        wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
        wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
        std::string::basic_string[abi:ne180100]<0>(v28, a2);
        wireless_diagnostics::google::protobuf::CEscape((uint64_t)v28, __p);
        wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
        wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
        wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
        goto LABEL_36;
      }
    }

    ++v15;
LABEL_9:
    uint64_t v16 = (int)v16 + 1LL;
    int v11 = a2[v16];
  }

  while (a2[v16]);
  if (v15)
  {
    else {
      LODWORD(size) = this->__r_.__value_.__s.__size_;
    }
    std::string::resize(this, v15 + (int)size, 0);
    if ((char)v14->__r_.__value_.__s.__size_ < 0)
    {
      if (!v14->__r_.__value_.__l.__size_) {
        goto LABEL_24;
      }
      v14 = (std::string *)v14->__r_.__value_.__r.__words[0];
    }

    else if (!v14->__r_.__value_.__s.__size_)
    {
LABEL_24:
      v14 = 0LL;
    }

    int v21 = 0;
    v22 = (char *)v14 + (int)size;
    while (2)
    {
      int v23 = a2[v21];
      if (v23 == 36)
      {
        uint64_t v24 = v21 + 1LL;
        uint64_t v25 = a2[v24];
        if ((v25 - 48) > 9)
        {
          if ((_DWORD)v25 != 36) {
            goto LABEL_29;
          }
          *v22++ = 36;
        }

        else
        {
          v26 = (const void ***)&v34[v25 - 49];
          v27 = *v26;
          memcpy(v22, **v26, *((int *)*v26 + 2));
          v22 += *((int *)v27 + 2);
        }
      }

      else
      {
        if (!a2[v21]) {
          return;
        }
        *v22++ = v23;
LABEL_29:
        LODWORD(v24) = v21;
      }

      int v21 = v24 + 1;
      continue;
    }
  }
}

void sub_187C34374( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *__p, uint64_t a18, int a19, __int16 a20, char a21, char a22, char a23)
{
  if (a22 < 0) {
    operator delete(__p);
  }
  if (a16 < 0) {
    operator delete(a11);
  }
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)&a23);
  _Unwind_Resume(a1);
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
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000LL;
    *a1 = v6;
  }

  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
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
  __cxa_throw(exception, (struct type_info *)off_18A11ACF8, MEMORY[0x1896141F8]);
}

void sub_187C344DC(_Unwind_Exception *a1)
{
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x189614778] + 16LL);
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::UTF8GenericScan( unsigned int *a1, _BYTE *a2, int a3, _DWORD *a4)
{
  *a4 = 0;
  if (!a3) {
    return 241LL;
  }
  unint64_t v4 = (unint64_t)&a2[a3];
  unint64_t v5 = v4 - 7;
  uint64_t v6 = *((void *)a1 + 4) + *a1;
  uint64_t v7 = *((void *)a1 + 7);
  uint64_t v8 = a2;
  while (2)
  {
    uint64_t v9 = v8 & 7;
    if ((v8 & 7) != 0 && (unint64_t)v8 < v4)
    {
      char v10 = (_BYTE)v8 + 1;
      while (!*(_BYTE *)(v7 + *v8))
      {
        ++v8;
        uint64_t v9 = v10 & 7;
        if ((v10 & 7) != 0)
        {
          ++v10;
        }

        goto LABEL_9;
      }

LABEL_17:
      int v11 = v8;
      goto LABEL_18;
    }

LABEL_9:
    int v11 = v8 + 4;
    while (1)
    {
      unint64_t v12 = *(v11 - 1);
      if (((((_DWORD)v12 - a1[6]) | ((_DWORD)v12 + a1[7]) | (*v11 - a1[6]) | (*v11 + a1[7])) & 0x80808080) != 0) {
        break;
      }
LABEL_15:
      v13 = v11 + 2;
      v14 = v11 + 1;
      v11 += 2;
      if ((unint64_t)v14 >= v5)
      {
        int v11 = v13 - 1;
        goto LABEL_18;
      }
    }

    if (!(*(unsigned __int8 *)(v7 + BYTE1(v12)) | *(unsigned __int8 *)(v7 + v12) | *(unsigned __int8 *)(v7 + BYTE2(v12)) | *(unsigned __int8 *)(v7 + (v12 >> 24))))
    {
      goto LABEL_15;
    }

    --v11;
LABEL_18:
    if ((unint64_t)v11 < v4)
    {
      unint64_t v15 = v4 - (void)v11;
      uint64_t v16 = (char *)v11 - 1;
      uint64_t v17 = *((void *)a1 + 4) + *a1;
      uint64_t v8 = v11;
      while (1)
      {
        uint64_t v18 = *(unsigned __int8 *)(v17 + *v8);
        ++v8;
        uint64_t v17 = v6 + (int)((_DWORD)v18 << a1[4]);
        ++v16;
        if (!--v15)
        {
          LODWORD(v8) = v4;
          goto LABEL_29;
        }
      }

      if (a1[1] <= (int)v17 - (int)v6)
      {
        do
        {
          uint64_t v8 = v16;
          if (v16 <= a2) {
            break;
          }
          --v16;
        }

        while ((*v8 & 0xC0) == 0x80);
      }

      if ((_DWORD)v18 != 253) {
        goto LABEL_39;
      }
      continue;
    }

    break;
  }

  LODWORD(v8) = (_DWORD)v11;
  LODWORD(v17) = a1[8] + *a1;
LABEL_29:
  if (a1[1] <= (int)v17 - (int)v6)
  {
    else {
      v19 = v11;
    }
    uint64_t v20 = (char *)v19 - 1;
    do
    {
      uint64_t v8 = v20;
      if (v20 <= a2) {
        break;
      }
      --v20;
    }

    while ((*v8 & 0xC0) == 0x80);
    uint64_t v18 = 240LL;
  }

  else
  {
    uint64_t v18 = 241LL;
  }

LABEL_39:
  *a4 = (_DWORD)v8 - (_DWORD)a2;
  return v18;
}

      *a3 = v25;
      a3[1] = v21;
      a3[2] = &v16[8 * v15];
      if (v26) {
        operator delete(v26);
      }
LABEL_41:
      a3[1] = v21;
      goto LABEL_42;
    }

  ++*(void *)(a1 + 24);
  return i;
}

uint64_t wireless_diagnostics::google::protobuf::internal::UTF8GenericScanFastAscii( unsigned int *a1, unint64_t a2, int a3, _DWORD *a4)
{
  *a4 = 0;
  if (!a3) {
    return 241LL;
  }
  unint64_t v8 = a2 + a3;
  unint64_t v9 = a2;
  do
  {
    unint64_t v10 = v9 & 7;
    if ((v9 & 7) != 0 && v9 < v8)
    {
      char v11 = v9 + 1;
      while ((*(char *)v9 & 0x80000000) == 0)
      {
        ++v9;
        unint64_t v10 = v11 & 7;
        if ((v11 & 7) != 0)
        {
          ++v11;
          if (v9 < v8) {
            continue;
          }
        }

        goto LABEL_9;
      }
    }

    else
    {
LABEL_9:
      if (!v10)
      {
        while (v9 < v8 - 7 && ((*(_DWORD *)(v9 + 4) | *(_DWORD *)v9) & 0x80808080) == 0)
          v9 += 8LL;
      }
    }

    if (v9 < v8)
    {
      unint64_t v12 = v8 - v9;
      while ((*(char *)v9 & 0x80000000) == 0)
      {
        ++v9;
        if (!--v12)
        {
          unint64_t v9 = v8;
          break;
        }
      }
    }

    uint64_t result = wireless_diagnostics::google::protobuf::internal::UTF8GenericScan( a1,  (_BYTE *)(a2 + (int)v9 - (int)a2),  a3 - ((int)v9 - (int)a2),  &v14);
    v9 += v14;
  }

  while ((_DWORD)result == 253);
  *a4 = v9 - a2;
  return result;
}

BOOL wireless_diagnostics::google::protobuf::internal::IsStructurallyValidUTF8( wireless_diagnostics::google::protobuf::internal *this, const char *a2)
{
  int v2 = (int)a2;
  int v4 = 0;
  wireless_diagnostics::google::protobuf::internal::UTF8GenericScanFastAscii( wireless_diagnostics::google::protobuf::internal::utf8acceptnonsurrogates_obj,  (unint64_t)this,  (int)a2,  &v4);
  return v4 == v2;
}

BOOL wireless_diagnostics::google::protobuf::Message::DebugString@<W0>( wireless_diagnostics::google::protobuf::Message *this@<X0>, void *a2@<X8>)
{
  *a2 = 0LL;
  a2[1] = 0LL;
  a2[2] = 0LL;
  *(int *)((char *)v3 + 3) = 0;
  v3[0] = 0;
  return wireless_diagnostics::google::protobuf::TextFormat::Printer::PrintToString(v3, this, (uint64_t)a2);
}

void sub_187C348D0(_Unwind_Exception *exception_object)
{
}

BOOL wireless_diagnostics::google::protobuf::TextFormat::PrintToString( const wireless_diagnostics::google::protobuf::Message *a1, uint64_t a2)
{
  *(int *)((char *)v3 + 3) = 0;
  v3[0] = 0;
  return wireless_diagnostics::google::protobuf::TextFormat::Printer::PrintToString(v3, a1, a2);
}

void wireless_diagnostics::google::protobuf::Message::ShortDebugString( wireless_diagnostics::google::protobuf::Message *this@<X0>, std::string *a2@<X8>)
{
  a2->__r_.__value_.__r.__words[0] = 0LL;
  a2->__r_.__value_.__l.__size_ = 0LL;
  a2->__r_.__value_.__l.__cap_ = 0LL;
  __int16 v8 = 0;
  int v6 = 0;
  char v7 = 1;
  wireless_diagnostics::google::protobuf::TextFormat::Printer::PrintToString(&v6, this, (uint64_t)a2);
  std::string::size_type size = a2->__r_.__value_.__s.__size_;
  if ((char)a2->__r_.__value_.__s.__size_ < 0)
  {
    std::string::size_type v4 = a2->__r_.__value_.__l.__size_;
    if (!v4) {
      return;
    }
  }

  else
  {
    if (!a2->__r_.__value_.__s.__size_) {
      return;
    }
    std::string::size_type v4 = a2->__r_.__value_.__s.__size_;
  }

  std::string::size_type v5 = v4 - 1;
  if ((size & 0x80) != 0)
  {
    if (*(_BYTE *)(a2->__r_.__value_.__r.__words[0] + v5) != 32) {
      return;
    }
    std::string::size_type size = a2->__r_.__value_.__l.__size_;
    goto LABEL_10;
  }

  if (a2->__r_.__value_.__s.__data_[v5] == 32) {
LABEL_10:
  }
    std::string::resize(a2, size - 1, 0);
}

void sub_187C349C4(_Unwind_Exception *exception_object)
{
}

_DWORD *wireless_diagnostics::google::protobuf::TextFormat::Printer::Printer(_DWORD *this)
{
  *(_DWORD *)((char *)this + 3) = 0;
  *this = 0;
  return this;
}

{
  *(_DWORD *)((char *)this + 3) = 0;
  *this = 0;
  return this;
}

BOOL wireless_diagnostics::google::protobuf::TextFormat::Printer::PrintToString( int *a1, const wireless_diagnostics::google::protobuf::Message *a2, uint64_t a3)
{
  if (*(char *)(a3 + 23) < 0)
  {
    **(_BYTE **)a3 = 0;
    *(void *)(a3 + 8) = 0LL;
  }

  else
  {
    *(_BYTE *)a3 = 0;
    *(_BYTE *)(a3 + 23) = 0;
  }

  wireless_diagnostics::google::protobuf::io::StringOutputStream::StringOutputStream();
  BOOL v5 = wireless_diagnostics::google::protobuf::TextFormat::Printer::Print(a1, a2, (uint64_t)v7);
  MEMORY[0x1895B3490](v7);
  return v5;
}

BOOL wireless_diagnostics::google::protobuf::Message::Utf8DebugString@<W0>( wireless_diagnostics::google::protobuf::Message *this@<X0>, void *a2@<X8>)
{
  *a2 = 0LL;
  a2[1] = 0LL;
  a2[2] = 0LL;
  *(int *)((char *)v3 + 3) = 0x1000000;
  v3[0] = 0;
  return wireless_diagnostics::google::protobuf::TextFormat::Printer::PrintToString(v3, this, (uint64_t)a2);
}

void sub_187C34AC4(_Unwind_Exception *exception_object)
{
}

void wireless_diagnostics::google::protobuf::Message::PrintDebugString( wireless_diagnostics::google::protobuf::Message *this)
{
  if (v3 >= 0) {
    uint64_t v1 = __p;
  }
  else {
    uint64_t v1 = (void **)__p[0];
  }
  printf("%s", (const char *)v1);
  if (v3 < 0) {
    operator delete(__p[0]);
  }
}

void *wireless_diagnostics::google::protobuf::TextFormat::ParseInfoTree::ParseInfoTree(void *this)
{
  this[1] = 0LL;
  *this = this + 1;
  this[5] = 0LL;
  this[4] = 0LL;
  this[2] = 0LL;
  this[3] = this + 4;
  return this;
}

{
  this[1] = 0LL;
  *this = this + 1;
  this[5] = 0LL;
  this[4] = 0LL;
  this[2] = 0LL;
  this[3] = this + 4;
  return this;
}

void wireless_diagnostics::google::protobuf::TextFormat::ParseInfoTree::~ParseInfoTree( wireless_diagnostics::google::protobuf::TextFormat::ParseInfoTree *this)
{
  int v2 = (char *)this + 24;
  char v3 = (char *)*((void *)this + 3);
  std::string::size_type v4 = (char *)this + 32;
  if (v3 != (char *)this + 32)
  {
    do
    {
      wireless_diagnostics::google::protobuf::STLDeleteContainerPointers<std::__wrap_iter<wireless_diagnostics::google::protobuf::TextFormat::ParseInfoTree **>>( *((wireless_diagnostics::google::protobuf::TextFormat::ParseInfoTree ***)v3 + 5),  *((wireless_diagnostics::google::protobuf::TextFormat::ParseInfoTree ***)v3 + 6));
      *((void *)v3 + 6) = *((void *)v3 + 5);
      BOOL v5 = (char *)*((void *)v3 + 1);
      if (v5)
      {
        do
        {
          int v6 = v5;
          BOOL v5 = *(char **)v5;
        }

        while (v5);
      }

      else
      {
        do
        {
          int v6 = (char *)*((void *)v3 + 2);
          BOOL v7 = *(void *)v6 == (void)v3;
          char v3 = v6;
        }

        while (!v7);
      }

      char v3 = v6;
    }

    while (v6 != v4);
  }

  std::__tree<std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>,std::__map_value_compare<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>,std::less<wireless_diagnostics::google::protobuf::FieldDescriptor const*>,true>,std::allocator<std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>>>::destroy( (uint64_t)v2,  *((void **)this + 4));
  std::__tree<std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>,std::__map_value_compare<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>,std::less<wireless_diagnostics::google::protobuf::FieldDescriptor const*>,true>,std::allocator<std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>>>::destroy( (uint64_t)this,  *((void **)this + 1));
}

void __clang_call_terminate(void *a1)
{
}

void wireless_diagnostics::google::protobuf::TextFormat::ParseInfoTree::RecordLocation( uint64_t **a1, unint64_t a2, uint64_t a3)
{
  unint64_t v19 = a2;
  uint64_t v20 = &v19;
  std::string::size_type v4 = std::__tree<std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>,std::__map_value_compare<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>,std::less<wireless_diagnostics::google::protobuf::FieldDescriptor const*>,true>,std::allocator<std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>>>::__emplace_unique_key_args<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::piecewise_construct_t const&,std::tuple<wireless_diagnostics::google::protobuf::FieldDescriptor const* const&>,std::tuple<>>( a1,  &v19,  (uint64_t)&std::piecewise_construct,  (uint64_t **)&v20);
  BOOL v5 = (void *)v4[6];
  unint64_t v6 = v4[7];
  if ((unint64_t)v5 >= v6)
  {
    uint64_t v8 = v4[5];
    uint64_t v9 = ((uint64_t)v5 - v8) >> 3;
    uint64_t v10 = v6 - v8;
    uint64_t v11 = v10 >> 2;
    else {
      unint64_t v12 = v11;
    }
    if (v12) {
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>( (uint64_t)(v4 + 7),  v12);
    }
    else {
      v13 = 0LL;
    }
    int v14 = &v13[8 * v9];
    unint64_t v15 = &v13[8 * v12];
    *(void *)int v14 = a3;
    BOOL v7 = v14 + 8;
    uint64_t v17 = (char *)v4[5];
    uint64_t v16 = (char *)v4[6];
    if (v16 != v17)
    {
      do
      {
        uint64_t v18 = *((void *)v16 - 1);
        v16 -= 8;
        *((void *)v14 - 1) = v18;
        v14 -= 8;
      }

      while (v16 != v17);
      uint64_t v16 = (char *)v4[5];
    }

    v4[5] = (uint64_t)v14;
    v4[6] = (uint64_t)v7;
    v4[7] = (uint64_t)v15;
    if (v16) {
      operator delete(v16);
    }
  }

  else
  {
    *BOOL v5 = a3;
    BOOL v7 = v5 + 1;
  }

  v4[6] = (uint64_t)v7;
}

void *wireless_diagnostics::google::protobuf::TextFormat::ParseInfoTree::CreateNested( uint64_t **this, const wireless_diagnostics::google::protobuf::FieldDescriptor *a2)
{
  uint64_t v20 = a2;
  char v3 = operator new(0x30uLL);
  v3[1] = 0LL;
  *char v3 = v3 + 1;
  v3[4] = 0LL;
  v3[5] = 0LL;
  int v3[2] = 0LL;
  v3[3] = v3 + 4;
  int v21 = &v20;
  std::string::size_type v4 = std::__tree<std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>,std::__map_value_compare<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>,std::less<wireless_diagnostics::google::protobuf::FieldDescriptor const*>,true>,std::allocator<std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>>>::__emplace_unique_key_args<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::piecewise_construct_t const&,std::tuple<wireless_diagnostics::google::protobuf::FieldDescriptor const* const&>,std::tuple<>>( this + 3,  (unint64_t *)&v20,  (uint64_t)&std::piecewise_construct,  (uint64_t **)&v21);
  BOOL v5 = (void *)v4[6];
  unint64_t v6 = v4[7];
  if ((unint64_t)v5 >= v6)
  {
    uint64_t v8 = v4[5];
    uint64_t v9 = ((uint64_t)v5 - v8) >> 3;
    uint64_t v10 = v6 - v8;
    uint64_t v11 = v10 >> 2;
    else {
      unint64_t v12 = v11;
    }
    if (v12) {
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>( (uint64_t)(v4 + 7),  v12);
    }
    else {
      v13 = 0LL;
    }
    int v14 = &v13[8 * v9];
    unint64_t v15 = &v13[8 * v12];
    *(void *)int v14 = v3;
    BOOL v7 = v14 + 8;
    uint64_t v17 = (char *)v4[5];
    uint64_t v16 = (char *)v4[6];
    if (v16 != v17)
    {
      do
      {
        uint64_t v18 = *((void *)v16 - 1);
        v16 -= 8;
        *((void *)v14 - 1) = v18;
        v14 -= 8;
      }

      while (v16 != v17);
      uint64_t v16 = (char *)v4[5];
    }

    v4[5] = (uint64_t)v14;
    v4[6] = (uint64_t)v7;
    v4[7] = (uint64_t)v15;
    if (v16) {
      operator delete(v16);
    }
  }

  else
  {
    *BOOL v5 = v3;
    BOOL v7 = v5 + 1;
  }

  v4[6] = (uint64_t)v7;
  return v3;
}

void wireless_diagnostics::google::protobuf::CheckFieldIndex( wireless_diagnostics::google::protobuf *this, const wireless_diagnostics::google::protobuf::FieldDescriptor *a2)
{
  if (this)
  {
    if ((int v2 = *((_DWORD *)this + 12), (_DWORD)a2 == -1) && v2 == 3 || (_DWORD)a2 != -1 && v2 != 3)
    {
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
      wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v3);
    }
  }

void sub_187C34F4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

unint64_t wireless_diagnostics::google::protobuf::TextFormat::ParseInfoTree::GetLocation( wireless_diagnostics::google::protobuf::TextFormat::ParseInfoTree *this, const wireless_diagnostics::google::protobuf::FieldDescriptor *a2, wireless_diagnostics::google::protobuf::FieldDescriptor *a3)
{
  int v3 = (int)a3;
  wireless_diagnostics::google::protobuf::CheckFieldIndex(a2, a3);
  uint64_t v8 = (void *)*((void *)this + 1);
  BOOL v7 = (char *)this + 8;
  unint64_t v6 = v8;
  if (!v8) {
    goto LABEL_17;
  }
  uint64_t v9 = v7;
  do
  {
    unint64_t v10 = v6[4];
    BOOL v11 = v10 >= (unint64_t)a2;
    else {
      unint64_t v12 = v6 + 1;
    }
    if (v11) {
      uint64_t v9 = (char *)v6;
    }
    unint64_t v6 = (void *)*v12;
  }

  while (*v12);
  if (v9 == v7
    || *((void *)v9 + 4) > (unint64_t)a2
    || (v3 != -1 ? (int v13 = v3) : (int v13 = 0),
        unint64_t v15 = v9 + 40,
        uint64_t v14 = *((void *)v9 + 5),
        v13 >= (unint64_t)((*((void *)v15 + 1) - v14) >> 3)))
  {
LABEL_17:
    unint64_t v16 = 0xFFFFFFFF00000000LL;
    uint64_t v17 = 0xFFFFFFFFLL;
  }

  else
  {
    uint64_t v17 = *(void *)(v14 + 8LL * v13);
    unint64_t v16 = v17 & 0xFFFFFFFF00000000LL;
    uint64_t v17 = v17;
  }

  return v16 | v17;
}

uint64_t wireless_diagnostics::google::protobuf::TextFormat::ParseInfoTree::GetTreeForNested( wireless_diagnostics::google::protobuf::TextFormat::ParseInfoTree *this, const wireless_diagnostics::google::protobuf::FieldDescriptor *a2, wireless_diagnostics::google::protobuf::FieldDescriptor *a3)
{
  int v3 = (int)a3;
  wireless_diagnostics::google::protobuf::CheckFieldIndex(a2, a3);
  uint64_t v8 = (void *)*((void *)this + 4);
  BOOL v7 = (char *)this + 32;
  unint64_t v6 = v8;
  if (!v8) {
    return 0LL;
  }
  uint64_t v9 = v7;
  do
  {
    unint64_t v10 = v6[4];
    BOOL v11 = v10 >= (unint64_t)a2;
    else {
      unint64_t v12 = v6 + 1;
    }
    if (v11) {
      uint64_t v9 = (char *)v6;
    }
    unint64_t v6 = (void *)*v12;
  }

  while (*v12);
  int v13 = v3 == -1 ? 0 : v3;
  unint64_t v15 = v9 + 40;
  uint64_t v14 = *((void *)v9 + 5);
  else {
    return *(void *)(v14 + 8LL * v13);
  }
}

uint64_t wireless_diagnostics::google::protobuf::TextFormat::Parser::Parser(uint64_t this)
{
  *(void *)this = 0LL;
  *(void *)(this + 8) = 0LL;
  *(_WORD *)(this + 24) = 0;
  *(void *)(this + 16) = 0LL;
  return this;
}

{
  *(void *)this = 0LL;
  *(void *)(this + 8) = 0LL;
  *(_WORD *)(this + 24) = 0;
  *(void *)(this + 16) = 0LL;
  return this;
}

uint64_t wireless_diagnostics::google::protobuf::TextFormat::Parser::Parse( uint64_t a1, uint64_t a2, wireless_diagnostics::google::protobuf::Message *a3)
{
  uint64_t v6 = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::Message *))(*(void *)a3 + 152LL))(a3);
  wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ParserImpl( (uint64_t)v10,  v6,  a2,  *(void *)a1,  *(void *)(a1 + 8),  *(void *)(a1 + 16),  1,  *(_BYTE *)(a1 + 25));
  uint64_t v8 = wireless_diagnostics::google::protobuf::TextFormat::Parser::MergeUsingImpl(a1, v7, a3, (uint64_t)v10);
  wireless_diagnostics::google::protobuf::io::Tokenizer::~Tokenizer((wireless_diagnostics::google::protobuf::io::Tokenizer *)&v12);
  wireless_diagnostics::google::protobuf::io::ErrorCollector::~ErrorCollector((wireless_diagnostics::google::protobuf::io::ErrorCollector *)&v11);
  return v8;
}

void sub_187C35190(_Unwind_Exception *a1)
{
}

uint64_t wireless_diagnostics::google::protobuf::TextFormat::Parser::MergeUsingImpl( uint64_t a1, uint64_t a2, wireless_diagnostics::google::protobuf::Message *a3, uint64_t a4)
{
  while (*(_DWORD *)(a4 + 40) != 1)
  {
    if ((wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ConsumeField( (wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl *)a4,  a3) & 1) == 0) {
      return 0LL;
    }
  }

  if (*(_BYTE *)(a4 + 229)) {
    return 0LL;
  }
  if (!*(_BYTE *)(a1 + 24)
    && ((*(uint64_t (**)(wireless_diagnostics::google::protobuf::Message *))(*(void *)a3 + 40LL))(a3) & 1) == 0)
  {
    memset(v13, 0, sizeof(v13));
    wireless_diagnostics::google::protobuf::Message::FindInitializationErrors((uint64_t)a3, (uint64_t)v13);
    memset(&v10, 0, sizeof(v10));
    wireless_diagnostics::google::protobuf::JoinStrings(v13, ", ", &v10);
    uint64_t v8 = std::string::insert(&v10, 0LL, "Message missing required fields: ");
    __int128 v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
    std::string::size_type cap = v8->__r_.__value_.__l.__cap_;
    *(_OWORD *)__p = v9;
    v8->__r_.__value_.__l.__size_ = 0LL;
    v8->__r_.__value_.__l.__cap_ = 0LL;
    v8->__r_.__value_.__r.__words[0] = 0LL;
    wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ReportError( (uint64_t *)a4,  0xFFFFFFFFLL,  0LL,  (uint64_t)__p);
    if (SHIBYTE(cap) < 0) {
      operator delete(__p[0]);
    }
    __p[0] = v13;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
    return 0LL;
  }

  return 1LL;
}

void sub_187C352D4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, char *__p, uint64_t a17, int a18, __int16 a19, char a20, char a21, char a22)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  __p = &a22;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::TextFormat::Parser::ParseFromString( uint64_t a1, const void **a2, wireless_diagnostics::google::protobuf::Message *a3)
{
  uint64_t v5 = wireless_diagnostics::google::protobuf::TextFormat::Parser::Parse(a1, (uint64_t)v7, a3);
  MEMORY[0x1895B3334](v7);
  return v5;
}

uint64_t wireless_diagnostics::google::protobuf::TextFormat::Parser::Merge( uint64_t a1, uint64_t a2, wireless_diagnostics::google::protobuf::Message *a3)
{
  uint64_t v6 = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::Message *))(*(void *)a3 + 152LL))(a3);
  wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ParserImpl( (uint64_t)v10,  v6,  a2,  *(void *)a1,  *(void *)(a1 + 8),  *(void *)(a1 + 16),  0,  *(_BYTE *)(a1 + 25));
  uint64_t v8 = wireless_diagnostics::google::protobuf::TextFormat::Parser::MergeUsingImpl(a1, v7, a3, (uint64_t)v10);
  wireless_diagnostics::google::protobuf::io::Tokenizer::~Tokenizer((wireless_diagnostics::google::protobuf::io::Tokenizer *)&v12);
  wireless_diagnostics::google::protobuf::io::ErrorCollector::~ErrorCollector((wireless_diagnostics::google::protobuf::io::ErrorCollector *)&v11);
  return v8;
}

void sub_187C35440(_Unwind_Exception *a1)
{
}

uint64_t wireless_diagnostics::google::protobuf::TextFormat::Parser::MergeFromString( uint64_t a1, const void **a2, wireless_diagnostics::google::protobuf::Message *a3)
{
  uint64_t v5 = wireless_diagnostics::google::protobuf::TextFormat::Parser::Merge(a1, (uint64_t)v7, a3);
  MEMORY[0x1895B3334](v7);
  return v5;
}

void wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ReportError( uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4 = a2;
  *((_BYTE *)a1 + 229) = 1;
  uint64_t v5 = *a1;
  if (v5)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v5 + 16LL))(v5, a2, a3, a4);
  }

  else
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    if ((v4 & 0x80000000) == 0)
    {
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    }

    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v6);
  }

void sub_187C35620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

uint64_t wireless_diagnostics::google::protobuf::TextFormat::Parser::ParseFieldValueFromString( uint64_t a1, const void **a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, wireless_diagnostics::google::protobuf::Message *a4)
{
  uint64_t v7 = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::Message *))(*(void *)a4 + 152LL))(a4);
  wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ParserImpl( (uint64_t)v10,  v7,  (uint64_t)v13,  *(void *)a1,  *(void *)(a1 + 8),  *(void *)(a1 + 16),  0,  *(_BYTE *)(a1 + 25));
  uint64_t v8 = wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ParseField( (wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl *)v10,  a3,  a4);
  wireless_diagnostics::google::protobuf::io::Tokenizer::~Tokenizer((wireless_diagnostics::google::protobuf::io::Tokenizer *)&v12);
  wireless_diagnostics::google::protobuf::io::ErrorCollector::~ErrorCollector((wireless_diagnostics::google::protobuf::io::ErrorCollector *)&v11);
  MEMORY[0x1895B3334](v13);
  return v8;
}

void sub_187C35700(_Unwind_Exception *a1)
{
}

uint64_t wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ParseField( wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl *this, const wireless_diagnostics::google::protobuf::FieldDescriptor *a2, wireless_diagnostics::google::protobuf::Message *a3)
{
  int v6 = wireless_diagnostics::google::protobuf::FieldDescriptor::kTypeToCppTypeMap[*((unsigned int *)a2 + 11)];
  uint64_t v7 = (const wireless_diagnostics::google::protobuf::Reflection *)(*(uint64_t (**)(wireless_diagnostics::google::protobuf::Message *))(*(void *)a3 + 144LL))(a3);
  if (v6 == 10)
  {
    if ((wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ConsumeFieldMessage(this, a3, v7, a2) & 1) == 0) {
      return 0LL;
    }
  }

  else
  {
    uint64_t result = wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ConsumeFieldValue(this, a3, v7, a2);
    if (!(_DWORD)result) {
      return result;
    }
  }

  return *((_DWORD *)this + 10) == 1;
}

uint64_t wireless_diagnostics::google::protobuf::TextFormat::Parse( uint64_t a1, wireless_diagnostics::google::protobuf::Message *a2)
{
  __int16 v4 = 0;
  return wireless_diagnostics::google::protobuf::TextFormat::Parser::Parse((uint64_t)v3, a1, a2);
}

uint64_t wireless_diagnostics::google::protobuf::TextFormat::Merge( uint64_t a1, wireless_diagnostics::google::protobuf::Message *a2)
{
  __int16 v4 = 0;
  return wireless_diagnostics::google::protobuf::TextFormat::Parser::Merge((uint64_t)v3, a1, a2);
}

uint64_t wireless_diagnostics::google::protobuf::TextFormat::ParseFromString( const void **a1, wireless_diagnostics::google::protobuf::Message *a2)
{
  __int16 v4 = 0;
  return wireless_diagnostics::google::protobuf::TextFormat::Parser::ParseFromString((uint64_t)v3, a1, a2);
}

uint64_t wireless_diagnostics::google::protobuf::TextFormat::MergeFromString( const void **a1, wireless_diagnostics::google::protobuf::Message *a2)
{
  __int16 v4 = 0;
  return wireless_diagnostics::google::protobuf::TextFormat::Parser::MergeFromString((uint64_t)v3, a1, a2);
}

BOOL wireless_diagnostics::google::protobuf::TextFormat::Printer::Print( int *a1, const wireless_diagnostics::google::protobuf::Message *a2, uint64_t a3)
{
  BOOL v5 = v7[0].__r_.__value_.__s.__data_[21] == 0;
  wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::~TextGenerator((wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator *)v7);
  return v5;
}

void sub_187C358F8(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

BOOL wireless_diagnostics::google::protobuf::TextFormat::Printer::PrintUnknownFieldsToString( int *a1, uint64_t **a2, uint64_t a3)
{
  if (*(char *)(a3 + 23) < 0)
  {
    **(_BYTE **)a3 = 0;
    *(void *)(a3 + 8) = 0LL;
  }

  else
  {
    *(_BYTE *)a3 = 0;
    *(_BYTE *)(a3 + 23) = 0;
  }

  wireless_diagnostics::google::protobuf::io::StringOutputStream::StringOutputStream();
  BOOL v5 = wireless_diagnostics::google::protobuf::TextFormat::Printer::PrintUnknownFields(a1, a2, (uint64_t)v7);
  MEMORY[0x1895B3490](v7);
  return v5;
}

BOOL wireless_diagnostics::google::protobuf::TextFormat::Printer::PrintUnknownFields( int *a1, uint64_t **a2, uint64_t a3)
{
  BOOL v5 = v7[0].__r_.__value_.__s.__data_[21] == 0;
  wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::~TextGenerator((wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator *)v7);
  return v5;
}

void sub_187C359F8(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void wireless_diagnostics::google::protobuf::TextFormat::Printer::Print( wireless_diagnostics::google::protobuf::TextFormat::Printer *this, const wireless_diagnostics::google::protobuf::Message *a2, std::string *a3)
{
  int v6 = (const wireless_diagnostics::google::protobuf::Reflection *)(*(uint64_t (**)(const wireless_diagnostics::google::protobuf::Message *))(*(void *)a2 + 144LL))(a2);
  __p = 0LL;
  uint64_t v11 = 0LL;
  uint64_t v12 = 0LL;
  (*(void (**)(const wireless_diagnostics::google::protobuf::Reflection *, const wireless_diagnostics::google::protobuf::Message *, void **))(*(void *)v6 + 96LL))( v6,  a2,  &__p);
  uint64_t v7 = (const wireless_diagnostics::google::protobuf::FieldDescriptor **)__p;
  if (v11 != __p)
  {
    unint64_t v8 = 0LL;
    do
    {
      wireless_diagnostics::google::protobuf::TextFormat::Printer::PrintField(this, a2, v6, v7[v8++], a3);
      uint64_t v7 = (const wireless_diagnostics::google::protobuf::FieldDescriptor **)__p;
    }

    while (v8 < (v11 - (_BYTE *)__p) >> 3);
  }

  __int128 v9 = (uint64_t **)(*(uint64_t (**)(const wireless_diagnostics::google::protobuf::Reflection *, const wireless_diagnostics::google::protobuf::Message *))(*(void *)v6 + 16LL))( v6,  a2);
  wireless_diagnostics::google::protobuf::TextFormat::Printer::PrintUnknownFields(this, v9, a3);
  if (__p)
  {
    uint64_t v11 = __p;
    operator delete(__p);
  }

void sub_187C35AE8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void wireless_diagnostics::google::protobuf::TextFormat::Printer::PrintUnknownFields( wireless_diagnostics::google::protobuf::TextFormat::Printer *this, uint64_t **a2, std::string *a3)
{
  uint64_t v6 = 0LL;
  uint64_t v7 = 0LL;
  uint64_t v48 = *MEMORY[0x1895F89C0];
  v40 = a3 + 1;
  while (1)
  {
    unint64_t v8 = *a2;
    if (*a2) {
      unint64_t v9 = (unint64_t)(v8[1] - *v8) >> 4;
    }
    else {
      LODWORD(v9) = 0;
    }
    uint64_t v10 = *v8;
    uint64_t v11 = (_DWORD *)(*v8 + v6);
    wireless_diagnostics::google::protobuf::SimpleItoa( (wireless_diagnostics::google::protobuf *)(*v11 & 0x1FFFFFFF),  (char *)a3,  &v42);
    switch(*v11 >> 29)
    {
      case 0:
        if ((v44 & 0x80u) == 0) {
          uint64_t v12 = (const char *)&v42;
        }
        else {
          uint64_t v12 = (const char *)v42;
        }
        if ((v44 & 0x80u) == 0) {
          int v13 = v44;
        }
        else {
          int v13 = v43;
        }
        wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Print( (wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator *)a3,  v12,  v13);
        wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Print( (wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator *)a3,  ": ",  2);
        wireless_diagnostics::google::protobuf::SimpleItoa( *(wireless_diagnostics::google::protobuf **)(v10 + v6 + 8),  v14,  &__p);
        if ((v47 & 0x80u) == 0) {
          p_p = (const char *)&__p;
        }
        else {
          p_p = (const char *)__p;
        }
        if ((v47 & 0x80u) == 0) {
          int v16 = v47;
        }
        else {
          int v16 = v46;
        }
        wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Print( (wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator *)a3,  p_p,  v16);
        if (*((_BYTE *)this + 4)) {
          uint64_t v17 = " ";
        }
        else {
          uint64_t v17 = "\n";
        }
        int v18 = 1;
        goto LABEL_84;
      case 1:
        if ((v44 & 0x80u) == 0) {
          unint64_t v19 = (const char *)&v42;
        }
        else {
          unint64_t v19 = (const char *)v42;
        }
        if ((v44 & 0x80u) == 0) {
          int v20 = v44;
        }
        else {
          int v20 = v43;
        }
        wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Print( (wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator *)a3,  v19,  v20);
        wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Print( (wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator *)a3,  ": 0x",  4);
        v22 = (const char *)wireless_diagnostics::google::protobuf::FastHex32ToBuffer( (wireless_diagnostics::google::protobuf *)*(unsigned int *)(v10 + v6 + 8),  (uint64_t)&__p,  v21);
        int v23 = strlen(v22);
        wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Print( (wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator *)a3,  v22,  v23);
        if (*((_BYTE *)this + 4)) {
          uint64_t v24 = " ";
        }
        else {
          uint64_t v24 = "\n";
        }
        goto LABEL_34;
      case 2:
        if ((v44 & 0x80u) == 0) {
          uint64_t v25 = (const char *)&v42;
        }
        else {
          uint64_t v25 = (const char *)v42;
        }
        if ((v44 & 0x80u) == 0) {
          int v26 = v44;
        }
        else {
          int v26 = v43;
        }
        wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Print( (wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator *)a3,  v25,  v26);
        wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Print( (wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator *)a3,  ": 0x",  4);
        v28 = (const char *)wireless_diagnostics::google::protobuf::FastHex64ToBuffer( *(void *)(v10 + v6 + 8),  (uint64_t)&__p,  v27);
        int v29 = strlen(v28);
        wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Print( (wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator *)a3,  v28,  v29);
        if (*((_BYTE *)this + 4)) {
          uint64_t v24 = " ";
        }
        else {
          uint64_t v24 = "\n";
        }
LABEL_34:
        wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Print( (wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator *)a3,  v24,  1);
        goto LABEL_90;
      case 3:
        if ((v44 & 0x80u) == 0) {
          v30 = (const char *)&v42;
        }
        else {
          v30 = (const char *)v42;
        }
        if ((v44 & 0x80u) == 0) {
          int v31 = v44;
        }
        else {
          int v31 = v43;
        }
        wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Print( (wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator *)a3,  v30,  v31);
        uint64_t v32 = *(void *)(v10 + v6 + 8);
        wireless_diagnostics::google::protobuf::UnknownFieldSet::UnknownFieldSet(&v41);
        if (*(char *)(v32 + 23) < 0)
        {
          if (!*(void *)(v32 + 8)) {
            goto LABEL_71;
          }
        }

        else if (!*(_BYTE *)(v32 + 23))
        {
          goto LABEL_71;
        }

        else {
          __int128 v35 = *(const void **)v32;
        }
        if (wireless_diagnostics::google::protobuf::UnknownFieldSet::ParseFromArray(&v41, v35))
        {
          if (*((_BYTE *)this + 4))
          {
            wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Print( (wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator *)a3,  " { ",  3);
          }

          else
          {
            wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Print( (wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator *)a3,  " {\n",  3);
            std::string::append(v40, "  ");
          }

          wireless_diagnostics::google::protobuf::TextFormat::Printer::PrintUnknownFields( this,  (const wireless_diagnostics::google::protobuf::UnknownFieldSet *)&v41,  (wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator *)a3);
          if (*((_BYTE *)this + 4))
          {
            int v39 = 2;
            uint64_t v38 = "} ";
          }

          else
          {
            wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Outdent(a3);
            int v39 = 2;
            uint64_t v38 = "}\n";
          }

          goto LABEL_89;
        }

LABEL_71:
        wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Print( (wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator *)a3,  ": ",  3);
        wireless_diagnostics::google::protobuf::CEscape(v32, &__p);
        if ((v47 & 0x80u) == 0) {
          uint64_t v36 = (const char *)&__p;
        }
        else {
          uint64_t v36 = (const char *)__p;
        }
        if ((v47 & 0x80u) == 0) {
          int v37 = v47;
        }
        else {
          int v37 = v46;
        }
        wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Print( (wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator *)a3,  v36,  v37);
        wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Print( (wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator *)a3,  "",  1);
        if (*((_BYTE *)this + 4)) {
          uint64_t v38 = " ";
        }
        else {
          uint64_t v38 = "\n";
        }
        int v39 = 1;
LABEL_89:
        wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Print( (wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator *)a3,  v38,  v39);
        wireless_diagnostics::google::protobuf::UnknownFieldSet::~UnknownFieldSet((wireless_diagnostics::google::protobuf::UnknownFieldSet *)&v41);
LABEL_90:
        ++v7;
        v6 += 16LL;
        break;
      case 4:
        if ((v44 & 0x80u) == 0) {
          uint64_t v33 = (const char *)&v42;
        }
        else {
          uint64_t v33 = (const char *)v42;
        }
        if ((v44 & 0x80u) == 0) {
          int v34 = v44;
        }
        else {
          int v34 = v43;
        }
        wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Print( (wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator *)a3,  v33,  v34);
        if (*((_BYTE *)this + 4))
        {
          wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Print( (wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator *)a3,  " { ",  3);
        }

        else
        {
          wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Print( (wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator *)a3,  " {\n",  3);
          std::string::append(v40, "  ");
        }

        wireless_diagnostics::google::protobuf::TextFormat::Printer::PrintUnknownFields( this,  *(const wireless_diagnostics::google::protobuf::UnknownFieldSet **)(v10 + v6 + 8),  (wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator *)a3);
        if (*((_BYTE *)this + 4))
        {
          int v18 = 2;
          uint64_t v17 = "} ";
        }

        else
        {
          wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Outdent(a3);
          int v18 = 2;
          uint64_t v17 = "}\n";
        }

LABEL_84:
        wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Print( (wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator *)a3,  v17,  v18);
        goto LABEL_90;
      default:
        goto LABEL_90;
    }
  }

void sub_187C36004( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *__p, uint64_t a18, int a19, __int16 a20, char a21, char a22)
{
  if (a22 < 0) {
    operator delete(__p);
  }
  wireless_diagnostics::google::protobuf::UnknownFieldSet::~UnknownFieldSet((wireless_diagnostics::google::protobuf::UnknownFieldSet *)&a10);
  if (a16 < 0) {
    operator delete(a11);
  }
  _Unwind_Resume(a1);
}

wireless_diagnostics::google::protobuf::TextFormat::Printer *wireless_diagnostics::google::protobuf::TextFormat::Printer::PrintField( wireless_diagnostics::google::protobuf::TextFormat::Printer *this, const wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::Reflection *a3, const wireless_diagnostics::google::protobuf::FieldDescriptor *a4, std::string *a5)
{
  int v10 = *((_DWORD *)a4 + 12);
  if (*((_BYTE *)this + 5))
  {
    if (v10 == 3)
    {
      if ((wireless_diagnostics::google::protobuf::FieldDescriptor::kTypeToCppTypeMap[*((unsigned int *)a4 + 11)]
                        - 9) >= 2)
        return (wireless_diagnostics::google::protobuf::TextFormat::Printer *)wireless_diagnostics::google::protobuf::TextFormat::Printer::PrintShortRepeatedField( this,  a2,  a3,  a4,  (wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator *)a5);
      goto LABEL_6;
    }
  }

  else if (v10 == 3)
  {
LABEL_6:
    uint64_t result = (wireless_diagnostics::google::protobuf::TextFormat::Printer *)(*(uint64_t (**)(const wireless_diagnostics::google::protobuf::Reflection *, const wireless_diagnostics::google::protobuf::Message *, const wireless_diagnostics::google::protobuf::FieldDescriptor *))(*(void *)a3 + 48LL))( a3,  a2,  a4);
    goto LABEL_8;
  }

  uint64_t result = (wireless_diagnostics::google::protobuf::TextFormat::Printer *)(*(uint64_t (**)(const wireless_diagnostics::google::protobuf::Reflection *, const wireless_diagnostics::google::protobuf::Message *, const wireless_diagnostics::google::protobuf::FieldDescriptor *))(*(void *)a3 + 40LL))( a3,  a2,  a4);
LABEL_8:
  int v14 = (int)result;
  if ((int)result >= 1)
  {
    for (unsigned int i = 0; v14 != i; ++i)
    {
      wireless_diagnostics::google::protobuf::TextFormat::Printer::PrintFieldName( result,  v12,  v13,  a4,  (wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator *)a5);
      if (wireless_diagnostics::google::protobuf::FieldDescriptor::kTypeToCppTypeMap[*((unsigned int *)a4 + 11)] == 10)
      {
        if (!*((_BYTE *)this + 4))
        {
          wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Print( (wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator *)a5,  " {\n",  3);
          std::string::append(a5 + 1, "  ");
          goto LABEL_15;
        }

        int v16 = (wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator *)a5;
        uint64_t v17 = " { ";
        int v18 = 3;
      }

      else
      {
        int v16 = (wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator *)a5;
        uint64_t v17 = ": ";
        int v18 = 2;
      }

      wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Print(v16, v17, v18);
LABEL_15:
      if (*((_DWORD *)a4 + 12) == 3) {
        uint64_t v19 = i;
      }
      else {
        uint64_t v19 = 0xFFFFFFFFLL;
      }
      wireless_diagnostics::google::protobuf::TextFormat::Printer::PrintFieldValue( this,  a2,  a3,  a4,  v19,  (wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator *)a5);
      int v20 = (wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator *)a5;
      if (wireless_diagnostics::google::protobuf::FieldDescriptor::kTypeToCppTypeMap[*((unsigned int *)a4 + 11)] == 10)
      {
        if (*((_BYTE *)this + 4))
        {
          int v21 = "} ";
        }

        else
        {
          wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Outdent(a5);
          int v20 = (wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator *)a5;
          int v21 = "}\n";
        }

        int v22 = 2;
      }

      else
      {
        if (*((_BYTE *)this + 4)) {
          int v21 = " ";
        }
        else {
          int v21 = "\n";
        }
        int v22 = 1;
      }

      uint64_t result = (wireless_diagnostics::google::protobuf::TextFormat::Printer *)wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Print( v20,  v21,  v22);
    }
  }

  return result;
}

uint64_t wireless_diagnostics::google::protobuf::TextFormat::Printer::PrintFieldValueToString( int *a1, const wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, uint64_t a4, uint64_t a5)
{
  if (*(char *)(a5 + 23) < 0)
  {
    **(_BYTE **)a5 = 0;
    *(void *)(a5 + 8) = 0LL;
  }

  else
  {
    *(_BYTE *)a5 = 0;
    *(_BYTE *)(a5 + 23) = 0;
  }

  wireless_diagnostics::google::protobuf::io::StringOutputStream::StringOutputStream();
  wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::TextGenerator( (uint64_t)v11,  (uint64_t)v12,  *a1);
  unint64_t v9 = (const wireless_diagnostics::google::protobuf::Reflection *)(*(uint64_t (**)(const wireless_diagnostics::google::protobuf::Message *))(*(void *)a2 + 144LL))(a2);
  wireless_diagnostics::google::protobuf::TextFormat::Printer::PrintFieldValue( (wireless_diagnostics::google::protobuf::TextFormat::Printer *)a1,  a2,  v9,  a3,  a4,  (wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator *)v11);
  wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::~TextGenerator((wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator *)v11);
  return MEMORY[0x1895B3490](v12);
}

void sub_187C36324(_Unwind_Exception *a1)
{
}

void wireless_diagnostics::google::protobuf::TextFormat::Printer::PrintFieldValue( wireless_diagnostics::google::protobuf::TextFormat::Printer *this, const wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::Reflection *a3, const wireless_diagnostics::google::protobuf::FieldDescriptor *a4, uint64_t a5, wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator *a6)
{
  switch(*((_DWORD *)a4 + 11))
  {
    case 1:
      uint64_t v20 = *(void *)a3;
      if (*((_DWORD *)a4 + 12) == 3) {
        (*(void (**)(const wireless_diagnostics::google::protobuf::Reflection *, const wireless_diagnostics::google::protobuf::Message *, const wireless_diagnostics::google::protobuf::FieldDescriptor *, uint64_t))(v20 + 320))( a3,  a2,  a4,  a5);
      }
      else {
        double v22 = (*(double (**)(const wireless_diagnostics::google::protobuf::Reflection *, const wireless_diagnostics::google::protobuf::Message *, const wireless_diagnostics::google::protobuf::FieldDescriptor *))(v20 + 144))( a3,  a2,  a4);
      }
      wireless_diagnostics::google::protobuf::SimpleDtoa(v22, v21, &v45);
      if (v47 >= 0) {
        int v34 = (const char *)&v45;
      }
      else {
        int v34 = (const char *)v45;
      }
      if (v47 >= 0) {
        int v35 = HIBYTE(v47);
      }
      else {
        int v35 = v46;
      }
      goto LABEL_64;
    case 2:
      uint64_t v23 = *(void *)a3;
      if (*((_DWORD *)a4 + 12) == 3) {
        (*(void (**)(const wireless_diagnostics::google::protobuf::Reflection *, const wireless_diagnostics::google::protobuf::Message *, const wireless_diagnostics::google::protobuf::FieldDescriptor *, uint64_t))(v23 + 312))( a3,  a2,  a4,  a5);
      }
      else {
        float v25 = (*(float (**)(const wireless_diagnostics::google::protobuf::Reflection *, const wireless_diagnostics::google::protobuf::Message *, const wireless_diagnostics::google::protobuf::FieldDescriptor *))(v23 + 136))( a3,  a2,  a4);
      }
      wireless_diagnostics::google::protobuf::SimpleFtoa(v25, v24, &v45);
      if (v47 >= 0) {
        int v34 = (const char *)&v45;
      }
      else {
        int v34 = (const char *)v45;
      }
      if (v47 >= 0) {
        int v35 = HIBYTE(v47);
      }
      else {
        int v35 = v46;
      }
      goto LABEL_64;
    case 3:
    case 0x10:
    case 0x12:
      uint64_t v11 = *(void *)a3;
      if (*((_DWORD *)a4 + 12) == 3) {
        uint64_t v12 = (wireless_diagnostics::google::protobuf *)(*(uint64_t (**)(const wireless_diagnostics::google::protobuf::Reflection *, const wireless_diagnostics::google::protobuf::Message *, const wireless_diagnostics::google::protobuf::FieldDescriptor *, uint64_t))(v11 + 288))( a3,  a2,  a4,  a5);
      }
      else {
        uint64_t v12 = (wireless_diagnostics::google::protobuf *)(*(uint64_t (**)(const wireless_diagnostics::google::protobuf::Reflection *, const wireless_diagnostics::google::protobuf::Message *, const wireless_diagnostics::google::protobuf::FieldDescriptor *))(v11 + 112))( a3,  a2,  a4);
      }
      wireless_diagnostics::google::protobuf::SimpleItoa(v12, v13, &v45);
      if (v47 >= 0) {
        int v34 = (const char *)&v45;
      }
      else {
        int v34 = (const char *)v45;
      }
      if (v47 >= 0) {
        int v35 = HIBYTE(v47);
      }
      else {
        int v35 = v46;
      }
      goto LABEL_64;
    case 4:
    case 6:
      uint64_t v17 = *(void *)a3;
      if (*((_DWORD *)a4 + 12) == 3) {
        int v18 = (wireless_diagnostics::google::protobuf *)(*(uint64_t (**)(const wireless_diagnostics::google::protobuf::Reflection *, const wireless_diagnostics::google::protobuf::Message *, const wireless_diagnostics::google::protobuf::FieldDescriptor *, uint64_t))(v17 + 304))( a3,  a2,  a4,  a5);
      }
      else {
        int v18 = (wireless_diagnostics::google::protobuf *)(*(uint64_t (**)(const wireless_diagnostics::google::protobuf::Reflection *, const wireless_diagnostics::google::protobuf::Message *, const wireless_diagnostics::google::protobuf::FieldDescriptor *))(v17 + 128))( a3,  a2,  a4);
      }
      wireless_diagnostics::google::protobuf::SimpleItoa(v18, v19, &v45);
      if (v47 >= 0) {
        int v34 = (const char *)&v45;
      }
      else {
        int v34 = (const char *)v45;
      }
      if (v47 >= 0) {
        int v35 = HIBYTE(v47);
      }
      else {
        int v35 = v46;
      }
      goto LABEL_64;
    case 5:
    case 0xF:
    case 0x11:
      uint64_t v8 = *(void *)a3;
      if (*((_DWORD *)a4 + 12) == 3) {
        unint64_t v9 = (wireless_diagnostics::google::protobuf *)(*(uint64_t (**)(const wireless_diagnostics::google::protobuf::Reflection *, const wireless_diagnostics::google::protobuf::Message *, const wireless_diagnostics::google::protobuf::FieldDescriptor *, uint64_t))(v8 + 280))( a3,  a2,  a4,  a5);
      }
      else {
        unint64_t v9 = (wireless_diagnostics::google::protobuf *)(*(uint64_t (**)(const wireless_diagnostics::google::protobuf::Reflection *, const wireless_diagnostics::google::protobuf::Message *, const wireless_diagnostics::google::protobuf::FieldDescriptor *))(v8 + 104))( a3,  a2,  a4);
      }
      wireless_diagnostics::google::protobuf::SimpleItoa(v9, v10, &v45);
      if (v47 >= 0) {
        int v34 = (const char *)&v45;
      }
      else {
        int v34 = (const char *)v45;
      }
      if (v47 >= 0) {
        int v35 = HIBYTE(v47);
      }
      else {
        int v35 = v46;
      }
      goto LABEL_64;
    case 7:
    case 0xD:
      uint64_t v14 = *(void *)a3;
      if (*((_DWORD *)a4 + 12) == 3) {
        unint64_t v15 = (wireless_diagnostics::google::protobuf *)(*(uint64_t (**)(const wireless_diagnostics::google::protobuf::Reflection *, const wireless_diagnostics::google::protobuf::Message *, const wireless_diagnostics::google::protobuf::FieldDescriptor *, uint64_t))(v14 + 296))( a3,  a2,  a4,  a5);
      }
      else {
        unint64_t v15 = (wireless_diagnostics::google::protobuf *)(*(uint64_t (**)(const wireless_diagnostics::google::protobuf::Reflection *, const wireless_diagnostics::google::protobuf::Message *, const wireless_diagnostics::google::protobuf::FieldDescriptor *))(v14 + 120))( a3,  a2,  a4);
      }
      wireless_diagnostics::google::protobuf::SimpleItoa(v15, v16, &v45);
      if (v47 >= 0) {
        int v34 = (const char *)&v45;
      }
      else {
        int v34 = (const char *)v45;
      }
      if (v47 >= 0) {
        int v35 = HIBYTE(v47);
      }
      else {
        int v35 = v46;
      }
LABEL_64:
      wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Print(a6, v34, v35);
      goto LABEL_99;
    case 8:
      uint64_t v26 = *(void *)a3;
      if (*((_DWORD *)a4 + 12) == 3) {
        int v27 = (*(uint64_t (**)(const wireless_diagnostics::google::protobuf::Reflection *, const wireless_diagnostics::google::protobuf::Message *, const wireless_diagnostics::google::protobuf::FieldDescriptor *, uint64_t))(v26 + 328))( a3,  a2,  a4,  a5);
      }
      else {
        int v27 = (*(uint64_t (**)(const wireless_diagnostics::google::protobuf::Reflection *, const wireless_diagnostics::google::protobuf::Message *, const wireless_diagnostics::google::protobuf::FieldDescriptor *))(v26 + 152))( a3,  a2,  a4);
      }
      if (v27) {
        uint64_t v36 = "true";
      }
      else {
        uint64_t v36 = "false";
      }
      if (v27) {
        int v37 = 4;
      }
      else {
        int v37 = 5;
      }
      goto LABEL_79;
    case 9:
    case 0xC:
      v45 = 0LL;
      uint64_t v46 = 0LL;
      uint64_t v47 = 0LL;
      uint64_t v30 = *(void *)a3;
      if (*((_DWORD *)a4 + 12) == 3) {
        uint64_t v31 = (*(uint64_t (**)(const wireless_diagnostics::google::protobuf::Reflection *, const wireless_diagnostics::google::protobuf::Message *, const wireless_diagnostics::google::protobuf::FieldDescriptor *, uint64_t, void **))(v30 + 360))( a3,  a2,  a4,  a5,  &v45);
      }
      else {
        uint64_t v31 = (*(uint64_t (**)(const wireless_diagnostics::google::protobuf::Reflection *, const wireless_diagnostics::google::protobuf::Message *, const wireless_diagnostics::google::protobuf::FieldDescriptor *, void **))(v30 + 184))( a3,  a2,  a4,  &v45);
      }
      uint64_t v39 = v31;
      wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Print(a6, "", 1);
      if (*((_BYTE *)this + 6))
      {
        wireless_diagnostics::google::protobuf::strings::Utf8SafeCEscape(v39, &__p);
        if ((v44 & 0x80u) == 0) {
          p_p = (const char *)&__p;
        }
        else {
          p_p = (const char *)__p;
        }
        if ((v44 & 0x80u) == 0) {
          int v41 = v44;
        }
        else {
          int v41 = v43;
        }
      }

      else
      {
        wireless_diagnostics::google::protobuf::CEscape(v39, &__p);
        if ((v44 & 0x80u) == 0) {
          p_p = (const char *)&__p;
        }
        else {
          p_p = (const char *)__p;
        }
        if ((v44 & 0x80u) == 0) {
          int v41 = v44;
        }
        else {
          int v41 = v43;
        }
      }

      wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Print(a6, p_p, v41);
      wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Print(a6, "", 1);
LABEL_99:
      if (SHIBYTE(v47) < 0) {
        operator delete(v45);
      }
      break;
    case 0xA:
    case 0xB:
      uint64_t v32 = *(void *)a3;
      if (*((_DWORD *)a4 + 12) == 3) {
        uint64_t v33 = (const wireless_diagnostics::google::protobuf::Message *)(*(uint64_t (**)(const wireless_diagnostics::google::protobuf::Reflection *, const wireless_diagnostics::google::protobuf::Message *, const wireless_diagnostics::google::protobuf::FieldDescriptor *, uint64_t))(v32 + 352))( a3,  a2,  a4,  a5);
      }
      else {
        uint64_t v33 = (const wireless_diagnostics::google::protobuf::Message *)(*(uint64_t (**)(const wireless_diagnostics::google::protobuf::Reflection *, const wireless_diagnostics::google::protobuf::Message *, const wireless_diagnostics::google::protobuf::FieldDescriptor *, void))(v32 + 176))( a3,  a2,  a4,  0LL);
      }
      wireless_diagnostics::google::protobuf::TextFormat::Printer::Print(this, v33, a6);
      break;
    case 0xE:
      uint64_t v28 = *(void *)a3;
      if (*((_DWORD *)a4 + 12) == 3) {
        int v29 = (const char ***)(*(uint64_t (**)(const wireless_diagnostics::google::protobuf::Reflection *, const wireless_diagnostics::google::protobuf::Message *, const wireless_diagnostics::google::protobuf::FieldDescriptor *, uint64_t))(v28 + 344))( a3,  a2,  a4,  a5);
      }
      else {
        int v29 = (const char ***)(*(uint64_t (**)(const wireless_diagnostics::google::protobuf::Reflection *, const wireless_diagnostics::google::protobuf::Message *, const wireless_diagnostics::google::protobuf::FieldDescriptor *))(v28 + 168))( a3,  a2,  a4);
      }
      int v38 = *((char *)*v29 + 23);
      if (v38 >= 0) {
        uint64_t v36 = (const char *)*v29;
      }
      else {
        uint64_t v36 = **v29;
      }
      if (v38 >= 0) {
        int v37 = *((unsigned __int8 *)*v29 + 23);
      }
      else {
        int v37 = *((_DWORD *)*v29 + 2);
      }
LABEL_79:
      wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Print(a6, v36, v37);
      break;
    default:
      return;
  }

void sub_187C3686C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

uint64_t wireless_diagnostics::google::protobuf::TextFormat::Printer::PrintShortRepeatedField( wireless_diagnostics::google::protobuf::TextFormat::Printer *this, const wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::Reflection *a3, const wireless_diagnostics::google::protobuf::FieldDescriptor *a4, wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator *a5)
{
  int v10 = (*(uint64_t (**)(const wireless_diagnostics::google::protobuf::Reflection *, const wireless_diagnostics::google::protobuf::Message *, const wireless_diagnostics::google::protobuf::FieldDescriptor *))(*(void *)a3 + 48LL))( a3,  a2,  a4);
  wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Print(a5, ": [", 3);
  if (v10 >= 1)
  {
    uint64_t v11 = 0LL;
    do
    {
      if ((_DWORD)v11) {
        wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Print(a5, ", ", 2);
      }
      wireless_diagnostics::google::protobuf::TextFormat::Printer::PrintFieldValue(this, a2, a3, a4, v11, a5);
      uint64_t v11 = (v11 + 1);
    }

    while (v10 != (_DWORD)v11);
  }

  if (*((_BYTE *)this + 4)) {
    uint64_t v12 = "] ";
  }
  else {
    uint64_t v12 = "]\n";
  }
  return wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Print(a5, v12, 2);
}

uint64_t wireless_diagnostics::google::protobuf::TextFormat::Printer::PrintFieldName( wireless_diagnostics::google::protobuf::TextFormat::Printer *this, const wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::Reflection *a3, const wireless_diagnostics::google::protobuf::FieldDescriptor *a4, wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator *a5)
{
  if (*((_BYTE *)a4 + 52))
  {
    wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Print(a5, "[", 1);
    if (*(_BYTE *)(*(void *)(*((void *)a4 + 7) + 32LL) + 64LL)
      && *((_DWORD *)a4 + 11) == 11
      && *((_DWORD *)a4 + 12) == 1
      && (uint64_t v7 = *((void *)a4 + 8), v7 == *((void *)a4 + 9)))
    {
      uint64_t v8 = *(void *)(v7 + 8);
    }

    else
    {
      uint64_t v8 = *((void *)a4 + 1);
    }

    int v9 = *(char *)(v8 + 23);
    if (v9 >= 0) {
      int v10 = (const char *)v8;
    }
    else {
      int v10 = *(const char **)v8;
    }
    if (v9 >= 0) {
      LODWORD(v11) = *(unsigned __int8 *)(v8 + 23);
    }
    else {
      uint64_t v11 = *(void *)(v8 + 8);
    }
    wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Print(a5, v10, v11);
    uint64_t v12 = "]";
    int v13 = a5;
    int v14 = 1;
  }

  else
  {
    if (*((_DWORD *)a4 + 11) == 10) {
      uint64_t v15 = **((void **)a4 + 9);
    }
    else {
      uint64_t v15 = *(void *)a4;
    }
    int v16 = *(char *)(v15 + 23);
    if (v16 >= 0) {
      uint64_t v12 = (const char *)v15;
    }
    else {
      uint64_t v12 = *(const char **)v15;
    }
    if (v16 >= 0) {
      int v14 = *(unsigned __int8 *)(v15 + 23);
    }
    else {
      int v14 = *(_DWORD *)(v15 + 8);
    }
    int v13 = a5;
  }

  return wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Print(v13, v12, v14);
}

void wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Outdent(std::string *this)
{
  if ((char)this[1].__r_.__value_.__s.__size_ < 0)
  {
    unint64_t size = this[1].__r_.__value_.__l.__size_;
    if (!size)
    {
LABEL_6:
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
      wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v2);
      return;
    }
  }

  else
  {
    unint64_t size = this[1].__r_.__value_.__s.__size_;
    if (!this[1].__r_.__value_.__s.__size_) {
      goto LABEL_6;
    }
  }

  if (size < 2LL * SLODWORD(this[2].__r_.__value_.__l.__data_)) {
    goto LABEL_6;
  }
  std::string::resize(this + 1, size - 2, 0);
}

void sub_187C36B3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

BOOL wireless_diagnostics::google::protobuf::TextFormat::Print( const wireless_diagnostics::google::protobuf::Message *a1, uint64_t a2)
{
  *(int *)((char *)v3 + 3) = 0;
  v3[0] = 0;
  return wireless_diagnostics::google::protobuf::TextFormat::Printer::Print(v3, a1, a2);
}

BOOL wireless_diagnostics::google::protobuf::TextFormat::PrintUnknownFields(uint64_t **a1, uint64_t a2)
{
  *(int *)((char *)v3 + 3) = 0;
  v3[0] = 0;
  return wireless_diagnostics::google::protobuf::TextFormat::Printer::PrintUnknownFields(v3, a1, a2);
}

BOOL wireless_diagnostics::google::protobuf::TextFormat::PrintUnknownFieldsToString( uint64_t **a1, uint64_t a2)
{
  *(int *)((char *)v3 + 3) = 0;
  v3[0] = 0;
  return wireless_diagnostics::google::protobuf::TextFormat::Printer::PrintUnknownFieldsToString(v3, a1, a2);
}

uint64_t wireless_diagnostics::google::protobuf::TextFormat::PrintFieldValueToString( const wireless_diagnostics::google::protobuf::Message *a1, const wireless_diagnostics::google::protobuf::FieldDescriptor *a2, uint64_t a3, uint64_t a4)
{
  *(int *)((char *)v5 + 3) = 0;
  v5[0] = 0;
  return wireless_diagnostics::google::protobuf::TextFormat::Printer::PrintFieldValueToString(v5, a1, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::TextFormat::ParseFieldValueFromString( const void **a1, const wireless_diagnostics::google::protobuf::FieldDescriptor *a2, wireless_diagnostics::google::protobuf::Message *a3)
{
  __int16 v5 = 0;
  return wireless_diagnostics::google::protobuf::TextFormat::Parser::ParseFieldValueFromString((uint64_t)v4, a1, a2, a3);
}

uint64_t wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ParserImpl( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, char a8)
{
  *(void *)a1 = a4;
  *(void *)(a1 + 8) = a5;
  *(void *)(a1 + 16) = a6;
  *(void *)(a1 + 24) = &unk_18A11AED8;
  *(void *)(a1 + 32) = a1;
  uint64_t v12 = (wireless_diagnostics::google::protobuf::io::Tokenizer *)(a1 + 40);
  wireless_diagnostics::google::protobuf::io::Tokenizer::Tokenizer(a1 + 40, a3, a1 + 24);
  *(void *)(a1 + 216) = a2;
  *(_DWORD *)(a1 + 224) = a7;
  *(_BYTE *)(a1 + 228) = a8;
  *(_BYTE *)(a1 + 229) = 0;
  *(_BYTE *)(a1 + 204) = 1;
  *(_DWORD *)(a1 + 208) = 1;
  wireless_diagnostics::google::protobuf::io::Tokenizer::Next(v12);
  return a1;
}

void sub_187C36CE8(_Unwind_Exception *a1)
{
}

void wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ParserErrorCollector::~ParserErrorCollector( wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ParserErrorCollector *this)
{
}

void wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ParserErrorCollector::AddError( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ParserErrorCollector::AddWarning( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ReportWarning( uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4 = a2;
  uint64_t v5 = *a1;
  if (v5)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v5 + 24LL))(v5, a2, a3, a4);
  }

  else
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    if ((v4 & 0x80000000) == 0)
    {
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    }

    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v6);
  }

void sub_187C36E6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

uint64_t wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ConsumeField( wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl *this, wireless_diagnostics::google::protobuf::Message *a2)
{
  int v4 = (const wireless_diagnostics::google::protobuf::Reflection *)(*(uint64_t (**)(wireless_diagnostics::google::protobuf::Message *))(*(void *)a2 + 144LL))(a2);
  uint64_t v5 = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::Message *))(*(void *)a2 + 152LL))(a2);
  memset(&v68, 0, sizeof(v68));
  uint64_t v6 = *((void *)this + 9);
  std::string::basic_string[abi:ne180100]<0>(__p, "[");
  int v7 = wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::TryConsume( (uint64_t)this,  (unsigned __int8 *)__p);
  int v8 = v7;
  if ((char)__p[0].__r_.__value_.__s.__size_ < 0)
  {
    operator delete(__p[0].__r_.__value_.__l.__data_);
    if (v8) {
      goto LABEL_3;
    }
  }

  else if (v7)
  {
LABEL_3:
    while (1)
    {
      std::string::basic_string[abi:ne180100]<0>(__p, ".");
      int v9 = wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::TryConsume( (uint64_t)this,  (unsigned __int8 *)__p);
      if (!v9) {
        break;
      }
      memset(__p, 0, 24);
      if (!wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ConsumeIdentifier( (uint64_t)this,  __p))
      {
        uint64_t v15 = (void *)__p[0].__r_.__value_.__r.__words[0];
        goto LABEL_146;
      }

      std::string::append(&v68, ".");
      if ((__p[0].__r_.__value_.__s.__size_ & 0x80u) == 0) {
        int v10 = __p;
      }
      else {
        int v10 = (std::string *)__p[0].__r_.__value_.__r.__words[0];
      }
      if ((__p[0].__r_.__value_.__s.__size_ & 0x80u) == 0) {
        std::string::size_type size = __p[0].__r_.__value_.__s.__size_;
      }
      else {
        std::string::size_type size = __p[0].__r_.__value_.__l.__size_;
      }
      std::string::append(&v68, (const std::string::value_type *)v10, size);
    }

    std::string::basic_string[abi:ne180100]<0>(__p, "]");
    char v13 = wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::Consume( (uint64_t)this,  (unsigned __int8 *)__p);
    char v14 = v13;
    if ((char)__p[0].__r_.__value_.__s.__size_ < 0)
    {
      operator delete(__p[0].__r_.__value_.__l.__data_);
      if ((v14 & 1) == 0) {
        goto LABEL_147;
      }
    }

    else if ((v13 & 1) == 0)
    {
      goto LABEL_147;
    }

    uint64_t v16 = *((void *)this + 1);
    if (v16) {
      uint64_t v17 = (*(uint64_t (**)(uint64_t, wireless_diagnostics::google::protobuf::Message *, std::string *))(*(void *)v16 + 16LL))( v16,  a2,  &v68);
    }
    else {
      uint64_t v17 = (*(uint64_t (**)(const wireless_diagnostics::google::protobuf::Reflection *, std::string *))(*(void *)v4 + 528LL))( v4,  &v68);
    }
    unint64_t FieldByName = v17;
    if (v17) {
      goto LABEL_62;
    }
    if (*((_BYTE *)this + 228))
    {
      std::operator+<char>();
      int v37 = std::string::append(&v65, " is not defined or is not an extension of ");
      __int128 v38 = *(_OWORD *)&v37->__r_.__value_.__l.__data_;
      v66.__r_.__value_.__l.__cap_ = v37->__r_.__value_.__l.__cap_;
      *(_OWORD *)&v66.__r_.__value_.__l.__data_ = v38;
      v37->__r_.__value_.__l.__size_ = 0LL;
      v37->__r_.__value_.__l.__cap_ = 0LL;
      v37->__r_.__value_.__r.__words[0] = 0LL;
      uint64_t v39 = *(void *)(v5 + 8);
      int v40 = *(char *)(v39 + 23);
      if (v40 >= 0) {
        int v41 = *(std::string **)(v5 + 8);
      }
      else {
        int v41 = *(std::string **)v39;
      }
      if (v40 >= 0) {
        std::string::size_type v42 = *(unsigned __int8 *)(v39 + 23);
      }
      else {
        std::string::size_type v42 = *(void *)(v39 + 8);
      }
      goto LABEL_118;
    }

    std::operator+<char>();
    v60 = std::string::append(&v65, " is not defined or is not an extension of ");
    __int128 v61 = *(_OWORD *)&v60->__r_.__value_.__l.__data_;
    v66.__r_.__value_.__l.__cap_ = v60->__r_.__value_.__l.__cap_;
    *(_OWORD *)&v66.__r_.__value_.__l.__data_ = v61;
    v60->__r_.__value_.__l.__size_ = 0LL;
    v60->__r_.__value_.__l.__cap_ = 0LL;
    v60->__r_.__value_.__r.__words[0] = 0LL;
    uint64_t v62 = *(void *)(v5 + 8);
    int v63 = *(char *)(v62 + 23);
    if (v63 >= 0) {
      v52 = *(std::string **)(v5 + 8);
    }
    else {
      v52 = *(std::string **)v62;
    }
    if (v63 >= 0) {
      std::string::size_type v53 = *(unsigned __int8 *)(v62 + 23);
    }
    else {
      std::string::size_type v53 = *(void *)(v62 + 8);
    }
LABEL_138:
    v54 = std::string::append(&v66, (const std::string::value_type *)v52, v53);
    __int128 v55 = *(_OWORD *)&v54->__r_.__value_.__l.__data_;
    v67.__r_.__value_.__l.__cap_ = v54->__r_.__value_.__l.__cap_;
    *(_OWORD *)&v67.__r_.__value_.__l.__data_ = v55;
    v54->__r_.__value_.__l.__size_ = 0LL;
    v54->__r_.__value_.__l.__cap_ = 0LL;
    v54->__r_.__value_.__r.__words[0] = 0LL;
    v56 = std::string::append(&v67, ".");
    __int128 v57 = *(_OWORD *)&v56->__r_.__value_.__l.__data_;
    __p[0].__r_.__value_.__l.__cap_ = v56->__r_.__value_.__l.__cap_;
    *(_OWORD *)&__p[0].__r_.__value_.__l.__data_ = v57;
    v56->__r_.__value_.__l.__size_ = 0LL;
    v56->__r_.__value_.__l.__cap_ = 0LL;
    v56->__r_.__value_.__r.__words[0] = 0LL;
    wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ReportError( (uint64_t *)this,  *((unsigned int *)this + 18),  *((unsigned int *)this + 19),  (uint64_t)__p);
    uint64_t v15 = (void *)v65.__r_.__value_.__r.__words[0];
LABEL_146:
    operator delete(v15);
    goto LABEL_147;
  }

  unint64_t FieldByName = wireless_diagnostics::google::protobuf::Descriptor::FindFieldByName(v5, (uint64_t)&v68);
  if (!FieldByName)
  {
    else {
      __p[0] = v68;
    }
    int v18 = (std::string *)((char *)__p + __p[0].__r_.__value_.__s.__size_);
    if ((__p[0].__r_.__value_.__s.__size_ & 0x80u) == 0)
    {
      uint64_t v19 = __p;
    }

    else
    {
      int v18 = (std::string *)(__p[0].__r_.__value_.__r.__words[0] + __p[0].__r_.__value_.__l.__size_);
      uint64_t v19 = (std::string *)__p[0].__r_.__value_.__r.__words[0];
    }

    while (v19 != v18)
    {
      int v20 = v19->__r_.__value_.__s.__data_[0];
      uint64_t v19 = (std::string *)((char *)v19 + 1);
    }

    uint64_t v21 = wireless_diagnostics::google::protobuf::Descriptor::FindFieldByName(v5, (uint64_t)__p);
    if (v21)
    {
      if (*(_DWORD *)(v21 + 44) == 10) {
        unint64_t FieldByName = v21;
      }
      else {
        unint64_t FieldByName = 0LL;
      }
    }

    else
    {
      unint64_t FieldByName = 0LL;
    }

    if (!FieldByName)
    {
LABEL_111:
      if (!*((_BYTE *)this + 228))
      {
        std::operator+<char>();
        v50 = std::string::append(&v65, " has no field named ");
        __int128 v51 = *(_OWORD *)&v50->__r_.__value_.__l.__data_;
        v66.__r_.__value_.__l.__cap_ = v50->__r_.__value_.__l.__cap_;
        *(_OWORD *)&v66.__r_.__value_.__l.__data_ = v51;
        v50->__r_.__value_.__l.__size_ = 0LL;
        v50->__r_.__value_.__l.__cap_ = 0LL;
        v50->__r_.__value_.__r.__words[0] = 0LL;
        if ((v68.__r_.__value_.__s.__size_ & 0x80u) == 0) {
          v52 = &v68;
        }
        else {
          v52 = (std::string *)v68.__r_.__value_.__r.__words[0];
        }
        if ((v68.__r_.__value_.__s.__size_ & 0x80u) == 0) {
          std::string::size_type v53 = v68.__r_.__value_.__s.__size_;
        }
        else {
          std::string::size_type v53 = v68.__r_.__value_.__l.__size_;
        }
        goto LABEL_138;
      }

      std::operator+<char>();
      int v43 = std::string::append(&v65, " has no field named ");
      __int128 v44 = *(_OWORD *)&v43->__r_.__value_.__l.__data_;
      v66.__r_.__value_.__l.__cap_ = v43->__r_.__value_.__l.__cap_;
      *(_OWORD *)&v66.__r_.__value_.__l.__data_ = v44;
      v43->__r_.__value_.__l.__size_ = 0LL;
      v43->__r_.__value_.__l.__cap_ = 0LL;
      v43->__r_.__value_.__r.__words[0] = 0LL;
      if ((v68.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        int v41 = &v68;
      }
      else {
        int v41 = (std::string *)v68.__r_.__value_.__r.__words[0];
      }
      if ((v68.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        std::string::size_type v42 = v68.__r_.__value_.__s.__size_;
      }
      else {
        std::string::size_type v42 = v68.__r_.__value_.__l.__size_;
      }
LABEL_118:
      v45 = std::string::append(&v66, (const std::string::value_type *)v41, v42);
      __int128 v46 = *(_OWORD *)&v45->__r_.__value_.__l.__data_;
      v67.__r_.__value_.__l.__cap_ = v45->__r_.__value_.__l.__cap_;
      *(_OWORD *)&v67.__r_.__value_.__l.__data_ = v46;
      v45->__r_.__value_.__l.__size_ = 0LL;
      v45->__r_.__value_.__l.__cap_ = 0LL;
      v45->__r_.__value_.__r.__words[0] = 0LL;
      uint64_t v47 = std::string::append(&v67, ".");
      __int128 v48 = *(_OWORD *)&v47->__r_.__value_.__l.__data_;
      __p[0].__r_.__value_.__l.__cap_ = v47->__r_.__value_.__l.__cap_;
      *(_OWORD *)&__p[0].__r_.__value_.__l.__data_ = v48;
      v47->__r_.__value_.__l.__size_ = 0LL;
      v47->__r_.__value_.__l.__cap_ = 0LL;
      v47->__r_.__value_.__r.__words[0] = 0LL;
      wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ReportWarning( (uint64_t *)this,  *((unsigned int *)this + 18),  *((unsigned int *)this + 19),  (uint64_t)__p);
      if (!*((_BYTE *)this + 228))
      {
        wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
        wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
        wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
        wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)__p);
      }

      std::string::basic_string[abi:ne180100]<0>(__p, ":");
      if (wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::TryConsume( (uint64_t)this,  (unsigned __int8 *)__p))
      {
        std::string::basic_string[abi:ne180100]<0>(&v67, "{");
        if ((wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::LookingAt( (uint64_t)this,  (unsigned __int8 *)&v67) & 1) != 0)
        {
          int v49 = 0;
        }

        else
        {
          std::string::basic_string[abi:ne180100]<0>(&v66, "<");
          int v49 = wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::LookingAt( (uint64_t)this,  (unsigned __int8 *)&v66) ^ 1;
        }
      }

      else
      {
        int v49 = 0;
      }

      if ((char)__p[0].__r_.__value_.__s.__size_ < 0)
      {
        operator delete(__p[0].__r_.__value_.__l.__data_);
        if (v49) {
          goto LABEL_157;
        }
      }

      else if (v49)
      {
LABEL_157:
        uint64_t v59 = wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::SkipFieldValue(this);
LABEL_160:
        uint64_t v33 = v59;
        goto LABEL_148;
      }

      uint64_t v59 = wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::SkipFieldMessage(this);
      goto LABEL_160;
    }
  }

  if (*(_DWORD *)(FieldByName + 44) == 10)
  {
    double v22 = **(unsigned __int8 ***)(FieldByName + 72);
    uint64_t v23 = v22[23];
    if ((v23 & 0x80u) == 0LL) {
      uint64_t v24 = v22[23];
    }
    else {
      uint64_t v24 = *((void *)v22 + 1);
    }
    std::string::size_type v25 = v68.__r_.__value_.__s.__size_;
    if ((v68.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      std::string::size_type v25 = v68.__r_.__value_.__l.__size_;
    }
    if (v24 != v25) {
      goto LABEL_111;
    }
    if ((v68.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v26 = &v68;
    }
    else {
      uint64_t v26 = (std::string *)v68.__r_.__value_.__r.__words[0];
    }
    if ((v23 & 0x80) != 0)
    {
    }

    else if (v22[23])
    {
      while (*v22 == v26->__r_.__value_.__s.__data_[0])
      {
        ++v22;
        uint64_t v26 = (std::string *)((char *)v26 + 1);
        if (!--v23) {
          goto LABEL_62;
        }
      }

      goto LABEL_111;
    }
  }

LABEL_62:
  if (*((_DWORD *)this + 56) == 1
    && *(_DWORD *)(FieldByName + 48) != 3
    && (*(unsigned int (**)(const wireless_diagnostics::google::protobuf::Reflection *, wireless_diagnostics::google::protobuf::Message *, unint64_t))(*(void *)v4 + 40LL))( v4,  a2,  FieldByName))
  {
    std::operator+<char>();
    int v27 = std::string::append(&v67, " is specified multiple times.");
    __int128 v28 = *(_OWORD *)&v27->__r_.__value_.__l.__data_;
    __p[0].__r_.__value_.__l.__cap_ = v27->__r_.__value_.__l.__cap_;
    *(_OWORD *)&__p[0].__r_.__value_.__l.__data_ = v28;
    v27->__r_.__value_.__l.__size_ = 0LL;
    v27->__r_.__value_.__l.__cap_ = 0LL;
    v27->__r_.__value_.__r.__words[0] = 0LL;
    wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ReportError( (uint64_t *)this,  *((unsigned int *)this + 18),  *((unsigned int *)this + 19),  (uint64_t)__p);
    uint64_t v15 = (void *)v67.__r_.__value_.__r.__words[0];
    goto LABEL_146;
  }

  if (wireless_diagnostics::google::protobuf::FieldDescriptor::kTypeToCppTypeMap[*(unsigned int *)(FieldByName + 44)] == 10)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, ":");
    wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::TryConsume( (uint64_t)this,  (unsigned __int8 *)__p);
    if ((wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ConsumeFieldMessage( this,  a2,  v4,  (const wireless_diagnostics::google::protobuf::FieldDescriptor *)FieldByName) & 1) == 0) {
      goto LABEL_147;
    }
    goto LABEL_90;
  }

  std::string::basic_string[abi:ne180100]<0>(__p, ":");
  char v29 = wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::Consume( (uint64_t)this,  (unsigned __int8 *)__p);
  if ((v29 & 1) == 0) {
    goto LABEL_147;
  }
  if (*(_DWORD *)(FieldByName + 48) == 3)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "[");
    int v30 = wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::TryConsume( (uint64_t)this,  (unsigned __int8 *)__p);
    if (v30)
    {
      while ((wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ConsumeFieldValue( this,  a2,  v4,  (const wireless_diagnostics::google::protobuf::FieldDescriptor *)FieldByName) & 1) != 0)
      {
        std::string::basic_string[abi:ne180100]<0>(__p, "]");
        char v31 = wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::TryConsume( (uint64_t)this,  (unsigned __int8 *)__p);
        if ((v31 & 1) != 0) {
          goto LABEL_90;
        }
        std::string::basic_string[abi:ne180100]<0>(__p, ",");
        char v32 = wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::Consume( (uint64_t)this,  (unsigned __int8 *)__p);
        uint64_t v33 = 0LL;
        if ((v32 & 1) == 0) {
          goto LABEL_148;
        }
      }

      goto LABEL_147;
    }
  }

  if (!wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ConsumeFieldValue( this,  a2,  v4,  (const wireless_diagnostics::google::protobuf::FieldDescriptor *)FieldByName))
  {
LABEL_147:
    uint64_t v33 = 0LL;
    goto LABEL_148;
  }

LABEL_90:
  std::string::basic_string[abi:ne180100]<0>(__p, ";");
  if ((wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::TryConsume( (uint64_t)this,  (unsigned __int8 *)__p) & 1) == 0)
  {
    std::string::basic_string[abi:ne180100]<0>(&v67, ",");
    wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::TryConsume( (uint64_t)this,  (unsigned __int8 *)&v67);
  }

  if (*(_BYTE *)(*(void *)(FieldByName + 96) + 46LL))
  {
    std::operator+<char>();
    int v34 = std::string::append(&v67, "");
    __int128 v35 = *(_OWORD *)&v34->__r_.__value_.__l.__data_;
    __p[0].__r_.__value_.__l.__cap_ = v34->__r_.__value_.__l.__cap_;
    *(_OWORD *)&__p[0].__r_.__value_.__l.__data_ = v35;
    v34->__r_.__value_.__l.__size_ = 0LL;
    v34->__r_.__value_.__l.__cap_ = 0LL;
    v34->__r_.__value_.__r.__words[0] = 0LL;
    wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ReportWarning( (uint64_t *)this,  *((unsigned int *)this + 18),  *((unsigned int *)this + 19),  (uint64_t)__p);
  }

  uint64_t v36 = (uint64_t **)*((void *)this + 2);
  if (v36) {
    wireless_diagnostics::google::protobuf::TextFormat::ParseInfoTree::RecordLocation(v36, FieldByName, v6);
  }
  uint64_t v33 = 1LL;
LABEL_148:
  return v33;
}

          wireless_diagnostics::google::protobuf::DescriptorBuilder::OptionInterpreter::AddWithoutInterpreting( FieldByName,  *((const wireless_diagnostics::google::protobuf::UninterpretedOption **)this + 2),  a2);
          __int128 v57 = 1LL;
          goto LABEL_116;
        }
      }

      else
      {
        __int128 v28 = (char)v20->__r_.__value_.__s.__size_;
        if (v28 >= 0) {
          char v29 = (const std::string::value_type *)v20;
        }
        else {
          char v29 = (const std::string::value_type *)v20->__r_.__value_.__r.__words[0];
        }
        if (v28 >= 0) {
          int v30 = v20->__r_.__value_.__s.__size_;
        }
        else {
          int v30 = v20->__r_.__value_.__l.__size_;
        }
        std::string::append(&v82, v29, v30);
        unint64_t FieldByName = (wireless_diagnostics::google::protobuf::DescriptorBuilder::OptionInterpreter *)wireless_diagnostics::google::protobuf::Descriptor::FindFieldByName((uint64_t)v15, (uint64_t)v20);
        int v18 = (uint64_t)FieldByName;
        if (!FieldByName) {
          goto LABEL_87;
        }
      }

      char v31 = *(void *)(v18 + 56);
      if ((const std::string::value_type **)v31 != v15) {
        break;
      }
      if (*(_DWORD *)(v18 + 48) == 3)
      {
        std::operator+<char>();
        v60 = std::string::append(&v77, " is repeated. Repeated options are not supported.");
        __int128 v61 = *(_OWORD *)&v60->__r_.__value_.__l.__data_;
        std::string::size_type cap = v60->__r_.__value_.__l.__cap_;
        v86 = v61;
        v60->__r_.__value_.__l.__size_ = 0LL;
        v60->__r_.__value_.__l.__cap_ = 0LL;
        v60->__r_.__value_.__r.__words[0] = 0LL;
        wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( *(void *)this,  *((void *)this + 1) + 24LL,  *((void *)this + 2),  7LL,  (uint64_t)&v86);
        goto LABEL_93;
      }

      uint64_t v16 = *((void *)this + 2);
      char v32 = *(int *)(v16 + 24);
      if (v17 < v32 - 1)
      {
        if ((*(_DWORD *)(v18 + 44) & 0xFFFFFFFE) != 0xA)
        {
          std::operator+<char>();
          uint64_t v62 = std::string::append(&v77, " is an atomic type, not a message.");
          int v63 = *(_OWORD *)&v62->__r_.__value_.__l.__data_;
          std::string::size_type cap = v62->__r_.__value_.__l.__cap_;
          v86 = v63;
          v62->__r_.__value_.__l.__size_ = 0LL;
          v62->__r_.__value_.__l.__cap_ = 0LL;
          v62->__r_.__value_.__r.__words[0] = 0LL;
          wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( *(void *)this,  *((void *)this + 1) + 24LL,  *((void *)this + 2),  7LL,  (uint64_t)&v86);
LABEL_93:
          if (SHIBYTE(cap) < 0) {
            operator delete((void *)v86);
          }
          if ((char)v77.__r_.__value_.__s.__size_ < 0)
          {
            v64 = (void *)v77.__r_.__value_.__r.__words[0];
            goto LABEL_97;
          }

          goto LABEL_111;
        }

        uint64_t v33 = v84;
        if (v84 >= v85)
        {
          __int128 v35 = ((char *)v84 - (_BYTE *)__p) >> 3;
          uint64_t v36 = ((char *)v85 - (_BYTE *)__p) >> 2;
          if (v36 <= v35 + 1) {
            uint64_t v36 = v35 + 1;
          }
          else {
            int v37 = v36;
          }
          if (v37) {
            __int128 v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>( (uint64_t)&v85,  v37);
          }
          else {
            __int128 v38 = 0LL;
          }
          uint64_t v39 = (uint64_t *)&v38[8 * v35];
          *uint64_t v39 = v18;
          int v34 = v39 + 1;
          int v40 = (char *)v84;
          int v41 = (char *)__p;
          if (v84 != __p)
          {
            do
            {
              std::string::size_type v42 = *((void *)v40 - 1);
              v40 -= 8;
              *--uint64_t v39 = v42;
            }

            while (v40 != v41);
            int v40 = (char *)__p;
          }

          __p = v39;
          v84 = v34;
          v85 = (uint64_t *)&v38[8 * v37];
          if (v40) {
            operator delete(v40);
          }
        }

        else
        {
          *v84 = v18;
          int v34 = v33 + 1;
        }

        v84 = v34;
        uint64_t v15 = *(const std::string::value_type ***)(v18 + 72);
        uint64_t v16 = *((void *)this + 2);
        LODWORD(v32) = *(_DWORD *)(v16 + 24);
      }
    }

    if (*(_BYTE *)(v31 + 40)) {
      goto LABEL_90;
    }
    std::operator+<char>();
    std::string v65 = std::string::append(&v80, " is not a field or extension of message ");
    std::string v66 = *(_OWORD *)&v65->__r_.__value_.__l.__data_;
    v81.__r_.__value_.__l.__cap_ = v65->__r_.__value_.__l.__cap_;
    *(_OWORD *)&v81.__r_.__value_.__l.__data_ = v66;
    v65->__r_.__value_.__l.__size_ = 0LL;
    v65->__r_.__value_.__l.__cap_ = 0LL;
    v65->__r_.__value_.__r.__words[0] = 0LL;
    std::string v67 = (*v15)[23];
    if (v67 >= 0) {
      std::string v68 = *v15;
    }
    else {
      std::string v68 = *(const std::string::value_type **)*v15;
    }
    if (v67 >= 0) {
      v69 = *((unsigned __int8 *)*v15 + 23);
    }
    else {
      v69 = *((void *)*v15 + 1);
    }
    v70 = std::string::append(&v81, v68, v69);
    v71 = *(_OWORD *)&v70->__r_.__value_.__l.__data_;
    v77.__r_.__value_.__l.__cap_ = v70->__r_.__value_.__l.__cap_;
    *(_OWORD *)&v77.__r_.__value_.__l.__data_ = v71;
    v70->__r_.__value_.__l.__size_ = 0LL;
    v70->__r_.__value_.__l.__cap_ = 0LL;
    v70->__r_.__value_.__r.__words[0] = 0LL;
    v72 = std::string::append(&v77, ".");
    v73 = *(_OWORD *)&v72->__r_.__value_.__l.__data_;
    std::string::size_type cap = v72->__r_.__value_.__l.__cap_;
    v86 = v73;
    v72->__r_.__value_.__l.__size_ = 0LL;
    v72->__r_.__value_.__l.__cap_ = 0LL;
    v72->__r_.__value_.__r.__words[0] = 0LL;
    wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( *(void *)this,  *((void *)this + 1) + 24LL,  *((void *)this + 2),  7LL,  (uint64_t)&v86);
    if (SHIBYTE(cap) < 0) {
      operator delete((void *)v86);
    }
    if ((char)v80.__r_.__value_.__s.__size_ < 0)
    {
      v64 = (void *)v80.__r_.__value_.__r.__words[0];
LABEL_97:
      operator delete(v64);
    }

void sub_187C37950( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20, int a21, __int16 a22, char a23, char a24, void *a25, uint64_t a26, int a27, __int16 a28, char a29, char a30, uint64_t a31, void *a32, uint64_t a33, int a34, __int16 a35, char a36, char a37)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a37 < 0) {
    operator delete(a32);
  }
  if (a30 < 0) {
    operator delete(a25);
  }
  if (a24 < 0) {
    operator delete(a19);
  }
  _Unwind_Resume(exception_object);
}

uint64_t wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::TryConsume( uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 71);
  if ((v2 & 0x80u) == 0LL) {
    uint64_t v3 = *(unsigned __int8 *)(a1 + 71);
  }
  else {
    uint64_t v3 = *(void *)(a1 + 56);
  }
  uint64_t v4 = a2[23];
  int v5 = (char)v4;
  if ((v4 & 0x80u) != 0LL) {
    uint64_t v4 = *((void *)a2 + 1);
  }
  if (v3 != v4) {
    return 0LL;
  }
  int v7 = (const void **)(a1 + 48);
  if (v5 < 0) {
    a2 = *(unsigned __int8 **)a2;
  }
  if ((v2 & 0x80) != 0)
  {
    if (!memcmp(*v7, a2, *(void *)(a1 + 56))) {
      goto LABEL_16;
    }
    return 0LL;
  }

  if (*(_BYTE *)(a1 + 71))
  {
    while (*(unsigned __int8 *)v7 == *a2)
    {
      int v7 = (const void **)((char *)v7 + 1);
      ++a2;
      if (!--v2) {
        goto LABEL_16;
      }
    }

    return 0LL;
  }

LABEL_16:
  wireless_diagnostics::google::protobuf::io::Tokenizer::Next((wireless_diagnostics::google::protobuf::io::Tokenizer *)(a1 + 40));
  return 1LL;
}

  std::operator+<char>();
  int v9 = std::string::append(&v19, ", found ");
  int v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  v20.__r_.__value_.__l.__cap_ = v9->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v20.__r_.__value_.__l.__data_ = v10;
  v9->__r_.__value_.__l.__size_ = 0LL;
  v9->__r_.__value_.__l.__cap_ = 0LL;
  v9->__r_.__value_.__r.__words[0] = 0LL;
  uint64_t v11 = *(char *)(a1 + 71);
  if (v11 >= 0) {
    uint64_t v12 = (const std::string::value_type *)v3;
  }
  else {
    uint64_t v12 = *(const std::string::value_type **)(a1 + 48);
  }
  if (v11 >= 0) {
    char v13 = *(unsigned __int8 *)(a1 + 71);
  }
  else {
    char v13 = *(void *)(a1 + 56);
  }
  char v14 = std::string::append(&v20, v12, v13);
  uint64_t v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
  v21.__r_.__value_.__l.__cap_ = v14->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v21.__r_.__value_.__l.__data_ = v15;
  v14->__r_.__value_.__l.__size_ = 0LL;
  v14->__r_.__value_.__l.__cap_ = 0LL;
  v14->__r_.__value_.__r.__words[0] = 0LL;
  uint64_t v16 = std::string::append(&v21, ".");
  uint64_t v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
  std::string::size_type cap = v16->__r_.__value_.__l.__cap_;
  double v22 = v17;
  v16->__r_.__value_.__l.__size_ = 0LL;
  v16->__r_.__value_.__l.__cap_ = 0LL;
  v16->__r_.__value_.__r.__words[0] = 0LL;
  wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ReportError( (uint64_t *)a1,  *(unsigned int *)(a1 + 72),  *(unsigned int *)(a1 + 76),  (uint64_t)&v22);
  if (SHIBYTE(cap) < 0) {
    operator delete((void *)v22);
  }
  return 0LL;
}

BOOL wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ConsumeIdentifier( uint64_t a1, std::string *this)
{
  uint64_t v3 = (wireless_diagnostics::google::protobuf::io::Tokenizer *)(a1 + 40);
  int v4 = *(_DWORD *)(a1 + 40);
  if (v4 == 2)
  {
    std::string::operator=(this, (const std::string *)(a1 + 48));
    wireless_diagnostics::google::protobuf::io::Tokenizer::Next(v3);
  }

  else
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "Expected identifier.");
    wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ReportError( (uint64_t *)a1,  *(unsigned int *)(a1 + 72),  *(unsigned int *)(a1 + 76),  (uint64_t)__p);
    if (v7 < 0) {
      operator delete(__p[0]);
    }
  }

  return v4 == 2;
}

void sub_187C37C2C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::Consume( uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v3 = (const void **)(a1 + 48);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 71);
  if ((v4 & 0x80u) == 0LL) {
    uint64_t v5 = *(unsigned __int8 *)(a1 + 71);
  }
  else {
    uint64_t v5 = *(void *)(a1 + 56);
  }
  uint64_t v6 = a2[23];
  int v7 = (char)v6;
  if ((v6 & 0x80u) != 0LL) {
    uint64_t v6 = *((void *)a2 + 1);
  }
  if (v5 == v6)
  {
    if (v7 < 0) {
      a2 = *(unsigned __int8 **)a2;
    }
    if ((v4 & 0x80) == 0)
    {
      if (*(_BYTE *)(a1 + 71))
      {
        int v8 = (unsigned __int8 *)(a1 + 48);
        while (*v8 == *a2)
        {
          ++v8;
          ++a2;
          if (!--v4) {
            goto LABEL_31;
          }
        }

        goto LABEL_16;
      }

LABEL_31:
      wireless_diagnostics::google::protobuf::io::Tokenizer::Next((wireless_diagnostics::google::protobuf::io::Tokenizer *)(a1 + 40));
      return 1LL;
    }

    if (!memcmp(*v3, a2, *(void *)(a1 + 56))) {
      goto LABEL_31;
    }
  }

  wireless_diagnostics::google::protobuf::internal::MutexLockMaybe::~MutexLockMaybe(&v35);
  return v19 | ((unint64_t)v20 << 32);
}

void sub_187C37DF4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21, uint64_t a22, void *__p, uint64_t a24, int a25, __int16 a26, char a27, char a28)
{
  if (a28 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::LookingAt( uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 71);
  if ((v2 & 0x80u) == 0LL) {
    uint64_t v3 = *(unsigned __int8 *)(a1 + 71);
  }
  else {
    uint64_t v3 = *(void *)(a1 + 56);
  }
  uint64_t v4 = a2[23];
  int v5 = (char)v4;
  if ((v4 & 0x80u) != 0LL) {
    uint64_t v4 = *((void *)a2 + 1);
  }
  if (v3 != v4) {
    return 0LL;
  }
  uint64_t v6 = (const void **)(a1 + 48);
  if (v5 < 0) {
    a2 = *(unsigned __int8 **)a2;
  }
  if ((v2 & 0x80) != 0) {
    return memcmp(*v6, a2, *(void *)(a1 + 56)) == 0;
  }
  if (!*(_BYTE *)(a1 + 71)) {
    return 1LL;
  }
  uint64_t v7 = v2 - 1;
  do
  {
    int v9 = *(unsigned __int8 *)v6;
    uint64_t v6 = (const void **)((char *)v6 + 1);
    int v8 = v9;
    int v11 = *a2++;
    int v10 = v11;
    BOOL v13 = v7-- != 0;
    uint64_t result = v8 == v10;
  }

  while (v8 == v10 && v13);
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::SkipFieldValue( wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl *this)
{
  uint64_t v1 = (wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl *)((char *)this + 40);
  if (*((_DWORD *)this + 10) == 5)
  {
    do
      wireless_diagnostics::google::protobuf::io::Tokenizer::Next(v1);
    while (*(_DWORD *)v1 == 5);
    return 1LL;
  }

  std::string::basic_string[abi:ne180100]<0>(&__p, "-");
  int v3 = wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::TryConsume( (uint64_t)this,  (unsigned __int8 *)&__p);
  if ((*(_DWORD *)v1 - 3) < 2)
  {
LABEL_7:
    wireless_diagnostics::google::protobuf::io::Tokenizer::Next(v1);
    return 1LL;
  }

  if (*(_DWORD *)v1 == 2)
  {
    if (!v3) {
      goto LABEL_7;
    }
    else {
      std::string __p = *(std::string *)((_BYTE *)this + 2);
    }
    int size = __p.__r_.__value_.__s.__size_;
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v7 = (std::string *)((char *)&__p + __p.__r_.__value_.__s.__size_);
    }
    else {
      uint64_t v7 = (std::string *)(__p.__r_.__value_.__r.__words[0] + __p.__r_.__value_.__l.__size_);
    }
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      p_p = &__p;
    }
    if (p_p != v7)
    {
      do
      {
        int v8 = p_p->__r_.__value_.__s.__data_[0];
        p_p = (std::string *)((char *)p_p + 1);
      }

      while (p_p != v7);
      int size = __p.__r_.__value_.__s.__size_;
    }

    if ((size & 0x80) != 0)
    {
      std::string::size_type v9 = __p.__r_.__value_.__l.__size_;
      if (__p.__r_.__value_.__l.__size_ == 3
        && *(_WORD *)__p.__r_.__value_.__l.__data_ == 28265
        && *(_BYTE *)(__p.__r_.__value_.__r.__words[0] + 2) == 102)
      {
LABEL_53:
        if ((size & 0x80) == 0) {
          goto LABEL_7;
        }
LABEL_54:
        operator delete(__p.__r_.__value_.__l.__data_);
        goto LABEL_7;
      }

      if (__p.__r_.__value_.__l.__size_ == 8)
      {
        if (*(void *)__p.__r_.__value_.__l.__data_ == 0x7974696E69666E69LL) {
          goto LABEL_54;
        }
        std::string::size_type v9 = __p.__r_.__value_.__l.__size_;
      }

      if (v9 != 3)
      {
LABEL_48:
        std::operator+<char>();
        wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ReportError( (uint64_t *)this,  *((unsigned int *)this + 18),  *((unsigned int *)this + 19),  (uint64_t)&v16);
        if (v17 < 0) {
          operator delete(v16);
        }
        return 0LL;
      }

      int v11 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }

    else
    {
      if (size != 3)
      {
        if (size != 8 || __p.__r_.__value_.__r.__words[0] != 0x7974696E69666E69LL) {
          goto LABEL_48;
        }
        goto LABEL_53;
      }

      if (LOWORD(__p.__r_.__value_.__l.__data_) == 28265 && __p.__r_.__value_.__s.__data_[2] == 102) {
        goto LABEL_7;
      }
      int v11 = &__p;
    }

    int data_low = LOWORD(v11->__r_.__value_.__l.__data_);
    int v14 = v11->__r_.__value_.__s.__data_[2];
    if (data_low != 24942 || v14 != 110) {
      goto LABEL_48;
    }
    goto LABEL_53;
  }

  return 0LL;
}

void sub_187C38160( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::SkipFieldMessage( wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl *this)
{
  v15[0] = 0LL;
  v15[1] = 0LL;
  uint64_t v16 = 0LL;
  std::string::basic_string[abi:ne180100]<0>(__p, "<");
  int v2 = wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::TryConsume( (uint64_t)this,  (unsigned __int8 *)__p);
  int v3 = v2;
  if (v14 < 0)
  {
    operator delete(__p[0]);
    if (v3) {
      goto LABEL_3;
    }
  }

  else if (v2)
  {
LABEL_3:
    uint64_t v4 = ">";
    goto LABEL_10;
  }

  std::string::basic_string[abi:ne180100]<0>(__p, "{");
  char v5 = wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::Consume( (uint64_t)this,  (unsigned __int8 *)__p);
  char v6 = v5;
  if (v14 < 0)
  {
    operator delete(__p[0]);
    if ((v6 & 1) == 0)
    {
LABEL_20:
      uint64_t v9 = 0LL;
      goto LABEL_22;
    }
  }

  else if ((v5 & 1) == 0)
  {
    goto LABEL_20;
  }

  uint64_t v4 = "}";
LABEL_10:
  MEMORY[0x1895B3A84](v15, v4);
  while (1)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, ">");
    if ((wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::LookingAt( (uint64_t)this,  (unsigned __int8 *)__p) & 1) != 0)
    {
      int v7 = 0;
    }

    else
    {
      std::string::basic_string[abi:ne180100]<0>(v11, "}");
      int v8 = wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::LookingAt( (uint64_t)this,  (unsigned __int8 *)v11);
      if (v12 < 0) {
        operator delete(v11[0]);
      }
      int v7 = v8 ^ 1;
    }

    if (v14 < 0) {
      operator delete(__p[0]);
    }
    if (!v7) {
      break;
    }
    if ((wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::SkipField(this) & 1) == 0) {
      goto LABEL_20;
    }
  }

  uint64_t v9 = wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::Consume( (uint64_t)this,  (unsigned __int8 *)v15);
LABEL_22:
  if (SHIBYTE(v16) < 0) {
    operator delete(v15[0]);
  }
  return v9;
}

void sub_187C3830C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *a19, uint64_t a20, int a21, __int16 a22, char a23, char a24)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  if (a24 < 0) {
    operator delete(a19);
  }
  _Unwind_Resume(exception_object);
}

uint64_t wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ConsumeFieldMessage( wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl *this, wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::Reflection *a3, const wireless_diagnostics::google::protobuf::FieldDescriptor *a4)
{
  uint64_t v8 = *((void *)this + 2);
  if (v8) {
    *((void *)this + 2) = wireless_diagnostics::google::protobuf::TextFormat::ParseInfoTree::CreateNested( *((uint64_t ***)this + 2),  a4);
  }
  memset(&v25, 0, sizeof(v25));
  std::string::basic_string[abi:ne180100]<0>(__p, "<");
  char v9 = wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::TryConsume( (uint64_t)this,  (unsigned __int8 *)__p);
  char v10 = v9;
  if (v24 < 0)
  {
    operator delete(__p[0]);
    if ((v10 & 1) != 0) {
      goto LABEL_5;
    }
  }

  else if ((v9 & 1) != 0)
  {
LABEL_5:
    int v11 = ">";
    goto LABEL_12;
  }

  std::string::basic_string[abi:ne180100]<0>(__p, "{");
  char v12 = wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::Consume( (uint64_t)this,  (unsigned __int8 *)__p);
  char v13 = v12;
  if (v24 < 0)
  {
    operator delete(__p[0]);
    if ((v13 & 1) == 0) {
      goto LABEL_26;
    }
  }

  else if ((v12 & 1) == 0)
  {
    goto LABEL_26;
  }

  int v11 = "}";
LABEL_12:
  MEMORY[0x1895B3A84](&v25, v11);
  uint64_t v14 = *(void *)a3;
  if (*((_DWORD *)a4 + 12) == 3)
  {
    __int128 v15 = (wireless_diagnostics::google::protobuf::Message *)(*(uint64_t (**)(const wireless_diagnostics::google::protobuf::Reflection *, wireless_diagnostics::google::protobuf::Message *, const wireless_diagnostics::google::protobuf::FieldDescriptor *, void))(v14 + 520))( a3,  a2,  a4,  0LL);
    else {
      std::string v22 = v25;
    }
    char v17 = wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ConsumeMessage( this,  v15,  (unsigned __int8 *)&v22);
    if ((char)v22.__r_.__value_.__s.__size_ < 0)
    {
      int v18 = (void *)v22.__r_.__value_.__r.__words[0];
      goto LABEL_25;
    }
  }

  else
  {
    uint64_t v16 = (wireless_diagnostics::google::protobuf::Message *)(*(uint64_t (**)(const wireless_diagnostics::google::protobuf::Reflection *, wireless_diagnostics::google::protobuf::Message *, const wireless_diagnostics::google::protobuf::FieldDescriptor *, void))(v14 + 264))( a3,  a2,  a4,  0LL);
    else {
      std::string v21 = v25;
    }
    char v17 = wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ConsumeMessage( this,  v16,  (unsigned __int8 *)&v21);
    if ((char)v21.__r_.__value_.__s.__size_ < 0)
    {
      int v18 = (void *)v21.__r_.__value_.__r.__words[0];
LABEL_25:
      operator delete(v18);
      if ((v17 & 1) == 0) {
        goto LABEL_26;
      }
LABEL_23:
      *((void *)this + 2) = v8;
      uint64_t v19 = 1LL;
      goto LABEL_27;
    }
  }

  if ((v17 & 1) != 0) {
    goto LABEL_23;
  }
LABEL_26:
  uint64_t v19 = 0LL;
LABEL_27:
  return v19;
}

void sub_187C38554( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, __int16 a19, char a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, int a25, __int16 a26, char a27, char a28)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ConsumeFieldValue( wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl *this, wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::Reflection *a3, const wireless_diagnostics::google::protobuf::FieldDescriptor *a4)
{
  switch(*((_DWORD *)a4 + 11))
  {
    case 1:
      uint64_t result = wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ConsumeDouble( this,  (double *)__p);
      if ((_DWORD)result)
      {
        v16.n128_u64[0] = __p[0].__r_.__value_.__r.__words[0];
        uint64_t v17 = 232LL;
        if (*((_DWORD *)a4 + 12) == 3) {
          uint64_t v17 = 488LL;
        }
        goto LABEL_16;
      }

      return result;
    case 2:
      uint64_t result = wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ConsumeDouble( this,  (double *)__p);
      if ((_DWORD)result)
      {
        v16.n128_u32[1] = HIDWORD(__p[0].__r_.__value_.__r.__words[0]);
        v16.n128_f32[0] = *(double *)&__p[0].__r_.__value_.__l.__data_;
        uint64_t v17 = 224LL;
        if (*((_DWORD *)a4 + 12) == 3) {
          uint64_t v17 = 480LL;
        }
LABEL_16:
        (*(void (**)(const wireless_diagnostics::google::protobuf::Reflection *, wireless_diagnostics::google::protobuf::Message *, const wireless_diagnostics::google::protobuf::FieldDescriptor *, __n128))(*(void *)a3 + v17))( a3,  a2,  a4,  v16);
        return 1LL;
      }

      return result;
    case 3:
    case 0x10:
    case 0x12:
      uint64_t result = wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ConsumeSignedInteger( this,  (uint64_t *)__p,  0x7FFFFFFFFFFFFFFFLL);
      if ((_DWORD)result)
      {
        std::string::size_type data_low = __p[0].__r_.__value_.__r.__words[0];
        uint64_t v10 = *(void *)a3;
        BOOL v14 = *((_DWORD *)a4 + 12) == 3;
        uint64_t v12 = 200LL;
        uint64_t v15 = 456LL;
        goto LABEL_10;
      }

      return result;
    case 4:
    case 6:
      uint64_t result = wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ConsumeUnsignedInteger( this,  (unint64_t *)__p,  0xFFFFFFFFFFFFFFFFLL);
      if ((_DWORD)result)
      {
        std::string::size_type data_low = __p[0].__r_.__value_.__r.__words[0];
        uint64_t v10 = *(void *)a3;
        BOOL v14 = *((_DWORD *)a4 + 12) == 3;
        uint64_t v12 = 216LL;
        uint64_t v15 = 472LL;
LABEL_10:
        if (v14) {
          uint64_t v12 = v15;
        }
        goto LABEL_12;
      }

      return result;
    case 5:
    case 0xF:
    case 0x11:
      uint64_t result = wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ConsumeSignedInteger( this,  (uint64_t *)__p,  0x7FFFFFFFLL);
      if ((_DWORD)result)
      {
        std::string::size_type data_low = LODWORD(__p[0].__r_.__value_.__l.__data_);
        uint64_t v10 = *(void *)a3;
        BOOL v11 = *((_DWORD *)a4 + 12) == 3;
        uint64_t v12 = 192LL;
        uint64_t v13 = 448LL;
        goto LABEL_24;
      }

      return result;
    case 7:
    case 0xD:
      uint64_t result = wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ConsumeUnsignedInteger( this,  (unint64_t *)__p,  0xFFFFFFFFuLL);
      if ((_DWORD)result)
      {
        std::string::size_type data_low = LODWORD(__p[0].__r_.__value_.__l.__data_);
        uint64_t v10 = *(void *)a3;
        BOOL v11 = *((_DWORD *)a4 + 12) == 3;
        uint64_t v12 = 208LL;
        uint64_t v13 = 464LL;
        goto LABEL_24;
      }

      return result;
    case 8:
      if (*((_DWORD *)this + 10) != 3)
      {
        memset(__p, 0, 24);
        if (!wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ConsumeIdentifier( (uint64_t)this,  __p)) {
          goto LABEL_109;
        }
        if ((char)__p[0].__r_.__value_.__s.__size_ < 0)
        {
          if (__p[0].__r_.__value_.__l.__size_ == 4)
          {
            std::string v22 = (std::string *)__p[0].__r_.__value_.__r.__words[0];
LABEL_83:
            if (LODWORD(v22->__r_.__value_.__l.__data_) == 1702195828)
            {
LABEL_85:
              uint64_t v37 = (void (**)(const wireless_diagnostics::google::protobuf::Reflection *, wireless_diagnostics::google::protobuf::Message *, const wireless_diagnostics::google::protobuf::FieldDescriptor *, uint64_t))(*(void *)a3 + 240LL);
              if (*((_DWORD *)a4 + 12) == 3) {
                uint64_t v37 = (void (**)(const wireless_diagnostics::google::protobuf::Reflection *, wireless_diagnostics::google::protobuf::Message *, const wireless_diagnostics::google::protobuf::FieldDescriptor *, uint64_t))(*(void *)a3 + 496LL);
              }
              uint64_t v38 = 1LL;
LABEL_94:
              (*v37)(a3, a2, a4, v38);
              char v39 = 1;
              goto LABEL_110;
            }
          }
        }

        else if (__p[0].__r_.__value_.__s.__size_ == 4)
        {
          std::string v22 = __p;
          goto LABEL_83;
        }

        if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(__p, "false")
          || std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(__p, "f"))
        {
          uint64_t v37 = (void (**)(const wireless_diagnostics::google::protobuf::Reflection *, wireless_diagnostics::google::protobuf::Message *, const wireless_diagnostics::google::protobuf::FieldDescriptor *, uint64_t))(*(void *)a3 + 240LL);
          if (*((_DWORD *)a4 + 12) == 3) {
            uint64_t v37 = (void (**)(const wireless_diagnostics::google::protobuf::Reflection *, wireless_diagnostics::google::protobuf::Message *, const wireless_diagnostics::google::protobuf::FieldDescriptor *, uint64_t))(*(void *)a3 + 496LL);
          }
          uint64_t v38 = 0LL;
          goto LABEL_94;
        }

        std::operator+<char>();
        int v40 = std::string::append(&v49, ". Value: ");
        __int128 v41 = *(_OWORD *)&v40->__r_.__value_.__l.__data_;
        v50.__r_.__value_.__l.__cap_ = v40->__r_.__value_.__l.__cap_;
        *(_OWORD *)&v50.__r_.__value_.__l.__data_ = v41;
        v40->__r_.__value_.__l.__size_ = 0LL;
        v40->__r_.__value_.__l.__cap_ = 0LL;
        v40->__r_.__value_.__r.__words[0] = 0LL;
        if ((__p[0].__r_.__value_.__s.__size_ & 0x80u) == 0) {
          std::string::size_type v42 = __p;
        }
        else {
          std::string::size_type v42 = (std::string *)__p[0].__r_.__value_.__r.__words[0];
        }
        if ((__p[0].__r_.__value_.__s.__size_ & 0x80u) == 0) {
          std::string::size_type size = __p[0].__r_.__value_.__s.__size_;
        }
        else {
          std::string::size_type size = __p[0].__r_.__value_.__l.__size_;
        }
        __int128 v44 = std::string::append(&v50, (const std::string::value_type *)v42, size);
        __int128 v45 = *(_OWORD *)&v44->__r_.__value_.__l.__data_;
        v51.__r_.__value_.__l.__cap_ = v44->__r_.__value_.__l.__cap_;
        *(_OWORD *)&v51.__r_.__value_.__l.__data_ = v45;
        v44->__r_.__value_.__l.__size_ = 0LL;
        v44->__r_.__value_.__l.__cap_ = 0LL;
        v44->__r_.__value_.__r.__words[0] = 0LL;
        __int128 v46 = std::string::append(&v51, ".");
        __int128 v47 = *(_OWORD *)&v46->__r_.__value_.__l.__data_;
        v52.__r_.__value_.__l.__cap_ = v46->__r_.__value_.__l.__cap_;
        *(_OWORD *)&v52.__r_.__value_.__l.__data_ = v47;
        v46->__r_.__value_.__l.__size_ = 0LL;
        v46->__r_.__value_.__l.__cap_ = 0LL;
        v46->__r_.__value_.__r.__words[0] = 0LL;
        wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ReportError( (uint64_t *)this,  *((unsigned int *)this + 18),  *((unsigned int *)this + 19),  (uint64_t)&v52);
LABEL_109:
        char v39 = 0;
LABEL_110:
        return (v39 & 1) != 0;
      }

      uint64_t result = wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ConsumeUnsignedInteger( this,  (unint64_t *)__p,  1uLL);
      if ((_DWORD)result)
      {
        std::string::size_type data_low = __p[0].__r_.__value_.__r.__words[0] != 0;
        uint64_t v10 = *(void *)a3;
        BOOL v11 = *((_DWORD *)a4 + 12) == 3;
        uint64_t v12 = 240LL;
        uint64_t v13 = 496LL;
LABEL_24:
        if (v11) {
          uint64_t v12 = v13;
        }
LABEL_12:
        (*(void (**)(const wireless_diagnostics::google::protobuf::Reflection *, wireless_diagnostics::google::protobuf::Message *, const wireless_diagnostics::google::protobuf::FieldDescriptor *, std::string::size_type))(v10 + v12))( a3,  a2,  a4,  data_low);
        return 1LL;
      }

      return result;
    case 9:
    case 0xC:
      memset(__p, 0, 24);
      BOOL v20 = wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ConsumeString( (uint64_t)this,  __p,  (uint64_t)a3,  (unsigned int *)a4);
      if (v20)
      {
        uint64_t v21 = 248LL;
        if (*((_DWORD *)a4 + 12) == 3) {
          uint64_t v21 = 504LL;
        }
        (*(void (**)(const wireless_diagnostics::google::protobuf::Reflection *, wireless_diagnostics::google::protobuf::Message *, const wireless_diagnostics::google::protobuf::FieldDescriptor *, std::string *))(*(void *)a3 + v21))( a3,  a2,  a4,  __p);
      }

      if ((char)__p[0].__r_.__value_.__s.__size_ < 0)
      {
        operator delete(__p[0].__r_.__value_.__l.__data_);
        if (!v20) {
          return 0LL;
        }
      }

      else if (!v20)
      {
        return 0LL;
      }

      return 1LL;
    case 0xA:
    case 0xB:
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
      wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)__p);
      return 1LL;
    case 0xE:
      memset(__p, 0, 24);
      int v18 = (wireless_diagnostics::google::protobuf::EnumDescriptor *)*((void *)a4 + 10);
      if (*((_DWORD *)this + 10) == 2)
      {
        if (!wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ConsumeIdentifier( (uint64_t)this,  __p)) {
          goto LABEL_75;
        }
        uint64_t ValueByName = wireless_diagnostics::google::protobuf::EnumDescriptor::FindValueByName( (uint64_t)v18,  (uint64_t)__p);
      }

      else
      {
        std::string::basic_string[abi:ne180100]<0>(&v52, "-");
        if ((wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::LookingAt( (uint64_t)this,  (unsigned __int8 *)&v52) & 1) != 0)
        {
        }

        else
        {
          int v23 = *((_DWORD *)this + 10);
          if (v23 != 3)
          {
            std::string::basic_string[abi:ne180100]<0>(&v52, "Expected integer or identifier.");
            wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ReportError( (uint64_t *)this,  *((unsigned int *)this + 18),  *((unsigned int *)this + 19),  (uint64_t)&v52);
            if ((char)v52.__r_.__value_.__s.__size_ < 0)
            {
              uint64_t v36 = (void *)v52.__r_.__value_.__r.__words[0];
              goto LABEL_74;
            }

LABEL_75:
            char v26 = 1;
            goto LABEL_76;
          }
        }

        if ((wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ConsumeSignedInteger( this,  (uint64_t *)&v51,  0x7FFFFFFFLL) & 1) == 0) {
          goto LABEL_75;
        }
        wireless_diagnostics::google::protobuf::SimpleItoa( (wireless_diagnostics::google::protobuf *)v51.__r_.__value_.__l.__data_,  v24,  &v52);
        __p[0] = v52;
        uint64_t ValueByName = wireless_diagnostics::google::protobuf::EnumDescriptor::FindValueByNumber( v18,  (int)v51.__r_.__value_.__l.__data_);
      }

      if (ValueByName)
      {
        uint64_t v25 = 256LL;
        if (*((_DWORD *)a4 + 12) == 3) {
          uint64_t v25 = 512LL;
        }
        (*(void (**)(const wireless_diagnostics::google::protobuf::Reflection *, wireless_diagnostics::google::protobuf::Message *, const wireless_diagnostics::google::protobuf::FieldDescriptor *, uint64_t))(*(void *)a3 + v25))( a3,  a2,  a4,  ValueByName);
        char v26 = 0;
LABEL_76:
        if ((char)__p[0].__r_.__value_.__s.__size_ < 0)
        {
          operator delete(__p[0].__r_.__value_.__l.__data_);
          if ((v26 & 1) != 0) {
            return 0LL;
          }
        }

        else if ((v26 & 1) != 0)
        {
          return 0LL;
        }

        return 1LL;
      }

      std::operator+<char>();
      int v27 = std::string::append(&v49, " for field ");
      __int128 v28 = *(_OWORD *)&v27->__r_.__value_.__l.__data_;
      v50.__r_.__value_.__l.__cap_ = v27->__r_.__value_.__l.__cap_;
      *(_OWORD *)&v50.__r_.__value_.__l.__data_ = v28;
      v27->__r_.__value_.__l.__size_ = 0LL;
      v27->__r_.__value_.__l.__cap_ = 0LL;
      v27->__r_.__value_.__r.__words[0] = 0LL;
      int v29 = *(char *)(*(void *)a4 + 23LL);
      if (v29 >= 0) {
        int v30 = *(const std::string::value_type **)a4;
      }
      else {
        int v30 = **(const std::string::value_type ***)a4;
      }
      if (v29 >= 0) {
        std::string::size_type v31 = *(unsigned __int8 *)(*(void *)a4 + 23LL);
      }
      else {
        std::string::size_type v31 = *(void *)(*(void *)a4 + 8LL);
      }
      char v32 = std::string::append(&v50, v30, v31);
      __int128 v33 = *(_OWORD *)&v32->__r_.__value_.__l.__data_;
      v51.__r_.__value_.__l.__cap_ = v32->__r_.__value_.__l.__cap_;
      *(_OWORD *)&v51.__r_.__value_.__l.__data_ = v33;
      v32->__r_.__value_.__l.__size_ = 0LL;
      v32->__r_.__value_.__l.__cap_ = 0LL;
      v32->__r_.__value_.__r.__words[0] = 0LL;
      int v34 = std::string::append(&v51, ".");
      __int128 v35 = *(_OWORD *)&v34->__r_.__value_.__l.__data_;
      v52.__r_.__value_.__l.__cap_ = v34->__r_.__value_.__l.__cap_;
      *(_OWORD *)&v52.__r_.__value_.__l.__data_ = v35;
      v34->__r_.__value_.__l.__size_ = 0LL;
      v34->__r_.__value_.__l.__cap_ = 0LL;
      v34->__r_.__value_.__r.__words[0] = 0LL;
      wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ReportError( (uint64_t *)this,  *((unsigned int *)this + 18),  *((unsigned int *)this + 19),  (uint64_t)&v52);
      if ((char)v49.__r_.__value_.__s.__size_ < 0)
      {
        uint64_t v36 = (void *)v49.__r_.__value_.__r.__words[0];
LABEL_74:
        operator delete(v36);
        goto LABEL_75;
      }

      goto LABEL_75;
    default:
      return 1LL;
  }

void sub_187C38CF0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20, int a21, __int16 a22, char a23, char a24, void *a25, uint64_t a26, int a27, __int16 a28, char a29, char a30, uint64_t a31, void *__p, uint64_t a33, int a34, __int16 a35, char a36, char a37)
{
  if (a37 < 0) {
    operator delete(__p);
  }
  if (a30 < 0) {
    operator delete(a25);
  }
  if (a24 < 0) {
    operator delete(a19);
  }
  if (a14 < 0) {
    operator delete(a9);
  }
  _Unwind_Resume(exception_object);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x189614700], MEMORY[0x189614270]);
}

void std::string::__init_copy_ctor_external( std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  char v5 = this;
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
    uint64_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__l.__cap_ = v7 | 0x8000000000000000LL;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    char v5 = v8;
  }

  else
  {
    this->__r_.__value_.__s.__size_ = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

BOOL std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (*((char *)a1 + 23) < 0)
  {
    if (v4 == a1[1])
    {
      if (v4 == -1LL) {
        goto LABEL_10;
      }
      a1 = (void *)*a1;
      return memcmp(a1, __s, v4) == 0;
    }
  }

  else if (v4 == *((unsigned __int8 *)a1 + 23))
  {
    if (v4 == -1LL) {
LABEL_10:
    }
      std::string::__throw_out_of_range[abi:ne180100]();
    return memcmp(a1, __s, v4) == 0;
  }

  return 0LL;
}

void std::string::__throw_out_of_range[abi:ne180100]()
{
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_18A11AD00, MEMORY[0x189614200]);
}

void sub_187C38F58(_Unwind_Exception *a1)
{
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x189614780] + 16LL);
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::SkipField( wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl *this)
{
  int v2 = wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::TryConsume( (uint64_t)this,  (unsigned __int8 *)&__p);
  int v3 = v2;
  if ((char)__p.__r_.__value_.__s.__size_ < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if (v3) {
      goto LABEL_3;
    }
  }

  else if (v2)
  {
LABEL_3:
    while (1)
    {
      std::string::basic_string[abi:ne180100]<0>(&__p, ".");
      int v4 = wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::TryConsume( (uint64_t)this,  (unsigned __int8 *)&__p);
      if (!v4) {
        break;
      }
      memset(&__p, 0, sizeof(__p));
      if (!wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ConsumeIdentifier( (uint64_t)this,  &__p))
      {
        goto LABEL_35;
      }

      std::string::append(&v16, ".");
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        std::string::size_type size = __p.__r_.__value_.__s.__size_;
      }
      else {
        std::string::size_type size = __p.__r_.__value_.__l.__size_;
      }
      std::string::append(&v16, (const std::string::value_type *)p_p, size);
    }

    std::string::basic_string[abi:ne180100]<0>(&__p, "]");
    char v7 = wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::Consume( (uint64_t)this,  (unsigned __int8 *)&__p);
    if ((v7 & 1) == 0) {
      goto LABEL_35;
    }
    goto LABEL_22;
  }

LABEL_22:
  std::string::basic_string[abi:ne180100]<0>(&__p, ":");
  if (wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::TryConsume( (uint64_t)this,  (unsigned __int8 *)&__p))
  {
    std::string::basic_string[abi:ne180100]<0>(v13, "{");
    if ((wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::LookingAt( (uint64_t)this,  (unsigned __int8 *)v13) & 1) != 0)
    {
      int v8 = 0;
    }

    else
    {
      std::string::basic_string[abi:ne180100]<0>(v11, "<");
      int v8 = wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::LookingAt( (uint64_t)this,  (unsigned __int8 *)v11) ^ 1;
      if (v12 < 0) {
        operator delete(v11[0]);
      }
    }

    if (v14 < 0) {
      operator delete(v13[0]);
    }
  }

  else
  {
    int v8 = 0;
  }

  if (((char)__p.__r_.__value_.__s.__size_ & 0x80000000) == 0)
  {
    if (v8) {
      goto LABEL_34;
    }
LABEL_40:
    goto LABEL_41;
  }

  operator delete(__p.__r_.__value_.__l.__data_);
  if (!v8) {
    goto LABEL_40;
  }
LABEL_34:
  if ((wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::SkipFieldValue(this) & 1) == 0)
  {
LABEL_35:
    uint64_t v9 = 0LL;
    goto LABEL_36;
  }

          *(void *)BOOL v11 = v9;
          uint64_t v21 = v11 + 8;
          goto LABEL_41;
        }

LABEL_41:
  std::string::basic_string[abi:ne180100]<0>(&__p, ";");
  if ((wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::TryConsume( (uint64_t)this,  (unsigned __int8 *)&__p) & 1) == 0)
  {
    std::string::basic_string[abi:ne180100]<0>(v13, ",");
    wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::TryConsume( (uint64_t)this,  (unsigned __int8 *)v13);
    if (v14 < 0) {
      operator delete(v13[0]);
    }
  }

  uint64_t v9 = 1LL;
LABEL_36:
  return v9;
}

  BOOL v20 = *(void *)(a1 + 24);
  if (v20) {
    IsSubSymbolOfBuiltType = wireless_diagnostics::google::protobuf::DescriptorPool::IsSubSymbolOfBuiltType(v20, a2);
  }
  else {
    IsSubSymbolOfBuiltType = 0LL;
  }
LABEL_44:
  return IsSubSymbolOfBuiltType;
}

void sub_187C39238( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20, __int16 a21, char a22, char a23)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  _Unwind_Resume(exception_object);
}

uint64_t wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ConsumeMessage( wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl *a1, wireless_diagnostics::google::protobuf::Message *a2, unsigned __int8 *a3)
{
  while (1)
  {
    std::string::basic_string[abi:ne180100]<0>(v11, ">");
    if ((wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::LookingAt( (uint64_t)a1,  (unsigned __int8 *)v11) & 1) != 0)
    {
      int v6 = 0;
    }

    else
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "}");
      int v7 = wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::LookingAt( (uint64_t)a1,  (unsigned __int8 *)__p);
      if (v10 < 0) {
        operator delete(__p[0]);
      }
      int v6 = v7 ^ 1;
    }

    if (v12 < 0) {
      operator delete(v11[0]);
    }
    if (!v6) {
      break;
    }
    if ((wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ConsumeField(a1, a2) & 1) == 0) {
      return 0LL;
    }
  }

  return wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::Consume((uint64_t)a1, a3);
}

void sub_187C39390( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ConsumeSignedInteger( wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl *this, uint64_t *a2, uint64_t a3)
{
  unsigned int v6 = wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::TryConsume( (uint64_t)this,  (unsigned __int8 *)__p);
  if (v10 < 0) {
    operator delete(__p[0]);
  }
  uint64_t result = wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ConsumeUnsignedInteger( this,  (unint64_t *)__p,  a3 + v6);
  if ((result & 1) != 0)
  {
    uint64_t v8 = (uint64_t)__p[0];
    if (v6) {
      uint64_t v8 = -(uint64_t)__p[0];
    }
    *a2 = v8;
  }

  return result;
}

void sub_187C39434( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ConsumeUnsignedInteger( wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl *this, unint64_t *a2, unint64_t a3)
{
  int v4 = (wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl *)((char *)this + 40);
  if (*((_DWORD *)this + 10) == 3)
  {
    if ((wireless_diagnostics::google::protobuf::io::Tokenizer::ParseInteger((uint64_t)this + 48, a3, a2) & 1) != 0)
    {
      wireless_diagnostics::google::protobuf::io::Tokenizer::Next(v4);
      return 1LL;
    }

    std::string::basic_string[abi:ne180100]<0>(__p, "Integer out of range.");
    wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ReportError( (uint64_t *)this,  *((unsigned int *)this + 18),  *((unsigned int *)this + 19),  (uint64_t)__p);
  }

  else
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "Expected integer.");
    wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ReportError( (uint64_t *)this,  *((unsigned int *)this + 18),  *((unsigned int *)this + 19),  (uint64_t)__p);
  }

  if (v7 < 0) {
    operator delete(__p[0]);
  }
  return 0LL;
}

void sub_187C39504( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ConsumeDouble( wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl *this, double *a2)
{
  int v6 = wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::TryConsume( (uint64_t)this,  (unsigned __int8 *)&__p);
  int v7 = *((_DWORD *)this + 10);
  switch(v7)
  {
    case 2:
      if (*((char *)this + 71) < 0) {
        std::string::__init_copy_ctor_external( &__p,  *((const std::string::value_type **)this + 6),  *((void *)this + 7));
      }
      else {
        std::string __p = *(std::string *)((_BYTE *)this + 2);
      }
      int size = __p.__r_.__value_.__s.__size_;
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        BOOL v11 = (std::string *)((char *)&__p + __p.__r_.__value_.__s.__size_);
      }
      else {
        BOOL v11 = (std::string *)(__p.__r_.__value_.__r.__words[0] + __p.__r_.__value_.__l.__size_);
      }
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        p_p = &__p;
      }
      if (p_p != v11)
      {
        do
        {
          int v12 = p_p->__r_.__value_.__s.__data_[0];
          p_p = (std::string *)((char *)p_p + 1);
        }

        while (p_p != v11);
        int size = __p.__r_.__value_.__s.__size_;
      }

      if ((size & 0x80) == 0)
      {
        if (size != 3)
        {
          if (size != 8 || __p.__r_.__value_.__r.__words[0] != 0x7974696E69666E69LL) {
            goto LABEL_47;
          }
          goto LABEL_52;
        }

        if (LOWORD(__p.__r_.__value_.__l.__data_) != 28265 || __p.__r_.__value_.__s.__data_[2] != 102)
        {
          uint64_t v15 = &__p;
LABEL_43:
          int data_low = LOWORD(v15->__r_.__value_.__l.__data_);
          int v18 = v15->__r_.__value_.__s.__data_[2];
          if (data_low != 24942 || v18 != 110)
          {
LABEL_47:
            std::string::basic_string[abi:ne180100]<0>(v21, "Expected double.");
            wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ReportError( (uint64_t *)this,  *((unsigned int *)this + 18),  *((unsigned int *)this + 19),  (uint64_t)v21);
            if (v22 < 0) {
              operator delete(v21[0]);
            }
            goto LABEL_49;
          }

          uint64_t v20 = 0x7FF8000000000000LL;
LABEL_54:
          *(void *)a2 = v20;
          wireless_diagnostics::google::protobuf::io::Tokenizer::Next((wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl *)((char *)this + 40));
          goto LABEL_56;
        }

LABEL_52:
        uint64_t v20 = 0x7FF0000000000000LL;
        goto LABEL_54;
      }

      std::string::size_type v13 = __p.__r_.__value_.__l.__size_;
      if (__p.__r_.__value_.__l.__size_ == 3
        && *(_WORD *)__p.__r_.__value_.__l.__data_ == 28265
        && *(_BYTE *)(__p.__r_.__value_.__r.__words[0] + 2) == 102)
      {
        goto LABEL_52;
      }

      if (__p.__r_.__value_.__l.__size_ == 8)
      {
        if (*(void *)__p.__r_.__value_.__l.__data_ == 0x7974696E69666E69LL) {
          goto LABEL_52;
        }
        std::string::size_type v13 = __p.__r_.__value_.__l.__size_;
      }

      if (v13 != 3) {
        goto LABEL_47;
      }
      uint64_t v15 = (std::string *)__p.__r_.__value_.__r.__words[0];
      goto LABEL_43;
    case 3:
      uint64_t result = wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ConsumeUnsignedInteger( this,  (unint64_t *)&__p,  0xFFFFFFFFFFFFFFFFLL);
      if (!(_DWORD)result) {
        return result;
      }
      *a2 = (double)__p.__r_.__value_.__r.__words[0];
      goto LABEL_56;
    case 4:
      *a2 = wireless_diagnostics::google::protobuf::io::Tokenizer::ParseFloat((uint64_t)this + 48, v4, v5);
      wireless_diagnostics::google::protobuf::io::Tokenizer::Next((wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl *)((char *)this + 40));
LABEL_56:
      if (v6) {
        *a2 = -*a2;
      }
      return 1LL;
  }

  std::string::basic_string[abi:ne180100]<0>(&__p, "Expected double.");
  wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ReportError( (uint64_t *)this,  *((unsigned int *)this + 18),  *((unsigned int *)this + 19),  (uint64_t)&__p);
LABEL_49:
  return 0LL;
}

void sub_187C397EC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ConsumeString( uint64_t a1, std::string *this, uint64_t a3, unsigned int *a4)
{
  char v5 = (wireless_diagnostics::google::protobuf::io::Tokenizer *)(a1 + 40);
  int v6 = *(_DWORD *)(a1 + 40);
  if (v6 == 5)
  {
    if ((char)this->__r_.__value_.__s.__size_ < 0)
    {
      *this->__r_.__value_.__l.__data_ = 0;
      this->__r_.__value_.__l.__size_ = 0LL;
    }

    else
    {
      this->__r_.__value_.__s.__data_[0] = 0;
      this->__r_.__value_.__s.__size_ = 0;
    }

    if (*(_DWORD *)v5 == 5)
    {
      uint64_t v8 = a1 + 48;
      do
      {
        wireless_diagnostics::google::protobuf::io::Tokenizer::ParseStringAppend(v8, this, a3, a4);
        wireless_diagnostics::google::protobuf::io::Tokenizer::Next(v5);
      }

      while (*(_DWORD *)v5 == 5);
    }
  }

  else
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "Expected string.");
    wireless_diagnostics::google::protobuf::TextFormat::Parser::ParserImpl::ReportError( (uint64_t *)a1,  *(unsigned int *)(a1 + 72),  *(unsigned int *)(a1 + 76),  (uint64_t)__p);
    if (v11 < 0) {
      operator delete(__p[0]);
    }
  }

  return v6 == 5;
}

void sub_187C398F8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::TextGenerator( uint64_t a1, uint64_t a2, int a3)
{
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = 0LL;
  *(_DWORD *)(a1 + 16) = 0;
  *(_WORD *)(a1 + 20) = 1;
  char v5 = (std::string *)std::string::basic_string[abi:ne180100]<0>((void *)(a1 + 24), "");
  *(_DWORD *)(a1 + MEMORY[0x1895B3490](v1 - 48) = a3;
  std::string::resize(v5, 2 * a3, 32);
  return a1;
}

void sub_187C39978(_Unwind_Exception *exception_object)
{
}

void wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::~TextGenerator( wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Print( wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator *this, const char *a2, int a3)
{
  if (a3 < 1)
  {
    int v7 = 0;
  }

  else
  {
    uint64_t v6 = 0LL;
    int v7 = 0;
    do
    {
      if (a2[v6] == 10)
      {
        wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Write( (uint64_t)this,  &a2[v7],  v6++ - v7 + 1);
        *((_BYTE *)this + 20) = 1;
        int v7 = v6;
      }

      else
      {
        ++v6;
      }
    }

    while (v6 != a3);
  }

  return wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Write( (uint64_t)this,  &a2[v7],  a3 - v7);
}

uint64_t wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Write( uint64_t this, const char *a2, int a3)
{
  if (a3)
  {
    int v3 = (void *)this;
    if (!*(_BYTE *)(this + 21))
    {
      int v4 = a3;
      if (!*(_BYTE *)(this + 20)
        || ((*(_BYTE *)(this + 20) = 0, *(char *)(this + 47) < 0)
          ? (v6 = *(const char **)(this + 24), uint64_t v7 = *(void *)(this + 32))
          : (uint64_t v6 = (const char *)(this + 24), LODWORD(v7) = *(unsigned __int8 *)(this + 47)),
            this = wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator::Write( (wireless_diagnostics::google::protobuf::TextFormat::Printer::TextGenerator *)this,  v6,  v7),  !*((_BYTE *)v3 + 21)))
      {
        int v8 = *((_DWORD *)v3 + 4);
        uint64_t v9 = (void *)v3[1];
        if (v8 >= v4)
        {
LABEL_11:
          this = (uint64_t)memcpy(v9, a2, v4);
          v3[1] += v4;
          *((_DWORD *)v3 + 4) -= v4;
        }

        else
        {
          while (1)
          {
            memcpy(v9, a2, v8);
            uint64_t v10 = *((int *)v3 + 4);
            this = (*(uint64_t (**)(void, void **, void *))(*(void *)*v3 + 16LL))(*v3, &__dst, v3 + 2);
            *((_BYTE *)v3 + 21) = this ^ 1;
            if ((this & 1) == 0) {
              break;
            }
            v4 -= v10;
            a2 += v10;
            uint64_t v9 = __dst;
            v3[1] = __dst;
            int v8 = *((_DWORD *)v3 + 4);
            if (v4 <= v8) {
              goto LABEL_11;
            }
          }
        }
      }
    }
  }

  return this;
}

void std::__tree<std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>,std::__map_value_compare<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>,std::less<wireless_diagnostics::google::protobuf::FieldDescriptor const*>,true>,std::allocator<std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>>>::destroy( uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>,std::__map_value_compare<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>,std::less<wireless_diagnostics::google::protobuf::FieldDescriptor const*>,true>,std::allocator<std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>>>::destroy( a1,  *a2);
    std::__tree<std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>,std::__map_value_compare<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>,std::less<wireless_diagnostics::google::protobuf::FieldDescriptor const*>,true>,std::allocator<std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>>>::destroy( a1,  a2[1]);
    int v4 = (void *)a2[5];
    if (v4)
    {
      a2[6] = v4;
      operator delete(v4);
    }

    operator delete(a2);
  }

void wireless_diagnostics::google::protobuf::STLDeleteContainerPointers<std::__wrap_iter<wireless_diagnostics::google::protobuf::TextFormat::ParseInfoTree **>>( wireless_diagnostics::google::protobuf::TextFormat::ParseInfoTree **a1, wireless_diagnostics::google::protobuf::TextFormat::ParseInfoTree **a2)
{
  if (a1 != a2)
  {
    int v3 = a1;
    do
    {
      char v5 = *v3++;
      int v4 = v5;
      if (v5)
      {
        wireless_diagnostics::google::protobuf::TextFormat::ParseInfoTree::~ParseInfoTree(v4);
        operator delete(v6);
      }
    }

    while (v3 != a2);
  }

uint64_t *std::__tree<std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>,std::__map_value_compare<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>,std::less<wireless_diagnostics::google::protobuf::FieldDescriptor const*>,true>,std::allocator<std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>>>::__emplace_unique_key_args<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::piecewise_construct_t const&,std::tuple<wireless_diagnostics::google::protobuf::FieldDescriptor const* const&>,std::tuple<>>( uint64_t **a1, unint64_t *a2, uint64_t a3, uint64_t **a4)
{
  uint64_t v7 = a1 + 1;
  uint64_t v6 = a1[1];
  if (v6)
  {
    unint64_t v8 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = (uint64_t **)v6;
        unint64_t v10 = v6[4];
        if (v8 >= v10) {
          break;
        }
        uint64_t v6 = *v9;
        uint64_t v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }

      if (v10 >= v8) {
        break;
      }
      uint64_t v6 = v9[1];
      if (!v6)
      {
        uint64_t v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }

  else
  {
    uint64_t v9 = a1 + 1;
LABEL_10:
    char v11 = (uint64_t *)operator new(0x40uLL);
    uint64_t v12 = **a4;
    v11[6] = 0LL;
    v11[7] = 0LL;
    v11[4] = v12;
    v11[5] = 0LL;
    std::__tree<std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>,std::__map_value_compare<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>,std::less<wireless_diagnostics::google::protobuf::FieldDescriptor const*>,true>,std::allocator<std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>>>::__insert_node_at( a1,  (uint64_t)v9,  v7,  v11);
    return v11;
  }

  return (uint64_t *)v9;
}

uint64_t *std::__tree<std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>,std::__map_value_compare<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>,std::less<wireless_diagnostics::google::protobuf::FieldDescriptor const*>,true>,std::allocator<std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>>>::__insert_node_at( uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0LL;
  a4[1] = 0LL;
  a4[2] = a2;
  *a3 = a4;
  char v5 = (uint64_t *)**a1;
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
      int v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24)) {
        return result;
      }
      int v3 = (uint64_t *)v2[2];
      int v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), char v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            uint64_t v9 = (uint64_t **)a2[2];
          }

          else
          {
            uint64_t v9 = (uint64_t **)v2[1];
            unint64_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              int v3 = (uint64_t *)v2[2];
            }

            v9[2] = v3;
            *(void *)(v2[2] + 8LL * (*(void *)v2[2] != (void)v2)) = v9;
            *uint64_t v9 = v2;
            v2[2] = (uint64_t)v9;
            int v3 = v9[2];
            int v2 = (uint64_t *)*v3;
          }

          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          *int v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8LL * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }

      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), char v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          *int v2 = v11;
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
        int v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8LL * (*(void *)v3[2] != (void)v3)) = v2;
        *int v2 = (uint64_t)v3;
LABEL_27:
        int v3[2] = (uint64_t)v2;
        return result;
      }

      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *char v5 = 1;
    }

    while (v3 != result);
  }

  return result;
}

void std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>( uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  int v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }

void std::vector<std::string>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24LL)
  {
  }

  a1[1] = v2;
}

uint64_t wireless_diagnostics::google::protobuf::internal::StringSpaceUsedExcludingSelf(unint64_t a1)
{
  else {
    return 0LL;
  }
}

BOOL wireless_diagnostics::google::protobuf::internal::ParseNamedEnum(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t ValueByName = wireless_diagnostics::google::protobuf::EnumDescriptor::FindValueByName(a1, a2);
  if (ValueByName) {
    *a3 = *(_DWORD *)(ValueByName + 16);
  }
  return ValueByName != 0;
}

uint64_t wireless_diagnostics::google::protobuf::internal::NameOfEnum( wireless_diagnostics::google::protobuf::internal *this, const wireless_diagnostics::google::protobuf::EnumDescriptor *a2)
{
  uint64_t ValueByNumber = wireless_diagnostics::google::protobuf::EnumDescriptor::FindValueByNumber(this, (int)a2);
  if (ValueByNumber) {
    return *(void *)ValueByNumber;
  }
  else {
    return MEMORY[0x189616DE8];
  }
}

wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::GeneratedMessageReflection( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, const wireless_diagnostics::google::protobuf::Descriptor *a2, const wireless_diagnostics::google::protobuf::Message *a3, const int *a4, int a5, int a6, int a7, const wireless_diagnostics::google::protobuf::DescriptorPool *a8, wireless_diagnostics::google::protobuf::MessageFactory *a9, int a10)
{
  *(void *)this = off_18A11AF20;
  *((void *)this + 1) = a2;
  *((void *)this + 2) = a3;
  *((void *)this + 3) = a4;
  *((_DWORD *)this + 8) = a5;
  *((_DWORD *)this + 9) = a6;
  *((_DWORD *)this + 10) = a7;
  *((_DWORD *)this + 11) = a10;
  if (!a8) {
    a8 = (const wireless_diagnostics::google::protobuf::DescriptorPool *)wireless_diagnostics::google::protobuf::DescriptorPool::generated_pool(this);
  }
  *((void *)this + 6) = a8;
  *((void *)this + 7) = a9;
  return this;
}

{
  return wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::GeneratedMessageReflection( this,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10);
}

void sub_187C3A078(_Unwind_Exception *a1)
{
}

void wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::~GeneratedMessageReflection( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::GetUnknownFields( uint64_t a1, uint64_t a2)
{
  return a2 + *(int *)(a1 + 36);
}

uint64_t wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::MutableUnknownFields( uint64_t a1, uint64_t a2)
{
  return a2 + *(int *)(a1 + 36);
}

uint64_t wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::SpaceUsed( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, const wireless_diagnostics::google::protobuf::Message *a2)
{
  int v5 = *((_DWORD *)this + 11);
  int v6 = (uint64_t **)(*(uint64_t (**)(wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *))(*(void *)this + 16LL))(this);
  uint64_t v7 = wireless_diagnostics::google::protobuf::UnknownFieldSet::SpaceUsedExcludingSelf(v6) + v5;
  uint64_t v8 = *((int *)this + 10);
  if ((_DWORD)v8 != -1) {
  uint64_t v9 = *((void *)this + 1);
  }
  if (*(int *)(v9 + 44) >= 1)
  {
    for (uint64_t i = 0LL; i < *(int *)(v9 + 44); ++i)
    {
      uint64_t v11 = *(void *)(v9 + 48);
      uint64_t v12 = v11 + 120 * i;
      int v13 = wireless_diagnostics::google::protobuf::FieldDescriptor::kTypeToCppTypeMap[*(unsigned int *)(v12 + 44)];
      if (*(_DWORD *)(v12 + 48) == 3)
      {
        switch(*(_DWORD *)(v12 + 44))
        {
          case 1:
          case 3:
          case 4:
          case 6:
          case 0x10:
          case 0x12:
            if (*(_BYTE *)(v11 + 120 * i + 52))
            {
              uint64_t v22 = *(void *)(v11 + 120 * i + 64);
              if (v22) {
                uint64_t v23 = (void *)(v22 + 112);
              }
              else {
                uint64_t v23 = (void *)(*(void *)(v11 + 120 * i + 32) + 128LL);
              }
            }

            else
            {
              uint64_t v23 = (void *)(*(void *)(v11 + 120 * i + 56) + 48LL);
            }

            uint64_t v38 = (char *)a2
                + *(int *)(*((void *)this + 3) + 4LL * (int)(-286331153 * ((unint64_t)(v12 - *v23) >> 3)));
            if (!*(void *)v38) {
              goto LABEL_66;
            }
            int v33 = 8 * *((_DWORD *)v38 + 3);
            goto LABEL_67;
          case 2:
          case 5:
          case 7:
          case 0xD:
          case 0xE:
          case 0xF:
          case 0x11:
            if (*(_BYTE *)(v11 + 120 * i + 52))
            {
              uint64_t v14 = *(void *)(v11 + 120 * i + 64);
              if (v14) {
                uint64_t v15 = (void *)(v14 + 112);
              }
              else {
                uint64_t v15 = (void *)(*(void *)(v11 + 120 * i + 32) + 128LL);
              }
            }

            else
            {
              uint64_t v15 = (void *)(*(void *)(v11 + 120 * i + 56) + 48LL);
            }

            char v32 = (char *)a2
                + *(int *)(*((void *)this + 3) + 4LL * (int)(-286331153 * ((unint64_t)(v12 - *v15) >> 3)));
            if (!*(void *)v32) {
              goto LABEL_66;
            }
            int v33 = 4 * *((_DWORD *)v32 + 3);
            goto LABEL_67;
          case 8:
            if (*(_BYTE *)(v11 + 120 * i + 52))
            {
              uint64_t v26 = *(void *)(v11 + 120 * i + 64);
              if (v26) {
                int v27 = (void *)(v26 + 112);
              }
              else {
                int v27 = (void *)(*(void *)(v11 + 120 * i + 32) + 128LL);
              }
            }

            else
            {
              int v27 = (void *)(*(void *)(v11 + 120 * i + 56) + 48LL);
            }

            int v40 = (char *)a2
                + *(int *)(*((void *)this + 3) + 4LL * (int)(-286331153 * ((unint64_t)(v12 - *v27) >> 3)));
            if (*(void *)v40) {
              int v33 = *((_DWORD *)v40 + 3);
            }
            else {
LABEL_66:
            }
              int v33 = 0;
LABEL_67:
            uint64_t v7 = (v33 + v7);
            break;
          case 9:
          case 0xC:
            if (*(_BYTE *)(v11 + 120 * i + 52))
            {
              uint64_t v28 = *(void *)(v11 + 120 * i + 64);
              if (v28) {
                int v29 = (void *)(v28 + 112);
              }
              else {
                int v29 = (void *)(*(void *)(v11 + 120 * i + 32) + 128LL);
              }
            }

            else
            {
              int v29 = (void *)(*(void *)(v11 + 120 * i + 56) + 48LL);
            }

            __int128 v41 = (char *)a2
                + *(int *)(*((void *)this + 3) + 4LL * (int)(-286331153 * ((unint64_t)(v12 - *v29) >> 3)));
            std::string::size_type v42 = *(unint64_t **)v41;
            if (*(void *)v41) {
              int v43 = 8 * *((_DWORD *)v41 + 4);
            }
            else {
              int v43 = 0;
            }
            uint64_t v44 = *((unsigned int *)v41 + 3);
            if ((int)v44 >= 1)
            {
              do
              {
                unint64_t v45 = *v42;
                if (*(char *)(*v42 + 23) < 0
                  && (*(void *)v45 >= v45 ? (BOOL v46 = *(void *)v45 > v45 + 24) : (BOOL v46 = 1), v46))
                {
                  int v47 = *(_DWORD *)(v45 + 16) + 23;
                }

                else
                {
                  int v47 = 24;
                }

                v43 += v47;
                ++v42;
                --v44;
              }

              while (v44);
            }

            uint64_t v7 = (v43 + v7);
            break;
          case 0xA:
          case 0xB:
            if (*(_BYTE *)(v11 + 120 * i + 52))
            {
              uint64_t v30 = *(void *)(v11 + 120 * i + 64);
              if (v30) {
                std::string::size_type v31 = (void *)(v30 + 112);
              }
              else {
                std::string::size_type v31 = (void *)(*(void *)(v11 + 120 * i + 32) + 128LL);
              }
            }

            else
            {
              std::string::size_type v31 = (void *)(*(void *)(v11 + 120 * i + 56) + 48LL);
            }

            __int128 v48 = (char *)a2
                + *(int *)(*((void *)this + 3) + 4LL * (int)(-286331153 * ((unint64_t)(v12 - *v31) >> 3)));
            if (*(void *)v48) {
              int v49 = 8 * *((_DWORD *)v48 + 4);
            }
            else {
              int v49 = 0;
            }
            uint64_t v50 = v2;
            if (*((int *)v48 + 3) >= 1)
            {
              uint64_t v51 = 0LL;
              do
              {
                v49 += (*(uint64_t (**)(void))(**(void **)(*(void *)v48 + 8 * v51) + 128LL))(*(void *)(*(void *)v48 + 8 * v51));
                ++v51;
              }

              while (v51 < *((int *)v48 + 3));
            }

            uint64_t v7 = (v49 + v7);
            uint64_t v2 = v50;
            break;
          default:
            break;
        }
      }

      else
      {
        if (v13 == 10)
        {
          if (*((const wireless_diagnostics::google::protobuf::Message **)this + 2) != a2)
          {
            if (*(_BYTE *)(v11 + 120 * i + 52))
            {
              uint64_t v20 = *(void *)(v11 + 120 * i + 64);
              uint64_t v21 = (void *)(v20 ? v20 + 112 : *(void *)(v11 + 120 * i + 32) + 128LL);
            }

            else
            {
              uint64_t v21 = (void *)(*(void *)(v11 + 120 * i + 56) + 48LL);
            }

            uint64_t v39 = *(void *)((char *)a2
            if (v39) {
              uint64_t v7 = (*(unsigned int (**)(uint64_t))(*(void *)v39 + 128LL))(v39) + v7;
            }
          }

          goto LABEL_68;
        }

        if (v13 == 9)
        {
          uint64_t v16 = v11 + 120 * i;
          int v17 = *(unsigned __int8 *)(v16 + 52);
          if (*(_BYTE *)(v16 + 52))
          {
            uint64_t v18 = *(void *)(v11 + 120 * i + 64);
            if (v18)
            {
              uint64_t v19 = (void *)(v18 + 112);
              if (!v17)
              {
LABEL_41:
                uint64_t v25 = (void *)(*(void *)(v11 + 120 * i + 56) + 48LL);
                goto LABEL_44;
              }
            }

            else
            {
              uint64_t v19 = (void *)(*(void *)(v11 + 120 * i + 32) + 128LL);
              if (!v17) {
                goto LABEL_41;
              }
            }
          }

          else
          {
            uint64_t v19 = (void *)(*(void *)(v11 + 120 * i + 56) + 48LL);
            if (!v17) {
              goto LABEL_41;
            }
          }

          uint64_t v24 = *(void *)(v11 + 120 * i + 64);
          if (v24) {
            uint64_t v25 = (void *)(v24 + 112);
          }
          else {
            uint64_t v25 = (void *)(*(void *)(v11 + 120 * i + 32) + 128LL);
          }
LABEL_44:
          uint64_t v34 = *((void *)this + 3);
          unint64_t v35 = *(void *)((char *)a2 + *(int *)(v34 + 4LL * (int)(-286331153 * ((unint64_t)(v12 - *v19) >> 3))));
          if (v35 != *(void *)(*((void *)this + 2)
                                + *(int *)(v34 + 4LL * (int)(-286331153 * ((unint64_t)(v12 - *v25) >> 3)))))
          {
            else {
              int v37 = 0;
            }
            uint64_t v7 = (v7 + v37 + 24);
          }
        }
      }

LABEL_68:
      uint64_t v9 = *((void *)this + 1);
    }
  }

  return v7;
}

uint64_t *wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::Swap( uint64_t *this, wireless_diagnostics::google::protobuf::Message *a2, wireless_diagnostics::google::protobuf::Message *a3)
{
  if (a2 != a3)
  {
    uint64_t v5 = (uint64_t)this;
    if ((uint64_t *)(*(uint64_t (**)(wireless_diagnostics::google::protobuf::Message *))(*(void *)a2 + 144LL))(a2) != this)
    {
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      (*(void (**)(wireless_diagnostics::google::protobuf::Message *))(*(void *)a2 + 152LL))(a2);
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
      wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v53);
    }

    if ((*(uint64_t (**)(wireless_diagnostics::google::protobuf::Message *))(*(void *)a3 + 144LL))(a3) != v5)
    {
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      (*(void (**)(wireless_diagnostics::google::protobuf::Message *))(*(void *)a3 + 152LL))(a3);
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
      wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v53);
    }

    uint64_t v6 = *(void *)(v5 + 8);
    uint64_t v7 = *(unsigned int *)(v6 + 44);
    if ((int)v7 >= 1)
    {
      uint64_t v8 = *(int *)(v5 + 32);
      uint64_t v9 = (int *)((char *)a2 + v8);
      unint64_t v10 = (int *)((char *)a3 + v8);
      unint64_t v11 = (unint64_t)(v7 + 31) >> 5;
      do
      {
        int v12 = *v9;
        *v9++ = *v10;
        *v10++ = v12;
        --v11;
      }

      while (v11);
      if (*(int *)(v6 + 44) >= 1)
      {
        uint64_t v13 = 0LL;
        uint64_t v14 = 0LL;
        do
        {
          uint64_t v15 = *(void *)(v6 + 48);
          if (*(_DWORD *)(v15 + v13 + 48) == 3)
          {
            switch(*(_DWORD *)(v15 + v13 + 44))
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
                uint64_t v16 = v15 + v13;
                if (*(_BYTE *)(v15 + v13 + 52))
                {
                  uint64_t v17 = *(void *)(v16 + 64);
                  if (v17) {
                    uint64_t v18 = (void *)(v17 + 112);
                  }
                  else {
                    uint64_t v18 = (void *)(*(void *)(v15 + v13 + 32) + 128LL);
                  }
                }

                else
                {
                  uint64_t v18 = (void *)(*(void *)(v16 + 56) + 48LL);
                }

                if (a2 != a3)
                {
                  uint64_t v26 = (uint64_t *)((char *)a2 + v25);
                  int v27 = (uint64_t *)((char *)a3 + v25);
                  uint64_t v28 = *v26;
                  *uint64_t v26 = *v27;
                  uint64_t v29 = v27[1];
                  uint64_t *v27 = v28;
                  uint64_t v30 = v26[1];
                  v26[1] = v29;
                  v27[1] = v30;
                }

                break;
              case 9:
              case 0xA:
              case 0xB:
              case 0xC:
                wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Swap();
                break;
              default:
                goto LABEL_30;
            }
          }

          else
          {
            switch(*(_DWORD *)(v15 + v13 + 44))
            {
              case 1:
                uint64_t v31 = v15 + v13;
                if (*(_BYTE *)(v15 + v13 + 52))
                {
                  uint64_t v32 = *(void *)(v31 + 64);
                  if (v32) {
                    int v33 = (void *)(v32 + 112);
                  }
                  else {
                    int v33 = (void *)(*(void *)(v15 + v13 + 32) + 128LL);
                  }
                }

                else
                {
                  int v33 = (void *)(*(void *)(v31 + 56) + 48LL);
                }

                uint64_t v45 = *(void *)((char *)a2 + v44);
                *(void *)((char *)a2 + v44) = *(void *)((char *)a3 + v44);
                *(void *)((char *)a3 + v44) = v45;
                break;
              case 2:
                uint64_t v34 = v15 + v13;
                if (*(_BYTE *)(v15 + v13 + 52))
                {
                  uint64_t v35 = *(void *)(v34 + 64);
                  if (v35) {
                    BOOL v36 = (void *)(v35 + 112);
                  }
                  else {
                    BOOL v36 = (void *)(*(void *)(v15 + v13 + 32) + 128LL);
                  }
                }

                else
                {
                  BOOL v36 = (void *)(*(void *)(v34 + 56) + 48LL);
                }

                int v47 = *(_DWORD *)((char *)a2 + v46);
                *(_DWORD *)((char *)a2 + v46) = *(_DWORD *)((char *)a3 + v46);
                *(_DWORD *)((char *)a3 + v46) = v47;
                break;
              case 3:
              case 4:
              case 6:
              case 9:
              case 0xA:
              case 0xB:
              case 0xC:
              case 0x10:
              case 0x12:
                uint64_t v19 = v15 + v13;
                if (*(_BYTE *)(v15 + v13 + 52))
                {
                  uint64_t v20 = *(void *)(v19 + 64);
                  if (v20) {
                    uint64_t v21 = (void *)(v20 + 112);
                  }
                  else {
                    uint64_t v21 = (void *)(*(void *)(v15 + v13 + 32) + 128LL);
                  }
                }

                else
                {
                  uint64_t v21 = (void *)(*(void *)(v19 + 56) + 48LL);
                }

                uint64_t v41 = *(void *)((char *)a2 + v40);
                *(void *)((char *)a2 + v40) = *(void *)((char *)a3 + v40);
                *(void *)((char *)a3 + v40) = v41;
                break;
              case 5:
              case 7:
              case 0xD:
              case 0xE:
              case 0xF:
              case 0x11:
                uint64_t v22 = v15 + v13;
                if (*(_BYTE *)(v15 + v13 + 52))
                {
                  uint64_t v23 = *(void *)(v22 + 64);
                  if (v23) {
                    uint64_t v24 = (void *)(v23 + 112);
                  }
                  else {
                    uint64_t v24 = (void *)(*(void *)(v15 + v13 + 32) + 128LL);
                  }
                }

                else
                {
                  uint64_t v24 = (void *)(*(void *)(v22 + 56) + 48LL);
                }

                int v43 = *(_DWORD *)((char *)a2 + v42);
                *(_DWORD *)((char *)a2 + v42) = *(_DWORD *)((char *)a3 + v42);
                *(_DWORD *)((char *)a3 + v42) = v43;
                break;
              case 8:
                uint64_t v37 = v15 + v13;
                if (*(_BYTE *)(v15 + v13 + 52))
                {
                  uint64_t v38 = *(void *)(v37 + 64);
                  if (v38) {
                    uint64_t v39 = (void *)(v38 + 112);
                  }
                  else {
                    uint64_t v39 = (void *)(*(void *)(v15 + v13 + 32) + 128LL);
                  }
                }

                else
                {
                  uint64_t v39 = (void *)(*(void *)(v37 + 56) + 48LL);
                }

                char v49 = *((_BYTE *)a2 + v48);
                *((_BYTE *)a2 + vMEMORY[0x1895B3490](v1 - 48) = *((_BYTE *)a3 + v48);
                *((_BYTE *)a3 + vMEMORY[0x1895B3490](v1 - 48) = v49;
                break;
              default:
LABEL_30:
                wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
                wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
                wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
                wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
                wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v53);
                break;
            }
          }

          ++v14;
          uint64_t v6 = *(void *)(v5 + 8);
          v13 += 120LL;
        }

        while (v14 < *(int *)(v6 + 44));
      }
    }

    uint64_t v50 = *(int *)(v5 + 40);
    if ((_DWORD)v50 != -1) {
      MEMORY[0x1895B35EC]((char *)a2 + v50, (char *)a3 + v50);
    }
    uint64_t v51 = (uint64_t *)(*(uint64_t (**)(uint64_t, wireless_diagnostics::google::protobuf::Message *))(*(void *)v5 + 24LL))( v5,  a2);
    this = (uint64_t *)(*(uint64_t (**)(uint64_t, wireless_diagnostics::google::protobuf::Message *))(*(void *)v5 + 24LL))( v5,  a3);
    uint64_t v52 = *v51;
    *uint64_t v51 = *this;
    *this = v52;
  }

  return this;
}

void sub_187C3AC68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

uint64_t wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::HasField( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, const wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, uint64_t a4, const char *a5)
{
  uint64_t v8 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v8) {
  if (*((_DWORD *)a3 + 12) == 3)
  }
      a5);
  if (*((_BYTE *)a3 + 52)) {
    return wireless_diagnostics::google::protobuf::internal::ExtensionSet::Has((const wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)));
  }
  int v10 = -286331153 * (((unint64_t)a3 - *(void *)(*((void *)a3 + 7) + 48LL)) >> 3);
  return (*(_DWORD *)((char *)a2 + 4 * (v10 / 32) + *((int *)this + 8)) >> v10) & 1;
}

void wireless_diagnostics::google::protobuf::internal::anonymous namespace'::ReportReflectionUsageError( wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *this, const wireless_diagnostics::google::protobuf::Descriptor *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, const char *a4, const char *a5)
{
  wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v5);
}

void sub_187C3AE30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

uint64_t wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::FieldSize( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, const wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, uint64_t a4, const char *a5)
{
  uint64_t v8 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v8) {
  if (*((_DWORD *)a3 + 12) != 3)
  }
      a5);
  if (*((_BYTE *)a3 + 52)) {
    return wireless_diagnostics::google::protobuf::internal::ExtensionSet::ExtensionSize((const wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)));
  }
  switch(*((_DWORD *)a3 + 11))
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
      uint64_t result = *(unsigned int *)((char *)a2
                               + *(int *)(*((void *)this + 3)
                                        + 4LL
                                        * (int)(-286331153
      break;
    default:
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
      wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v10);
      uint64_t result = 0LL;
      break;
  }

  return result;
}

void sub_187C3AF9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::ClearField( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, wireless_diagnostics::google::protobuf::Message *a2, const std::string **a3, uint64_t a4, const char *a5)
{
  uint64_t v8 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (a3[7] != (const std::string *)v8) {
  if (*((_BYTE *)a3 + 52))
  }
  {
    wireless_diagnostics::google::protobuf::internal::ExtensionSet::ClearExtension((wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)));
  }

  else if (*((_DWORD *)a3 + 12) == 3)
  {
    switch(*((_DWORD *)a3 + 11))
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
        *(_DWORD *)((char *)a2
                  + *(int *)(*((void *)this + 3)
                           + 4LL
        break;
      case 9:
      case 0xC:
        wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Clear<wireless_diagnostics::google::protobuf::RepeatedPtrField<std::string>::TypeHandler>( (uint64_t)a2 + *(int *)(*((void *)this + 3)
                 + 4LL * (int)(-286331153 * (((unint64_t)a3 - a3[7][2].__r_.__value_.__r.__words[0]) >> 3))));
        break;
      case 0xA:
      case 0xB:
        uint64_t v14 = (int *)((char *)a2
                    + *(int *)(*((void *)this + 3)
                             + 4LL
                             * (int)(-286331153 * (((unint64_t)a3 - a3[7][2].__r_.__value_.__r.__words[0]) >> 3))));
        if (v14[2] >= 1)
        {
          uint64_t v15 = 0LL;
          do
          {
            (*(void (**)(void))(**(void **)(*(void *)v14 + 8 * v15) + 32LL))(*(void *)(*(void *)v14 + 8 * v15));
            ++v15;
          }

          while (v15 < v14[2]);
        }

        v14[2] = 0;
        break;
      default:
        return;
    }
  }

  else
  {
    uint64_t v9 = (char *)a2 + *((int *)this + 8);
    unint64_t v10 = 0xEEEEEEEEEEEEEEEFLL * ((uint64_t)((uint64_t)a3 - a3[7][2].__r_.__value_.__r.__words[0]) >> 3);
    int v11 = v10 + 31;
    if ((v10 & 0x80000000) == 0LL) {
      int v11 = -286331153 * ((uint64_t)((uint64_t)a3 - a3[7][2].__r_.__value_.__r.__words[0]) >> 3);
    }
    int v12 = *(_DWORD *)&v9[4 * (v11 >> 5)];
    if (((1 << v10) & v12) != 0)
    {
      *(_DWORD *)&v9[4 * ((uint64_t)v11 >> 5)] = v12 & ~(1 << v10);
      switch(*((_DWORD *)a3 + 11))
      {
        case 1:
          *(void *)((char *)a2 + *(int *)(*((void *)this + 3) + 4LL * (int)v10)) = a3[14];
          break;
        case 2:
          *(_DWORD *)((char *)a2 + *(int *)(*((void *)this + 3) + 4LL * (int)v10)) = *((_DWORD *)a3 + 28);
          break;
        case 3:
        case 4:
        case 6:
        case 0x10:
        case 0x12:
          *(void *)((char *)a2 + *(int *)(*((void *)this + 3) + 4LL * (int)v10)) = a3[14];
          break;
        case 5:
        case 7:
        case 0xD:
        case 0xF:
        case 0x11:
          int v13 = *((_DWORD *)a3 + 28);
          goto LABEL_23;
        case 8:
          *((_BYTE *)a2 + *(int *)(*((void *)this + 3) + 4LL * (int)v10)) = *((_BYTE *)a3 + 112);
          break;
        case 9:
        case 0xC:
          uint64_t v16 = *(int *)(*((void *)this + 3) + 4LL * (int)v10);
          uint64_t v17 = *(std::string **)((char *)a2 + v16);
          if (v17 != *(std::string **)(*((void *)this + 2) + v16))
          {
            if (*((_BYTE *)a3 + 104))
            {
              std::string::operator=(v17, a3[14]);
            }

            else if ((char)v17->__r_.__value_.__s.__size_ < 0)
            {
              *v17->__r_.__value_.__l.__data_ = 0;
              v17->__r_.__value_.__l.__size_ = 0LL;
            }

            else
            {
              v17->__r_.__value_.__s.__data_[0] = 0;
              v17->__r_.__value_.__s.__size_ = 0;
            }
          }

          break;
        case 0xA:
        case 0xB:
          uint64_t v18 = *(void *)((char *)a2 + *(int *)(*((void *)this + 3) + 4LL * (int)v10));
          (*(void (**)(uint64_t))(*(void *)v18 + 32LL))(v18);
          break;
        case 0xE:
          int v13 = a3[14]->__r_.__value_.__r.__words[2];
LABEL_23:
          *(_DWORD *)((char *)a2 + *(int *)(*((void *)this + 3) + 4LL * (int)v10)) = v13;
          break;
        default:
          return;
      }
    }
  }

void wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::RemoveLast( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, uint64_t a4, const char *a5)
{
  uint64_t v8 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v8) {
  if (*((_DWORD *)a3 + 12) != 3)
  }
      a5);
  if (*((_BYTE *)a3 + 52))
  {
    wireless_diagnostics::google::protobuf::internal::ExtensionSet::RemoveLast((wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)));
  }

  else
  {
    switch(*((_DWORD *)a3 + 11))
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
        uint64_t v9 = (char *)a2
        --*((_DWORD *)v9 + 2);
        break;
      case 9:
      case 0xC:
        unint64_t v10 = (char *)a2
        uint64_t v11 = *(void *)v10;
        uint64_t v12 = *((int *)v10 + 2) - 1LL;
        *((_DWORD *)v10 + 2) = v12;
        uint64_t v13 = *(void *)(v11 + 8 * v12);
        if (*(char *)(v13 + 23) < 0)
        {
          **(_BYTE **)uint64_t v13 = 0;
          *(void *)(v13 + 8) = 0LL;
        }

        else
        {
          *(_BYTE *)uint64_t v13 = 0;
          *(_BYTE *)(v13 + 23) = 0;
        }

        break;
      case 0xA:
      case 0xB:
        uint64_t v14 = (char *)a2
        uint64_t v15 = *(void *)v14;
        uint64_t v16 = *((int *)v14 + 2) - 1LL;
        *((_DWORD *)v14 + 2) = v16;
        (*(void (**)(void))(**(void **)(v15 + 8 * v16) + 32LL))(*(void *)(v15 + 8 * v16));
        break;
      default:
        return;
    }
  }

uint64_t wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::ReleaseLast( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, uint64_t a4, const char *a5)
{
  uint64_t v8 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v8) {
  if (*((_DWORD *)a3 + 12) != 3)
  }
      a5);
  if (*((_BYTE *)a3 + 52)) {
    return wireless_diagnostics::google::protobuf::internal::ExtensionSet::ReleaseLast((wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)));
  }
  unint64_t v10 = (char *)a2
  uint64_t v11 = *(void *)v10;
  int v12 = *((_DWORD *)v10 + 3);
  uint64_t v13 = *((int *)v10 + 2);
  uint64_t result = *(void *)(*(void *)v10 + 8 * (v13 - 1));
  *((_DWORD *)v10 + 2) = v13 - 1;
  *((_DWORD *)v10 + 3) = v12 - 1;
  return result;
}

void wireless_diagnostics::google::protobuf::internal::anonymous namespace'::ReportReflectionUsageTypeError()
{
  wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v0);
}

void sub_187C3B6A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::SwapElements( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, int a4, const char *a5)
{
  int v5 = (int)a5;
  unint64_t v10 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v10) {
  if (*((_DWORD *)a3 + 12) != 3)
  }
      a5);
  if (*((_BYTE *)a3 + 52))
  {
    wireless_diagnostics::google::protobuf::internal::ExtensionSet::SwapElements((wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)));
  }

  else
  {
    switch(*((_DWORD *)a3 + 11))
    {
      case 1:
        uint64_t v15 = *(void *)((char *)a2
                        + *(int *)(*((void *)this + 3)
                                 + 4LL
                                 * (int)(-286331153
                                       * (((unint64_t)a3 - *(void *)(*((void *)a3 + 7) + 48LL)) >> 3))));
        uint64_t v16 = *(void *)(v15 + 8LL * a4);
        *(void *)(v15 + 8LL * a4) = *(void *)(v15 + 8LL * v5);
        *(void *)(v15 + 8LL * v5) = v16;
        break;
      case 2:
        uint64_t v17 = *(void *)((char *)a2
                        + *(int *)(*((void *)this + 3)
                                 + 4LL
                                 * (int)(-286331153
                                       * (((unint64_t)a3 - *(void *)(*((void *)a3 + 7) + 48LL)) >> 3))));
        int v18 = *(_DWORD *)(v17 + 4LL * a4);
        *(_DWORD *)(v17 + 4LL * a4) = *(_DWORD *)(v17 + 4LL * v5);
        *(_DWORD *)(v17 + 4LL * v5) = v18;
        break;
      case 3:
      case 4:
      case 6:
      case 9:
      case 0xA:
      case 0xB:
      case 0xC:
      case 0x10:
      case 0x12:
        uint64_t v11 = *(void *)((char *)a2
                        + *(int *)(*((void *)this + 3)
                                 + 4LL
                                 * (int)(-286331153
                                       * (((unint64_t)a3 - *(void *)(*((void *)a3 + 7) + 48LL)) >> 3))));
        uint64_t v12 = *(void *)(v11 + 8LL * a4);
        *(void *)(v11 + 8LL * a4) = *(void *)(v11 + 8LL * v5);
        *(void *)(v11 + 8LL * v5) = v12;
        break;
      case 5:
      case 7:
      case 0xD:
      case 0xE:
      case 0xF:
      case 0x11:
        uint64_t v13 = *(void *)((char *)a2
                        + *(int *)(*((void *)this + 3)
                                 + 4LL
                                 * (int)(-286331153
                                       * (((unint64_t)a3 - *(void *)(*((void *)a3 + 7) + 48LL)) >> 3))));
        int v14 = *(_DWORD *)(v13 + 4LL * a4);
        *(_DWORD *)(v13 + 4LL * a4) = *(_DWORD *)(v13 + 4LL * v5);
        *(_DWORD *)(v13 + 4LL * v5) = v14;
        break;
      case 8:
        uint64_t v19 = *(void *)((char *)a2
                        + *(int *)(*((void *)this + 3)
                                 + 4LL
                                 * (int)(-286331153
                                       * (((unint64_t)a3 - *(void *)(*((void *)a3 + 7) + 48LL)) >> 3))));
        char v20 = *(_BYTE *)(v19 + a4);
        *(_BYTE *)(v19 + a4) = *(_BYTE *)(v19 + v5);
        *(_BYTE *)(v19 + v5) = v20;
        break;
      default:
        return;
    }
  }

uint64_t wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::ListFields( uint64_t result, uint64_t a2, char **a3)
{
  a3[1] = *a3;
  if (*(void *)(result + 16) != a2)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)(result + 8);
    if (*(int *)(v6 + 44) >= 1)
    {
      uint64_t v7 = 0LL;
      while (1)
      {
        uint64_t v8 = *(void *)(v6 + 48);
        uint64_t v9 = v8 + 120 * v7;
        if (*(_DWORD *)(v9 + 48) != 3) {
          break;
        }
        if ((*(int (**)(uint64_t, uint64_t, uint64_t))(*(void *)v5 + 48LL))(v5, a2, v9) >= 1)
        {
          uint64_t v11 = a3[1];
          unint64_t v10 = (unint64_t)a3[2];
          if ((unint64_t)v11 >= v10)
          {
            uint64_t v12 = (v11 - *a3) >> 3;
            uint64_t v13 = v10 - (void)*a3;
            uint64_t v14 = v13 >> 2;
            else {
              unint64_t v15 = v14;
            }
            if (v15) {
              uint64_t v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>( (uint64_t)(a3 + 2),  v15);
            }
            else {
              uint64_t v16 = 0LL;
            }
            uint64_t v25 = &v16[8 * v12];
            *(void *)uint64_t v25 = v9;
            uint64_t v21 = v25 + 8;
            int v27 = *a3;
            uint64_t v26 = a3[1];
            if (v26 != *a3)
            {
              do
              {
                uint64_t v28 = *((void *)v26 - 1);
                v26 -= 8;
                *((void *)v25 - 1) = v28;
                v25 -= 8;
              }

              while (v26 != v27);
              goto LABEL_38;
            }

            goto LABEL_39;
          }

LABEL_42:
        ++v7;
        uint64_t v6 = *(void *)(v5 + 8);
      }

      if (*(_BYTE *)(v8 + 120 * v7 + 52))
      {
        uint64_t v17 = *(void *)(v8 + 120 * v7 + 64);
        if (v17) {
          int v18 = (void *)(v17 + 112);
        }
        else {
          int v18 = (void *)(*(void *)(v8 + 120 * v7 + 32) + 128LL);
        }
      }

      else
      {
        int v18 = (void *)(*(void *)(v8 + 120 * v7 + 56) + 48LL);
      }

      int v19 = -286331153 * ((unint64_t)(v9 - *v18) >> 3);
      uint64_t v11 = a3[1];
      unint64_t v20 = (unint64_t)a3[2];
      uint64_t v22 = (v11 - *a3) >> 3;
      if ((unint64_t)(v22 + 1) >> 61) {
LABEL_50:
      }
        std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>::__throw_length_error[abi:ne180100]();
      uint64_t v23 = v20 - (void)*a3;
      uint64_t v24 = v23 >> 2;
      else {
        unint64_t v15 = v24;
      }
      if (v15) {
        uint64_t v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>( (uint64_t)(a3 + 2),  v15);
      }
      else {
        uint64_t v16 = 0LL;
      }
      uint64_t v25 = &v16[8 * v22];
      *(void *)uint64_t v25 = v9;
      uint64_t v21 = v25 + 8;
      uint64_t v29 = *a3;
      uint64_t v26 = a3[1];
      if (v26 != *a3)
      {
        do
        {
          uint64_t v30 = *((void *)v26 - 1);
          v26 -= 8;
          *((void *)v25 - 1) = v30;
          v25 -= 8;
        }

        while (v26 != v29);
LABEL_38:
        uint64_t v26 = *a3;
      }

    if (v13 >= 0) {
      uint64_t v31 = size;
    }
    else {
      uint64_t v31 = v14;
    }
    return std::string::append(v5, __str, v11, v31 - v11);
  }

  else
  {
    unint64_t v33 = (char)__str->__r_.__value_.__s.__size_;
    if (v33 >= 0) {
      uint64_t v34 = __str;
    }
    else {
      uint64_t v34 = (std::string *)__str->__r_.__value_.__r.__words[0];
    }
    if (v33 >= 0) {
      uint64_t v35 = __str->__r_.__value_.__s.__size_;
    }
    else {
      uint64_t v35 = __str->__r_.__value_.__l.__size_;
    }
    return std::string::append(this, (const std::string::value_type *)v34, v35);
  }

LABEL_43:
    uint64_t v31 = *(int *)(v5 + 40);
    if ((_DWORD)v31 != -1) {
      wireless_diagnostics::google::protobuf::internal::ExtensionSet::AppendToList( (void *)(a2 + v31),  (const wireless_diagnostics::google::protobuf::Descriptor *)v6,  *(wireless_diagnostics::google::protobuf::internal::Mutex ***)(v5 + 48),  (void **)a3);
    }
    uint64_t v32 = (uint64_t *)a3[1];
    unint64_t v33 = 126 - 2 * __clz(((char *)v32 - *a3) >> 3);
    else {
      uint64_t v34 = v33;
    }
  }

  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::GetInt32( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, const wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, uint64_t a4, const char *a5)
{
  uint64_t v8 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v8) {
  if (*((_DWORD *)a3 + 12) == 3)
  }
      a5);
  if (*((_BYTE *)a3 + 52)) {
    return wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetInt32((const wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)));
  }
  else {
    return *(unsigned int *)((char *)a2
  }
                           + *(int *)(*((void *)this + 3)
                                    + 4LL
                                    * (int)(-286331153
                                          * (((unint64_t)a3 - *(void *)(*((void *)a3 + 7) + 48LL)) >> 3))));
}

void wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::SetInt32( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, uint64_t a4, const char *a5)
{
  uint64_t v9 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v9) {
  if (*((_DWORD *)a3 + 12) == 3)
  }
      a5);
  if (*((_BYTE *)a3 + 52))
  {
    wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetInt32( (wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)),  *((unsigned int *)a3 + 10),  *((unsigned __int8 *)a3 + 44),  a4,  a3);
  }

  else
  {
    unint64_t v10 = 0xEEEEEEEEEEEEEEEFLL * (((uint64_t)a3 - *(void *)(*((void *)a3 + 7) + 48LL)) >> 3);
    *(_DWORD *)((char *)a2
    *(_DWORD *)((char *)a2 + 4 * ((int)v10 / 32) + *((int *)this + 8)) |= 1 << v10;
  }

uint64_t wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::GetRepeatedInt32( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, const wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, int a4, const char *a5)
{
  uint64_t v9 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v9) {
  if (*((_DWORD *)a3 + 12) != 3)
  }
      a5);
  if (*((_BYTE *)a3 + 52)) {
    return wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetRepeatedInt32((const wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)));
  }
  else {
    return *(unsigned int *)(*(void *)((char *)a2
  }
                                       + *(int *)(*((void *)this + 3)
                                                + 4LL
                                                * (int)(-286331153
}

void wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::SetRepeatedInt32( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, int a4, const char *a5)
{
  int v5 = (int)a5;
  unint64_t v10 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v10) {
  if (*((_DWORD *)a3 + 12) != 3)
  }
      a5);
  if (*((_BYTE *)a3 + 52)) {
    wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetRepeatedInt32((wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)));
  }
  else {
    *(_DWORD *)(*(void *)((char *)a2
  }
                          + *(int *)(*((void *)this + 3)
                                   + 4LL
                                   * (int)(-286331153
}

void wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::AddInt32( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, uint64_t a4, const char *a5)
{
  uint64_t v9 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v9) {
  if (*((_DWORD *)a3 + 12) != 3)
  }
      a5);
  if (*((_BYTE *)a3 + 52))
  {
    wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddInt32( (wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)),  *((unsigned int *)a3 + 10),  *((unsigned __int8 *)a3 + 44),  *(unsigned __int8 *)(*((void *)a3 + 12) + 44LL),  a4,  a3);
  }

  else
  {
    unint64_t v10 = (char *)a2
    int v11 = *((_DWORD *)v10 + 2);
    if (v11 == *((_DWORD *)v10 + 3))
    {
      wireless_diagnostics::google::protobuf::RepeatedField<int>::Reserve((uint64_t)v10, v11 + 1);
      int v11 = *((_DWORD *)v10 + 2);
    }

    uint64_t v12 = *(void *)v10;
    *((_DWORD *)v10 + 2) = v11 + 1;
    *(_DWORD *)(v12 + 4LL * v11) = a4;
  }

uint64_t wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::GetInt64( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, const wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, uint64_t a4, const char *a5)
{
  uint64_t v8 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v8) {
  if (*((_DWORD *)a3 + 12) == 3)
  }
      a5);
  if (*((_BYTE *)a3 + 52)) {
    return wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetInt64((const wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)));
  }
  else {
    return *(void *)((char *)a2
  }
                     + *(int *)(*((void *)this + 3)
                              + 4LL
                              * (int)(-286331153
                                    * (((unint64_t)a3 - *(void *)(*((void *)a3 + 7) + 48LL)) >> 3))));
}

void wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::SetInt64( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, uint64_t a4, const char *a5)
{
  uint64_t v9 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v9) {
  if (*((_DWORD *)a3 + 12) == 3)
  }
      a5);
  if (*((_BYTE *)a3 + 52))
  {
    wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetInt64( (wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)),  *((unsigned int *)a3 + 10),  *((unsigned __int8 *)a3 + 44),  a4,  a3);
  }

  else
  {
    unint64_t v10 = 0xEEEEEEEEEEEEEEEFLL * (((uint64_t)a3 - *(void *)(*((void *)a3 + 7) + 48LL)) >> 3);
    *(void *)((char *)a2
    *(_DWORD *)((char *)a2 + 4 * ((int)v10 / 32) + *((int *)this + 8)) |= 1 << v10;
  }

uint64_t wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::GetRepeatedInt64( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, const wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, int a4, const char *a5)
{
  uint64_t v9 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v9) {
  if (*((_DWORD *)a3 + 12) != 3)
  }
      a5);
  if (*((_BYTE *)a3 + 52)) {
    return wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetRepeatedInt64((const wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)));
  }
  else {
    return *(void *)(*(void *)((char *)a2
  }
                                 + *(int *)(*((void *)this + 3)
                                          + 4LL
                                          * (int)(-286331153
}

void wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::SetRepeatedInt64( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, int a4, const char *a5)
{
  unint64_t v10 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v10) {
  if (*((_DWORD *)a3 + 12) != 3)
  }
      a5);
  if (*((_BYTE *)a3 + 52)) {
    wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetRepeatedInt64((wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)));
  }
  else {
    *(void *)(*(void *)((char *)a2
  }
                          + *(int *)(*((void *)this + 3)
                                   + 4LL
                                   * (int)(-286331153
}

void wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::AddInt64( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, uint64_t a4, const char *a5)
{
  uint64_t v9 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v9) {
  if (*((_DWORD *)a3 + 12) != 3)
  }
      a5);
  if (*((_BYTE *)a3 + 52))
  {
    wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddInt64( (wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)),  *((unsigned int *)a3 + 10),  *((unsigned __int8 *)a3 + 44),  *(unsigned __int8 *)(*((void *)a3 + 12) + 44LL),  a4,  a3);
  }

  else
  {
    unint64_t v10 = (char *)a2
    int v11 = *((_DWORD *)v10 + 2);
    if (v11 == *((_DWORD *)v10 + 3))
    {
      wireless_diagnostics::google::protobuf::RepeatedField<long long>::Reserve((uint64_t)v10, v11 + 1);
      int v11 = *((_DWORD *)v10 + 2);
    }

    uint64_t v12 = *(void *)v10;
    *((_DWORD *)v10 + 2) = v11 + 1;
    *(void *)(v12 + 8LL * v11) = a4;
  }

uint64_t wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::GetUInt32( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, const wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, uint64_t a4, const char *a5)
{
  uint64_t v8 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v8) {
  if (*((_DWORD *)a3 + 12) == 3)
  }
      a5);
  if (*((_BYTE *)a3 + 52)) {
    return wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetUInt32((const wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)));
  }
  else {
    return *(unsigned int *)((char *)a2
  }
                           + *(int *)(*((void *)this + 3)
                                    + 4LL
                                    * (int)(-286331153
                                          * (((unint64_t)a3 - *(void *)(*((void *)a3 + 7) + 48LL)) >> 3))));
}

void wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::SetUInt32( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, uint64_t a4, const char *a5)
{
  uint64_t v9 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v9) {
  if (*((_DWORD *)a3 + 12) == 3)
  }
      a5);
  if (*((_BYTE *)a3 + 52))
  {
    wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetUInt32( (wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)),  *((unsigned int *)a3 + 10),  *((unsigned __int8 *)a3 + 44),  a4,  a3);
  }

  else
  {
    unint64_t v10 = 0xEEEEEEEEEEEEEEEFLL * (((uint64_t)a3 - *(void *)(*((void *)a3 + 7) + 48LL)) >> 3);
    *(_DWORD *)((char *)a2
    *(_DWORD *)((char *)a2 + 4 * ((int)v10 / 32) + *((int *)this + 8)) |= 1 << v10;
  }

uint64_t wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::GetRepeatedUInt32( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, const wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, int a4, const char *a5)
{
  uint64_t v9 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v9) {
  if (*((_DWORD *)a3 + 12) != 3)
  }
      a5);
  if (*((_BYTE *)a3 + 52)) {
    return wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetRepeatedUInt32((const wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)));
  }
  else {
    return *(unsigned int *)(*(void *)((char *)a2
  }
                                       + *(int *)(*((void *)this + 3)
                                                + 4LL
                                                * (int)(-286331153
}

void wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::SetRepeatedUInt32( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, int a4, const char *a5)
{
  int v5 = (int)a5;
  unint64_t v10 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v10) {
  if (*((_DWORD *)a3 + 12) != 3)
  }
      a5);
  if (*((_BYTE *)a3 + 52)) {
    wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetRepeatedUInt32((wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)));
  }
  else {
    *(_DWORD *)(*(void *)((char *)a2
  }
                          + *(int *)(*((void *)this + 3)
                                   + 4LL
                                   * (int)(-286331153
}

void wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::AddUInt32( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, uint64_t a4, const char *a5)
{
  uint64_t v9 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v9) {
  if (*((_DWORD *)a3 + 12) != 3)
  }
      a5);
  if (*((_BYTE *)a3 + 52))
  {
    wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddUInt32( (wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)),  *((unsigned int *)a3 + 10),  *((unsigned __int8 *)a3 + 44),  *(unsigned __int8 *)(*((void *)a3 + 12) + 44LL),  a4,  a3);
  }

  else
  {
    unint64_t v10 = (char *)a2
    int v11 = *((_DWORD *)v10 + 2);
    if (v11 == *((_DWORD *)v10 + 3))
    {
      wireless_diagnostics::google::protobuf::RepeatedField<int>::Reserve((uint64_t)v10, v11 + 1);
      int v11 = *((_DWORD *)v10 + 2);
    }

    uint64_t v12 = *(void *)v10;
    *((_DWORD *)v10 + 2) = v11 + 1;
    *(_DWORD *)(v12 + 4LL * v11) = a4;
  }

uint64_t wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::GetUInt64( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, const wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, uint64_t a4, const char *a5)
{
  uint64_t v8 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v8) {
  if (*((_DWORD *)a3 + 12) == 3)
  }
      a5);
  if (*((_BYTE *)a3 + 52)) {
    return wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetUInt64((const wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)));
  }
  else {
    return *(void *)((char *)a2
  }
                     + *(int *)(*((void *)this + 3)
                              + 4LL
                              * (int)(-286331153
                                    * (((unint64_t)a3 - *(void *)(*((void *)a3 + 7) + 48LL)) >> 3))));
}

void wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::SetUInt64( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, uint64_t a4, const char *a5)
{
  uint64_t v9 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v9) {
  if (*((_DWORD *)a3 + 12) == 3)
  }
      a5);
  if (*((_BYTE *)a3 + 52))
  {
    wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetUInt64( (wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)),  *((unsigned int *)a3 + 10),  *((unsigned __int8 *)a3 + 44),  a4,  a3);
  }

  else
  {
    unint64_t v10 = 0xEEEEEEEEEEEEEEEFLL * (((uint64_t)a3 - *(void *)(*((void *)a3 + 7) + 48LL)) >> 3);
    *(void *)((char *)a2
    *(_DWORD *)((char *)a2 + 4 * ((int)v10 / 32) + *((int *)this + 8)) |= 1 << v10;
  }

uint64_t wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::GetRepeatedUInt64( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, const wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, int a4, const char *a5)
{
  uint64_t v9 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v9) {
  if (*((_DWORD *)a3 + 12) != 3)
  }
      a5);
  if (*((_BYTE *)a3 + 52)) {
    return wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetRepeatedUInt64((const wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)));
  }
  else {
    return *(void *)(*(void *)((char *)a2
  }
                                 + *(int *)(*((void *)this + 3)
                                          + 4LL
                                          * (int)(-286331153
}

void wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::SetRepeatedUInt64( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, int a4, const char *a5)
{
  unint64_t v10 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v10) {
  if (*((_DWORD *)a3 + 12) != 3)
  }
      a5);
  if (*((_BYTE *)a3 + 52)) {
    wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetRepeatedUInt64((wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)));
  }
  else {
    *(void *)(*(void *)((char *)a2
  }
                          + *(int *)(*((void *)this + 3)
                                   + 4LL
                                   * (int)(-286331153
}

void wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::AddUInt64( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, uint64_t a4, const char *a5)
{
  uint64_t v9 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v9) {
  if (*((_DWORD *)a3 + 12) != 3)
  }
      a5);
  if (*((_BYTE *)a3 + 52))
  {
    wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddUInt64( (wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)),  *((unsigned int *)a3 + 10),  *((unsigned __int8 *)a3 + 44),  *(unsigned __int8 *)(*((void *)a3 + 12) + 44LL),  a4,  a3);
  }

  else
  {
    unint64_t v10 = (char *)a2
    int v11 = *((_DWORD *)v10 + 2);
    if (v11 == *((_DWORD *)v10 + 3))
    {
      wireless_diagnostics::google::protobuf::RepeatedField<long long>::Reserve((uint64_t)v10, v11 + 1);
      int v11 = *((_DWORD *)v10 + 2);
    }

    uint64_t v12 = *(void *)v10;
    *((_DWORD *)v10 + 2) = v11 + 1;
    *(void *)(v12 + 8LL * v11) = a4;
  }

float wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::GetFloat( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, const wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, uint64_t a4, const char *a5)
{
  uint64_t v8 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v8) {
  if (*((_DWORD *)a3 + 12) == 3)
  }
      a5);
  if (!*((_BYTE *)a3 + 52)) {
    return *(float *)((char *)a2
  }
                    + *(int *)(*((void *)this + 3)
                             + 4LL
                             * (int)(-286331153 * (((unint64_t)a3 - *(void *)(*((void *)a3 + 7) + 48LL)) >> 3))));
  wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetFloat( (const wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)),  *((float *)a3 + 28));
  return result;
}

void wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::SetFloat( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, float a4, uint64_t a5, const char *a6)
{
  unint64_t v10 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v10) {
  if (*((_DWORD *)a3 + 12) == 3)
  }
      a6);
  if (*((_BYTE *)a3 + 52))
  {
    wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetFloat( (wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)),  *((unsigned int *)a3 + 10),  *((unsigned __int8 *)a3 + 44),  a4,  a3);
  }

  else
  {
    unint64_t v11 = 0xEEEEEEEEEEEEEEEFLL * (((uint64_t)a3 - *(void *)(*((void *)a3 + 7) + 48LL)) >> 3);
    *(float *)((char *)a2
    *(_DWORD *)((char *)a2 + 4 * ((int)v11 / 32) + *((int *)this + 8)) |= 1 << v11;
  }

float wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::GetRepeatedFloat( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, const wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, int a4, const char *a5)
{
  uint64_t v9 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v9) {
  if (*((_DWORD *)a3 + 12) != 3)
  }
      a5);
  if (!*((_BYTE *)a3 + 52)) {
    return *(float *)(*(void *)((char *)a2
  }
                                + *(int *)(*((void *)this + 3)
                                         + 4LL
                                         * (int)(-286331153
  wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetRepeatedFloat((const wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)));
  return result;
}

void wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::SetRepeatedFloat( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, int a4, float a5, const char *a6)
{
  unint64_t v11 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v11) {
  if (*((_DWORD *)a3 + 12) != 3)
  }
      a6);
  if (*((_BYTE *)a3 + 52)) {
    wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetRepeatedFloat( (wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)),  a5);
  }
  else {
    *(float *)(*(void *)((char *)a2
  }
                         + *(int *)(*((void *)this + 3)
                                  + 4LL
                                  * (int)(-286331153
}

void wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::AddFloat( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, float a4, uint64_t a5, const char *a6)
{
  unint64_t v10 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v10) {
  if (*((_DWORD *)a3 + 12) != 3)
  }
      a6);
  if (*((_BYTE *)a3 + 52))
  {
    wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddFloat( (wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)),  *((unsigned int *)a3 + 10),  *((unsigned __int8 *)a3 + 44),  *(unsigned __int8 *)(*((void *)a3 + 12) + 44LL),  a4,  a3);
  }

  else
  {
    unint64_t v11 = (char *)a2
    int v12 = *((_DWORD *)v11 + 2);
    if (v12 == *((_DWORD *)v11 + 3))
    {
      wireless_diagnostics::google::protobuf::RepeatedField<int>::Reserve((uint64_t)v11, v12 + 1);
      int v12 = *((_DWORD *)v11 + 2);
    }

    uint64_t v13 = *(void *)v11;
    *((_DWORD *)v11 + 2) = v12 + 1;
    *(float *)(v13 + 4LL * v12) = a4;
  }

double wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::GetDouble( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, const wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, uint64_t a4, const char *a5)
{
  uint64_t v8 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v8) {
  if (*((_DWORD *)a3 + 12) == 3)
  }
      a5);
  if (!*((_BYTE *)a3 + 52)) {
    return *(double *)((char *)a2
  }
                     + *(int *)(*((void *)this + 3)
                              + 4LL
                              * (int)(-286331153
                                    * (((unint64_t)a3 - *(void *)(*((void *)a3 + 7) + 48LL)) >> 3))));
  wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetDouble( (const wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)),  *((double *)a3 + 14));
  return result;
}

void wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::SetDouble( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, double a4, uint64_t a5, const char *a6)
{
  unint64_t v10 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v10) {
  if (*((_DWORD *)a3 + 12) == 3)
  }
      a6);
  if (*((_BYTE *)a3 + 52))
  {
    wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetDouble( (wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)),  *((unsigned int *)a3 + 10),  *((unsigned __int8 *)a3 + 44),  a4,  a3);
  }

  else
  {
    unint64_t v11 = 0xEEEEEEEEEEEEEEEFLL * (((uint64_t)a3 - *(void *)(*((void *)a3 + 7) + 48LL)) >> 3);
    *(double *)((char *)a2
    *(_DWORD *)((char *)a2 + 4 * ((int)v11 / 32) + *((int *)this + 8)) |= 1 << v11;
  }

double wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::GetRepeatedDouble( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, const wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, int a4, const char *a5)
{
  uint64_t v9 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v9) {
  if (*((_DWORD *)a3 + 12) != 3)
  }
      a5);
  if (!*((_BYTE *)a3 + 52)) {
    return *(double *)(*(void *)((char *)a2
  }
                                 + *(int *)(*((void *)this + 3)
                                          + 4LL
                                          * (int)(-286331153
  wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetRepeatedDouble((const wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)));
  return result;
}

void wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::SetRepeatedDouble( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, int a4, double a5, const char *a6)
{
  unint64_t v11 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v11) {
  if (*((_DWORD *)a3 + 12) != 3)
  }
      a6);
  if (*((_BYTE *)a3 + 52)) {
    wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetRepeatedDouble( (wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)),  a5);
  }
  else {
    *(double *)(*(void *)((char *)a2
  }
                          + *(int *)(*((void *)this + 3)
                                   + 4LL
                                   * (int)(-286331153
}

void wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::AddDouble( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, double a4, uint64_t a5, const char *a6)
{
  unint64_t v10 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v10) {
  if (*((_DWORD *)a3 + 12) != 3)
  }
      a6);
  if (*((_BYTE *)a3 + 52))
  {
    wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddDouble( (wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)),  *((unsigned int *)a3 + 10),  *((unsigned __int8 *)a3 + 44),  *(unsigned __int8 *)(*((void *)a3 + 12) + 44LL),  a4,  a3);
  }

  else
  {
    unint64_t v11 = (char *)a2
    int v12 = *((_DWORD *)v11 + 2);
    if (v12 == *((_DWORD *)v11 + 3))
    {
      wireless_diagnostics::google::protobuf::RepeatedField<long long>::Reserve((uint64_t)v11, v12 + 1);
      int v12 = *((_DWORD *)v11 + 2);
    }

    uint64_t v13 = *(void *)v11;
    *((_DWORD *)v11 + 2) = v12 + 1;
    *(double *)(v13 + 8LL * v12) = a4;
  }

uint64_t wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::GetBool( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, const wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, uint64_t a4, const char *a5)
{
  uint64_t v8 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v8) {
  if (*((_DWORD *)a3 + 12) == 3)
  }
      a5);
  if (*((_BYTE *)a3 + 52)) {
    return wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetBool((const wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)));
  }
  else {
    return *((unsigned __int8 *)a2
  }
}

void wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::SetBool( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, uint64_t a4, const char *a5)
{
  uint64_t v9 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v9) {
  if (*((_DWORD *)a3 + 12) == 3)
  }
      a5);
  if (*((_BYTE *)a3 + 52))
  {
    wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetBool( (wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)),  *((unsigned int *)a3 + 10),  *((unsigned __int8 *)a3 + 44),  a4,  a3);
  }

  else
  {
    uint64_t v10 = *((void *)a3 + 7);
    uint64_t v12 = *(void *)(v10 + 48);
    unint64_t v11 = (void *)(v10 + 48);
    *((_BYTE *)a2 + *(int *)(*((void *)this + 3) + 4LL * (int)(-286331153 * (((unint64_t)a3 - v12) >> 3)))) = a4;
    if (*((_BYTE *)a3 + 52))
    {
      uint64_t v13 = *((void *)a3 + 8);
      if (v13) {
        unint64_t v11 = (void *)(v13 + 112);
      }
      else {
        unint64_t v11 = (void *)(*((void *)a3 + 4) + 128LL);
      }
    }

    *(_DWORD *)((char *)a2 + 4 * ((int)(-286331153 * (((unint64_t)a3 - *v11) >> 3)) / 32) + *((int *)this + 8)) |= 1 << (-17 * (((unint64_t)a3 - *v11) >> 3));
  }

uint64_t wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::GetRepeatedBool( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, const wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, int a4, const char *a5)
{
  uint64_t v9 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v9) {
  if (*((_DWORD *)a3 + 12) != 3)
  }
      a5);
  if (*((_BYTE *)a3 + 52)) {
    return wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetRepeatedBool((const wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)));
  }
  else {
    return *(unsigned __int8 *)(*(void *)((char *)a2
  }
                                          + *(int *)(*((void *)this + 3)
                                                   + 4LL
                                                   * (int)(-286331153
                                                         * (((unint64_t)a3
                                                           - *(void *)(*((void *)a3 + 7) + 48LL)) >> 3))))
                              + a4);
}

void wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::SetRepeatedBool( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, int a4, const char *a5)
{
  char v5 = (char)a5;
  uint64_t v10 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v10) {
  if (*((_DWORD *)a3 + 12) != 3)
  }
      a5);
  if (*((_BYTE *)a3 + 52)) {
    wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetRepeatedBool((wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)));
  }
  else {
    *(_BYTE *)(*(void *)((char *)a2
  }
                         + *(int *)(*((void *)this + 3)
                                  + 4LL
                                  * (int)(-286331153
}

void wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::AddBool( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, uint64_t a4, const char *a5)
{
  uint64_t v9 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v9) {
  if (*((_DWORD *)a3 + 12) != 3)
  }
      a5);
  if (*((_BYTE *)a3 + 52))
  {
    wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddBool( (wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)),  *((unsigned int *)a3 + 10),  *((unsigned __int8 *)a3 + 44),  *(unsigned __int8 *)(*((void *)a3 + 12) + 44LL),  a4,  a3);
  }

  else
  {
    uint64_t v10 = (char *)a2
    int v11 = *((_DWORD *)v10 + 2);
    if (v11 == *((_DWORD *)v10 + 3))
    {
      wireless_diagnostics::google::protobuf::RepeatedField<BOOL>::Reserve((uint64_t)v10, v11 + 1);
      int v11 = *((_DWORD *)v10 + 2);
    }

    uint64_t v12 = *(void *)v10;
    *((_DWORD *)v10 + 2) = v11 + 1;
    *(_BYTE *)(v12 + v11) = a4;
  }

void wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::GetString( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this@<X0>, const wireless_diagnostics::google::protobuf::Message *a2@<X1>, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3@<X2>, const char *a4@<X4>, std::string *a5@<X8>)
{
  uint64_t v9 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v9) {
  if (*((_DWORD *)a3 + 12) == 3)
  }
      a4);
  if (*((_BYTE *)a3 + 52))
  {
    uint64_t String = wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetString();
    if ((*(char *)(String + 23) & 0x80000000) == 0)
    {
      __int128 v11 = *(_OWORD *)String;
      std::string::size_type v12 = *(void *)(String + 16);
LABEL_12:
      a5->__r_.__value_.__l.__cap_ = v12;
      *(_OWORD *)&a5->__r_.__value_.__l.__data_ = v11;
      return;
    }

    uint64_t v14 = *(const std::string::value_type **)String;
    std::string::size_type v15 = *(void *)(String + 8);
  }

  else
  {
    uint64_t v13 = *(__int128 **)((char *)a2
                       + *(int *)(*((void *)this + 3)
                                + 4LL
                                * (int)(-286331153
                                      * (((unint64_t)a3 - *(void *)(*((void *)a3 + 7) + 48LL)) >> 3))));
    if ((*((char *)v13 + 23) & 0x80000000) == 0)
    {
      __int128 v11 = *v13;
      std::string::size_type v12 = *((void *)v13 + 2);
      goto LABEL_12;
    }

    uint64_t v14 = *(const std::string::value_type **)v13;
    std::string::size_type v15 = *((void *)v13 + 1);
  }

  std::string::__init_copy_ctor_external(a5, v14, v15);
}

uint64_t wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::GetStringReference( uint64_t a1, uint64_t a2, wireless_diagnostics::google::protobuf::Descriptor *a3, uint64_t a4, const char *a5)
{
  uint64_t v8 = *(wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)(a1 + 8);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v8) {
  if (*((_DWORD *)a3 + 12) == 3)
  }
      a5);
  if (*((_BYTE *)a3 + 52)) {
    return wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetString();
  }
  else {
    return *(void *)(a2
  }
                     + *(int *)(*(void *)(a1 + 24)
                              + 4LL
                              * (int)(-286331153
                                    * (((unint64_t)a3 - *(void *)(*((void *)a3 + 7) + 48LL)) >> 3))));
}

void wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::SetString( uint64_t a1, uint64_t a2, wireless_diagnostics::google::protobuf::Descriptor *a3, const std::string *a4, const char *a5)
{
  uint64_t v9 = *(wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)(a1 + 8);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v9) {
  if (*((_DWORD *)a3 + 12) == 3)
  }
      a5);
  if (*((_BYTE *)a3 + 52))
  {
    uint64_t v10 = (std::string *)wireless_diagnostics::google::protobuf::internal::ExtensionSet::MutableString( (wireless_diagnostics::google::protobuf::internal::ExtensionSet *)(a2 + *(int *)(a1 + 40)),  *((unsigned int *)a3 + 10),  *((unsigned __int8 *)a3 + 44),  a3);
LABEL_10:
    std::string::operator=(v10, a4);
    return;
  }

  unint64_t v11 = 0xEEEEEEEEEEEEEEEFLL * (((uint64_t)a3 - *(void *)(*((void *)a3 + 7) + 48LL)) >> 3);
  *(_DWORD *)(a2 + *(int *)(a1 + 32) + 4LL * ((int)v11 / 32)) |= 1 << v11;
  uint64_t v12 = *(int *)(*(void *)(a1 + 24) + 4LL * (int)v11);
  uint64_t v10 = *(std::string **)(a2 + v12);
  if (v10 != *(std::string **)(*(void *)(a1 + 16) + v12)) {
    goto LABEL_10;
  }
  uint64_t v13 = (std::string *)operator new(0x18uLL);
  uint64_t v14 = v13;
  if ((char)a4->__r_.__value_.__s.__size_ < 0)
  {
    std::string::__init_copy_ctor_external(v13, a4->__r_.__value_.__l.__data_, a4->__r_.__value_.__l.__size_);
  }

  else
  {
    *(_OWORD *)&v13->__r_.__value_.__l.__data_ = *(_OWORD *)&a4->__r_.__value_.__l.__data_;
    v13->__r_.__value_.__l.__cap_ = a4->__r_.__value_.__l.__cap_;
  }

  *(void *)(a2 + v12) = v14;
}

void sub_187C3E718(_Unwind_Exception *a1)
{
}

void wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::GetRepeatedString( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this@<X0>, const wireless_diagnostics::google::protobuf::Message *a2@<X1>, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3@<X2>, int a4@<W3>, const char *a5@<X4>, std::string *a6@<X8>)
{
  unint64_t v11 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v11) {
  if (*((_DWORD *)a3 + 12) != 3)
  }
      a5);
  if (*((_BYTE *)a3 + 52))
  {
    Repeateduint64_t String = wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetRepeatedString((const wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)));
    if ((*(char *)(RepeatedString + 23) & 0x80000000) == 0)
    {
      __int128 v13 = *(_OWORD *)RepeatedString;
      std::string::size_type v14 = *(void *)(RepeatedString + 16);
LABEL_12:
      a6->__r_.__value_.__l.__cap_ = v14;
      *(_OWORD *)&a6->__r_.__value_.__l.__data_ = v13;
      return;
    }

    uint64_t v16 = *(const std::string::value_type **)RepeatedString;
    std::string::size_type v17 = *(void *)(RepeatedString + 8);
  }

  else
  {
    std::string::size_type v15 = *(__int128 **)(*(void *)((char *)a2
                                   + *(int *)(*((void *)this + 3)
                                            + 4LL
                                            * (int)(-286331153
    if ((*((char *)v15 + 23) & 0x80000000) == 0)
    {
      __int128 v13 = *v15;
      std::string::size_type v14 = *((void *)v15 + 2);
      goto LABEL_12;
    }

    uint64_t v16 = *(const std::string::value_type **)v15;
    std::string::size_type v17 = *((void *)v15 + 1);
  }

  std::string::__init_copy_ctor_external(a6, v16, v17);
}

uint64_t wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::GetRepeatedStringReference( uint64_t a1, uint64_t a2, wireless_diagnostics::google::protobuf::Descriptor *a3, int a4, const char *a5)
{
  uint64_t v9 = *(wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)(a1 + 8);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v9) {
  if (*((_DWORD *)a3 + 12) != 3)
  }
      a5);
  if (*((_BYTE *)a3 + 52)) {
    return wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetRepeatedString((wireless_diagnostics::google::protobuf::internal::ExtensionSet *)(a2 + *(int *)(a1 + 40)));
  }
  else {
    return *(void *)(*(void *)(a2
  }
                                 + *(int *)(*(void *)(a1 + 24)
                                          + 4LL
                                          * (int)(-286331153
}

std::string *wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::SetRepeatedString( uint64_t a1, uint64_t a2, wireless_diagnostics::google::protobuf::Descriptor *a3, int a4, const std::string *a5)
{
  uint64_t v10 = *(wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)(a1 + 8);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v10) {
  if (*((_DWORD *)a3 + 12) != 3)
  }
      (const char *)a5);
  if (*((_BYTE *)a3 + 52)) {
    unint64_t v11 = (std::string *)wireless_diagnostics::google::protobuf::internal::ExtensionSet::MutableRepeatedString((wireless_diagnostics::google::protobuf::internal::ExtensionSet *)(a2 + *(int *)(a1 + 40)));
  }
  else {
    unint64_t v11 = *(std::string **)(*(void *)(a2
  }
                                      + *(int *)(*(void *)(a1 + 24)
                                               + 4LL
                                               * (int)(-286331153
  return std::string::operator=(v11, a5);
}

std::string *wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::AddString( uint64_t a1, uint64_t a2, wireless_diagnostics::google::protobuf::Descriptor *a3, const std::string *a4, const char *a5)
{
  uint64_t v9 = *(wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)(a1 + 8);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v9) {
  if (*((_DWORD *)a3 + 12) != 3)
  }
      a5);
  if (*((_BYTE *)a3 + 52))
  {
    uint64_t v10 = (std::string *)wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddString( (wireless_diagnostics::google::protobuf::internal::ExtensionSet *)(a2 + *(int *)(a1 + 40)),  *((unsigned int *)a3 + 10),  *((unsigned __int8 *)a3 + 44),  a3);
  }

  else
  {
    unint64_t v11 = (int *)(a2
                + *(int *)(*(void *)(a1 + 24)
                         + 4LL
                         * (int)(-286331153 * (((unint64_t)a3 - *(void *)(*((void *)a3 + 7) + 48LL)) >> 3))));
    int v12 = v11[3];
    uint64_t v13 = v11[2];
    if ((int)v13 >= v12)
    {
      if (v12 == v11[4])
      {
        uint64_t v9 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *)v11);
        int v12 = v11[3];
      }

      v11[3] = v12 + 1;
      uint64_t v10 = (std::string *)wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase::New(v9);
      uint64_t v15 = *(void *)v11;
      uint64_t v16 = v11[2];
      v11[2] = v16 + 1;
      *(void *)(v15 + 8 * v16) = v10;
    }

    else
    {
      uint64_t v14 = *(void *)v11;
      v11[2] = v13 + 1;
      uint64_t v10 = *(std::string **)(v14 + 8 * v13);
    }
  }

  return std::string::operator=(v10, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::GetEnum( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, const wireless_diagnostics::google::protobuf::Message *a2, wireless_diagnostics::google::protobuf::EnumDescriptor **a3, uint64_t a4, const char *a5)
{
  uint64_t v8 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (a3[7] != v8) {
  if (*((_DWORD *)a3 + 12) == 3)
  }
      a5);
  if (*((_BYTE *)a3 + 52)) {
    int Enum = wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetEnum((const wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)));
  }
  else {
    int Enum = *(_DWORD *)((char *)a2
  }
  uint64_t ValueByNumber = wireless_diagnostics::google::protobuf::EnumDescriptor::FindValueByNumber(a3[10], Enum);
  if (!ValueByNumber)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v12);
  }

  return ValueByNumber;
}

void sub_187C3EDA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::SetEnum( uint64_t a1, uint64_t a2, wireless_diagnostics::google::protobuf::Descriptor *a3, uint64_t a4, const char *a5)
{
  uint64_t v9 = *(wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)(a1 + 8);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v9) {
  if (*((_DWORD *)a3 + 12) == 3)
  }
      a5);
  if (*(void *)(a4 + 24) != *((void *)a3 + 10)) {
  if (*((_BYTE *)a3 + 52))
  }
  {
    wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetEnum( (wireless_diagnostics::google::protobuf::internal::ExtensionSet *)(a2 + *(int *)(a1 + 40)),  *((unsigned int *)a3 + 10),  *((unsigned __int8 *)a3 + 44),  *(unsigned int *)(a4 + 16),  a3);
  }

  else
  {
    unint64_t v10 = 0xEEEEEEEEEEEEEEEFLL * (((uint64_t)a3 - *(void *)(*((void *)a3 + 7) + 48LL)) >> 3);
    *(_DWORD *)(a2
    *(_DWORD *)(a2 + *(int *)(a1 + 32) + 4LL * ((int)v10 / 32)) |= 1 << v10;
  }

void wireless_diagnostics::google::protobuf::internal::anonymous namespace'::ReportReflectionUsageEnumTypeError()
{
  wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v0);
}

void sub_187C3EFF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

uint64_t wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::GetRepeatedEnum( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, const wireless_diagnostics::google::protobuf::Message *a2, wireless_diagnostics::google::protobuf::EnumDescriptor **a3, int a4, const char *a5)
{
  uint64_t v9 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (a3[7] != v9) {
  if (*((_DWORD *)a3 + 12) != 3)
  }
      a5);
  if (*((_BYTE *)a3 + 52)) {
    Repeatedint Enum = wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetRepeatedEnum((const wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)));
  }
  else {
    Repeatedint Enum = *(_DWORD *)(*(void *)((char *)a2
  }
                                         + *(int *)(*((void *)this + 3)
                                                  + 4LL
                                                  * (int)(-286331153
  uint64_t ValueByNumber = wireless_diagnostics::google::protobuf::EnumDescriptor::FindValueByNumber(a3[10], RepeatedEnum);
  if (!ValueByNumber)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v13);
  }

  return ValueByNumber;
}

void sub_187C3F1B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::SetRepeatedEnum( uint64_t a1, uint64_t a2, wireless_diagnostics::google::protobuf::Descriptor *a3, int a4, uint64_t a5)
{
  unint64_t v10 = *(wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)(a1 + 8);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v10) {
  if (*((_DWORD *)a3 + 12) != 3)
  }
      (const char *)a5);
  if (*(void *)(a5 + 24) != *((void *)a3 + 10)) {
  if (*((_BYTE *)a3 + 52))
  }
    wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetRepeatedEnum((wireless_diagnostics::google::protobuf::internal::ExtensionSet *)(a2 + *(int *)(a1 + 40)));
  else {
    *(_DWORD *)(*(void *)(a2
  }
                          + *(int *)(*(void *)(a1 + 24)
                                   + 4LL
                                   * (int)(-286331153
}

void wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::AddEnum( uint64_t a1, uint64_t a2, wireless_diagnostics::google::protobuf::Descriptor *a3, uint64_t a4, const char *a5)
{
  uint64_t v9 = *(wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)(a1 + 8);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v9) {
  if (*((_DWORD *)a3 + 12) != 3)
  }
      a5);
  if (*(void *)(a4 + 24) != *((void *)a3 + 10)) {
  if (*((_BYTE *)a3 + 52))
  }
  {
    wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddEnum( (wireless_diagnostics::google::protobuf::internal::ExtensionSet *)(a2 + *(int *)(a1 + 40)),  *((unsigned int *)a3 + 10),  *((unsigned __int8 *)a3 + 44),  *(unsigned __int8 *)(*((void *)a3 + 12) + 44LL),  *(unsigned int *)(a4 + 16),  a3);
  }

  else
  {
    int v10 = *(_DWORD *)(a4 + 16);
    uint64_t v11 = a2
    int v12 = *(_DWORD *)(v11 + 8);
    if (v12 == *(_DWORD *)(v11 + 12))
    {
      wireless_diagnostics::google::protobuf::RepeatedField<int>::Reserve(v11, v12 + 1);
      int v12 = *(_DWORD *)(v11 + 8);
    }

    uint64_t v13 = *(void *)v11;
    *(_DWORD *)(v11 + 8) = v12 + 1;
    *(_DWORD *)(v13 + 4LL * v12) = v10;
  }

uint64_t wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::GetMessage( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, const wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, wireless_diagnostics::google::protobuf::MessageFactory *a4, const char *a5)
{
  uint64_t v9 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v9) {
  if (*((_DWORD *)a3 + 12) == 3)
  }
      a5);
  if (!a4) {
    a4 = (wireless_diagnostics::google::protobuf::MessageFactory *)*((void *)this + 7);
  }
  if (*((_BYTE *)a3 + 52)) {
    return wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetMessage( (const wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)),  *((_DWORD *)a3 + 10),  *((const wireless_diagnostics::google::protobuf::Descriptor **)a3 + 9),  a4);
  }
  uint64_t result = *(void *)((char *)a2 + v11);
  if (!result) {
    return *(void *)(*((void *)this + 2) + v11);
  }
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::MutableMessage( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, wireless_diagnostics::google::protobuf::MessageFactory *a4, const char *a5)
{
  uint64_t v9 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v9) {
  if (*((_DWORD *)a3 + 12) == 3)
  }
      a5);
  if (!a4) {
    a4 = (wireless_diagnostics::google::protobuf::MessageFactory *)*((void *)this + 7);
  }
  if (*((_BYTE *)a3 + 52)) {
    return wireless_diagnostics::google::protobuf::internal::ExtensionSet::MutableMessage( (wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)),  a3,  a4);
  }
  unint64_t v11 = 0xEEEEEEEEEEEEEEEFLL * (((uint64_t)a3 - *(void *)(*((void *)a3 + 7) + 48LL)) >> 3);
  *(_DWORD *)((char *)a2 + 4 * ((int)v11 / 32) + *((int *)this + 8)) |= 1 << v11;
  uint64_t v12 = *(int *)(*((void *)this + 3) + 4LL * (int)v11);
  uint64_t result = *(void *)((char *)a2 + v12);
  if (!result)
  {
    uint64_t result = (*(uint64_t (**)(void))(**(void **)(*((void *)this + 2) + v12) + 24LL))(*(void *)(*((void *)this + 2) + v12));
    *(void *)((char *)a2 + v12) = result;
  }

  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::ReleaseMessage( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, wireless_diagnostics::google::protobuf::MessageFactory *a4, const char *a5)
{
  uint64_t v9 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v9) {
  if (*((_DWORD *)a3 + 12) == 3)
  }
      a5);
  if (!a4) {
    a4 = (wireless_diagnostics::google::protobuf::MessageFactory *)*((void *)this + 7);
  }
  if (*((_BYTE *)a3 + 52)) {
    return wireless_diagnostics::google::protobuf::internal::ExtensionSet::ReleaseMessage( (wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)),  a3,  a4);
  }
  unint64_t v11 = 0xEEEEEEEEEEEEEEEFLL * (((uint64_t)a3 - *(void *)(*((void *)a3 + 7) + 48LL)) >> 3);
  *(_DWORD *)((char *)a2 + 4 * ((int)v11 / 32) + *((int *)this + 8)) &= ~(1 << v11);
  uint64_t v12 = *(int *)(*((void *)this + 3) + 4LL * (int)v11);
  uint64_t result = *(void *)((char *)a2 + v12);
  *(void *)((char *)a2 + v12) = 0LL;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::GetRepeatedMessage( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, const wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, int a4, const char *a5)
{
  uint64_t v9 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v9) {
  if (*((_DWORD *)a3 + 12) != 3)
  }
      a5);
  if (*((_BYTE *)a3 + 52)) {
    return wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetRepeatedMessage((const wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)));
  }
  else {
    return *(void *)(*(void *)((char *)a2
  }
                                 + *(int *)(*((void *)this + 3)
                                          + 4LL
                                          * (int)(-286331153
}

uint64_t wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::MutableRepeatedMessage( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, int a4, const char *a5)
{
  uint64_t v9 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v9) {
  if (*((_DWORD *)a3 + 12) != 3)
  }
      a5);
  if (*((_BYTE *)a3 + 52)) {
    return wireless_diagnostics::google::protobuf::internal::ExtensionSet::MutableRepeatedMessage((wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)));
  }
  else {
    return *(void *)(*(void *)((char *)a2
  }
                                 + *(int *)(*((void *)this + 3)
                                          + 4LL
                                          * (int)(-286331153
}

void wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::AddMessage( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, wireless_diagnostics::google::protobuf::Message *a2, const wireless_diagnostics::google::protobuf::FieldDescriptor *a3, wireless_diagnostics::google::protobuf::MessageFactory *a4, const char *a5)
{
  uint64_t v9 = (wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *)*((void *)this + 1);
  if (*((wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ **)a3 + 7) != v9) {
  if (*((_DWORD *)a3 + 12) != 3)
  }
      a5);
  if (!a4) {
    a4 = (wireless_diagnostics::google::protobuf::MessageFactory *)*((void *)this + 7);
  }
  if (*((_BYTE *)a3 + 52))
  {
    wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddMessage( (wireless_diagnostics::google::protobuf::Message *)((char *)a2 + *((int *)this + 10)),  a3,  a4);
  }

  else
  {
    int v10 = (int *)((char *)a2
                + *(int *)(*((void *)this + 3)
                         + 4LL
                         * (int)(-286331153 * (((unint64_t)a3 - *(void *)(*((void *)a3 + 7) + 48LL)) >> 3))));
    int v11 = v10[2];
    if (v11 >= v10[3] || (uint64_t v12 = v11, v13 = *(uint64_t **)v10, ++v11, v10[2] = v11, !v13[v12]))
    {
      if (v11) {
        uint64_t v14 = **(void **)v10;
      }
      else {
        uint64_t v14 = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageFactory *, void))(*(void *)a4 + 16LL))( a4,  *((void *)a3 + 9));
      }
      uint64_t v15 = (*(uint64_t (**)(uint64_t))(*(void *)v14 + 24LL))(v14);
      wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::AddAllocated<wireless_diagnostics::google::protobuf::internal::GenericTypeHandler<wireless_diagnostics::google::protobuf::Message>>( v10,  v15);
    }
  }

int *wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::AddAllocated<wireless_diagnostics::google::protobuf::internal::GenericTypeHandler<wireless_diagnostics::google::protobuf::Message>>( int *this, uint64_t a2)
{
  int v3 = this;
  uint64_t v4 = this[2];
  int v5 = this[4];
  if ((_DWORD)v4 == v5)
  {
    this = (int *)wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *)this);
    int v6 = v3[3] + 1;
LABEL_9:
    void v3[3] = v6;
    goto LABEL_10;
  }

  uint64_t v7 = this[3];
  if ((_DWORD)v7 != v5)
  {
    int v6 = v7 + 1;
    goto LABEL_9;
  }

  this = *(int **)(*(void *)this + 8 * v4);
  if (this) {
    this = (int *)(*(uint64_t (**)(int *))(*(void *)this + 8LL))(this);
  }
LABEL_10:
  uint64_t v8 = *(void *)v3;
  uint64_t v9 = v3[2];
  int v3[2] = v9 + 1;
  *(void *)(v8 + 8 * v9) = a2;
  return this;
}

uint64_t wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::MutableRawRepeatedField( uint64_t a1, uint64_t a2, wireless_diagnostics::google::protobuf::Descriptor *a3, int a4, const char *a5, uint64_t a6)
{
  int v7 = (int)a5;
  if (*((_DWORD *)a3 + 12) != 3) {
      a5);
  }
  if ((v7 & 0x80000000) == 0 && *(_DWORD *)(*((void *)a3 + 12) + 40LL) != v7)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v13);
  }

  if (a6 && *((void *)a3 + 9) != a6)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v13);
  }

  if (*((_BYTE *)a3 + 52)) {
    return wireless_diagnostics::google::protobuf::internal::ExtensionSet::MutableRawRepeatedField((wireless_diagnostics::google::protobuf::internal::ExtensionSet *)(a2 + *(int *)(a1 + 40)));
  }
  else {
    return a2
  }
}

void sub_187C3FDF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

uint64_t wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::FindKnownExtensionByName( uint64_t a1, std::string *a2)
{
  if (*(_DWORD *)(a1 + 40) == -1) {
    return 0LL;
  }
  uint64_t result = wireless_diagnostics::google::protobuf::DescriptorPool::FindExtensionByName(*(void *)(a1 + 48), a2);
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 8);
    if (*(void *)(result + 56) == v5) {
      return result;
    }
  }

  else
  {
    uint64_t v5 = *(void *)(a1 + 8);
  }

  if (!*(_BYTE *)(*(void *)(v5 + 32) + 64LL)) {
    return 0LL;
  }
  uint64_t result = wireless_diagnostics::google::protobuf::DescriptorPool::FindMessageTypeByName(*(void *)(a1 + 48), a2);
  if (!result) {
    return result;
  }
  uint64_t v6 = result;
  uint64_t v7 = *(unsigned int *)(result + 104);
  for (uint64_t result = *(void *)(result + 112);
        *(void *)(result + 56) != *(void *)(a1 + 8)
     || *(_DWORD *)(result + 44) != 11
     || *(_DWORD *)(result + 48) != 1
     || *(void *)(result + 72) != v6;
        result += 120LL)
  {
    if (!--v7) {
      return 0LL;
    }
  }

  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::FindKnownExtensionByNumber( wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection *this, uint64_t a2)
{
  if (*((_DWORD *)this + 10) == -1) {
    return 0LL;
  }
  else {
    return wireless_diagnostics::google::protobuf::DescriptorPool::FindExtensionByNumber( *((wireless_diagnostics::google::protobuf::internal::Mutex ***)this + 6),  *((const wireless_diagnostics::google::protobuf::Descriptor **)this + 1),  a2);
  }
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

uint64_t std::__introsort<std::_ClassicAlgPolicy,wireless_diagnostics::google::protobuf::internal::anonymous namespace'::FieldNumberSorter &,wireless_diagnostics::google::protobuf::FieldDescriptor const**,false>( uint64_t result, uint64_t *a2, uint64_t a3, char a4)
{
  uint64_t v7 = (uint64_t *)result;
LABEL_2:
  uint64_t v8 = v7;
  while (2)
  {
    uint64_t v7 = v8;
    uint64_t v9 = (char *)a2 - (char *)v8;
    unint64_t v10 = a2 - v8;
    switch(v10)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        uint64_t v38 = *(a2 - 1);
        uint64_t v39 = *v8;
        if (*(_DWORD *)(v38 + 40) < *(_DWORD *)(*v8 + 40))
        {
          *uint64_t v8 = v38;
          *(a2 - 1) = v39;
        }

        return result;
      case 3uLL:
      case 4uLL:
      case 5uLL:
        uint64_t v40 = v8 + 1;
        uint64_t v41 = v8 + 2;
        uint64_t v42 = v8 + 3;
        uint64_t v43 = *(a2 - 1);
        uint64_t v44 = v8[3];
        if (*(_DWORD *)(v43 + 40) < *(_DWORD *)(v44 + 40))
        {
          uint64_t *v42 = v43;
          *(a2 - 1) = v44;
          uint64_t v45 = *v42;
          uint64_t v46 = *v41;
          int v47 = *(_DWORD *)(*v42 + 40);
          if (v47 < *(_DWORD *)(*v41 + 40))
          {
            uint64_t *v41 = v45;
            uint64_t *v42 = v46;
            uint64_t v48 = *v40;
            if (v47 < *(_DWORD *)(*v40 + 40))
            {
              v8[1] = v45;
              v8[2] = v48;
              uint64_t v49 = *v8;
              if (v47 < *(_DWORD *)(*v8 + 40))
              {
                *uint64_t v8 = v45;
                v8[1] = v49;
              }
            }
          }
        }

        return result;
      default:
        if (v9 <= 191)
        {
          uint64_t v50 = v8 + 1;
          BOOL v52 = v8 == a2 || v50 == a2;
          if ((a4 & 1) != 0)
          {
            if (!v52)
            {
              uint64_t v53 = 0LL;
              v54 = v8;
              do
              {
                uint64_t v56 = *v54;
                uint64_t v55 = v54[1];
                v54 = v50;
                int v57 = *(_DWORD *)(v55 + 40);
                if (v57 < *(_DWORD *)(v56 + 40))
                {
                  uint64_t v58 = v53;
                  while (1)
                  {
                    *(uint64_t *)((char *)v8 + v58 + 8) = v56;
                    if (!v58) {
                      break;
                    }
                    uint64_t v56 = *(uint64_t *)((char *)v8 + v58 - 8);
                    v58 -= 8LL;
                    if (v57 >= *(_DWORD *)(v56 + 40))
                    {
                      uint64_t v59 = (uint64_t *)((char *)v8 + v58 + 8);
                      goto LABEL_80;
                    }
                  }

                  uint64_t v59 = v8;
LABEL_80:
                  *uint64_t v59 = v55;
                }

                uint64_t v50 = v54 + 1;
                v53 += 8LL;
              }

              while (v54 + 1 != a2);
            }
          }

          else if (!v52)
          {
            do
            {
              uint64_t v90 = *v7;
              uint64_t v89 = v7[1];
              uint64_t v7 = v50;
              int v91 = *(_DWORD *)(v89 + 40);
              if (v91 < *(_DWORD *)(v90 + 40))
              {
                do
                {
                  uint64_t *v50 = v90;
                  uint64_t v90 = *(v50 - 2);
                  --v50;
                }

                while (v91 < *(_DWORD *)(v90 + 40));
                uint64_t *v50 = v89;
              }

              uint64_t v50 = v7 + 1;
            }

            while (v7 + 1 != a2);
          }

          return result;
        }

        if (!a3)
        {
          if (v8 != a2)
          {
            int64_t v60 = (v10 - 2) >> 1;
            int64_t v61 = v60;
            do
            {
              int64_t v62 = v61;
              if (v60 >= v61)
              {
                uint64_t v63 = (2 * v61) | 1;
                v64 = &v8[v63];
                uint64_t v65 = *v64;
                if (2 * v62 + 2 < (uint64_t)v10)
                {
                  uint64_t result = *(unsigned int *)(v65 + 40);
                  if ((int)result < *(_DWORD *)(v64[1] + 40))
                  {
                    uint64_t v65 = v64[1];
                    ++v64;
                    uint64_t v63 = 2 * v62 + 2;
                  }
                }

                std::string v66 = &v8[v62];
                uint64_t v67 = *v66;
                int v68 = *(_DWORD *)(*v66 + 40);
                if (*(_DWORD *)(v65 + 40) >= v68)
                {
                  do
                  {
                    v69 = v64;
                    *std::string v66 = v65;
                    if (v60 < v63) {
                      break;
                    }
                    uint64_t result = (2 * v63) | 1;
                    v64 = &v8[result];
                    uint64_t v70 = 2 * v63 + 2;
                    uint64_t v65 = *v64;
                    if (v70 < (uint64_t)v10 && *(_DWORD *)(v65 + 40) < *(_DWORD *)(v64[1] + 40))
                    {
                      uint64_t v65 = v64[1];
                      ++v64;
                      uint64_t result = v70;
                    }

                    std::string v66 = v69;
                    uint64_t v63 = result;
                  }

                  while (*(_DWORD *)(v65 + 40) >= v68);
                  uint64_t *v69 = v67;
                }
              }

              int64_t v61 = v62 - 1;
            }

            while (v62);
            uint64_t v71 = (unint64_t)v9 >> 3;
            do
            {
              uint64_t v72 = 0LL;
              uint64_t v73 = *v8;
              v74 = v8;
              do
              {
                v75 = &v74[v72];
                uint64_t v78 = v75[1];
                v76 = v75 + 1;
                uint64_t v77 = v78;
                uint64_t v79 = (2 * v72) | 1;
                uint64_t v80 = 2 * v72 + 2;
                if (v80 < v71)
                {
                  uint64_t result = *(unsigned int *)(v77 + 40);
                  if ((int)result < *(_DWORD *)(v76[1] + 40))
                  {
                    uint64_t v77 = v76[1];
                    ++v76;
                    uint64_t v79 = v80;
                  }
                }

                uint64_t *v74 = v77;
                v74 = v76;
                uint64_t v72 = v79;
              }

              while (v79 <= (uint64_t)((unint64_t)(v71 - 2) >> 1));
              if (v76 == --a2)
              {
                uint64_t *v76 = v73;
              }

              else
              {
                uint64_t *v76 = *a2;
                *a2 = v73;
                uint64_t v81 = (char *)v76 - (char *)v8 + 8;
                if (v81 >= 9)
                {
                  unint64_t v82 = (((unint64_t)v81 >> 3) - 2) >> 1;
                  v83 = &v8[v82];
                  uint64_t v84 = *v83;
                  uint64_t v85 = *v76;
                  int v86 = *(_DWORD *)(*v76 + 40);
                  if (*(_DWORD *)(*v83 + 40) < v86)
                  {
                    do
                    {
                      v87 = v83;
                      uint64_t *v76 = v84;
                      if (!v82) {
                        break;
                      }
                      unint64_t v82 = (v82 - 1) >> 1;
                      v83 = &v8[v82];
                      uint64_t v84 = *v83;
                      v76 = v87;
                    }

                    while (*(_DWORD *)(*v83 + 40) < v86);
                    uint64_t *v87 = v85;
                  }
                }
              }
            }

            while (v71-- > 2);
          }

          return result;
        }

        unint64_t v11 = v10 >> 1;
        uint64_t v12 = &v8[v10 >> 1];
        if ((unint64_t)v9 < 0x401)
        {
        }

        else
        {
          uint64_t v13 = *v7;
          *uint64_t v7 = *v12;
          *uint64_t v12 = v13;
        }

        --a3;
        uint64_t v14 = *v7;
        if ((a4 & 1) == 0)
        {
          int v15 = *(_DWORD *)(v14 + 40);
          if (*(_DWORD *)(*(v7 - 1) + 40) < v15) {
            goto LABEL_12;
          }
          if (v15 >= *(_DWORD *)(*(a2 - 1) + 40))
          {
            uint64_t v30 = v7 + 1;
            do
            {
              uint64_t v8 = v30;
              if (v30 >= a2) {
                break;
              }
              ++v30;
            }

            while (v15 >= *(_DWORD *)(*v8 + 40));
          }

          else
          {
            uint64_t v8 = v7;
            do
            {
              uint64_t v29 = v8[1];
              ++v8;
            }

            while (v15 >= *(_DWORD *)(v29 + 40));
          }

          uint64_t v31 = a2;
          if (v8 < a2)
          {
            uint64_t v31 = a2;
            do
              uint64_t v32 = *--v31;
            while (v15 < *(_DWORD *)(v32 + 40));
          }

          if (v8 < v31)
          {
            uint64_t v33 = *v8;
            uint64_t v34 = *v31;
            do
            {
              *uint64_t v8 = v34;
              *uint64_t v31 = v33;
              do
              {
                uint64_t v35 = v8[1];
                ++v8;
                uint64_t v33 = v35;
              }

              while (v15 >= *(_DWORD *)(v35 + 40));
              do
              {
                uint64_t v36 = *--v31;
                uint64_t v34 = v36;
              }

              while (v15 < *(_DWORD *)(v36 + 40));
            }

            while (v8 < v31);
          }

          uint64_t v37 = v8 - 1;
          if (v8 - 1 != v7) {
            *uint64_t v7 = *v37;
          }
          a4 = 0;
          *uint64_t v37 = v14;
          continue;
        }

        int v15 = *(_DWORD *)(v14 + 40);
LABEL_12:
        uint64_t v16 = 0LL;
        do
          uint64_t v17 = v7[++v16];
        while (*(_DWORD *)(v17 + 40) < v15);
        int v18 = &v7[v16];
        int v19 = a2;
        if (v16 == 1)
        {
          int v19 = a2;
          do
          {
            if (v18 >= v19) {
              break;
            }
            uint64_t v21 = *--v19;
          }

          while (*(_DWORD *)(v21 + 40) >= v15);
        }

        else
        {
          do
            uint64_t v20 = *--v19;
          while (*(_DWORD *)(v20 + 40) >= v15);
        }

        if (v18 >= v19)
        {
          int v27 = v18 - 1;
        }

        else
        {
          uint64_t v22 = *v19;
          uint64_t v23 = &v7[v16];
          uint64_t v24 = v19;
          do
          {
            *uint64_t v23 = v22;
            *uint64_t v24 = v17;
            do
            {
              uint64_t v25 = v23[1];
              ++v23;
              uint64_t v17 = v25;
            }

            while (*(_DWORD *)(v25 + 40) < v15);
            do
            {
              uint64_t v26 = *--v24;
              uint64_t v22 = v26;
            }

            while (*(_DWORD *)(v26 + 40) >= v15);
          }

          while (v23 < v24);
          int v27 = v23 - 1;
        }

        if (v27 != v7) {
          *uint64_t v7 = *v27;
        }
        uint64_t *v27 = v14;
        if (v18 < v19)
        {
LABEL_33:
          a4 = 0;
          uint64_t v8 = v27 + 1;
          continue;
        }

        uint64_t v8 = v27 + 1;
        if (!(_DWORD)result)
        {
          if (v28) {
            continue;
          }
          goto LABEL_33;
        }

        a2 = v27;
        if (!v28) {
          goto LABEL_2;
        }
        return result;
    }
  }

uint64_t *std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,wireless_diagnostics::google::protobuf::internal::anonymous namespace'::FieldNumberSorter &,wireless_diagnostics::google::protobuf::FieldDescriptor const**>( uint64_t *result, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *result;
  int v5 = *(_DWORD *)(*a2 + 40);
  int v6 = *(_DWORD *)(*result + 40);
  uint64_t v7 = *a3;
  int v8 = *(_DWORD *)(*a3 + 40);
  if (v5 >= v6)
  {
    if (v8 < v5)
    {
      *a2 = v7;
      *a3 = v3;
      uint64_t v9 = *result;
      if (*(_DWORD *)(*a2 + 40) < *(_DWORD *)(*result + 40))
      {
        uint64_t *result = *a2;
        *a2 = v9;
      }
    }
  }

  else
  {
    if (v8 >= v5)
    {
      uint64_t *result = v3;
      *a2 = v4;
      if (*(_DWORD *)(*a3 + 40) >= v6) {
        return result;
      }
      *a2 = *a3;
    }

    else
    {
      uint64_t *result = v7;
    }

    *a3 = v4;
  }

  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,wireless_diagnostics::google::protobuf::internal::anonymous namespace'::FieldNumberSorter &,wireless_diagnostics::google::protobuf::FieldDescriptor const**>( uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = a2 - a1;
  BOOL result = 1LL;
  switch(v4)
  {
    case 0LL:
    case 1LL:
      return result;
    case 2LL:
      uint64_t v6 = *(a2 - 1);
      uint64_t v7 = *a1;
      if (*(_DWORD *)(v6 + 40) < *(_DWORD *)(*a1 + 40))
      {
        *a1 = v6;
        *(a2 - 1) = v7;
      }

      return result;
    case 3LL:
      return 1LL;
    case 4LL:
      return 1LL;
    case 5LL:
      int v18 = a1 + 1;
      int v19 = a1 + 2;
      uint64_t v20 = a1 + 3;
      uint64_t v21 = *(a2 - 1);
      uint64_t v22 = a1[3];
      if (*(_DWORD *)(v21 + 40) < *(_DWORD *)(v22 + 40))
      {
        *uint64_t v20 = v21;
        *(a2 - 1) = v22;
        uint64_t v23 = *v20;
        uint64_t v24 = *v19;
        int v25 = *(_DWORD *)(*v20 + 40);
        if (v25 < *(_DWORD *)(*v19 + 40))
        {
          uint64_t *v19 = v23;
          *uint64_t v20 = v24;
          uint64_t v26 = *v18;
          if (v25 < *(_DWORD *)(*v18 + 40))
          {
            a1[1] = v23;
            a1[2] = v26;
            uint64_t v27 = *a1;
            if (v25 < *(_DWORD *)(*a1 + 40))
            {
              *a1 = v23;
              a1[1] = v27;
            }
          }
        }
      }

      return 1LL;
    default:
      int v8 = a1 + 2;
      uint64_t v9 = a1 + 3;
      if (a1 + 3 == a2) {
        return 1LL;
      }
      int v10 = 0;
      uint64_t v11 = 24LL;
      break;
  }

  while (1)
  {
    uint64_t v12 = *v9;
    uint64_t v13 = *v8;
    int v14 = *(_DWORD *)(*v9 + 40);
    if (v14 < *(_DWORD *)(*v8 + 40))
    {
      uint64_t v15 = v11;
      while (1)
      {
        *(uint64_t *)((char *)a1 + v15) = v13;
        uint64_t v16 = v15 - 8;
        if (v15 == 8) {
          break;
        }
        uint64_t v13 = *(uint64_t *)((char *)a1 + v15 - 16);
        v15 -= 8LL;
        if (v14 >= *(_DWORD *)(v13 + 40))
        {
          uint64_t v17 = (uint64_t *)((char *)a1 + v16);
          goto LABEL_13;
        }
      }

      uint64_t v17 = a1;
LABEL_13:
      *uint64_t v17 = v12;
      if (++v10 == 8) {
        return v9 + 1 == a2;
      }
    }

    int v8 = v9;
    v11 += 8LL;
    if (++v9 == a2) {
      return 1LL;
    }
  }

uint64_t *std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,wireless_diagnostics::google::protobuf::internal::anonymous namespace'::FieldNumberSorter &,wireless_diagnostics::google::protobuf::FieldDescriptor const**>( uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v9 = *a3;
  if (*(_DWORD *)(*a4 + 40) < *(_DWORD *)(*a3 + 40))
  {
    *a3 = *a4;
    *a4 = v9;
    uint64_t v10 = *a2;
    if (*(_DWORD *)(*a3 + 40) < *(_DWORD *)(*a2 + 40))
    {
      *a2 = *a3;
      *a3 = v10;
      uint64_t v11 = *a1;
      if (*(_DWORD *)(*a2 + 40) < *(_DWORD *)(*a1 + 40))
      {
        *a1 = *a2;
        *a2 = v11;
      }
    }
  }

  return result;
}

void wireless_diagnostics::google::protobuf::RepeatedField<int>::Reserve(uint64_t a1, int a2)
{
  int v2 = *(_DWORD *)(a1 + 12);
  if (v2 < a2)
  {
    uint64_t v4 = *(void **)a1;
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
    uint64_t v4 = *(void **)a1;
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
    uint64_t v4 = *(void **)a1;
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

double wireless_diagnostics::google::protobuf::DescriptorPool::Tables::Tables( wireless_diagnostics::google::protobuf::DescriptorPool::Tables *this)
{
  *((void *)this + 6) = 0LL;
  double result = 0.0;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)this = 0u;
  *((_DWORD *)this + 14) = 1065353216;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_DWORD *)this + 24) = 1065353216;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 184) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *((_DWORD *)this + 58) = 1065353216;
  *((_OWORD *)this + 15) = 0u;
  *((_OWORD *)this + 16) = 0u;
  *((_DWORD *)this + 68) = 1065353216;
  *((void *)this + 36) = 0LL;
  *((void *)this + 37) = 0LL;
  *((void *)this + 35) = (char *)this + 288;
  *((_OWORD *)this + 23) = 0u;
  *((_OWORD *)this + 24) = 0u;
  *((_OWORD *)this + 21) = 0u;
  *((_OWORD *)this + 22) = 0u;
  *((_OWORD *)this + 19) = 0u;
  *((_OWORD *)this + 20) = 0u;
  return result;
}

{
  double result;
  *((void *)this + 6) = 0LL;
  double result = 0.0;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)this = 0u;
  *((_DWORD *)this + 14) = 1065353216;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_DWORD *)this + 24) = 1065353216;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 184) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *((_DWORD *)this + 58) = 1065353216;
  *((_OWORD *)this + 15) = 0u;
  *((_OWORD *)this + 16) = 0u;
  *((_DWORD *)this + 68) = 1065353216;
  *((void *)this + 36) = 0LL;
  *((void *)this + 37) = 0LL;
  *((void *)this + 35) = (char *)this + 288;
  *((_OWORD *)this + 23) = 0u;
  *((_OWORD *)this + 24) = 0u;
  *((_OWORD *)this + 21) = 0u;
  *((_OWORD *)this + 22) = 0u;
  *((_OWORD *)this + 19) = 0u;
  *((_OWORD *)this + 20) = 0u;
  return result;
}

void wireless_diagnostics::google::protobuf::DescriptorPool::Tables::~Tables( wireless_diagnostics::google::protobuf::DescriptorPool::Tables *this)
{
  int v2 = (uint64_t *)*((void *)this + 16);
  uint64_t v3 = (uint64_t *)*((void *)this + 17);
  if (v2 != v3)
  {
    do
    {
      uint64_t v5 = *v2++;
      uint64_t v4 = v5;
      if (v5) {
        (*(void (**)(uint64_t))(*(void *)v4 + 8LL))(v4);
      }
    }

    while (v2 != v3);
    int v2 = (uint64_t *)*((void *)this + 16);
  }

  *((void *)this + 17) = v2;
  uint64_t v6 = *((void *)this + 22);
  if (*((void *)this + 23) != v6)
  {
    unint64_t v7 = 0LL;
    do
    {
      operator delete(*(void **)(v6 + 8 * v7++));
      uint64_t v6 = *((void *)this + 22);
    }

    while (v7 < (*((void *)this + 23) - v6) >> 3);
  }

  wireless_diagnostics::google::protobuf::STLDeleteContainerPointers<std::__wrap_iter<std::string **>>( *((uint64_t **)this + 13),  *((uint64_t **)this + 14));
  *((void *)this + 14) = *((void *)this + 13);
  wireless_diagnostics::google::protobuf::STLDeleteContainerPointers<std::__wrap_iter<wireless_diagnostics::google::protobuf::FileDescriptorTables **>>( *((wireless_diagnostics::google::protobuf::FileDescriptorTables ***)this + 19),  *((wireless_diagnostics::google::protobuf::FileDescriptorTables ***)this + 20));
  *((void *)this + 20) = *((void *)this + 19);
  int v8 = (void *)*((void *)this + 47);
  if (v8)
  {
    *((void *)this + MEMORY[0x1895B3490](v1 - 48) = v8;
    operator delete(v8);
  }

  uint64_t v9 = (void *)*((void *)this + 44);
  if (v9)
  {
    *((void *)this + 45) = v9;
    operator delete(v9);
  }

  uint64_t v10 = (void *)*((void *)this + 41);
  if (v10)
  {
    *((void *)this + 42) = v10;
    operator delete(v10);
  }

  uint64_t v11 = (void *)*((void *)this + 38);
  if (v11)
  {
    *((void *)this + 39) = v11;
    operator delete(v11);
  }

  std::__tree<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::__map_value_compare<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::less<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>,true>,std::allocator<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>>>::destroy( (uint64_t)this + 280,  *((void **)this + 36));
  std::__hash_table<wireless_diagnostics::google::protobuf::Descriptor const*,wireless_diagnostics::google::protobuf::hash<wireless_diagnostics::google::protobuf::Descriptor const*>,std::equal_to<wireless_diagnostics::google::protobuf::Descriptor const*>,std::allocator<wireless_diagnostics::google::protobuf::Descriptor const*>>::~__hash_table((uint64_t)this + 240);
  uint64_t v12 = (void *)*((void *)this + 27);
  if (v12)
  {
    do
    {
      uint64_t v13 = (void *)*v12;
      operator delete(v12);
      uint64_t v12 = v13;
    }

    while (v13);
  }

  int v14 = (void *)*((void *)this + 25);
  *((void *)this + 25) = 0LL;
  if (v14) {
    operator delete(v14);
  }
  uint64_t v15 = (void *)*((void *)this + 22);
  if (v15)
  {
    *((void *)this + 23) = v15;
    operator delete(v15);
  }

  uint64_t v16 = (void *)*((void *)this + 19);
  if (v16)
  {
    *((void *)this + 20) = v16;
    operator delete(v16);
  }

  uint64_t v17 = (void *)*((void *)this + 16);
  if (v17)
  {
    *((void *)this + 17) = v17;
    operator delete(v17);
  }

  int v18 = (void *)*((void *)this + 13);
  if (v18)
  {
    *((void *)this + 14) = v18;
    operator delete(v18);
  }

  std::__hash_table<wireless_diagnostics::google::protobuf::Descriptor const*,wireless_diagnostics::google::protobuf::hash<wireless_diagnostics::google::protobuf::Descriptor const*>,std::equal_to<wireless_diagnostics::google::protobuf::Descriptor const*>,std::allocator<wireless_diagnostics::google::protobuf::Descriptor const*>>::~__hash_table((uint64_t)this + 64);
  std::__hash_table<std::string,wireless_diagnostics::google::protobuf::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)this + 24);
  int v19 = (void **)this;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v19);
}

double wireless_diagnostics::google::protobuf::FileDescriptorTables::FileDescriptorTables( wireless_diagnostics::google::protobuf::FileDescriptorTables *this)
{
  double result = 0.0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_DWORD *)this + 8) = 1065353216;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *((_DWORD *)this + 18) = 1065353216;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_DWORD *)this + 28) = 1065353216;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *((_DWORD *)this + 38) = 1065353216;
  *((_OWORD *)this + 10) = 0u;
  *((_OWORD *)this + 11) = 0u;
  *((_DWORD *)this + MEMORY[0x1895B3490](v1 - 48) = 1065353216;
  return result;
}

{
  double result;
  double result = 0.0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_DWORD *)this + 8) = 1065353216;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *((_DWORD *)this + 18) = 1065353216;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_DWORD *)this + 28) = 1065353216;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *((_DWORD *)this + 38) = 1065353216;
  *((_OWORD *)this + 10) = 0u;
  *((_OWORD *)this + 11) = 0u;
  *((_DWORD *)this + MEMORY[0x1895B3490](v1 - 48) = 1065353216;
  return result;
}

void wireless_diagnostics::google::protobuf::FileDescriptorTables::~FileDescriptorTables( wireless_diagnostics::google::protobuf::FileDescriptorTables *this)
{
  int v2 = (void *)*((void *)this + 22);
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)*v2;
      operator delete(v2);
      int v2 = v3;
    }

    while (v3);
  }

  uint64_t v4 = (void *)*((void *)this + 20);
  *((void *)this + 20) = 0LL;
  if (v4) {
    operator delete(v4);
  }
  uint64_t v5 = (void *)*((void *)this + 17);
  if (v5)
  {
    do
    {
      uint64_t v6 = (void *)*v5;
      operator delete(v5);
      uint64_t v5 = v6;
    }

    while (v6);
  }

  unint64_t v7 = (void *)*((void *)this + 15);
  *((void *)this + 15) = 0LL;
  if (v7) {
    operator delete(v7);
  }
  int v8 = (void *)*((void *)this + 12);
  if (v8)
  {
    do
    {
      uint64_t v9 = (void *)*v8;
      operator delete(v8);
      int v8 = v9;
    }

    while (v9);
  }

  uint64_t v10 = (void *)*((void *)this + 10);
  *((void *)this + 10) = 0LL;
  if (v10) {
    operator delete(v10);
  }
  uint64_t v11 = (void *)*((void *)this + 7);
  if (v11)
  {
    do
    {
      uint64_t v12 = (void *)*v11;
      operator delete(v11);
      uint64_t v11 = v12;
    }

    while (v12);
  }

  uint64_t v13 = (void *)*((void *)this + 5);
  *((void *)this + 5) = 0LL;
  if (v13) {
    operator delete(v13);
  }
  int v14 = (void *)*((void *)this + 2);
  if (v14)
  {
    do
    {
      uint64_t v15 = (void *)*v14;
      operator delete(v14);
      int v14 = v15;
    }

    while (v15);
  }

  uint64_t v16 = *(void **)this;
  *(void *)this = 0LL;
  if (v16) {
    operator delete(v16);
  }
}

void wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AddCheckpoint( wireless_diagnostics::google::protobuf::DescriptorPool::Tables *this)
{
  uint64_t v3 = (_OWORD *)*((void *)this + 39);
  unint64_t v2 = *((void *)this + 40);
  if ((unint64_t)v3 >= v2)
  {
    uint64_t v6 = *((void *)this + 38);
    uint64_t v7 = 0x6DB6DB6DB6DB6DB7LL * (((uint64_t)v3 - v6) >> 2);
    unint64_t v8 = v7 + 1;
    unint64_t v9 = 0x6DB6DB6DB6DB6DB7LL * ((uint64_t)(v2 - v6) >> 2);
    if (2 * v9 > v8) {
      unint64_t v8 = 2 * v9;
    }
    if (v9 >= 0x492492492492492LL) {
      unint64_t v10 = 0x924924924924924LL;
    }
    else {
      unint64_t v10 = v8;
    }
    if (v10) {
      uint64_t v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<wireless_diagnostics::google::protobuf::DescriptorPool::Tables::CheckPoint>>( (uint64_t)this + 320,  v10);
    }
    else {
      uint64_t v11 = 0LL;
    }
    uint64_t v12 = &v11[28 * v7];
    uint64_t v13 = &v11[28 * v10];
    __int128 v14 = *(_OWORD *)v18;
    *(_OWORD *)(v12 + 12) = *(_OWORD *)&v18[12];
    *(_OWORD *)uint64_t v12 = v14;
    uint64_t v5 = v12 + 28;
    uint64_t v16 = (char *)*((void *)this + 38);
    uint64_t v15 = (char *)*((void *)this + 39);
    if (v15 != v16)
    {
      do
      {
        __int128 v17 = *(_OWORD *)(v15 - 28);
        *((_OWORD *)v12 - 1) = *((_OWORD *)v15 - 1);
        *(_OWORD *)(v12 - 28) = v17;
        v12 -= 28;
        v15 -= 28;
      }

      while (v15 != v16);
      uint64_t v15 = (char *)*((void *)this + 38);
    }

    *((void *)this + 38) = v12;
    *((void *)this + 39) = v5;
    *((void *)this + 40) = v13;
    if (v15) {
      operator delete(v15);
    }
  }

  else
  {
    __int128 v4 = *(_OWORD *)v18;
    *(_OWORD *)((char *)v3 + 12) = *(_OWORD *)&v18[12];
    *uint64_t v3 = v4;
    uint64_t v5 = (char *)v3 + 28;
  }

  *((void *)this + 39) = v5;
}

void *wireless_diagnostics::google::protobuf::DescriptorPool::Tables::ClearLastCheckpoint(void *this)
{
  uint64_t v1 = this[38];
  uint64_t v2 = this[39] - 28LL;
  this[39] = v2;
  if (v1 == v2)
  {
    this[42] = this[41];
    this[45] = this[44];
    this[48] = this[47];
  }

  return this;
}

void wireless_diagnostics::google::protobuf::DescriptorPool::Tables::RollbackToLastCheckpoint( wireless_diagnostics::google::protobuf::DescriptorPool::Tables *this)
{
  uint64_t v39 = *((void *)this + 39);
  unint64_t v2 = *(int *)(v39 - 12);
  uint64_t v3 = *((void *)this + 41);
  uint64_t v4 = *((void *)this + 42);
  if (v2 >= (v4 - v3) >> 3) {
    goto LABEL_55;
  }
  uint64_t v37 = (char *)this + 216;
  do
  {
    uint64_t v5 = *(const char **)(v3 + 8 * v2);
    char v6 = *v5;
    if (*v5)
    {
      unint64_t v7 = 0LL;
      unint64_t v8 = (unsigned __int8 *)(v5 + 1);
      do
      {
        unint64_t v7 = 5 * v7 + v6;
        int v9 = *v8++;
        char v6 = v9;
      }

      while (v9);
    }

    else
    {
      unint64_t v7 = 0LL;
    }

    int8x8_t v10 = *(int8x8_t *)((char *)this + 208);
    if (!*(void *)&v10) {
      goto LABEL_54;
    }
    uint8x8_t v11 = (uint8x8_t)vcnt_s8(v10);
    v11.i16[0] = vaddlv_u8(v11);
    unint64_t v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v13 = v7;
      if (v7 >= *(void *)&v10) {
        unint64_t v13 = v7 % *(void *)&v10;
      }
    }

    else
    {
      unint64_t v13 = (*(void *)&v10 - 1LL) & v7;
    }

    __int128 v14 = *(void ***)(*((void *)this + 25) + 8 * v13);
    if (!v14) {
      goto LABEL_54;
    }
    uint64_t v15 = (char *)*v14;
    if (!*v14) {
      goto LABEL_54;
    }
    uint64_t v38 = *((void *)this + 25);
    uint64_t v40 = *(void *)&v10 - 1LL;
    while (1)
    {
      unint64_t v16 = *((void *)v15 + 1);
      if (v16 == v7) {
        break;
      }
      if (v12 > 1)
      {
        if (v16 >= *(void *)&v10) {
          v16 %= *(void *)&v10;
        }
      }

      else
      {
        v16 &= v40;
      }

      if (v16 != v13) {
        goto LABEL_54;
      }
LABEL_24:
      uint64_t v15 = *(char **)v15;
      if (!v15) {
        goto LABEL_54;
      }
    }

    if (v12 > 1)
    {
      uint64_t v17 = v38;
      if (v7 >= *(void *)&v10) {
        v7 %= *(void *)&v10;
      }
    }

    else
    {
      v7 &= v40;
      uint64_t v17 = v38;
    }

    int v18 = *(char **)v15;
    int v19 = *(char **)(v17 + 8 * v7);
    do
    {
      uint64_t v20 = v19;
      int v19 = *(char **)v19;
    }

    while (v19 != v15);
    if (v20 == v37) {
      goto LABEL_43;
    }
    unint64_t v21 = *((void *)v20 + 1);
    if (v12 > 1)
    {
      if (v21 >= *(void *)&v10) {
        v21 %= *(void *)&v10;
      }
    }

    else
    {
      v21 &= v40;
    }

    if (v21 == v7)
    {
LABEL_45:
      if (v18)
      {
        unint64_t v22 = *((void *)v18 + 1);
        goto LABEL_47;
      }
    }

    else
    {
LABEL_43:
      if (!v18) {
        goto LABEL_44;
      }
      unint64_t v22 = *((void *)v18 + 1);
      if (v12 > 1)
      {
        unint64_t v23 = *((void *)v18 + 1);
        if (v22 >= *(void *)&v10) {
          unint64_t v23 = v22 % *(void *)&v10;
        }
      }

      else
      {
        unint64_t v23 = v22 & v40;
      }

      if (v23 != v7)
      {
LABEL_44:
        *(void *)(v17 + 8 * v7) = 0LL;
        int v18 = *(char **)v15;
        goto LABEL_45;
      }

LABEL_47:
      if (v12 > 1)
      {
        if (v22 >= *(void *)&v10) {
          v22 %= *(void *)&v10;
        }
      }

      else
      {
        v22 &= v40;
      }

      if (v22 != v7)
      {
        *(void *)(*((void *)this + 25) + 8 * v22) = v20;
        int v18 = *(char **)v15;
      }
    }

    *(void *)uint64_t v20 = v18;
    *(void *)uint64_t v15 = 0LL;
    --*((void *)this + 28);
    operator delete(v15);
    uint64_t v3 = *((void *)this + 41);
    uint64_t v4 = *((void *)this + 42);
LABEL_54:
    ++v2;
  }

  while (v2 < (v4 - v3) >> 3);
LABEL_55:
  unint64_t v24 = *(int *)(v39 - 8);
  uint64_t v25 = *((void *)this + 44);
  if (v24 < (*((void *)this + 45) - v25) >> 3)
  {
    uint64_t v26 = 8 * v24;
    do
    {
      std::__hash_table<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::hash<char const*>,wireless_diagnostics::google::protobuf::streq,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::streq,wireless_diagnostics::google::protobuf::hash<char const*>,true>,std::allocator<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>>>::__erase_unique<char const*>( (void *)this + 30,  (const char **)(v25 + v26));
      ++v24;
      uint64_t v25 = *((void *)this + 44);
      v26 += 8LL;
    }

    while (v24 < (*((void *)this + 45) - v25) >> 3);
  }

  unint64_t v27 = *(int *)(v39 - 4);
  uint64_t v28 = *((void *)this + 47);
  if (v27 < (*((void *)this + 48) - v28) >> 4)
  {
    uint64_t v29 = 16 * v27;
    do
    {
      std::__tree<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::__map_value_compare<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::less<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>,true>,std::allocator<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>>>::__erase_unique<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>( (uint64_t **)this + 35,  (unint64_t *)(v28 + v29));
      ++v27;
      uint64_t v28 = *((void *)this + 47);
      v29 += 16LL;
    }

    while (v27 < (*((void *)this + 48) - v28) >> 4);
  }

  std::vector<char const*>::resize((uint64_t)this + 328, *(int *)(v39 - 12));
  std::vector<char const*>::resize((uint64_t)this + 352, *(int *)(v39 - 8));
  std::vector<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>::resize( (uint64_t)this + 376,  *(int *)(v39 - 4));
  wireless_diagnostics::google::protobuf::STLDeleteContainerPointers<std::__wrap_iter<std::string **>>( (uint64_t *)(*((void *)this + 13) + 8LL * *(int *)(v39 - 28)),  *((uint64_t **)this + 14));
  uint64_t v30 = (uint64_t *)(*((void *)this + 16) + 8LL * *(int *)(v39 - 24));
  uint64_t v31 = (uint64_t *)*((void *)this + 17);
  while (v30 != v31)
  {
    uint64_t v33 = *v30++;
    uint64_t v32 = v33;
    if (v33) {
      (*(void (**)(uint64_t))(*(void *)v32 + 8LL))(v32);
    }
  }

  wireless_diagnostics::google::protobuf::STLDeleteContainerPointers<std::__wrap_iter<wireless_diagnostics::google::protobuf::FileDescriptorTables **>>( (wireless_diagnostics::google::protobuf::FileDescriptorTables **)(*((void *)this + 19) + 8LL * *(int *)(v39 - 20)),  *((wireless_diagnostics::google::protobuf::FileDescriptorTables ***)this + 20));
  unint64_t v34 = *(int *)(v39 - 16);
  uint64_t v35 = *((void *)this + 22);
  for (uint64_t i = *((void *)this + 23); v34 < (i - v35) >> 3; uint64_t i = *((void *)this + 23))
  {
    operator delete(*(void **)(v35 + 8 * v34++));
    uint64_t v35 = *((void *)this + 22);
  }

  std::vector<char const*>::resize((uint64_t)this + 104, *(int *)(v39 - 28));
  std::vector<char const*>::resize((uint64_t)this + 128, *(int *)(v39 - 24));
  std::vector<char const*>::resize((uint64_t)this + 152, *(int *)(v39 - 20));
  std::vector<char const*>::resize((uint64_t)this + 176, *(int *)(v39 - 16));
  *((void *)this + 39) -= 28LL;
}

void std::vector<char const*>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 8 * a2;
    }
  }

  else
  {
    std::vector<char const*>::__append((void **)a1, a2 - v2);
  }

void std::vector<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>::resize( uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 4;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 16 * a2;
    }
  }

  else
  {
    std::vector<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>::__append( (void **)a1,  a2 - v2);
  }

void wireless_diagnostics::google::protobuf::STLDeleteContainerPointers<std::__wrap_iter<std::string **>>( uint64_t *a1, uint64_t *a2)
{
  if (a1 != a2)
  {
    uint64_t v3 = a1;
    do
    {
      uint64_t v5 = *v3++;
      uint64_t v4 = v5;
      if (v5)
      {
        operator delete((void *)v4);
      }
    }

    while (v3 != a2);
  }

void wireless_diagnostics::google::protobuf::STLDeleteContainerPointers<std::__wrap_iter<wireless_diagnostics::google::protobuf::FileDescriptorTables **>>( wireless_diagnostics::google::protobuf::FileDescriptorTables **a1, wireless_diagnostics::google::protobuf::FileDescriptorTables **a2)
{
  if (a1 != a2)
  {
    uint64_t v3 = a1;
    do
    {
      uint64_t v5 = *v3++;
      uint64_t v4 = v5;
      if (v5)
      {
        wireless_diagnostics::google::protobuf::FileDescriptorTables::~FileDescriptorTables(v4);
        operator delete(v6);
      }
    }

    while (v3 != a2);
  }

uint64_t wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AddFile(void *a1, uint64_t a2)
{
  uint64_t v4 = (uint64_t)(a1 + 30);
  uint64_t v5 = *(void **)a2;
  *(void *)&__int128 v24 = v5;
  *((void *)&v24 + 1) = a2;
  std::__hash_table<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::hash<char const*>,wireless_diagnostics::google::protobuf::streq,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::streq,wireless_diagnostics::google::protobuf::hash<char const*>,true>,std::allocator<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>>>::__emplace_unique_key_args<char const*,std::pair<char const* const,wireless_diagnostics::google::protobuf::FileDescriptor const*>>( v4,  (const char **)&v24,  &v24);
  char v7 = v6;
  if ((v6 & 1) != 0)
  {
    unint64_t v8 = *(void **)a2;
    int8x8_t v10 = (void *)a1[45];
    unint64_t v9 = a1[46];
    if ((unint64_t)v10 >= v9)
    {
      uint64_t v12 = a1[44];
      uint64_t v13 = ((uint64_t)v10 - v12) >> 3;
      uint64_t v14 = v9 - v12;
      uint64_t v15 = v14 >> 2;
      else {
        unint64_t v16 = v15;
      }
      if (v16) {
        uint64_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>( (uint64_t)(a1 + 46),  v16);
      }
      else {
        uint64_t v17 = 0LL;
      }
      int v18 = &v17[8 * v13];
      int v19 = &v17[8 * v16];
      *(void *)int v18 = v8;
      uint8x8_t v11 = v18 + 8;
      unint64_t v21 = (char *)a1[44];
      uint64_t v20 = (char *)a1[45];
      if (v20 != v21)
      {
        do
        {
          uint64_t v22 = *((void *)v20 - 1);
          v20 -= 8;
          *((void *)v18 - 1) = v22;
          v18 -= 8;
        }

        while (v20 != v21);
        uint64_t v20 = (char *)a1[44];
      }

      a1[44] = v18;
      a1[45] = v11;
      a1[46] = v19;
      if (v20) {
        operator delete(v20);
      }
    }

    else
    {
      *int8x8_t v10 = v8;
      uint8x8_t v11 = v10 + 1;
    }

    a1[45] = v11;
  }

  return v7 & 1;
}

void wireless_diagnostics::google::protobuf::FileDescriptorTables::AddFieldByStylizedNames( wireless_diagnostics::google::protobuf::FileDescriptorTables *this, const wireless_diagnostics::google::protobuf::FieldDescriptor *a2)
{
  int8x8_t v10 = a2;
  if (*((_BYTE *)a2 + 52))
  {
    uint64_t v4 = *((void *)a2 + 8);
    if (v4) {
      goto LABEL_6;
    }
    uint64_t v5 = (char *)a2 + 32;
  }

  else
  {
    uint64_t v5 = (char *)a2 + 56;
  }

  uint64_t v4 = *(void *)v5;
LABEL_6:
  uint64_t v6 = *((void *)a2 + 2);
  v9[0] = v4;
  v9[1] = v6;
  uint64_t v7 = *((void *)a2 + 3);
  v8[0] = v4;
  v8[1] = v7;
}

void wireless_diagnostics::google::protobuf::InsertIfNotPresent<wireless_diagnostics::google::protobuf::hash_map<std::pair<void const*,char const*>,wireless_diagnostics::google::protobuf::FieldDescriptor const*,wireless_diagnostics::google::protobuf::anonymous namespace'::PointerStringPairHash,wireless_diagnostics::google::protobuf::anonymous namespace'::PointerStringPairEqual>,std::pair<void const*,char const*>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>( float *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6 = *a2;
  uint64_t v5 = (const char *)a2[1];
  char v7 = *v5;
  if (*v5)
  {
    uint64_t v8 = 0LL;
    unint64_t v9 = (unsigned __int8 *)(v5 + 1);
    do
    {
      uint64_t v8 = 5 * v8 + v7;
      int v10 = *v9++;
      char v7 = v10;
    }

    while (v10);
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  uint64_t v11 = *a3;
  uint64_t v12 = v8 - v6;
  unint64_t v13 = v12 + (v6 << 16);
  unint64_t v14 = *((void *)a1 + 1);
  if (v14)
  {
    uint8x8_t v15 = (uint8x8_t)vcnt_s8((int8x8_t)v14);
    v15.i16[0] = vaddlv_u8(v15);
    unint64_t v16 = v15.u32[0];
    if (v15.u32[0] > 1uLL)
    {
      unint64_t v3 = v12 + (v6 << 16);
      if (v13 >= v14) {
        unint64_t v3 = v13 % v14;
      }
    }

    else
    {
      unint64_t v3 = (v14 - 1) & v13;
    }

    uint64_t v17 = *(uint64_t ****)(*(void *)a1 + 8 * v3);
    if (v17)
    {
      for (uint64_t i = *v17; i; uint64_t i = (uint64_t **)*i)
      {
        unint64_t v19 = (unint64_t)i[1];
        if (v19 == v13)
        {
        }

        else
        {
          if (v16 > 1)
          {
            if (v19 >= v14) {
              v19 %= v14;
            }
          }

          else
          {
            v19 &= v14 - 1;
          }

          if (v19 != v3) {
            break;
          }
        }
      }
    }
  }

  uint64_t v20 = operator new(0x28uLL);
  *uint64_t v20 = 0LL;
  v20[1] = v13;
  v20[2] = v6;
  v20[3] = v5;
  v20[4] = v11;
  float v21 = (float)(unint64_t)(*((void *)a1 + 3) + 1LL);
  float v22 = a1[8];
  if (!v14 || (float)(v22 * (float)v14) < v21)
  {
    BOOL v23 = (v14 & (v14 - 1)) == 0;
    if (v14 < 3) {
      BOOL v23 = 0;
    }
    unint64_t v24 = (2 * v14) | !v23;
    unint64_t v25 = vcvtps_u32_f32(v21 / v22);
    if (v24 <= v25) {
      int8x8_t prime = (int8x8_t)v25;
    }
    else {
      int8x8_t prime = (int8x8_t)v24;
    }
    if (*(void *)&prime == 1LL)
    {
      int8x8_t prime = (int8x8_t)2LL;
    }

    else if ((*(void *)&prime & (*(void *)&prime - 1LL)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v14 = *((void *)a1 + 1);
    }

    if (*(void *)&prime > v14) {
      goto LABEL_36;
    }
    if (*(void *)&prime < v14)
    {
      unint64_t v33 = vcvtps_u32_f32((float)*((unint64_t *)a1 + 3) / a1[8]);
      if (v14 < 3 || (uint8x8_t v34 = (uint8x8_t)vcnt_s8((int8x8_t)v14), v34.i16[0] = vaddlv_u8(v34), v34.u32[0] > 1uLL))
      {
        unint64_t v33 = std::__next_prime(v33);
      }

      else
      {
        uint64_t v35 = 1LL << -(char)__clz(v33 - 1);
        if (v33 >= 2) {
          unint64_t v33 = v35;
        }
      }

      if (*(void *)&prime <= v33) {
        int8x8_t prime = (int8x8_t)v33;
      }
      if (*(void *)&prime >= v14)
      {
        unint64_t v14 = *((void *)a1 + 1);
      }

      else
      {
        if (prime)
        {
LABEL_36:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          unint64_t v27 = operator new(8LL * *(void *)&prime);
          uint64_t v28 = *(void **)a1;
          *(void *)a1 = v27;
          if (v28) {
            operator delete(v28);
          }
          uint64_t v29 = 0LL;
          *((int8x8_t *)a1 + 1) = prime;
          do
            *(void *)(*(void *)a1 + 8 * v29++) = 0LL;
          while (*(void *)&prime != v29);
          uint64_t v30 = (void *)*((void *)a1 + 2);
          if (v30)
          {
            unint64_t v31 = v30[1];
            uint8x8_t v32 = (uint8x8_t)vcnt_s8(prime);
            v32.i16[0] = vaddlv_u8(v32);
            if (v32.u32[0] > 1uLL)
            {
              if (v31 >= *(void *)&prime) {
                v31 %= *(void *)&prime;
              }
            }

            else
            {
              v31 &= *(void *)&prime - 1LL;
            }

            *(void *)(*(void *)a1 + 8 * v31) = a1 + 4;
            uint64_t v36 = (void *)*v30;
            if (*v30)
            {
              do
              {
                unint64_t v37 = v36[1];
                if (v32.u32[0] > 1uLL)
                {
                  if (v37 >= *(void *)&prime) {
                    v37 %= *(void *)&prime;
                  }
                }

                else
                {
                  v37 &= *(void *)&prime - 1LL;
                }

                if (v37 != v31)
                {
                  if (!*(void *)(*(void *)a1 + 8 * v37))
                  {
                    *(void *)(*(void *)a1 + 8 * v37) = v30;
                    goto LABEL_61;
                  }

                  void *v30 = *v36;
                  *uint64_t v36 = **(void **)(*(void *)a1 + 8 * v37);
                  **(void **)(*(void *)a1 + 8 * v37) = v36;
                  uint64_t v36 = v30;
                }

                unint64_t v37 = v31;
LABEL_61:
                uint64_t v30 = v36;
                uint64_t v36 = (void *)*v36;
                unint64_t v31 = v37;
              }

              while (v36);
            }
          }

          unint64_t v14 = (unint64_t)prime;
          goto LABEL_65;
        }

        uint64_t v41 = *(void **)a1;
        *(void *)a1 = 0LL;
        if (v41) {
          operator delete(v41);
        }
        unint64_t v14 = 0LL;
        *((void *)a1 + 1) = 0LL;
      }
    }

LABEL_65:
    if ((v14 & (v14 - 1)) != 0)
    {
      if (v13 >= v14) {
        unint64_t v3 = v13 % v14;
      }
      else {
        unint64_t v3 = v13;
      }
    }

    else
    {
      unint64_t v3 = (v14 - 1) & v13;
    }
  }

  uint64_t v38 = *(void **)a1;
  uint64_t v39 = *(void **)(*(void *)a1 + 8 * v3);
  if (v39)
  {
    *uint64_t v20 = *v39;
LABEL_78:
    *uint64_t v39 = v20;
    goto LABEL_79;
  }

  *uint64_t v20 = *((void *)a1 + 2);
  *((void *)a1 + 2) = v20;
  v38[v3] = a1 + 4;
  if (*v20)
  {
    unint64_t v40 = *(void *)(*v20 + 8LL);
    if ((v14 & (v14 - 1)) != 0)
    {
      if (v40 >= v14) {
        v40 %= v14;
      }
    }

    else
    {
      v40 &= v14 - 1;
    }

    uint64_t v39 = (void *)(*(void *)a1 + 8 * v40);
    goto LABEL_78;
  }

LABEL_79:
  ++*((void *)a1 + 3);
}

void sub_187C41ACC(_Unwind_Exception *a1)
{
}

uint64_t wireless_diagnostics::google::protobuf::FileDescriptorTables::AddFieldByNumber( uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a2 + 56);
  uint64_t v6 = *(int *)(a2 + 40);
  unint64_t v7 = v6 - v5 + (v5 << 16);
  unint64_t v8 = *(void *)(a1 + 128);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v2 = v6 - v5 + (v5 << 16);
      if (v7 >= v8) {
        unint64_t v2 = v7 % v8;
      }
    }

    else
    {
      unint64_t v2 = (v8 - 1) & v7;
    }

    int v10 = *(uint64_t ***)(*(void *)(a1 + 120) + 8 * v2);
    if (v10)
    {
      for (uint64_t i = *v10; i; uint64_t i = (uint64_t *)*i)
      {
        unint64_t v12 = i[1];
        if (v12 == v7)
        {
          if (i[2] == v5 && *((_DWORD *)i + 6) == (_DWORD)v6) {
            return 0LL;
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

          if (v12 != v2) {
            break;
          }
        }
      }
    }
  }

  unint64_t v14 = operator new(0x28uLL);
  void *v14 = 0LL;
  v14[1] = v7;
  v14[2] = v5;
  *((_DWORD *)v14 + 6) = v6;
  v14[4] = a2;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 144) + 1LL);
  float v16 = *(float *)(a1 + 152);
  if (!v8 || (float)(v16 * (float)v8) < v15)
  {
    BOOL v17 = (v8 & (v8 - 1)) == 0;
    if (v8 < 3) {
      BOOL v17 = 0;
    }
    unint64_t v18 = (2 * v8) | !v17;
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      int8x8_t prime = (int8x8_t)v19;
    }
    else {
      int8x8_t prime = (int8x8_t)v18;
    }
    if (*(void *)&prime == 1LL)
    {
      int8x8_t prime = (int8x8_t)2LL;
    }

    else if ((*(void *)&prime & (*(void *)&prime - 1LL)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v8 = *(void *)(a1 + 128);
    }

    if (*(void *)&prime > v8) {
      goto LABEL_34;
    }
    if (*(void *)&prime < v8)
    {
      unint64_t v27 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 144) / *(float *)(a1 + 152));
      if (v8 < 3 || (uint8x8_t v28 = (uint8x8_t)vcnt_s8((int8x8_t)v8), v28.i16[0] = vaddlv_u8(v28), v28.u32[0] > 1uLL))
      {
        unint64_t v27 = std::__next_prime(v27);
      }

      else
      {
        uint64_t v29 = 1LL << -(char)__clz(v27 - 1);
        if (v27 >= 2) {
          unint64_t v27 = v29;
        }
      }

      if (*(void *)&prime <= v27) {
        int8x8_t prime = (int8x8_t)v27;
      }
      if (*(void *)&prime >= v8)
      {
        unint64_t v8 = *(void *)(a1 + 128);
      }

      else
      {
        if (prime)
        {
LABEL_34:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          float v21 = operator new(8LL * *(void *)&prime);
          float v22 = *(void **)(a1 + 120);
          *(void *)(a1 + 120) = v21;
          if (v22) {
            operator delete(v22);
          }
          uint64_t v23 = 0LL;
          *(int8x8_t *)(a1 + 128) = prime;
          do
            *(void *)(*(void *)(a1 + 120) + 8 * v23++) = 0LL;
          while (*(void *)&prime != v23);
          unint64_t v24 = *(void **)(a1 + 136);
          if (v24)
          {
            unint64_t v25 = v24[1];
            uint8x8_t v26 = (uint8x8_t)vcnt_s8(prime);
            v26.i16[0] = vaddlv_u8(v26);
            if (v26.u32[0] > 1uLL)
            {
              if (v25 >= *(void *)&prime) {
                v25 %= *(void *)&prime;
              }
            }

            else
            {
              v25 &= *(void *)&prime - 1LL;
            }

            *(void *)(*(void *)(a1 + 120) + 8 * v25) = a1 + 136;
            uint64_t v30 = (void *)*v24;
            if (*v24)
            {
              do
              {
                unint64_t v31 = v30[1];
                if (v26.u32[0] > 1uLL)
                {
                  if (v31 >= *(void *)&prime) {
                    v31 %= *(void *)&prime;
                  }
                }

                else
                {
                  v31 &= *(void *)&prime - 1LL;
                }

                if (v31 != v25)
                {
                  uint64_t v32 = *(void *)(a1 + 120);
                  if (!*(void *)(v32 + 8 * v31))
                  {
                    *(void *)(v32 + 8 * v31) = v24;
                    goto LABEL_59;
                  }

                  *unint64_t v24 = *v30;
                  void *v30 = **(void **)(*(void *)(a1 + 120) + 8 * v31);
                  **(void **)(*(void *)(a1 + 120) + 8 * v31) = v30;
                  uint64_t v30 = v24;
                }

                unint64_t v31 = v25;
LABEL_59:
                unint64_t v24 = v30;
                uint64_t v30 = (void *)*v30;
                unint64_t v25 = v31;
              }

              while (v30);
            }
          }

          unint64_t v8 = (unint64_t)prime;
          goto LABEL_63;
        }

        unint64_t v37 = *(void **)(a1 + 120);
        *(void *)(a1 + 120) = 0LL;
        if (v37) {
          operator delete(v37);
        }
        unint64_t v8 = 0LL;
        *(void *)(a1 + 128) = 0LL;
      }
    }

LABEL_63:
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v2 = v7 % v8;
      }
      else {
        unint64_t v2 = v6 - v5 + (v5 << 16);
      }
    }

    else
    {
      unint64_t v2 = (v8 - 1) & v7;
    }
  }

  uint64_t v33 = *(void *)(a1 + 120);
  uint8x8_t v34 = *(void **)(v33 + 8 * v2);
  if (v34)
  {
    void *v14 = *v34;
LABEL_76:
    *uint8x8_t v34 = v14;
    goto LABEL_77;
  }

  void *v14 = *(void *)(a1 + 136);
  *(void *)(a1 + 136) = v14;
  *(void *)(v33 + 8 * v2) = a1 + 136;
  if (*v14)
  {
    unint64_t v35 = *(void *)(*v14 + 8LL);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v35 >= v8) {
        v35 %= v8;
      }
    }

    else
    {
      v35 &= v8 - 1;
    }

    uint8x8_t v34 = (void *)(*(void *)(a1 + 120) + 8 * v35);
    goto LABEL_76;
  }

    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v2 = v7 % v8;
      }
      else {
        unint64_t v2 = v6 - v5 + (v5 << 16);
      }
    }

    else
    {
      unint64_t v2 = (v8 - 1) & v7;
    }
  }

  uint64_t v33 = *(void *)(a1 + 160);
  uint8x8_t v34 = *(void **)(v33 + 8 * v2);
  if (v34)
  {
    void *v14 = *v34;
LABEL_76:
    *uint8x8_t v34 = v14;
    goto LABEL_77;
  }

  void *v14 = *(void *)(a1 + 176);
  *(void *)(a1 + 176) = v14;
  *(void *)(v33 + 8 * v2) = a1 + 176;
  if (*v14)
  {
    unint64_t v35 = *(void *)(*v14 + 8LL);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v35 >= v8) {
        v35 %= v8;
      }
    }

    else
    {
      v35 &= v8 - 1;
    }

    uint8x8_t v34 = (void *)(*(void *)(a1 + 160) + 8 * v35);
    goto LABEL_76;
  }

LABEL_77:
  ++*(void *)(a1 + 144);
  return 1LL;
}

  ++*(void *)(a1 + 184);
  return 1LL;
}

void sub_187C41EDC(_Unwind_Exception *a1)
{
}

uint64_t wireless_diagnostics::google::protobuf::FileDescriptorTables::AddEnumValueByNumber( uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t v6 = *(int *)(a2 + 16);
  unint64_t v7 = v6 - v5 + (v5 << 16);
  unint64_t v8 = *(void *)(a1 + 168);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v2 = v6 - v5 + (v5 << 16);
      if (v7 >= v8) {
        unint64_t v2 = v7 % v8;
      }
    }

    else
    {
      unint64_t v2 = (v8 - 1) & v7;
    }

    int v10 = *(uint64_t ***)(*(void *)(a1 + 160) + 8 * v2);
    if (v10)
    {
      for (uint64_t i = *v10; i; uint64_t i = (uint64_t *)*i)
      {
        unint64_t v12 = i[1];
        if (v12 == v7)
        {
          if (i[2] == v5 && *((_DWORD *)i + 6) == (_DWORD)v6) {
            return 0LL;
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

          if (v12 != v2) {
            break;
          }
        }
      }
    }
  }

  unint64_t v14 = operator new(0x28uLL);
  void *v14 = 0LL;
  v14[1] = v7;
  v14[2] = v5;
  *((_DWORD *)v14 + 6) = v6;
  v14[4] = a2;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 184) + 1LL);
  float v16 = *(float *)(a1 + 192);
  if (!v8 || (float)(v16 * (float)v8) < v15)
  {
    BOOL v17 = (v8 & (v8 - 1)) == 0;
    if (v8 < 3) {
      BOOL v17 = 0;
    }
    unint64_t v18 = (2 * v8) | !v17;
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      int8x8_t prime = (int8x8_t)v19;
    }
    else {
      int8x8_t prime = (int8x8_t)v18;
    }
    if (*(void *)&prime == 1LL)
    {
      int8x8_t prime = (int8x8_t)2LL;
    }

    else if ((*(void *)&prime & (*(void *)&prime - 1LL)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v8 = *(void *)(a1 + 168);
    }

    if (*(void *)&prime > v8) {
      goto LABEL_34;
    }
    if (*(void *)&prime < v8)
    {
      unint64_t v27 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 184) / *(float *)(a1 + 192));
      if (v8 < 3 || (uint8x8_t v28 = (uint8x8_t)vcnt_s8((int8x8_t)v8), v28.i16[0] = vaddlv_u8(v28), v28.u32[0] > 1uLL))
      {
        unint64_t v27 = std::__next_prime(v27);
      }

      else
      {
        uint64_t v29 = 1LL << -(char)__clz(v27 - 1);
        if (v27 >= 2) {
          unint64_t v27 = v29;
        }
      }

      if (*(void *)&prime <= v27) {
        int8x8_t prime = (int8x8_t)v27;
      }
      if (*(void *)&prime >= v8)
      {
        unint64_t v8 = *(void *)(a1 + 168);
      }

      else
      {
        if (prime)
        {
LABEL_34:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          float v21 = operator new(8LL * *(void *)&prime);
          float v22 = *(void **)(a1 + 160);
          *(void *)(a1 + 160) = v21;
          if (v22) {
            operator delete(v22);
          }
          uint64_t v23 = 0LL;
          *(int8x8_t *)(a1 + 168) = prime;
          do
            *(void *)(*(void *)(a1 + 160) + 8 * v23++) = 0LL;
          while (*(void *)&prime != v23);
          unint64_t v24 = *(void **)(a1 + 176);
          if (v24)
          {
            unint64_t v25 = v24[1];
            uint8x8_t v26 = (uint8x8_t)vcnt_s8(prime);
            v26.i16[0] = vaddlv_u8(v26);
            if (v26.u32[0] > 1uLL)
            {
              if (v25 >= *(void *)&prime) {
                v25 %= *(void *)&prime;
              }
            }

            else
            {
              v25 &= *(void *)&prime - 1LL;
            }

            *(void *)(*(void *)(a1 + 160) + 8 * v25) = a1 + 176;
            uint64_t v30 = (void *)*v24;
            if (*v24)
            {
              do
              {
                unint64_t v31 = v30[1];
                if (v26.u32[0] > 1uLL)
                {
                  if (v31 >= *(void *)&prime) {
                    v31 %= *(void *)&prime;
                  }
                }

                else
                {
                  v31 &= *(void *)&prime - 1LL;
                }

                if (v31 != v25)
                {
                  uint64_t v32 = *(void *)(a1 + 160);
                  if (!*(void *)(v32 + 8 * v31))
                  {
                    *(void *)(v32 + 8 * v31) = v24;
                    goto LABEL_59;
                  }

                  *unint64_t v24 = *v30;
                  void *v30 = **(void **)(*(void *)(a1 + 160) + 8 * v31);
                  **(void **)(*(void *)(a1 + 160) + 8 * v31) = v30;
                  uint64_t v30 = v24;
                }

                unint64_t v31 = v25;
LABEL_59:
                unint64_t v24 = v30;
                uint64_t v30 = (void *)*v30;
                unint64_t v25 = v31;
              }

              while (v30);
            }
          }

          unint64_t v8 = (unint64_t)prime;
          goto LABEL_63;
        }

        unint64_t v37 = *(void **)(a1 + 160);
        *(void *)(a1 + 160) = 0LL;
        if (v37) {
          operator delete(v37);
        }
        unint64_t v8 = 0LL;
        *(void *)(a1 + 168) = 0LL;
      }
    }

void sub_187C422EC(_Unwind_Exception *a1)
{
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AddExtension( uint64_t **this, const wireless_diagnostics::google::protobuf::FieldDescriptor *a2)
{
  unint64_t v3 = *((void *)a2 + 7);
  int v4 = *((_DWORD *)a2 + 10);
  unint64_t v21 = v3;
  int v22 = v4;
  uint64_t v23 = a2;
  std::__tree<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::__map_value_compare<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::less<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>,true>,std::allocator<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>>>::__emplace_unique_key_args<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,std::pair<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int> const,wireless_diagnostics::google::protobuf::FieldDescriptor const*>>( this + 35,  &v21,  (uint64_t)&v21);
  char v6 = v5;
  if ((v5 & 1) != 0)
  {
    unint64_t v8 = this[48];
    unint64_t v7 = this[49];
    if (v8 >= v7)
    {
      int v10 = this[47];
      uint64_t v11 = ((char *)v8 - (char *)v10) >> 4;
      unint64_t v12 = v11 + 1;
      uint64_t v13 = (char *)v7 - (char *)v10;
      if (v13 >> 3 > v12) {
        unint64_t v12 = v13 >> 3;
      }
      else {
        unint64_t v14 = v12;
      }
      if (v14) {
        float v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>>( (uint64_t)(this + 49),  v14);
      }
      else {
        float v15 = 0LL;
      }
      float v16 = &v15[16 * v11];
      BOOL v17 = (uint64_t *)&v15[16 * v14];
      *(void *)float v16 = v3;
      *((_DWORD *)v16 + 2) = v4;
      uint8x8_t v9 = (uint64_t *)(v16 + 16);
      unint64_t v19 = this[47];
      unint64_t v18 = this[48];
      if (v18 != v19)
      {
        do
        {
          *((_OWORD *)v16 - 1) = *((_OWORD *)v18 - 1);
          v16 -= 16;
          v18 -= 2;
        }

        while (v18 != v19);
        unint64_t v18 = this[47];
      }

      this[47] = (uint64_t *)v16;
      this[48] = v9;
      this[49] = v17;
      if (v18) {
        operator delete(v18);
      }
    }

    else
    {
      *unint64_t v8 = v3;
      *((_DWORD *)v8 + 2) = v4;
      uint8x8_t v9 = v8 + 2;
    }

    this[48] = v9;
  }

  return v6 & 1;
}

std::string *wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateString( void *a1, uint64_t a2)
{
  int v4 = (std::string *)operator new(0x18uLL);
  char v5 = v4;
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }

  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    v4->__r_.__value_.__l.__cap_ = *(void *)(a2 + 16);
  }

  unint64_t v6 = a1[15];
  unint64_t v7 = (std::string **)a1[14];
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v9 = a1[13];
    uint64_t v10 = ((uint64_t)v7 - v9) >> 3;
    uint64_t v11 = v6 - v9;
    uint64_t v12 = v11 >> 2;
    else {
      unint64_t v13 = v12;
    }
    if (v13) {
      unint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>( (uint64_t)(a1 + 15),  v13);
    }
    else {
      unint64_t v14 = 0LL;
    }
    float v15 = (std::string **)&v14[8 * v10];
    float v16 = &v14[8 * v13];
    *float v15 = v5;
    unint64_t v8 = v15 + 1;
    unint64_t v18 = (char *)a1[13];
    BOOL v17 = (char *)a1[14];
    if (v17 != v18)
    {
      do
      {
        unint64_t v19 = (std::string *)*((void *)v17 - 1);
        v17 -= 8;
        *--float v15 = v19;
      }

      while (v17 != v18);
      BOOL v17 = (char *)a1[13];
    }

    a1[13] = v15;
    a1[14] = v8;
    a1[15] = v16;
    if (v17) {
      operator delete(v17);
    }
  }

  else
  {
    *unint64_t v7 = v5;
    unint64_t v8 = v7 + 1;
  }

  a1[14] = v8;
  return v5;
}

void sub_187C42540(_Unwind_Exception *a1)
{
}

_OWORD *wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateFileTables( wireless_diagnostics::google::protobuf::DescriptorPool::Tables *this)
{
  unint64_t v2 = operator new(0xC8uLL);
  *unint64_t v2 = 0u;
  v2[1] = 0u;
  *((_DWORD *)v2 + 8) = 1065353216;
  *(_OWORD *)((char *)v2 + 40) = 0u;
  *(_OWORD *)((char *)v2 + 56) = 0u;
  *((_DWORD *)v2 + 18) = 1065353216;
  v2[5] = 0u;
  v2[6] = 0u;
  *((_DWORD *)v2 + 28) = 1065353216;
  *(_OWORD *)((char *)v2 + 120) = 0u;
  *(_OWORD *)((char *)v2 + 136) = 0u;
  *((_DWORD *)v2 + 38) = 1065353216;
  v2[10] = 0u;
  v2[11] = 0u;
  *((_DWORD *)v2 + MEMORY[0x1895B3490](v1 - 48) = 1065353216;
  unint64_t v3 = *((void *)this + 21);
  int v4 = (void *)*((void *)this + 20);
  if ((unint64_t)v4 >= v3)
  {
    uint64_t v6 = *((void *)this + 19);
    uint64_t v7 = ((uint64_t)v4 - v6) >> 3;
    uint64_t v8 = v3 - v6;
    uint64_t v9 = v8 >> 2;
    else {
      unint64_t v10 = v9;
    }
    if (v10) {
      uint64_t v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>( (uint64_t)this + 168,  v10);
    }
    else {
      uint64_t v11 = 0LL;
    }
    uint64_t v12 = &v11[8 * v7];
    unint64_t v13 = &v11[8 * v10];
    *(void *)uint64_t v12 = v2;
    char v5 = v12 + 8;
    float v15 = (char *)*((void *)this + 19);
    unint64_t v14 = (char *)*((void *)this + 20);
    if (v14 != v15)
    {
      do
      {
        uint64_t v16 = *((void *)v14 - 1);
        v14 -= 8;
        *((void *)v12 - 1) = v16;
        v12 -= 8;
      }

      while (v14 != v15);
      unint64_t v14 = (char *)*((void *)this + 19);
    }

    *((void *)this + 19) = v12;
    *((void *)this + 20) = v5;
    *((void *)this + 21) = v13;
    if (v14) {
      operator delete(v14);
    }
  }

  else
  {
    *int v4 = v2;
    char v5 = v4 + 1;
  }

  *((void *)this + 20) = v5;
  return v2;
}

void *wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateBytes( wireless_diagnostics::google::protobuf::DescriptorPool::Tables *this, int a2)
{
  if (!a2) {
    return 0LL;
  }
  unint64_t v3 = operator new(a2);
  unint64_t v4 = *((void *)this + 24);
  char v5 = (void *)*((void *)this + 23);
  if ((unint64_t)v5 >= v4)
  {
    uint64_t v7 = *((void *)this + 22);
    uint64_t v8 = ((uint64_t)v5 - v7) >> 3;
    uint64_t v9 = v4 - v7;
    uint64_t v10 = v9 >> 2;
    else {
      unint64_t v11 = v10;
    }
    if (v11) {
      uint64_t v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>( (uint64_t)this + 192,  v11);
    }
    else {
      uint64_t v12 = 0LL;
    }
    unint64_t v13 = &v12[8 * v8];
    unint64_t v14 = &v12[8 * v11];
    *(void *)unint64_t v13 = v3;
    uint64_t v6 = v13 + 8;
    uint64_t v16 = (char *)*((void *)this + 22);
    float v15 = (char *)*((void *)this + 23);
    if (v15 != v16)
    {
      do
      {
        uint64_t v17 = *((void *)v15 - 1);
        v15 -= 8;
        *((void *)v13 - 1) = v17;
        v13 -= 8;
      }

      while (v15 != v16);
      float v15 = (char *)*((void *)this + 22);
    }

    *((void *)this + 22) = v13;
    *((void *)this + 23) = v6;
    *((void *)this + 24) = v14;
    if (v15) {
      operator delete(v15);
    }
  }

  else
  {
    *char v5 = v3;
    uint64_t v6 = v5 + 1;
  }

  *((void *)this + 23) = v6;
  return v3;
}

wireless_diagnostics::google::protobuf::DescriptorPool *wireless_diagnostics::google::protobuf::DescriptorPool::DescriptorPool( wireless_diagnostics::google::protobuf::DescriptorPool *this)
{
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  unint64_t v2 = operator new(0x190uLL);
  *unint64_t v2 = 0u;
  v2[1] = 0u;
  v2[2] = 0u;
  *((void *)v2 + 6) = 0LL;
  *((_DWORD *)v2 + 14) = 1065353216;
  v2[4] = 0u;
  v2[5] = 0u;
  *((_DWORD *)v2 + 24) = 1065353216;
  *(_OWORD *)((char *)v2 + 104) = 0u;
  *(_OWORD *)((char *)v2 + 120) = 0u;
  *(_OWORD *)((char *)v2 + 136) = 0u;
  *(_OWORD *)((char *)v2 + 152) = 0u;
  *(_OWORD *)((char *)v2 + 168) = 0u;
  *(_OWORD *)((char *)v2 + 184) = 0u;
  *(_OWORD *)((char *)v2 + 200) = 0u;
  *(_OWORD *)((char *)v2 + 216) = 0u;
  *((_DWORD *)v2 + 58) = 1065353216;
  v2[15] = 0u;
  v2[16] = 0u;
  *((_DWORD *)v2 + 68) = 1065353216;
  *((void *)v2 + 36) = 0LL;
  *((void *)v2 + 37) = 0LL;
  *((void *)v2 + 35) = v2 + 18;
  v2[23] = 0u;
  v2[24] = 0u;
  v2[21] = 0u;
  v2[22] = 0u;
  v2[19] = 0u;
  v2[20] = 0u;
  *((void *)this + 4) = v2;
  *((_WORD *)this + 20) = 1;
  return this;
}

wireless_diagnostics::google::protobuf::DescriptorPool *wireless_diagnostics::google::protobuf::DescriptorPool::DescriptorPool( wireless_diagnostics::google::protobuf::DescriptorPool *this, wireless_diagnostics::google::protobuf::DescriptorDatabase *a2, wireless_diagnostics::google::protobuf::DescriptorPool::ErrorCollector *a3)
{
  uint64_t v6 = (wireless_diagnostics::google::protobuf::internal::Mutex *)operator new(8uLL);
  wireless_diagnostics::google::protobuf::internal::Mutex::Mutex(v6);
  *(void *)this = v6;
  *((void *)this + 1) = a2;
  *((void *)this + 2) = a3;
  *((void *)this + 3) = 0LL;
  uint64_t v7 = operator new(0x190uLL);
  *uint64_t v7 = 0u;
  v7[1] = 0u;
  std::string v7[2] = 0u;
  *((void *)v7 + 6) = 0LL;
  *((_DWORD *)v7 + 14) = 1065353216;
  v7[4] = 0u;
  v7[5] = 0u;
  *((_DWORD *)v7 + 24) = 1065353216;
  *(_OWORD *)((char *)v7 + 104) = 0u;
  *(_OWORD *)((char *)v7 + 120) = 0u;
  *(_OWORD *)((char *)v7 + 136) = 0u;
  *(_OWORD *)((char *)v7 + 152) = 0u;
  *(_OWORD *)((char *)v7 + 168) = 0u;
  *(_OWORD *)((char *)v7 + 184) = 0u;
  *(_OWORD *)((char *)v7 + 200) = 0u;
  *(_OWORD *)((char *)v7 + 216) = 0u;
  *((_DWORD *)v7 + 58) = 1065353216;
  v7[15] = 0u;
  _BYTE v7[16] = 0u;
  *((_DWORD *)v7 + 68) = 1065353216;
  *((void *)v7 + 36) = 0LL;
  *((void *)v7 + 37) = 0LL;
  *((void *)v7 + 35) = v7 + 18;
  v7[23] = 0u;
  v7[24] = 0u;
  v7[21] = 0u;
  v7[22] = 0u;
  v7[19] = 0u;
  v7[20] = 0u;
  *((void *)this + 4) = v7;
  *((_WORD *)this + 20) = 1;
  return this;
}

void sub_187C428D8(_Unwind_Exception *a1)
{
}

wireless_diagnostics::google::protobuf::DescriptorPool *wireless_diagnostics::google::protobuf::DescriptorPool::DescriptorPool( wireless_diagnostics::google::protobuf::DescriptorPool *this, const wireless_diagnostics::google::protobuf::DescriptorPool *a2)
{
  *(void *)this = 0LL;
  *((void *)this + 1) = 0LL;
  *((void *)this + 2) = 0LL;
  *((void *)this + 3) = a2;
  unint64_t v3 = operator new(0x190uLL);
  *unint64_t v3 = 0u;
  v3[1] = 0u;
  int v3[2] = 0u;
  *((void *)v3 + 6) = 0LL;
  *((_DWORD *)v3 + 14) = 1065353216;
  v3[4] = 0u;
  v3[5] = 0u;
  *((_DWORD *)v3 + 24) = 1065353216;
  *(_OWORD *)((char *)v3 + 104) = 0u;
  *(_OWORD *)((char *)v3 + 120) = 0u;
  *(_OWORD *)((char *)v3 + 136) = 0u;
  *(_OWORD *)((char *)v3 + 152) = 0u;
  *(_OWORD *)((char *)v3 + 168) = 0u;
  *(_OWORD *)((char *)v3 + 184) = 0u;
  *(_OWORD *)((char *)v3 + 200) = 0u;
  *(_OWORD *)((char *)v3 + 216) = 0u;
  *((_DWORD *)v3 + 58) = 1065353216;
  v3[15] = 0u;
  v3[16] = 0u;
  *((_DWORD *)v3 + 68) = 1065353216;
  *((void *)v3 + 36) = 0LL;
  *((void *)v3 + 37) = 0LL;
  *((void *)v3 + 35) = v3 + 18;
  v3[23] = 0u;
  v3[24] = 0u;
  v3[21] = 0u;
  v3[22] = 0u;
  v3[19] = 0u;
  v3[20] = 0u;
  *((void *)this + 4) = v3;
  *((_WORD *)this + 20) = 1;
  return this;
}

void wireless_diagnostics::google::protobuf::DescriptorPool::~DescriptorPool( wireless_diagnostics::google::protobuf::DescriptorPool::Tables **this)
{
  if (*this)
  {
    unint64_t v2 = (void *)MEMORY[0x1895B3874]();
    operator delete(v2);
  }

  wireless_diagnostics::google::protobuf::internal::scoped_ptr<wireless_diagnostics::google::protobuf::DescriptorPool::Tables>::~scoped_ptr(this + 4);
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorPool::InternalDontEnforceDependencies( uint64_t this)
{
  *(_BYTE *)(this + 40) = 0;
  return this;
}

BOOL wireless_diagnostics::google::protobuf::DescriptorPool::InternalIsFileLoaded(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(wireless_diagnostics::google::protobuf::internal::Mutex **)a1;
  uint64_t v10 = v4;
  if (v4) {
    wireless_diagnostics::google::protobuf::internal::Mutex::Lock(v4);
  }
  char v5 = (void *)(*(void *)(a1 + 32) + 240LL);
  else {
    uint64_t v6 = *(const char **)a2;
  }
  unint64_t v11 = v6;
  uint64_t v7 = std::__hash_table<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::hash<char const*>,wireless_diagnostics::google::protobuf::streq,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::streq,wireless_diagnostics::google::protobuf::hash<char const*>,true>,std::allocator<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>>>::find<char const*>( v5,  &v11);
  if (v7) {
    BOOL v8 = v7[3] != 0LL;
  }
  else {
    BOOL v8 = 0LL;
  }
  wireless_diagnostics::google::protobuf::internal::MutexLockMaybe::~MutexLockMaybe(&v10);
  return v8;
}

void sub_187C42A58( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, wireless_diagnostics::google::protobuf::internal::Mutex *a9)
{
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorPool::generated_pool( wireless_diagnostics::google::protobuf::DescriptorPool *this)
{
  if (v1 != 2)
  {
    v3[0] = MEMORY[0x189617018] + 16LL;
    char v4 = 0;
    wireless_diagnostics::google::protobuf::GoogleOnceInitImpl();
    wireless_diagnostics::google::protobuf::internal::FunctionClosure0::~FunctionClosure0((wireless_diagnostics::google::protobuf::internal::FunctionClosure0 *)v3);
  }
}

void sub_187C42ADC(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorPool::internal_generated_pool( wireless_diagnostics::google::protobuf::DescriptorPool *this)
{
  if (v1 != 2)
  {
    v3[0] = MEMORY[0x189617018] + 16LL;
    char v4 = 0;
    wireless_diagnostics::google::protobuf::GoogleOnceInitImpl();
    wireless_diagnostics::google::protobuf::internal::FunctionClosure0::~FunctionClosure0((wireless_diagnostics::google::protobuf::internal::FunctionClosure0 *)v3);
  }
}

void sub_187C42B60(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void wireless_diagnostics::google::protobuf::DescriptorPool::InternalAddGeneratedFile( wireless_diagnostics::google::protobuf::DescriptorPool *this, const void *a2)
{
  unsigned int v2 = a2;
  __dmb(0xBu);
  if (v4 != 2)
  {
    v5[0] = MEMORY[0x189617018] + 16LL;
    char v6 = 0;
    wireless_diagnostics::google::protobuf::GoogleOnceInitImpl();
    wireless_diagnostics::google::protobuf::internal::FunctionClosure0::~FunctionClosure0((wireless_diagnostics::google::protobuf::internal::FunctionClosure0 *)v5);
  }

  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v5);
  }

void sub_187C42C38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorPool::FindFileByName( wireless_diagnostics::google::protobuf::internal::Mutex **a1, char *a2)
{
  uint64_t v4 = *a1;
  unint64_t v14 = v4;
  if (v4) {
    wireless_diagnostics::google::protobuf::internal::Mutex::Lock(v4);
  }
  char v5 = (void *)((char *)a1[4] + 240);
  if (a2[23] >= 0) {
    char v6 = a2;
  }
  else {
    char v6 = *(const char **)a2;
  }
  float v15 = v6;
  uint64_t v7 = std::__hash_table<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::hash<char const*>,wireless_diagnostics::google::protobuf::streq,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::streq,wireless_diagnostics::google::protobuf::hash<char const*>,true>,std::allocator<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>>>::find<char const*>( v5,  &v15);
  if (!v7 || (uint64_t FileByName = (uint64_t)v7[3]) == 0)
  {
    uint64_t v9 = a1[3];
    if (!v9 || (uint64_t FileByName = wireless_diagnostics::google::protobuf::DescriptorPool::FindFileByName(v9, a2)) == 0)
    {
      if (!wireless_diagnostics::google::protobuf::DescriptorPool::TryFindFileInFallbackDatabase( (wireless_diagnostics::google::protobuf::DescriptorPool *)a1,  a2)
        || ((v10 = (void *)((char *)a1[4] + 240), a2[23] >= 0) ? (unint64_t v11 = a2) : (unint64_t v11 = *(const char **)a2),
            (float v15 = v11,
             (uint64_t v12 = std::__hash_table<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::hash<char const*>,wireless_diagnostics::google::protobuf::streq,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::streq,wireless_diagnostics::google::protobuf::hash<char const*>,true>,std::allocator<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>>>::find<char const*>( v10,  &v15)) == 0LL)
         || (uint64_t FileByName = (uint64_t)v12[3]) == 0))
      {
        uint64_t FileByName = 0LL;
      }
    }
  }

  wireless_diagnostics::google::protobuf::internal::MutexLockMaybe::~MutexLockMaybe(&v14);
  return FileByName;
}

void sub_187C42D38( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, wireless_diagnostics::google::protobuf::internal::Mutex *a9)
{
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorPool::TryFindFileInFallbackDatabase( wireless_diagnostics::google::protobuf::DescriptorPool *a1, _BYTE *a2)
{
  if (!*((void *)a1 + 1)
    || std::__hash_table<std::string,wireless_diagnostics::google::protobuf::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>( (void *)(*((void *)a1 + 4) + 24LL),  a2))
  {
    return 0LL;
  }

  wireless_diagnostics::google::protobuf::FileDescriptorProto::FileDescriptorProto((wireless_diagnostics::google::protobuf::FileDescriptorProto *)v6);
  if ((*(unsigned int (**)(void, _BYTE *, _BYTE *))(**((void **)a1 + 1) + 16LL))( *((void *)a1 + 1),  a2,  v6)
    && wireless_diagnostics::google::protobuf::DescriptorPool::BuildFileFromDatabase( a1,  (const wireless_diagnostics::google::protobuf::FileDescriptorProto *)v6))
  {
    uint64_t v4 = 1LL;
  }

  else
  {
    std::__hash_table<std::string,wireless_diagnostics::google::protobuf::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string const&>( *((void *)a1 + 4) + 24LL,  a2,  (uint64_t)a2);
    uint64_t v4 = 0LL;
  }

  wireless_diagnostics::google::protobuf::FileDescriptorProto::~FileDescriptorProto((wireless_diagnostics::google::protobuf::FileDescriptorProto *)v6);
  return v4;
}

void sub_187C42DF4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorPool::FindFileContainingSymbol( wireless_diagnostics::google::protobuf::internal::Mutex **a1, std::string *a2)
{
  uint64_t v4 = *a1;
  unint64_t v37 = v4;
  if (v4) {
    wireless_diagnostics::google::protobuf::internal::Mutex::Lock(v4);
  }
  char v5 = (int8x8_t *)a1[4];
  if ((a2->__r_.__value_.__s.__size_ & 0x80u) == 0) {
    char v6 = (const char *)a2;
  }
  else {
    char v6 = (const char *)a2->__r_.__value_.__r.__words[0];
  }
  char v7 = *v6;
  if (*v6)
  {
    unint64_t v8 = 0LL;
    uint64_t v9 = (unsigned __int8 *)(v6 + 1);
    do
    {
      unint64_t v8 = 5 * v8 + v7;
      int v10 = *v9++;
      char v7 = v10;
    }

    while (v10);
  }

  else
  {
    unint64_t v8 = 0LL;
  }

  int8x8_t v11 = v5[26];
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8(v11);
    v12.i16[0] = vaddlv_u8(v12);
    unint64_t v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v14 = v8;
      if (v8 >= *(void *)&v11) {
        unint64_t v14 = v8 % *(void *)&v11;
      }
    }

    else
    {
      unint64_t v14 = (*(void *)&v11 - 1LL) & v8;
    }

    float v15 = *(uint64_t **)(*(void *)&v5[25] + 8 * v14);
    if (!v15) {
      goto LABEL_28;
    }
    for (uint64_t i = *v15; i; uint64_t i = *(void *)i)
    {
      unint64_t v17 = *(void *)(i + 8);
      if (v8 == v17)
      {
        if (!strcmp(*(const char **)(i + 16), v6))
        {
          float v15 = (uint64_t *)(i + 24);
          goto LABEL_28;
        }
      }

      else
      {
        if (v13 > 1)
        {
          if (v17 >= *(void *)&v11) {
            v17 %= *(void *)&v11;
          }
        }

        else
        {
          v17 &= *(void *)&v11 - 1LL;
        }

        if (v17 != v14) {
          break;
        }
      }
    }
  }

  float v15 = 0LL;
LABEL_28:
  if (v15) {
    unint64_t v18 = v15;
  }
  else {
  uint64_t FileContainingSymbol = v18[1];
  }
  switch(*(_DWORD *)v18)
  {
    case 0:
      unint64_t v21 = a1[3];
      if (v21)
      {
        uint64_t FileContainingSymbol = wireless_diagnostics::google::protobuf::DescriptorPool::FindFileContainingSymbol(v21, a2);
        if (FileContainingSymbol) {
          goto LABEL_70;
        }
      }

      if (!wireless_diagnostics::google::protobuf::DescriptorPool::TryFindSymbolInFallbackDatabase( (wireless_diagnostics::google::protobuf::DescriptorPool *)a1,  a2)) {
        goto LABEL_65;
      }
      int v22 = (int8x8_t *)a1[4];
      if ((a2->__r_.__value_.__s.__size_ & 0x80u) != 0) {
        a2 = (std::string *)a2->__r_.__value_.__r.__words[0];
      }
      std::string::value_type v23 = a2->__r_.__value_.__s.__data_[0];
      if (a2->__r_.__value_.__s.__data_[0])
      {
        unint64_t v24 = 0LL;
        unint64_t v25 = &a2->__r_.__value_.__s.__data_[1];
        do
        {
          unint64_t v24 = 5 * v24 + v23;
          int v26 = *v25++;
          std::string::value_type v23 = v26;
        }

        while (v26);
      }

      else
      {
        unint64_t v24 = 0LL;
      }

      int8x8_t v27 = v22[26];
      if (!*(void *)&v27) {
        goto LABEL_59;
      }
      uint8x8_t v28 = (uint8x8_t)vcnt_s8(v27);
      v28.i16[0] = vaddlv_u8(v28);
      unint64_t v29 = v28.u32[0];
      if (v28.u32[0] > 1uLL)
      {
        unint64_t v30 = v24;
        if (v24 >= *(void *)&v27) {
          unint64_t v30 = v24 % *(void *)&v27;
        }
      }

      else
      {
        unint64_t v30 = (*(void *)&v27 - 1LL) & v24;
      }

      unint64_t v31 = *(uint64_t **)(*(void *)&v22[25] + 8 * v30);
      if (!v31) {
        goto LABEL_60;
      }
      uint64_t v32 = *v31;
      if (!*v31) {
        goto LABEL_59;
      }
      break;
    case 1:
    case 3:
    case 5:
LABEL_32:
      uint64_t v20 = (uint64_t *)(FileContainingSymbol + 16);
      goto LABEL_69;
    case 2:
LABEL_64:
      uint64_t v20 = (uint64_t *)(FileContainingSymbol + 32);
      goto LABEL_69;
    case 4:
LABEL_66:
      uint64_t v35 = *(void *)(FileContainingSymbol + 24);
      goto LABEL_68;
    case 6:
LABEL_67:
      uint64_t v35 = *(void *)(FileContainingSymbol + 16);
LABEL_68:
      uint64_t v20 = (uint64_t *)(v35 + 16);
LABEL_69:
      uint64_t FileContainingSymbol = *v20;
      goto LABEL_70;
    case 7:
      goto LABEL_70;
    default:
LABEL_65:
      uint64_t FileContainingSymbol = 0LL;
      goto LABEL_70;
  }

  do
  {
    unint64_t v33 = *(void *)(v32 + 8);
    if (v24 == v33)
    {
      if (!strcmp(*(const char **)(v32 + 16), (const char *)a2))
      {
        unint64_t v31 = (uint64_t *)(v32 + 24);
        goto LABEL_60;
      }

      goto LABEL_58;
    }

    if (v29 > 1)
    {
      if (v33 >= *(void *)&v27) {
        v33 %= *(void *)&v27;
      }
    }

    else
    {
      v33 &= *(void *)&v27 - 1LL;
    }

    if (v33 != v30) {
      break;
    }
LABEL_58:
    uint64_t v32 = *(void *)v32;
  }

  while (v32);
LABEL_59:
  unint64_t v31 = 0LL;
LABEL_60:
  if (v31) {
    uint8x8_t v34 = v31;
  }
  else {
  uint64_t FileContainingSymbol = v34[1];
  }
  switch(*(_DWORD *)v34)
  {
    case 1:
    case 3:
    case 5:
      goto LABEL_32;
    case 2:
      goto LABEL_64;
    case 4:
      goto LABEL_66;
    case 6:
      goto LABEL_67;
    case 7:
      break;
    default:
      goto LABEL_65;
  }

LABEL_70:
  wireless_diagnostics::google::protobuf::internal::MutexLockMaybe::~MutexLockMaybe(&v37);
  return FileContainingSymbol;
}

      std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>::__throw_length_error[abi:ne180100]();
    }

      std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>::__throw_length_error[abi:ne180100]();
    }

void sub_187C4310C(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

BOOL wireless_diagnostics::google::protobuf::DescriptorPool::TryFindSymbolInFallbackDatabase( wireless_diagnostics::google::protobuf::DescriptorPool *a1, std::string *a2)
{
  if (!*((void *)a1 + 1)
    || (wireless_diagnostics::google::protobuf::DescriptorPool::IsSubSymbolOfBuiltType((uint64_t)a1, a2) & 1) != 0)
  {
    return 0LL;
  }

  wireless_diagnostics::google::protobuf::FileDescriptorProto::FileDescriptorProto((wireless_diagnostics::google::protobuf::FileDescriptorProto *)v9);
  BOOL v4 = ((*(uint64_t (**)(void, std::string *, _BYTE *))(**((void **)a1 + 1) + 24LL))( *((void *)a1 + 1),  a2,  v9) & 1) != 0 && ((v5 = (void *)(*((void *)a1 + 4) + 240LL), *(char *)(v10 + 23) >= 0)
      ? (char v6 = (const char *)v10)
      : (char v6 = *(const char **)v10),
        (int8x8_t v11 = v6,
         (char v7 = std::__hash_table<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::hash<char const*>,wireless_diagnostics::google::protobuf::streq,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::streq,wireless_diagnostics::google::protobuf::hash<char const*>,true>,std::allocator<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>>>::find<char const*>( v5,  &v11)) == 0LL)
     || !v7[3])
    && wireless_diagnostics::google::protobuf::DescriptorPool::BuildFileFromDatabase( a1,  (const wireless_diagnostics::google::protobuf::FileDescriptorProto *)v9) != 0;
  wireless_diagnostics::google::protobuf::FileDescriptorProto::~FileDescriptorProto((wireless_diagnostics::google::protobuf::FileDescriptorProto *)v9);
  return v4;
}

void sub_187C431EC(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorPool::FindMessageTypeByName( uint64_t a1, std::string *a2)
{
  if (wireless_diagnostics::google::protobuf::DescriptorPool::Tables::FindByNameHelper( *(int8x8_t **)(a1 + 32),  (wireless_diagnostics::google::protobuf::internal::Mutex **)a1,  a2) == 1) {
    return v2;
  }
  else {
    return 0LL;
  }
}

unint64_t wireless_diagnostics::google::protobuf::DescriptorPool::Tables::FindByNameHelper( int8x8_t *a1, wireless_diagnostics::google::protobuf::internal::Mutex **a2, std::string *a3)
{
  char v6 = *a2;
  uint64_t v35 = v6;
  if (v6) {
    wireless_diagnostics::google::protobuf::internal::Mutex::Lock(v6);
  }
  if ((a3->__r_.__value_.__s.__size_ & 0x80u) == 0) {
    char v7 = (const char *)a3;
  }
  else {
    char v7 = (const char *)a3->__r_.__value_.__r.__words[0];
  }
  char v8 = *v7;
  if (*v7)
  {
    unint64_t v9 = 0LL;
    uint64_t v10 = (unsigned __int8 *)(v7 + 1);
    do
    {
      unint64_t v9 = 5 * v9 + v8;
      int v11 = *v10++;
      char v8 = v11;
    }

    while (v11);
  }

  else
  {
    unint64_t v9 = 0LL;
  }

  int8x8_t v12 = a1[26];
  if (!*(void *)&v12)
  {
LABEL_27:
    uint64_t v16 = 0LL;
    goto LABEL_28;
  }

  uint8x8_t v13 = (uint8x8_t)vcnt_s8(v12);
  v13.i16[0] = vaddlv_u8(v13);
  unint64_t v14 = v13.u32[0];
  if (v13.u32[0] > 1uLL)
  {
    unint64_t v15 = v9;
    if (v9 >= *(void *)&v12) {
      unint64_t v15 = v9 % *(void *)&v12;
    }
  }

  else
  {
    unint64_t v15 = (*(void *)&v12 - 1LL) & v9;
  }

  uint64_t v16 = *(uint64_t **)(*(void *)&a1[25] + 8 * v15);
  if (v16)
  {
    uint64_t v17 = *v16;
    if (*v16)
    {
      while (1)
      {
        unint64_t v18 = *(void *)(v17 + 8);
        if (v9 == v18)
        {
          if (!strcmp(*(const char **)(v17 + 16), v7))
          {
            uint64_t v16 = (uint64_t *)(v17 + 24);
            goto LABEL_28;
          }
        }

        else
        {
          if (v14 > 1)
          {
            if (v18 >= *(void *)&v12) {
              v18 %= *(void *)&v12;
            }
          }

          else
          {
            v18 &= *(void *)&v12 - 1LL;
          }

          if (v18 != v15) {
            goto LABEL_27;
          }
        }

        uint64_t v17 = *(void *)v17;
        if (!v17) {
          goto LABEL_27;
        }
      }
    }

    goto LABEL_27;
  }

LABEL_28:
  if (!v16) {
  uint64_t v19 = *v16;
  }
  unint64_t v20 = HIDWORD(*v16);
  if (!*v16)
  {
    int v22 = a2[3];
    if (!v22
      || (v23 = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::FindByNameHelper( *((void *)v22 + 4),  v22,  a3),  LODWORD(v19) = v23,  unint64_t v20 = HIDWORD(v23),  !(_DWORD)v23))
    {
      if (!wireless_diagnostics::google::protobuf::DescriptorPool::TryFindSymbolInFallbackDatabase( (wireless_diagnostics::google::protobuf::DescriptorPool *)a2,  a3))
      {
        LODWORD(v19) = 0;
        goto LABEL_31;
      }

      if ((a3->__r_.__value_.__s.__size_ & 0x80u) != 0) {
        a3 = (std::string *)a3->__r_.__value_.__r.__words[0];
      }
      std::string::value_type v24 = a3->__r_.__value_.__s.__data_[0];
      if (a3->__r_.__value_.__s.__data_[0])
      {
        unint64_t v25 = 0LL;
        int v26 = &a3->__r_.__value_.__s.__data_[1];
        do
        {
          unint64_t v25 = 5 * v25 + v24;
          int v27 = *v26++;
          std::string::value_type v24 = v27;
        }

        while (v27);
      }

      else
      {
        unint64_t v25 = 0LL;
      }

      int8x8_t v28 = a1[26];
      if (v28)
      {
        uint8x8_t v29 = (uint8x8_t)vcnt_s8(v28);
        v29.i16[0] = vaddlv_u8(v29);
        unint64_t v30 = v29.u32[0];
        if (v29.u32[0] > 1uLL)
        {
          unint64_t v31 = v25;
          if (v25 >= *(void *)&v28) {
            unint64_t v31 = v25 % *(void *)&v28;
          }
        }

        else
        {
          unint64_t v31 = (*(void *)&v28 - 1LL) & v25;
        }

        uint64_t v32 = *(uint64_t **)(*(void *)&a1[25] + 8 * v31);
        if (!v32) {
          goto LABEL_60;
        }
        for (uint64_t i = *v32; i; uint64_t i = *(void *)i)
        {
          unint64_t v34 = *(void *)(i + 8);
          if (v25 == v34)
          {
            if (!strcmp(*(const char **)(i + 16), (const char *)a3))
            {
              uint64_t v32 = (uint64_t *)(i + 24);
              goto LABEL_60;
            }
          }

          else
          {
            if (v30 > 1)
            {
              if (v34 >= *(void *)&v28) {
                v34 %= *(void *)&v28;
              }
            }

            else
            {
              v34 &= *(void *)&v28 - 1LL;
            }

            if (v34 != v31) {
              break;
            }
          }
        }
      }

      uint64_t v32 = 0LL;
LABEL_60:
      if (!v32) {
      uint64_t v19 = *v32;
      }
      unint64_t v20 = HIDWORD(*v32);
    }
  }

    int v22 = (void *)__p.__r_.__value_.__r.__words[0];
    goto LABEL_30;
  }

void sub_187C434DC(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorPool::FindFieldByName(uint64_t a1, std::string *a2)
{
  if (wireless_diagnostics::google::protobuf::DescriptorPool::Tables::FindByNameHelper( *(int8x8_t **)(a1 + 32),  (wireless_diagnostics::google::protobuf::internal::Mutex **)a1,  a2) != 2) {
    return 0LL;
  }
  uint64_t result = v2;
  if (*(_BYTE *)(v2 + 52)) {
    return 0LL;
  }
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorPool::FindExtensionByName( uint64_t a1, std::string *a2)
{
  if (wireless_diagnostics::google::protobuf::DescriptorPool::Tables::FindByNameHelper( *(int8x8_t **)(a1 + 32),  (wireless_diagnostics::google::protobuf::internal::Mutex **)a1,  a2) != 2) {
    return 0LL;
  }
  uint64_t result = v2;
  if (!*(_BYTE *)(v2 + 52)) {
    return 0LL;
  }
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorPool::FindEnumTypeByName( uint64_t a1, std::string *a2)
{
  if (wireless_diagnostics::google::protobuf::DescriptorPool::Tables::FindByNameHelper( *(int8x8_t **)(a1 + 32),  (wireless_diagnostics::google::protobuf::internal::Mutex **)a1,  a2) == 3) {
    return v2;
  }
  else {
    return 0LL;
  }
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorPool::FindEnumValueByName( uint64_t a1, std::string *a2)
{
  if (wireless_diagnostics::google::protobuf::DescriptorPool::Tables::FindByNameHelper( *(int8x8_t **)(a1 + 32),  (wireless_diagnostics::google::protobuf::internal::Mutex **)a1,  a2) == 4) {
    return v2;
  }
  else {
    return 0LL;
  }
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorPool::FindServiceByName( uint64_t a1, std::string *a2)
{
  if (wireless_diagnostics::google::protobuf::DescriptorPool::Tables::FindByNameHelper( *(int8x8_t **)(a1 + 32),  (wireless_diagnostics::google::protobuf::internal::Mutex **)a1,  a2) == 5) {
    return v2;
  }
  else {
    return 0LL;
  }
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorPool::FindMethodByName( uint64_t a1, std::string *a2)
{
  if (wireless_diagnostics::google::protobuf::DescriptorPool::Tables::FindByNameHelper( *(int8x8_t **)(a1 + 32),  (wireless_diagnostics::google::protobuf::internal::Mutex **)a1,  a2) == 6) {
    return v2;
  }
  else {
    return 0LL;
  }
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorPool::FindExtensionByNumber( wireless_diagnostics::google::protobuf::internal::Mutex **this, const wireless_diagnostics::google::protobuf::Descriptor *a2, uint64_t a3)
{
  char v6 = *this;
  unint64_t v14 = v6;
  if (v6) {
    wireless_diagnostics::google::protobuf::internal::Mutex::Lock(v6);
  }
  char v7 = this[4];
  unint64_t v15 = a2;
  uint64_t v16 = a3;
  char v8 = std::__tree<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::__map_value_compare<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::less<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>,true>,std::allocator<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>>>::find<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>( (uint64_t)v7 + 280,  (unint64_t *)&v15);
  if ((uint64_t *)((char *)v7 + 288) == v8 || (uint64_t ExtensionByNumber = v8[6]) == 0)
  {
    uint64_t v10 = this[3];
    if (!v10
      || (uint64_t ExtensionByNumber = wireless_diagnostics::google::protobuf::DescriptorPool::FindExtensionByNumber(v10, a2, a3)) == 0)
    {
      if (!wireless_diagnostics::google::protobuf::DescriptorPool::TryFindExtensionInFallbackDatabase( (wireless_diagnostics::google::protobuf::DescriptorPool *)this,  a2,  a3)
        || (int v11 = this[4],
            unint64_t v15 = a2,
            uint64_t v16 = a3,
            int8x8_t v12 = std::__tree<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::__map_value_compare<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::less<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>,true>,std::allocator<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>>>::find<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>( (uint64_t)v11 + 280,  (unint64_t *)&v15),  (uint64_t *)((char *)v11 + 288) == v12)
        || (uint64_t ExtensionByNumber = v12[6]) == 0)
      {
        uint64_t ExtensionByNumber = 0LL;
      }
    }
  }

  wireless_diagnostics::google::protobuf::internal::MutexLockMaybe::~MutexLockMaybe(&v14);
  return ExtensionByNumber;
}

void sub_187C436EC(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

BOOL wireless_diagnostics::google::protobuf::DescriptorPool::TryFindExtensionInFallbackDatabase( wireless_diagnostics::google::protobuf::DescriptorPool *this, const wireless_diagnostics::google::protobuf::Descriptor *a2, uint64_t a3)
{
  if (!*((void *)this + 1)) {
    return 0LL;
  }
  wireless_diagnostics::google::protobuf::FileDescriptorProto::FileDescriptorProto((wireless_diagnostics::google::protobuf::FileDescriptorProto *)v11);
  v9 = ((*(uint64_t (**)(void, void, uint64_t, _BYTE *))(**((void **)this + 1) + 32LL))( *((void *)this + 1),  *((void *)a2 + 1),  a3,  v11) & 1) != 0 && ((char v6 = (void *)(*((void *)this + 4) + 240LL), *(char *)(v12 + 23) >= 0)
      ? (char v7 = (const char *)v12)
      : (char v7 = *(const char **)v12),
        (uint8x8_t v13 = v7,
         (char v8 = std::__hash_table<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::hash<char const*>,wireless_diagnostics::google::protobuf::streq,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::streq,wireless_diagnostics::google::protobuf::hash<char const*>,true>,std::allocator<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>>>::find<char const*>( v6,  &v13)) == 0LL)
     || !v8[3])
    && wireless_diagnostics::google::protobuf::DescriptorPool::BuildFileFromDatabase( (wireless_diagnostics::google::protobuf::internal::Mutex **)this,  (const wireless_diagnostics::google::protobuf::FileDescriptorProto *)v11) != 0;
  wireless_diagnostics::google::protobuf::FileDescriptorProto::~FileDescriptorProto((wireless_diagnostics::google::protobuf::FileDescriptorProto *)v11);
  return v9;
}

void sub_187C437C8(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void wireless_diagnostics::google::protobuf::DescriptorPool::FindAllExtensions( uint64_t a1, wireless_diagnostics::google::protobuf::Descriptor *a2, void **a3)
{
  BOOL v4 = a2;
  char v6 = *(wireless_diagnostics::google::protobuf::internal::Mutex **)a1;
  uint64_t v17 = v6;
  unint64_t v18 = a2;
  if (v6) {
    wireless_diagnostics::google::protobuf::internal::Mutex::Lock(v6);
  }
  if (*(void *)(a1 + 8))
  {
    char v7 = std::__hash_table<wireless_diagnostics::google::protobuf::Descriptor const*,wireless_diagnostics::google::protobuf::hash<wireless_diagnostics::google::protobuf::Descriptor const*>,std::equal_to<wireless_diagnostics::google::protobuf::Descriptor const*>,std::allocator<wireless_diagnostics::google::protobuf::Descriptor const*>>::find<wireless_diagnostics::google::protobuf::Descriptor const*>( (void *)(*(void *)(a1 + 32) + 64LL),  (unint64_t *)&v18);
    BOOL v4 = v18;
    if (!v7)
    {
      unint64_t v15 = 0LL;
      uint64_t v16 = 0LL;
      std::string __p = 0LL;
      if ((*(unsigned int (**)(void, void, void **))(**(void **)(a1 + 8) + 40LL))( *(void *)(a1 + 8),  *((void *)v18 + 1),  &__p))
      {
        char v8 = (unsigned int *)__p;
        if (v15 != __p)
        {
          unint64_t v9 = 0LL;
          do
          {
            uint64_t v10 = v8[v9];
            uint64_t v11 = *(void *)(a1 + 32);
            v19[0] = (unint64_t)v18;
            v19[1] = v10;
            uint64_t v12 = std::__tree<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::__map_value_compare<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::less<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>,true>,std::allocator<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>>>::find<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>( v11 + 280,  v19);
            if ((uint64_t *)(v11 + 288) == v12 || !v12[6]) {
              wireless_diagnostics::google::protobuf::DescriptorPool::TryFindExtensionInFallbackDatabase( (wireless_diagnostics::google::protobuf::DescriptorPool *)a1,  v18,  v10);
            }
            ++v9;
            char v8 = (unsigned int *)__p;
          }

          while (v9 < (v15 - (_BYTE *)__p) >> 2);
        }

        std::__hash_table<wireless_diagnostics::google::protobuf::Descriptor const*,wireless_diagnostics::google::protobuf::hash<wireless_diagnostics::google::protobuf::Descriptor const*>,std::equal_to<wireless_diagnostics::google::protobuf::Descriptor const*>,std::allocator<wireless_diagnostics::google::protobuf::Descriptor const*>>::__emplace_unique_key_args<wireless_diagnostics::google::protobuf::Descriptor const*,wireless_diagnostics::google::protobuf::Descriptor const* const&>( *(void *)(a1 + 32) + 64LL,  (unint64_t *)&v18,  &v18);
      }

      if (__p)
      {
        unint64_t v15 = __p;
        operator delete(__p);
      }

      BOOL v4 = v18;
    }
  }

  wireless_diagnostics::google::protobuf::DescriptorPool::Tables::FindAllExtensions( *(void *)(a1 + 32),  (unint64_t)v4,  a3);
  uint64_t v13 = *(void *)(a1 + 24);
  if (v13) {
    wireless_diagnostics::google::protobuf::DescriptorPool::FindAllExtensions(v13, v18, a3);
  }
  wireless_diagnostics::google::protobuf::internal::MutexLockMaybe::~MutexLockMaybe(&v17);
}

void sub_187C43924( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, wireless_diagnostics::google::protobuf::internal::Mutex *a13)
{
  if (__p) {
    operator delete(__p);
  }
  wireless_diagnostics::google::protobuf::internal::MutexLockMaybe::~MutexLockMaybe(&a13);
  _Unwind_Resume(a1);
}

void wireless_diagnostics::google::protobuf::DescriptorPool::Tables::FindAllExtensions( uint64_t a1, unint64_t a2, void **a3)
{
  unint64_t v3 = *(uint64_t **)(a1 + 288);
  if (v3)
  {
    char v6 = (void *)(a1 + 288);
    char v7 = (void *)(a1 + 288);
    do
    {
      unint64_t v8 = v3[4];
      if (v8 >= a2)
      {
        if (v8 <= a2)
        {
          else {
            char v7 = v3;
          }
        }

        else
        {
          char v7 = v3;
        }
      }

      else
      {
        ++v3;
      }

      unint64_t v3 = (uint64_t *)*v3;
    }

    while (v3);
    if (v7 != v6)
    {
      do
      {
        if (v7[4] != a2) {
          break;
        }
        uint64_t v10 = a3[1];
        unint64_t v9 = (unint64_t)a3[2];
        if ((unint64_t)v10 >= v9)
        {
          uint64_t v12 = ((char *)v10 - (_BYTE *)*a3) >> 3;
          uint64_t v13 = v9 - (void)*a3;
          uint64_t v14 = v13 >> 2;
          else {
            unint64_t v15 = v14;
          }
          if (v15) {
            uint64_t v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>( (uint64_t)(a3 + 2),  v15);
          }
          else {
            uint64_t v16 = 0LL;
          }
          uint64_t v17 = &v16[8 * v12];
          *(void *)uint64_t v17 = v7[6];
          uint64_t v11 = v17 + 8;
          uint64_t v19 = (char *)*a3;
          unint64_t v18 = (char *)a3[1];
          if (v18 != *a3)
          {
            do
            {
              uint64_t v20 = *((void *)v18 - 1);
              v18 -= 8;
              *((void *)v17 - 1) = v20;
              v17 -= 8;
            }

            while (v18 != v19);
            unint64_t v18 = (char *)*a3;
          }

          *a3 = v17;
          a3[1] = v11;
          a3[2] = &v16[8 * v15];
          if (v18) {
            operator delete(v18);
          }
        }

        else
        {
          *uint64_t v10 = v7[6];
          uint64_t v11 = v10 + 1;
        }

        a3[1] = v11;
        unint64_t v21 = (void *)v7[1];
        if (v21)
        {
          do
          {
            int v22 = v21;
            unint64_t v21 = (void *)*v21;
          }

          while (v21);
        }

        else
        {
          do
          {
            int v22 = (void *)v7[2];
            BOOL v23 = *v22 == (void)v7;
            char v7 = v22;
          }

          while (!v23);
        }

        char v7 = v22;
      }

      while (v22 != v6);
    }
  }

uint64_t wireless_diagnostics::google::protobuf::Descriptor::FindFieldByNumber( wireless_diagnostics::google::protobuf::Descriptor *this, int a2)
{
  uint64_t v2 = *(int8x8_t **)(*((void *)this + 2) + 144LL);
  int8x8_t v3 = v2[16];
  if (!*(void *)&v3) {
    return 0LL;
  }
  unint64_t v4 = 0xFFFFLL * (void)this + a2;
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    uint64_t v6 = 0xFFFFLL * (void)this + a2;
    if (v4 >= *(void *)&v3) {
      uint64_t v6 = v4 % *(void *)&v3;
    }
  }

  else
  {
    uint64_t v6 = (*(void *)&v3 - 1LL) & v4;
  }

  char v7 = *(uint64_t ***)(*(void *)&v2[15] + 8 * v6);
  if (!v7) {
    return 0LL;
  }
  unint64_t v8 = *v7;
  if (!v8) {
    return 0LL;
  }
  while (1)
  {
    unint64_t v9 = v8[1];
    if (v4 == v9) {
      break;
    }
    if (v5.u32[0] > 1uLL)
    {
      if (v9 >= *(void *)&v3) {
        v9 %= *(void *)&v3;
      }
    }

    else
    {
      v9 &= *(void *)&v3 - 1LL;
    }

    if (v9 != v6) {
      return 0LL;
    }
LABEL_20:
    unint64_t v8 = (uint64_t *)*v8;
    if (!v8) {
      return 0LL;
    }
  }

  if ((wireless_diagnostics::google::protobuf::Descriptor *)v8[2] != this || *((_DWORD *)v8 + 6) != a2) {
    goto LABEL_20;
  }
  uint64_t v12 = v8[4];
  if (!v12) {
    return 0LL;
  }
  if (*(_BYTE *)(v12 + 52)) {
    return 0LL;
  }
  else {
    return v8[4];
  }
}

uint64_t *wireless_diagnostics::google::protobuf::Descriptor::FindFieldByLowercaseName( uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (void *)(*(void *)(*(void *)(a1 + 16) + 144LL) + 40LL);
  else {
    uint64_t v3 = *(void *)a2;
  }
  v5[0] = a1;
  v5[1] = v3;
  if (result)
  {
    if (*((_BYTE *)result + 52)) {
      return 0LL;
    }
  }

  return result;
}

uint64_t *wireless_diagnostics::google::protobuf::Descriptor::FindFieldByCamelcaseName( uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (void *)(*(void *)(*(void *)(a1 + 16) + 144LL) + 80LL);
  else {
    uint64_t v3 = *(void *)a2;
  }
  v5[0] = a1;
  v5[1] = v3;
  if (result)
  {
    if (*((_BYTE *)result + 52)) {
      return 0LL;
    }
  }

  return result;
}

uint64_t wireless_diagnostics::google::protobuf::Descriptor::FindFieldByName(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(*(void *)(a1 + 16) + 144LL);
  else {
    unint64_t v4 = *(const char **)a2;
  }
  char v5 = *v4;
  if (*v4)
  {
    uint64_t v6 = 0LL;
    char v7 = (unsigned __int8 *)(v4 + 1);
    do
    {
      uint64_t v6 = 5 * v6 + v5;
      int v8 = *v7++;
      char v5 = v8;
    }

    while (v8);
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  int8x8_t v9 = (int8x8_t)v3[1];
  if (!*(void *)&v9)
  {
LABEL_26:
    uint64_t v14 = 0LL;
    goto LABEL_27;
  }

  unint64_t v10 = v6 - a1 + (a1 << 16);
  uint8x8_t v11 = (uint8x8_t)vcnt_s8(v9);
  v11.i16[0] = vaddlv_u8(v11);
  unint64_t v12 = v11.u32[0];
  if (v11.u32[0] > 1uLL)
  {
    uint64_t v13 = v6 - a1 + (a1 << 16);
    if (v10 >= *(void *)&v9) {
      uint64_t v13 = v10 % *(void *)&v9;
    }
  }

  else
  {
    uint64_t v13 = (*(void *)&v9 - 1LL) & v10;
  }

  uint64_t v14 = *(uint64_t **)(*v3 + 8 * v13);
  if (v14)
  {
    uint64_t v15 = *v14;
    if (*v14)
    {
      while (1)
      {
        unint64_t v16 = *(void *)(v15 + 8);
        if (v10 == v16)
        {
          if (*(void *)(v15 + 16) == a1 && !strcmp(*(const char **)(v15 + 24), v4))
          {
            uint64_t v14 = (uint64_t *)(v15 + 32);
            goto LABEL_27;
          }
        }

        else
        {
          if (v12 > 1)
          {
            if (v16 >= *(void *)&v9) {
              v16 %= *(void *)&v9;
            }
          }

          else
          {
            v16 &= *(void *)&v9 - 1LL;
          }

          if (v16 != v13) {
            goto LABEL_26;
          }
        }

        uint64_t v15 = *(void *)v15;
        if (!v15) {
          goto LABEL_26;
        }
      }
    }

    goto LABEL_26;
  }

LABEL_27:
  if (v14) {
    uint64_t v17 = v14;
  }
  else {
  uint64_t v18 = *v17;
  }
  uint64_t v19 = *v17;
  if (v19 != 2) {
  if (!(_DWORD)v18)
  }
    return 0LL;
  if (!v14) {
  uint64_t v20 = v14 + 1;
  }
  if (v19 != 2) {
    uint64_t v20 = &qword_18C4D01C8;
  }
  uint64_t v21 = *v20;
  if (*(_BYTE *)(v21 + 52)) {
    return 0LL;
  }
  else {
    return v21;
  }
}

  if (v14) {
    uint64_t v17 = v14;
  }
  else {
  uint64_t v18 = *v17;
  }
  uint64_t v19 = *v17;
  if (v19 != 2) {
  if (!(_DWORD)v18)
  }
    return 0LL;
  if (!v14) {
  uint64_t v20 = v14 + 1;
  }
  if (v19 != 2) {
    uint64_t v20 = &qword_18C4D01C8;
  }
  uint64_t v21 = *v20;
  if (*(_BYTE *)(v21 + 52)) {
    return v21;
  }
  else {
    return 0LL;
  }
}

  if (!v14) {
  uint64_t v19 = *v14;
  }
  uint64_t v17 = v14 + 1;
  uint64_t v18 = v19;
  uint64_t v20 = v19;
  uint64_t v21 = *v17;
  if (v20 == 1) {
    int v22 = v18;
  }
  else {
  if (v22) {
    return v21;
  }
  else {
    return 0LL;
  }
}

  if (!v14) {
  uint64_t v19 = *v14;
  }
  uint64_t v17 = v14 + 1;
  uint64_t v18 = v19;
  uint64_t v20 = v19;
  uint64_t v21 = *v17;
  if (v20 == 3) {
    int v22 = v18;
  }
  else {
  if (v22) {
    return v21;
  }
  else {
    return 0LL;
  }
}

  if (!v14) {
  uint64_t v19 = *v14;
  }
  uint64_t v17 = v14 + 1;
  uint64_t v18 = v19;
  uint64_t v20 = v19;
  uint64_t v21 = *v17;
  if (v20 == 4) {
    int v22 = v18;
  }
  else {
  if (v22) {
    return v21;
  }
  else {
    return 0LL;
  }
}

  if (!v14) {
  uint64_t v19 = *v14;
  }
  uint64_t v17 = v14 + 1;
  uint64_t v18 = v19;
  uint64_t v20 = v19;
  uint64_t v21 = *v17;
  if (v20 == 4) {
    int v22 = v18;
  }
  else {
  if (v22) {
    return v21;
  }
  else {
    return 0LL;
  }
}

  if (!v14) {
  uint64_t v19 = *v14;
  }
  uint64_t v17 = v14 + 1;
  uint64_t v18 = v19;
  uint64_t v20 = v19;
  uint64_t v21 = *v17;
  if (v20 == 6) {
    int v22 = v18;
  }
  else {
  if (v22) {
    return v21;
  }
  else {
    return 0LL;
  }
}

  if (!v14) {
  uint64_t v19 = *v14;
  }
  uint64_t v17 = v14 + 1;
  uint64_t v18 = v19;
  uint64_t v20 = v19;
  uint64_t v21 = *v17;
  if (v20 == 1) {
    int v22 = v18;
  }
  else {
  if (v22) {
    return v21;
  }
  else {
    return 0LL;
  }
}

  if (!v14) {
  uint64_t v19 = *v14;
  }
  uint64_t v17 = v14 + 1;
  uint64_t v18 = v19;
  uint64_t v20 = v19;
  uint64_t v21 = *v17;
  if (v20 == 3) {
    int v22 = v18;
  }
  else {
  if (v22) {
    return v21;
  }
  else {
    return 0LL;
  }
}

  if (!v14) {
  uint64_t v19 = *v14;
  }
  uint64_t v17 = v14 + 1;
  uint64_t v18 = v19;
  uint64_t v20 = v19;
  uint64_t v21 = *v17;
  if (v20 == 4) {
    int v22 = v18;
  }
  else {
  if (v22) {
    return v21;
  }
  else {
    return 0LL;
  }
}

  if (!v14) {
  uint64_t v19 = *v14;
  }
  uint64_t v17 = v14 + 1;
  uint64_t v18 = v19;
  uint64_t v20 = v19;
  uint64_t v21 = *v17;
  if (v20 == 5) {
    int v22 = v18;
  }
  else {
  if (v22) {
    return v21;
  }
  else {
    return 0LL;
  }
}

  if (v14) {
    uint64_t v17 = v14;
  }
  else {
  uint64_t v18 = *v17;
  }
  uint64_t v19 = *v17;
  if (v19 != 2) {
  if (!(_DWORD)v18)
  }
    return 0LL;
  if (!v14) {
  uint64_t v20 = v14 + 1;
  }
  if (v19 != 2) {
    uint64_t v20 = &qword_18C4D01C8;
  }
  uint64_t v21 = *v20;
  if (*(_BYTE *)(v21 + 52)) {
    return v21;
  }
  else {
    return 0LL;
  }
}

uint64_t wireless_diagnostics::google::protobuf::Descriptor::FindExtensionByName(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(*(void *)(a1 + 16) + 144LL);
  else {
    unint64_t v4 = *(const char **)a2;
  }
  char v5 = *v4;
  if (*v4)
  {
    uint64_t v6 = 0LL;
    char v7 = (unsigned __int8 *)(v4 + 1);
    do
    {
      uint64_t v6 = 5 * v6 + v5;
      int v8 = *v7++;
      char v5 = v8;
    }

    while (v8);
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  int8x8_t v9 = (int8x8_t)v3[1];
  if (!*(void *)&v9)
  {
LABEL_26:
    uint64_t v14 = 0LL;
    goto LABEL_27;
  }

  unint64_t v10 = v6 - a1 + (a1 << 16);
  uint8x8_t v11 = (uint8x8_t)vcnt_s8(v9);
  v11.i16[0] = vaddlv_u8(v11);
  unint64_t v12 = v11.u32[0];
  if (v11.u32[0] > 1uLL)
  {
    uint64_t v13 = v6 - a1 + (a1 << 16);
    if (v10 >= *(void *)&v9) {
      uint64_t v13 = v10 % *(void *)&v9;
    }
  }

  else
  {
    uint64_t v13 = (*(void *)&v9 - 1LL) & v10;
  }

  uint64_t v14 = *(uint64_t **)(*v3 + 8 * v13);
  if (v14)
  {
    uint64_t v15 = *v14;
    if (*v14)
    {
      while (1)
      {
        unint64_t v16 = *(void *)(v15 + 8);
        if (v10 == v16)
        {
          if (*(void *)(v15 + 16) == a1 && !strcmp(*(const char **)(v15 + 24), v4))
          {
            uint64_t v14 = (uint64_t *)(v15 + 32);
            goto LABEL_27;
          }
        }

        else
        {
          if (v12 > 1)
          {
            if (v16 >= *(void *)&v9) {
              v16 %= *(void *)&v9;
            }
          }

          else
          {
            v16 &= *(void *)&v9 - 1LL;
          }

          if (v16 != v13) {
            goto LABEL_26;
          }
        }

        uint64_t v15 = *(void *)v15;
        if (!v15) {
          goto LABEL_26;
        }
      }
    }

    goto LABEL_26;
  }

uint64_t *wireless_diagnostics::google::protobuf::Descriptor::FindExtensionByLowercaseName( uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (void *)(*(void *)(*(void *)(a1 + 16) + 144LL) + 40LL);
  else {
    uint64_t v3 = *(void *)a2;
  }
  v5[0] = a1;
  v5[1] = v3;
  if (result)
  {
    if (!*((_BYTE *)result + 52)) {
      return 0LL;
    }
  }

  return result;
}

uint64_t *wireless_diagnostics::google::protobuf::Descriptor::FindExtensionByCamelcaseName( uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (void *)(*(void *)(*(void *)(a1 + 16) + 144LL) + 80LL);
  else {
    uint64_t v3 = *(void *)a2;
  }
  v5[0] = a1;
  v5[1] = v3;
  if (result)
  {
    if (!*((_BYTE *)result + 52)) {
      return 0LL;
    }
  }

  return result;
}

uint64_t wireless_diagnostics::google::protobuf::Descriptor::FindNestedTypeByName(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(*(void *)(a1 + 16) + 144LL);
  else {
    unint64_t v4 = *(const char **)a2;
  }
  char v5 = *v4;
  if (*v4)
  {
    uint64_t v6 = 0LL;
    char v7 = (unsigned __int8 *)(v4 + 1);
    do
    {
      uint64_t v6 = 5 * v6 + v5;
      int v8 = *v7++;
      char v5 = v8;
    }

    while (v8);
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  int8x8_t v9 = (int8x8_t)v3[1];
  if (!*(void *)&v9)
  {
LABEL_26:
    uint64_t v14 = 0LL;
    goto LABEL_27;
  }

  unint64_t v10 = v6 - a1 + (a1 << 16);
  uint8x8_t v11 = (uint8x8_t)vcnt_s8(v9);
  v11.i16[0] = vaddlv_u8(v11);
  unint64_t v12 = v11.u32[0];
  if (v11.u32[0] > 1uLL)
  {
    uint64_t v13 = v6 - a1 + (a1 << 16);
    if (v10 >= *(void *)&v9) {
      uint64_t v13 = v10 % *(void *)&v9;
    }
  }

  else
  {
    uint64_t v13 = (*(void *)&v9 - 1LL) & v10;
  }

  uint64_t v14 = *(uint64_t **)(*v3 + 8 * v13);
  if (v14)
  {
    uint64_t v15 = *v14;
    if (*v14)
    {
      while (1)
      {
        unint64_t v16 = *(void *)(v15 + 8);
        if (v10 == v16)
        {
          if (*(void *)(v15 + 16) == a1 && !strcmp(*(const char **)(v15 + 24), v4))
          {
            uint64_t v14 = (uint64_t *)(v15 + 32);
            goto LABEL_27;
          }
        }

        else
        {
          if (v12 > 1)
          {
            if (v16 >= *(void *)&v9) {
              v16 %= *(void *)&v9;
            }
          }

          else
          {
            v16 &= *(void *)&v9 - 1LL;
          }

          if (v16 != v13) {
            goto LABEL_26;
          }
        }

        uint64_t v15 = *(void *)v15;
        if (!v15) {
          goto LABEL_26;
        }
      }
    }

    goto LABEL_26;
  }

uint64_t wireless_diagnostics::google::protobuf::Descriptor::FindEnumTypeByName(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(*(void *)(a1 + 16) + 144LL);
  else {
    unint64_t v4 = *(const char **)a2;
  }
  char v5 = *v4;
  if (*v4)
  {
    uint64_t v6 = 0LL;
    char v7 = (unsigned __int8 *)(v4 + 1);
    do
    {
      uint64_t v6 = 5 * v6 + v5;
      int v8 = *v7++;
      char v5 = v8;
    }

    while (v8);
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  int8x8_t v9 = (int8x8_t)v3[1];
  if (!*(void *)&v9)
  {
LABEL_26:
    uint64_t v14 = 0LL;
    goto LABEL_27;
  }

  unint64_t v10 = v6 - a1 + (a1 << 16);
  uint8x8_t v11 = (uint8x8_t)vcnt_s8(v9);
  v11.i16[0] = vaddlv_u8(v11);
  unint64_t v12 = v11.u32[0];
  if (v11.u32[0] > 1uLL)
  {
    uint64_t v13 = v6 - a1 + (a1 << 16);
    if (v10 >= *(void *)&v9) {
      uint64_t v13 = v10 % *(void *)&v9;
    }
  }

  else
  {
    uint64_t v13 = (*(void *)&v9 - 1LL) & v10;
  }

  uint64_t v14 = *(uint64_t **)(*v3 + 8 * v13);
  if (v14)
  {
    uint64_t v15 = *v14;
    if (*v14)
    {
      while (1)
      {
        unint64_t v16 = *(void *)(v15 + 8);
        if (v10 == v16)
        {
          if (*(void *)(v15 + 16) == a1 && !strcmp(*(const char **)(v15 + 24), v4))
          {
            uint64_t v14 = (uint64_t *)(v15 + 32);
            goto LABEL_27;
          }
        }

        else
        {
          if (v12 > 1)
          {
            if (v16 >= *(void *)&v9) {
              v16 %= *(void *)&v9;
            }
          }

          else
          {
            v16 &= *(void *)&v9 - 1LL;
          }

          if (v16 != v13) {
            goto LABEL_26;
          }
        }

        uint64_t v15 = *(void *)v15;
        if (!v15) {
          goto LABEL_26;
        }
      }
    }

    goto LABEL_26;
  }

uint64_t wireless_diagnostics::google::protobuf::Descriptor::FindEnumValueByName(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(*(void *)(a1 + 16) + 144LL);
  else {
    unint64_t v4 = *(const char **)a2;
  }
  char v5 = *v4;
  if (*v4)
  {
    uint64_t v6 = 0LL;
    char v7 = (unsigned __int8 *)(v4 + 1);
    do
    {
      uint64_t v6 = 5 * v6 + v5;
      int v8 = *v7++;
      char v5 = v8;
    }

    while (v8);
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  int8x8_t v9 = (int8x8_t)v3[1];
  if (!*(void *)&v9)
  {
LABEL_26:
    uint64_t v14 = 0LL;
    goto LABEL_27;
  }

  unint64_t v10 = v6 - a1 + (a1 << 16);
  uint8x8_t v11 = (uint8x8_t)vcnt_s8(v9);
  v11.i16[0] = vaddlv_u8(v11);
  unint64_t v12 = v11.u32[0];
  if (v11.u32[0] > 1uLL)
  {
    uint64_t v13 = v6 - a1 + (a1 << 16);
    if (v10 >= *(void *)&v9) {
      uint64_t v13 = v10 % *(void *)&v9;
    }
  }

  else
  {
    uint64_t v13 = (*(void *)&v9 - 1LL) & v10;
  }

  uint64_t v14 = *(uint64_t **)(*v3 + 8 * v13);
  if (v14)
  {
    uint64_t v15 = *v14;
    if (*v14)
    {
      while (1)
      {
        unint64_t v16 = *(void *)(v15 + 8);
        if (v10 == v16)
        {
          if (*(void *)(v15 + 16) == a1 && !strcmp(*(const char **)(v15 + 24), v4))
          {
            uint64_t v14 = (uint64_t *)(v15 + 32);
            goto LABEL_27;
          }
        }

        else
        {
          if (v12 > 1)
          {
            if (v16 >= *(void *)&v9) {
              v16 %= *(void *)&v9;
            }
          }

          else
          {
            v16 &= *(void *)&v9 - 1LL;
          }

          if (v16 != v13) {
            goto LABEL_26;
          }
        }

        uint64_t v15 = *(void *)v15;
        if (!v15) {
          goto LABEL_26;
        }
      }
    }

    goto LABEL_26;
  }

uint64_t wireless_diagnostics::google::protobuf::EnumDescriptor::FindValueByName(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(*(void *)(a1 + 16) + 144LL);
  else {
    unint64_t v4 = *(const char **)a2;
  }
  char v5 = *v4;
  if (*v4)
  {
    uint64_t v6 = 0LL;
    char v7 = (unsigned __int8 *)(v4 + 1);
    do
    {
      uint64_t v6 = 5 * v6 + v5;
      int v8 = *v7++;
      char v5 = v8;
    }

    while (v8);
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  int8x8_t v9 = (int8x8_t)v3[1];
  if (!*(void *)&v9)
  {
LABEL_26:
    uint64_t v14 = 0LL;
    goto LABEL_27;
  }

  unint64_t v10 = v6 - a1 + (a1 << 16);
  uint8x8_t v11 = (uint8x8_t)vcnt_s8(v9);
  v11.i16[0] = vaddlv_u8(v11);
  unint64_t v12 = v11.u32[0];
  if (v11.u32[0] > 1uLL)
  {
    uint64_t v13 = v6 - a1 + (a1 << 16);
    if (v10 >= *(void *)&v9) {
      uint64_t v13 = v10 % *(void *)&v9;
    }
  }

  else
  {
    uint64_t v13 = (*(void *)&v9 - 1LL) & v10;
  }

  uint64_t v14 = *(uint64_t **)(*v3 + 8 * v13);
  if (v14)
  {
    uint64_t v15 = *v14;
    if (*v14)
    {
      while (1)
      {
        unint64_t v16 = *(void *)(v15 + 8);
        if (v10 == v16)
        {
          if (*(void *)(v15 + 16) == a1 && !strcmp(*(const char **)(v15 + 24), v4))
          {
            uint64_t v14 = (uint64_t *)(v15 + 32);
            goto LABEL_27;
          }
        }

        else
        {
          if (v12 > 1)
          {
            if (v16 >= *(void *)&v9) {
              v16 %= *(void *)&v9;
            }
          }

          else
          {
            v16 &= *(void *)&v9 - 1LL;
          }

          if (v16 != v13) {
            goto LABEL_26;
          }
        }

        uint64_t v15 = *(void *)v15;
        if (!v15) {
          goto LABEL_26;
        }
      }
    }

    goto LABEL_26;
  }

uint64_t wireless_diagnostics::google::protobuf::EnumDescriptor::FindValueByNumber( wireless_diagnostics::google::protobuf::EnumDescriptor *this, int a2)
{
  uint64_t v2 = *(int8x8_t **)(*((void *)this + 2) + 144LL);
  int8x8_t v3 = v2[21];
  if (v3)
  {
    unint64_t v4 = 0xFFFFLL * (void)this + a2;
    uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
    v5.i16[0] = vaddlv_u8(v5);
    if (v5.u32[0] > 1uLL)
    {
      uint64_t v6 = 0xFFFFLL * (void)this + a2;
      if (v4 >= *(void *)&v3) {
        uint64_t v6 = v4 % *(void *)&v3;
      }
    }

    else
    {
      uint64_t v6 = (*(void *)&v3 - 1LL) & v4;
    }

    char v7 = *(uint64_t ***)(*(void *)&v2[20] + 8 * v6);
    if (v7)
    {
      for (uint64_t i = *v7; i; uint64_t i = (uint64_t *)*i)
      {
        unint64_t v9 = i[1];
        if (v4 == v9)
        {
          if ((wireless_diagnostics::google::protobuf::EnumDescriptor *)i[2] == this && *((_DWORD *)i + 6) == a2) {
            return i[4];
          }
        }

        else
        {
          if (v5.u32[0] > 1uLL)
          {
            if (v9 >= *(void *)&v3) {
              v9 %= *(void *)&v3;
            }
          }

          else
          {
            v9 &= *(void *)&v3 - 1LL;
          }

          if (v9 != v6) {
            return 0LL;
          }
        }
      }
    }
  }

  return 0LL;
}

uint64_t wireless_diagnostics::google::protobuf::ServiceDescriptor::FindMethodByName(uint64_t a1, uint64_t a2)
{
  int8x8_t v3 = *(void **)(*(void *)(a1 + 16) + 144LL);
  else {
    unint64_t v4 = *(const char **)a2;
  }
  char v5 = *v4;
  if (*v4)
  {
    uint64_t v6 = 0LL;
    char v7 = (unsigned __int8 *)(v4 + 1);
    do
    {
      uint64_t v6 = 5 * v6 + v5;
      int v8 = *v7++;
      char v5 = v8;
    }

    while (v8);
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  int8x8_t v9 = (int8x8_t)v3[1];
  if (!*(void *)&v9)
  {
LABEL_26:
    uint64_t v14 = 0LL;
    goto LABEL_27;
  }

  unint64_t v10 = v6 - a1 + (a1 << 16);
  uint8x8_t v11 = (uint8x8_t)vcnt_s8(v9);
  v11.i16[0] = vaddlv_u8(v11);
  unint64_t v12 = v11.u32[0];
  if (v11.u32[0] > 1uLL)
  {
    uint64_t v13 = v6 - a1 + (a1 << 16);
    if (v10 >= *(void *)&v9) {
      uint64_t v13 = v10 % *(void *)&v9;
    }
  }

  else
  {
    uint64_t v13 = (*(void *)&v9 - 1LL) & v10;
  }

  uint64_t v14 = *(uint64_t **)(*v3 + 8 * v13);
  if (v14)
  {
    uint64_t v15 = *v14;
    if (*v14)
    {
      while (1)
      {
        unint64_t v16 = *(void *)(v15 + 8);
        if (v10 == v16)
        {
          if (*(void *)(v15 + 16) == a1 && !strcmp(*(const char **)(v15 + 24), v4))
          {
            uint64_t v14 = (uint64_t *)(v15 + 32);
            goto LABEL_27;
          }
        }

        else
        {
          if (v12 > 1)
          {
            if (v16 >= *(void *)&v9) {
              v16 %= *(void *)&v9;
            }
          }

          else
          {
            v16 &= *(void *)&v9 - 1LL;
          }

          if (v16 != v13) {
            goto LABEL_26;
          }
        }

        uint64_t v15 = *(void *)v15;
        if (!v15) {
          goto LABEL_26;
        }
      }
    }

    goto LABEL_26;
  }

uint64_t wireless_diagnostics::google::protobuf::FileDescriptor::FindMessageTypeByName( uint64_t a1, uint64_t a2)
{
  int8x8_t v3 = *(void **)(a1 + 144);
  else {
    unint64_t v4 = *(const char **)a2;
  }
  char v5 = *v4;
  if (*v4)
  {
    uint64_t v6 = 0LL;
    char v7 = (unsigned __int8 *)(v4 + 1);
    do
    {
      uint64_t v6 = 5 * v6 + v5;
      int v8 = *v7++;
      char v5 = v8;
    }

    while (v8);
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  int8x8_t v9 = (int8x8_t)v3[1];
  if (!*(void *)&v9)
  {
LABEL_26:
    uint64_t v14 = 0LL;
    goto LABEL_27;
  }

  unint64_t v10 = v6 - a1 + (a1 << 16);
  uint8x8_t v11 = (uint8x8_t)vcnt_s8(v9);
  v11.i16[0] = vaddlv_u8(v11);
  unint64_t v12 = v11.u32[0];
  if (v11.u32[0] > 1uLL)
  {
    uint64_t v13 = v6 - a1 + (a1 << 16);
    if (v10 >= *(void *)&v9) {
      uint64_t v13 = v10 % *(void *)&v9;
    }
  }

  else
  {
    uint64_t v13 = (*(void *)&v9 - 1LL) & v10;
  }

  uint64_t v14 = *(uint64_t **)(*v3 + 8 * v13);
  if (v14)
  {
    uint64_t v15 = *v14;
    if (*v14)
    {
      while (1)
      {
        unint64_t v16 = *(void *)(v15 + 8);
        if (v10 == v16)
        {
          if (*(void *)(v15 + 16) == a1 && !strcmp(*(const char **)(v15 + 24), v4))
          {
            uint64_t v14 = (uint64_t *)(v15 + 32);
            goto LABEL_27;
          }
        }

        else
        {
          if (v12 > 1)
          {
            if (v16 >= *(void *)&v9) {
              v16 %= *(void *)&v9;
            }
          }

          else
          {
            v16 &= *(void *)&v9 - 1LL;
          }

          if (v16 != v13) {
            goto LABEL_26;
          }
        }

        uint64_t v15 = *(void *)v15;
        if (!v15) {
          goto LABEL_26;
        }
      }
    }

    goto LABEL_26;
  }

uint64_t wireless_diagnostics::google::protobuf::FileDescriptor::FindEnumTypeByName(uint64_t a1, uint64_t a2)
{
  int8x8_t v3 = *(void **)(a1 + 144);
  else {
    unint64_t v4 = *(const char **)a2;
  }
  char v5 = *v4;
  if (*v4)
  {
    uint64_t v6 = 0LL;
    char v7 = (unsigned __int8 *)(v4 + 1);
    do
    {
      uint64_t v6 = 5 * v6 + v5;
      int v8 = *v7++;
      char v5 = v8;
    }

    while (v8);
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  int8x8_t v9 = (int8x8_t)v3[1];
  if (!*(void *)&v9)
  {
LABEL_26:
    uint64_t v14 = 0LL;
    goto LABEL_27;
  }

  unint64_t v10 = v6 - a1 + (a1 << 16);
  uint8x8_t v11 = (uint8x8_t)vcnt_s8(v9);
  v11.i16[0] = vaddlv_u8(v11);
  unint64_t v12 = v11.u32[0];
  if (v11.u32[0] > 1uLL)
  {
    uint64_t v13 = v6 - a1 + (a1 << 16);
    if (v10 >= *(void *)&v9) {
      uint64_t v13 = v10 % *(void *)&v9;
    }
  }

  else
  {
    uint64_t v13 = (*(void *)&v9 - 1LL) & v10;
  }

  uint64_t v14 = *(uint64_t **)(*v3 + 8 * v13);
  if (v14)
  {
    uint64_t v15 = *v14;
    if (*v14)
    {
      while (1)
      {
        unint64_t v16 = *(void *)(v15 + 8);
        if (v10 == v16)
        {
          if (*(void *)(v15 + 16) == a1 && !strcmp(*(const char **)(v15 + 24), v4))
          {
            uint64_t v14 = (uint64_t *)(v15 + 32);
            goto LABEL_27;
          }
        }

        else
        {
          if (v12 > 1)
          {
            if (v16 >= *(void *)&v9) {
              v16 %= *(void *)&v9;
            }
          }

          else
          {
            v16 &= *(void *)&v9 - 1LL;
          }

          if (v16 != v13) {
            goto LABEL_26;
          }
        }

        uint64_t v15 = *(void *)v15;
        if (!v15) {
          goto LABEL_26;
        }
      }
    }

    goto LABEL_26;
  }

uint64_t wireless_diagnostics::google::protobuf::FileDescriptor::FindEnumValueByName(uint64_t a1, uint64_t a2)
{
  int8x8_t v3 = *(void **)(a1 + 144);
  else {
    unint64_t v4 = *(const char **)a2;
  }
  char v5 = *v4;
  if (*v4)
  {
    uint64_t v6 = 0LL;
    char v7 = (unsigned __int8 *)(v4 + 1);
    do
    {
      uint64_t v6 = 5 * v6 + v5;
      int v8 = *v7++;
      char v5 = v8;
    }

    while (v8);
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  int8x8_t v9 = (int8x8_t)v3[1];
  if (!*(void *)&v9)
  {
LABEL_26:
    uint64_t v14 = 0LL;
    goto LABEL_27;
  }

  unint64_t v10 = v6 - a1 + (a1 << 16);
  uint8x8_t v11 = (uint8x8_t)vcnt_s8(v9);
  v11.i16[0] = vaddlv_u8(v11);
  unint64_t v12 = v11.u32[0];
  if (v11.u32[0] > 1uLL)
  {
    uint64_t v13 = v6 - a1 + (a1 << 16);
    if (v10 >= *(void *)&v9) {
      uint64_t v13 = v10 % *(void *)&v9;
    }
  }

  else
  {
    uint64_t v13 = (*(void *)&v9 - 1LL) & v10;
  }

  uint64_t v14 = *(uint64_t **)(*v3 + 8 * v13);
  if (v14)
  {
    uint64_t v15 = *v14;
    if (*v14)
    {
      while (1)
      {
        unint64_t v16 = *(void *)(v15 + 8);
        if (v10 == v16)
        {
          if (*(void *)(v15 + 16) == a1 && !strcmp(*(const char **)(v15 + 24), v4))
          {
            uint64_t v14 = (uint64_t *)(v15 + 32);
            goto LABEL_27;
          }
        }

        else
        {
          if (v12 > 1)
          {
            if (v16 >= *(void *)&v9) {
              v16 %= *(void *)&v9;
            }
          }

          else
          {
            v16 &= *(void *)&v9 - 1LL;
          }

          if (v16 != v13) {
            goto LABEL_26;
          }
        }

        uint64_t v15 = *(void *)v15;
        if (!v15) {
          goto LABEL_26;
        }
      }
    }

    goto LABEL_26;
  }

uint64_t wireless_diagnostics::google::protobuf::FileDescriptor::FindServiceByName(uint64_t a1, uint64_t a2)
{
  int8x8_t v3 = *(void **)(a1 + 144);
  else {
    unint64_t v4 = *(const char **)a2;
  }
  char v5 = *v4;
  if (*v4)
  {
    uint64_t v6 = 0LL;
    char v7 = (unsigned __int8 *)(v4 + 1);
    do
    {
      uint64_t v6 = 5 * v6 + v5;
      int v8 = *v7++;
      char v5 = v8;
    }

    while (v8);
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  int8x8_t v9 = (int8x8_t)v3[1];
  if (!*(void *)&v9)
  {
LABEL_26:
    uint64_t v14 = 0LL;
    goto LABEL_27;
  }

  unint64_t v10 = v6 - a1 + (a1 << 16);
  uint8x8_t v11 = (uint8x8_t)vcnt_s8(v9);
  v11.i16[0] = vaddlv_u8(v11);
  unint64_t v12 = v11.u32[0];
  if (v11.u32[0] > 1uLL)
  {
    uint64_t v13 = v6 - a1 + (a1 << 16);
    if (v10 >= *(void *)&v9) {
      uint64_t v13 = v10 % *(void *)&v9;
    }
  }

  else
  {
    uint64_t v13 = (*(void *)&v9 - 1LL) & v10;
  }

  uint64_t v14 = *(uint64_t **)(*v3 + 8 * v13);
  if (v14)
  {
    uint64_t v15 = *v14;
    if (*v14)
    {
      while (1)
      {
        unint64_t v16 = *(void *)(v15 + 8);
        if (v10 == v16)
        {
          if (*(void *)(v15 + 16) == a1 && !strcmp(*(const char **)(v15 + 24), v4))
          {
            uint64_t v14 = (uint64_t *)(v15 + 32);
            goto LABEL_27;
          }
        }

        else
        {
          if (v12 > 1)
          {
            if (v16 >= *(void *)&v9) {
              v16 %= *(void *)&v9;
            }
          }

          else
          {
            v16 &= *(void *)&v9 - 1LL;
          }

          if (v16 != v13) {
            goto LABEL_26;
          }
        }

        uint64_t v15 = *(void *)v15;
        if (!v15) {
          goto LABEL_26;
        }
      }
    }

    goto LABEL_26;
  }

uint64_t wireless_diagnostics::google::protobuf::FileDescriptor::FindExtensionByName(uint64_t a1, uint64_t a2)
{
  int8x8_t v3 = *(void **)(a1 + 144);
  else {
    unint64_t v4 = *(const char **)a2;
  }
  char v5 = *v4;
  if (*v4)
  {
    uint64_t v6 = 0LL;
    char v7 = (unsigned __int8 *)(v4 + 1);
    do
    {
      uint64_t v6 = 5 * v6 + v5;
      int v8 = *v7++;
      char v5 = v8;
    }

    while (v8);
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  int8x8_t v9 = (int8x8_t)v3[1];
  if (!*(void *)&v9)
  {
LABEL_26:
    uint64_t v14 = 0LL;
    goto LABEL_27;
  }

  unint64_t v10 = v6 - a1 + (a1 << 16);
  uint8x8_t v11 = (uint8x8_t)vcnt_s8(v9);
  v11.i16[0] = vaddlv_u8(v11);
  unint64_t v12 = v11.u32[0];
  if (v11.u32[0] > 1uLL)
  {
    uint64_t v13 = v6 - a1 + (a1 << 16);
    if (v10 >= *(void *)&v9) {
      uint64_t v13 = v10 % *(void *)&v9;
    }
  }

  else
  {
    uint64_t v13 = (*(void *)&v9 - 1LL) & v10;
  }

  uint64_t v14 = *(uint64_t **)(*v3 + 8 * v13);
  if (v14)
  {
    uint64_t v15 = *v14;
    if (*v14)
    {
      while (1)
      {
        unint64_t v16 = *(void *)(v15 + 8);
        if (v10 == v16)
        {
          if (*(void *)(v15 + 16) == a1 && !strcmp(*(const char **)(v15 + 24), v4))
          {
            uint64_t v14 = (uint64_t *)(v15 + 32);
            goto LABEL_27;
          }
        }

        else
        {
          if (v12 > 1)
          {
            if (v16 >= *(void *)&v9) {
              v16 %= *(void *)&v9;
            }
          }

          else
          {
            v16 &= *(void *)&v9 - 1LL;
          }

          if (v16 != v13) {
            goto LABEL_26;
          }
        }

        uint64_t v15 = *(void *)v15;
        if (!v15) {
          goto LABEL_26;
        }
      }
    }

    goto LABEL_26;
  }

uint64_t *wireless_diagnostics::google::protobuf::FileDescriptor::FindExtensionByLowercaseName( uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (void *)(*(void *)(a1 + 144) + 40LL);
  else {
    uint64_t v3 = *(void *)a2;
  }
  v5[0] = a1;
  v5[1] = v3;
  if (result)
  {
    if (!*((_BYTE *)result + 52)) {
      return 0LL;
    }
  }

  return result;
}

uint64_t *wireless_diagnostics::google::protobuf::FileDescriptor::FindExtensionByCamelcaseName( uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (void *)(*(void *)(a1 + 144) + 80LL);
  else {
    uint64_t v3 = *(void *)a2;
  }
  v5[0] = a1;
  v5[1] = v3;
  if (result)
  {
    if (!*((_BYTE *)result + 52)) {
      return 0LL;
    }
  }

  return result;
}

BOOL wireless_diagnostics::google::protobuf::Descriptor::IsExtensionNumber( wireless_diagnostics::google::protobuf::Descriptor *this, int a2)
{
  unint64_t v2 = *((unsigned int *)this + 22);
  if ((int)v2 < 1)
  {
    return 0;
  }

  else
  {
    uint64_t v3 = 0LL;
    unint64_t v4 = (_DWORD *)(*((void *)this + 12) + 4LL);
    BOOL v5 = 1;
    do
    {
      if (*(v4 - 1) <= a2 && *v4 > a2) {
        break;
      }
      v4 += 2;
      BOOL v5 = ++v3 < v2;
    }

    while (v2 != v3);
  }

  return v5;
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorPool::BuildFileFromDatabase( wireless_diagnostics::google::protobuf::internal::Mutex **this, const wireless_diagnostics::google::protobuf::FileDescriptorProto *a2)
{
  unint64_t v4 = this[4];
  BOOL v5 = this[2];
  v8[0] = this;
  v8[1] = v4;
  uint64_t v10 = 0LL;
  uint64_t v11 = 0LL;
  v14[0] = 0LL;
  v14[1] = 0LL;
  uint64_t v8[2] = v5;
  memset(&v8[3], 0, 24);
  char v9 = 0;
  uint64_t v12 = 0LL;
  uint64_t v13 = v14;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t v6 = wireless_diagnostics::google::protobuf::DescriptorBuilder::BuildFile( (wireless_diagnostics::google::protobuf::DescriptorBuilder *)v8,  a2);
  wireless_diagnostics::google::protobuf::DescriptorBuilder::~DescriptorBuilder(v8);
  return v6;
}

void sub_187C450F8(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorPool::IsSubSymbolOfBuiltType( uint64_t a1, std::string *a2)
{
  else {
    std::string __str = *a2;
  }
  std::string::size_type v3 = std::string::rfind(&__str, 46, 0xFFFFFFFFFFFFFFFFLL);
  if (v3 != -1LL)
  {
    std::string::size_type v4 = v3;
    while (1)
    {
      std::string::basic_string(&v24, &__str, 0LL, v4, (std::allocator<char> *)&v26);
      std::string __str = v24;
      BOOL v5 = *(int8x8_t **)(a1 + 32);
      if ((v24.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        p_str = &__str;
      }
      else {
        p_str = (std::string *)v24.__r_.__value_.__r.__words[0];
      }
      char v7 = p_str->__r_.__value_.__s.__data_[0];
      if (p_str->__r_.__value_.__s.__data_[0])
      {
        unint64_t v8 = 0LL;
        char v9 = &p_str->__r_.__value_.__s.__data_[1];
        do
        {
          unint64_t v8 = 5 * v8 + v7;
          int v10 = *v9++;
          char v7 = v10;
        }

        while (v10);
      }

      else
      {
        unint64_t v8 = 0LL;
      }

      int8x8_t v11 = v5[26];
      if (!*(void *)&v11) {
        goto LABEL_32;
      }
      uint8x8_t v12 = (uint8x8_t)vcnt_s8(v11);
      v12.i16[0] = vaddlv_u8(v12);
      unint64_t v13 = v12.u32[0];
      if (v12.u32[0] > 1uLL)
      {
        unint64_t v14 = v8;
        if (v8 >= *(void *)&v11) {
          unint64_t v14 = v8 % *(void *)&v11;
        }
      }

      else
      {
        unint64_t v14 = (*(void *)&v11 - 1LL) & v8;
      }

      __int128 v15 = *(uint64_t **)(*(void *)&v5[25] + 8 * v14);
      if (v15) {
        break;
      }
LABEL_33:
      if (!v15) {
      int v18 = *(_DWORD *)v15;
      }
      if (v18) {
        BOOL v19 = v18 == 7;
      }
      else {
        BOOL v19 = 1;
      }
      if (!v19)
      {
        uint64_t IsSubSymbolOfBuiltType = 1LL;
        goto LABEL_44;
      }

      std::string::size_type v4 = std::string::rfind(&__str, 46, 0xFFFFFFFFFFFFFFFFLL);
      if (v4 == -1LL) {
        goto LABEL_41;
      }
    }

    for (uint64_t i = *v15; i; uint64_t i = *(void *)i)
    {
      unint64_t v17 = *(void *)(i + 8);
      if (v8 == v17)
      {
        if (!strcmp(*(const char **)(i + 16), (const char *)p_str))
        {
          __int128 v15 = (uint64_t *)(i + 24);
          goto LABEL_33;
        }
      }

      else
      {
        if (v13 > 1)
        {
          if (v17 >= *(void *)&v11) {
            v17 %= *(void *)&v11;
          }
        }

        else
        {
          v17 &= *(void *)&v11 - 1LL;
        }

        if (v17 != v14) {
          break;
        }
      }
    }

LABEL_32:
    __int128 v15 = 0LL;
    goto LABEL_33;
  }

  std::string::basic_string(&v19, a1, v9, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v18);
  int v18 = a3;
  std::back_insert_iterator<std::vector<std::string>>::operator=[abi:ne180100](&v18, (__int128 *)&v19);
}

void sub_187C45338( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void wireless_diagnostics::google::protobuf::FieldDescriptor::DefaultValueAsString( wireless_diagnostics::google::protobuf::FieldDescriptor *this@<X0>, char *a2@<X1>, char *a3@<X2>, std::string *a4@<X8>)
{
  int v4 = (int)a2;
  if (!*((_BYTE *)this + 104))
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)&v19);
  }

  switch(*((_DWORD *)this + 11))
  {
    case 1:
      wireless_diagnostics::google::protobuf::SimpleDtoa(*((double *)this + 14), a2, a4);
      return;
    case 2:
      wireless_diagnostics::google::protobuf::SimpleFtoa(*((float *)this + 28), a2, a4);
      return;
    case 3:
    case 0x10:
    case 0x12:
      wireless_diagnostics::google::protobuf::SimpleItoa( *((wireless_diagnostics::google::protobuf **)this + 14),  a3,  a4);
      return;
    case 4:
    case 6:
      wireless_diagnostics::google::protobuf::SimpleItoa( *((wireless_diagnostics::google::protobuf **)this + 14),  a3,  a4);
      return;
    case 5:
    case 0xF:
    case 0x11:
      wireless_diagnostics::google::protobuf::SimpleItoa( (wireless_diagnostics::google::protobuf *)*((unsigned int *)this + 28),  a3,  a4);
      return;
    case 7:
    case 0xD:
      wireless_diagnostics::google::protobuf::SimpleItoa( (wireless_diagnostics::google::protobuf *)*((unsigned int *)this + 28),  a3,  a4);
      return;
    case 8:
      if (*((_BYTE *)this + 112)) {
        char v7 = "true";
      }
      else {
        char v7 = "false";
      }
      goto LABEL_18;
    case 9:
    case 0xC:
      if (v4)
      {
        wireless_diagnostics::google::protobuf::CEscape(*((void *)this + 14), &v18);
        int8x8_t v11 = std::string::insert(&v18, 0LL, "");
        __int128 v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
        v19.__r_.__value_.__l.__cap_ = v11->__r_.__value_.__l.__cap_;
        *(_OWORD *)&v19.__r_.__value_.__l.__data_ = v12;
        v11->__r_.__value_.__l.__size_ = 0LL;
        v11->__r_.__value_.__l.__cap_ = 0LL;
        v11->__r_.__value_.__r.__words[0] = 0LL;
        unint64_t v13 = std::string::append(&v19, "");
        __int128 v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
        a4->__r_.__value_.__l.__cap_ = v13->__r_.__value_.__l.__cap_;
        *(_OWORD *)&a4->__r_.__value_.__l.__data_ = v14;
        v13->__r_.__value_.__l.__size_ = 0LL;
        v13->__r_.__value_.__l.__cap_ = 0LL;
        v13->__r_.__value_.__r.__words[0] = 0LL;
        return;
      }

      uint64_t v15 = *((void *)this + 14);
      if (*((_DWORD *)this + 11) == 12)
      {
        wireless_diagnostics::google::protobuf::CEscape(v15, a4);
        return;
      }

      if ((*(char *)(v15 + 23) & 0x80000000) == 0)
      {
        __int128 v9 = *(_OWORD *)v15;
        std::string::size_type v10 = *(void *)(v15 + 16);
        goto LABEL_15;
      }

      __int128 v16 = *(const std::string::value_type **)v15;
      std::string::size_type v17 = *(void *)(v15 + 8);
      goto LABEL_28;
    case 0xA:
    case 0xB:
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
      wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)&v19);
      goto LABEL_17;
    case 0xE:
      unint64_t v8 = (__int128 *)**((void **)this + 14);
      if (*((char *)v8 + 23) < 0)
      {
        __int128 v16 = *(const std::string::value_type **)v8;
        std::string::size_type v17 = *((void *)v8 + 1);
LABEL_28:
        std::string::__init_copy_ctor_external(a4, v16, v17);
      }

      else
      {
        __int128 v9 = *v8;
        std::string::size_type v10 = *((void *)v8 + 2);
LABEL_15:
        a4->__r_.__value_.__l.__cap_ = v10;
        *(_OWORD *)&a4->__r_.__value_.__l.__data_ = v9;
      }

      return;
    default:
LABEL_17:
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
      wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)&v19);
      char v7 = "";
LABEL_18:
      std::string::basic_string[abi:ne180100]<0>(a4, v7);
      return;
  }

void sub_187C45608( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  _Unwind_Resume(exception_object);
}

void wireless_diagnostics::google::protobuf::FileDescriptor::CopyTo( wireless_diagnostics::google::protobuf::FileDescriptor *this, wireless_diagnostics::google::protobuf::FileDescriptorProto *a2)
{
  int v4 = *(const std::string **)this;
  *((_DWORD *)a2 + 51) |= 1u;
  BOOL v5 = (std::string *)*((void *)a2 + 2);
  uint64_t v6 = (std::string *)MEMORY[0x189616DE8];
  if (v5 == (std::string *)MEMORY[0x189616DE8])
  {
    BOOL v5 = (std::string *)operator new(0x18uLL);
    v5->__r_.__value_.__l.__size_ = 0LL;
    v5->__r_.__value_.__l.__cap_ = 0LL;
    v5->__r_.__value_.__r.__words[0] = 0LL;
    *((void *)a2 + 2) = v5;
  }

  char v7 = (wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase *)std::string::operator=(v5, v4);
  int8x8_t v11 = (const std::string *)*((void *)this + 1);
  if ((char)v11->__r_.__value_.__s.__size_ < 0)
  {
    if (!v11->__r_.__value_.__l.__size_) {
      goto LABEL_10;
    }
  }

  else if (!v11->__r_.__value_.__s.__size_)
  {
    goto LABEL_10;
  }

  *((_DWORD *)a2 + 51) |= 2u;
  __int128 v12 = (std::string *)*((void *)a2 + 3);
  if (v12 == v6)
  {
    __int128 v12 = (std::string *)operator new(0x18uLL);
    v12->__r_.__value_.__l.__size_ = 0LL;
    v12->__r_.__value_.__l.__cap_ = 0LL;
    v12->__r_.__value_.__r.__words[0] = 0LL;
    *((void *)a2 + 3) = v12;
  }

  char v7 = (wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase *)std::string::operator=(v12, v11);
LABEL_10:
  if (*((int *)this + 6) >= 1)
  {
    uint64_t v13 = 0LL;
    do
    {
      __int128 v14 = **(const std::string ***)(*((void *)this + 4) + 8 * v13);
      int v15 = *((_DWORD *)a2 + 11);
      uint64_t v16 = *((int *)a2 + 10);
      if ((int)v16 >= v15)
      {
        if (v15 == *((_DWORD *)a2 + 12))
        {
          char v7 = (wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase *)wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((wireless_diagnostics::google::protobuf::FileDescriptorProto *)((char *)a2 + 32));
          int v15 = *((_DWORD *)a2 + 11);
        }

        *((_DWORD *)a2 + 11) = v15 + 1;
        std::string v18 = (std::string *)wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase::New(v7);
        uint64_t v19 = *((void *)a2 + 4);
        uint64_t v20 = *((int *)a2 + 10);
        *((_DWORD *)a2 + 10) = v20 + 1;
        *(void *)(v19 + 8 * v20) = v18;
      }

      else
      {
        uint64_t v17 = *((void *)a2 + 4);
        *((_DWORD *)a2 + 10) = v16 + 1;
        std::string v18 = *(std::string **)(v17 + 8 * v16);
      }

      char v7 = (wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase *)std::string::operator=(v18, v14);
      ++v13;
    }

    while (v13 < *((int *)this + 6));
  }

  if (*((int *)this + 10) >= 1)
  {
    uint64_t v21 = 0LL;
    do
    {
      int v22 = *(_DWORD *)(*((void *)this + 6) + 4 * v21);
      int v23 = *((_DWORD *)a2 + 16);
      if (v23 == *((_DWORD *)a2 + 17))
      {
        wireless_diagnostics::google::protobuf::RepeatedField<int>::Reserve((uint64_t)a2 + 56, v23 + 1);
        int v23 = *((_DWORD *)a2 + 16);
      }

      uint64_t v24 = *((void *)a2 + 7);
      *((_DWORD *)a2 + 16) = v23 + 1;
      *(_DWORD *)(v24 + 4LL * v23) = v22;
      ++v21;
    }

    while (v21 < *((int *)this + 10));
  }

  if (*((int *)this + 14) >= 1)
  {
    uint64_t v25 = 0LL;
    do
    {
      int v26 = *(_DWORD *)(*((void *)this + 8) + 4 * v25);
      int v27 = *((_DWORD *)a2 + 20);
      if (v27 == *((_DWORD *)a2 + 21))
      {
        wireless_diagnostics::google::protobuf::RepeatedField<int>::Reserve((uint64_t)a2 + 72, v27 + 1);
        int v27 = *((_DWORD *)a2 + 20);
      }

      uint64_t v28 = *((void *)a2 + 9);
      *((_DWORD *)a2 + 20) = v27 + 1;
      *(_DWORD *)(v28 + 4LL * v27) = v26;
      ++v25;
    }

    while (v25 < *((int *)this + 14));
  }

  if (*((int *)this + 18) >= 1)
  {
    uint64_t v29 = 0LL;
    uint64_t v30 = 0LL;
    do
    {
      uint64_t v31 = *((void *)this + 10);
      int v32 = *((_DWORD *)a2 + 25);
      uint64_t v33 = *((int *)a2 + 24);
      if ((int)v33 >= v32)
      {
        if (v32 == *((_DWORD *)a2 + 26))
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((wireless_diagnostics::google::protobuf::FileDescriptorProto *)((char *)a2 + 88));
          int v32 = *((_DWORD *)a2 + 25);
        }

        *((_DWORD *)a2 + 25) = v32 + 1;
        uint64_t v35 = wireless_diagnostics::google::protobuf::internal::GenericTypeHandler<wireless_diagnostics::google::protobuf::DescriptorProto>::New();
        uint64_t v36 = *((void *)a2 + 11);
        uint64_t v37 = *((int *)a2 + 24);
        *((_DWORD *)a2 + 24) = v37 + 1;
        *(void *)(v36 + 8 * v37) = v35;
      }

      else
      {
        uint64_t v34 = *((void *)a2 + 11);
        *((_DWORD *)a2 + 24) = v33 + 1;
        uint64_t v35 = *(wireless_diagnostics::google::protobuf::DescriptorProto **)(v34 + 8 * v33);
      }

      wireless_diagnostics::google::protobuf::Descriptor::CopyTo( (wireless_diagnostics::google::protobuf::Descriptor *)(v31 + v29),  v35);
      ++v30;
      v29 += 120LL;
    }

    while (v30 < *((int *)this + 18));
  }

  if (*((int *)this + 22) >= 1)
  {
    uint64_t v38 = 0LL;
    uint64_t v39 = 0LL;
    do
    {
      uint64_t v40 = *((void *)this + 12);
      int v41 = *((_DWORD *)a2 + 31);
      uint64_t v42 = *((int *)a2 + 30);
      if ((int)v42 >= v41)
      {
        if (v41 == *((_DWORD *)a2 + 32))
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((wireless_diagnostics::google::protobuf::FileDescriptorProto *)((char *)a2 + 112));
          int v41 = *((_DWORD *)a2 + 31);
        }

        *((_DWORD *)a2 + 31) = v41 + 1;
        uint64_t v44 = wireless_diagnostics::google::protobuf::internal::GenericTypeHandler<wireless_diagnostics::google::protobuf::EnumDescriptorProto>::New();
        uint64_t v45 = *((void *)a2 + 14);
        uint64_t v46 = *((int *)a2 + 30);
        *((_DWORD *)a2 + 30) = v46 + 1;
        *(void *)(v45 + 8 * v46) = v44;
      }

      else
      {
        uint64_t v43 = *((void *)a2 + 14);
        *((_DWORD *)a2 + 30) = v42 + 1;
        uint64_t v44 = *(wireless_diagnostics::google::protobuf::EnumDescriptorProto **)(v43 + 8 * v42);
      }

      wireless_diagnostics::google::protobuf::EnumDescriptor::CopyTo( (wireless_diagnostics::google::protobuf::EnumDescriptor *)(v40 + v38),  v44);
      ++v39;
      v38 += 56LL;
    }

    while (v39 < *((int *)this + 22));
  }

  if (*((int *)this + 26) >= 1)
  {
    uint64_t v47 = 0LL;
    uint64_t v48 = 0LL;
    do
    {
      uint64_t v49 = *((void *)this + 14);
      int v50 = *((_DWORD *)a2 + 37);
      uint64_t v51 = *((int *)a2 + 36);
      if ((int)v51 >= v50)
      {
        if (v50 == *((_DWORD *)a2 + 38))
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((wireless_diagnostics::google::protobuf::FileDescriptorProto *)((char *)a2 + 136));
          int v50 = *((_DWORD *)a2 + 37);
        }

        *((_DWORD *)a2 + 37) = v50 + 1;
        uint64_t v53 = wireless_diagnostics::google::protobuf::internal::GenericTypeHandler<wireless_diagnostics::google::protobuf::ServiceDescriptorProto>::New();
        uint64_t v54 = *((void *)a2 + 17);
        uint64_t v55 = *((int *)a2 + 36);
        *((_DWORD *)a2 + 36) = v55 + 1;
        *(void *)(v54 + 8 * v55) = v53;
      }

      else
      {
        uint64_t v52 = *((void *)a2 + 17);
        *((_DWORD *)a2 + 36) = v51 + 1;
        uint64_t v53 = *(wireless_diagnostics::google::protobuf::ServiceDescriptorProto **)(v52 + 8 * v51);
      }

      wireless_diagnostics::google::protobuf::ServiceDescriptor::CopyTo( (wireless_diagnostics::google::protobuf::ServiceDescriptor *)(v49 + v47),  v53);
      ++v48;
      v47 += 48LL;
    }

    while (v48 < *((int *)this + 26));
  }

  if (*((int *)this + 30) >= 1)
  {
    uint64_t v56 = 0LL;
    uint64_t v57 = 0LL;
    do
    {
      uint64_t v58 = *((void *)this + 16);
      int v59 = *((_DWORD *)a2 + 43);
      uint64_t v60 = *((int *)a2 + 42);
      if ((int)v60 >= v59)
      {
        if (v59 == *((_DWORD *)a2 + 44))
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((wireless_diagnostics::google::protobuf::FileDescriptorProto *)((char *)a2 + 160));
          int v59 = *((_DWORD *)a2 + 43);
        }

        *((_DWORD *)a2 + 43) = v59 + 1;
        int64_t v62 = wireless_diagnostics::google::protobuf::internal::GenericTypeHandler<wireless_diagnostics::google::protobuf::FieldDescriptorProto>::New();
        uint64_t v63 = *((void *)a2 + 20);
        uint64_t v64 = *((int *)a2 + 42);
        *((_DWORD *)a2 + 42) = v64 + 1;
        *(void *)(v63 + 8 * vMEMORY[0x1895B3334](v2 - 64) = v62;
      }

      else
      {
        uint64_t v61 = *((void *)a2 + 20);
        *((_DWORD *)a2 + 42) = v60 + 1;
        int64_t v62 = *(wireless_diagnostics::google::protobuf::FieldDescriptorProto **)(v61 + 8 * v60);
      }

      wireless_diagnostics::google::protobuf::FieldDescriptor::CopyTo( (wireless_diagnostics::google::protobuf::FieldDescriptor *)(v58 + v56),  v62);
      ++v57;
      v56 += 120LL;
    }

    while (v57 < *((int *)this + 30));
  }

  uint64_t v65 = *((void *)this + 17);
  if (v65 != wireless_diagnostics::google::protobuf::FileOptions::default_instance(v7, v8, v9, v10))
  {
    *((_DWORD *)a2 + 51) |= 0x200u;
    std::string v66 = (wireless_diagnostics::google::protobuf::FileOptions *)*((void *)a2 + 23);
    if (!v66)
    {
      std::string v66 = (wireless_diagnostics::google::protobuf::FileOptions *)operator new(0x70uLL);
      wireless_diagnostics::google::protobuf::FileOptions::FileOptions(v66);
      *((void *)a2 + 23) = v66;
    }

    wireless_diagnostics::google::protobuf::FileOptions::CopyFrom( v66,  *((const wireless_diagnostics::google::protobuf::FileOptions **)this + 17));
  }

void sub_187C45B30(_Unwind_Exception *a1)
{
}

void wireless_diagnostics::google::protobuf::Descriptor::CopyTo( wireless_diagnostics::google::protobuf::Descriptor *this, wireless_diagnostics::google::protobuf::DescriptorProto *a2)
{
  int v4 = *(const std::string **)this;
  *((_DWORD *)a2 + 39) |= 1u;
  BOOL v5 = (std::string *)*((void *)a2 + 2);
  if (v5 == (std::string *)MEMORY[0x189616DE8])
  {
    BOOL v5 = (std::string *)operator new(0x18uLL);
    v5->__r_.__value_.__l.__size_ = 0LL;
    v5->__r_.__value_.__l.__cap_ = 0LL;
    v5->__r_.__value_.__r.__words[0] = 0LL;
    *((void *)a2 + 2) = v5;
  }

  uint64_t v6 = (wireless_diagnostics::google::protobuf::MessageOptions *)std::string::operator=(v5, v4);
  if (*((int *)this + 11) >= 1)
  {
    uint64_t v10 = 0LL;
    uint64_t v11 = 0LL;
    do
    {
      uint64_t v12 = *((void *)this + 6);
      int v13 = *((_DWORD *)a2 + 9);
      uint64_t v14 = *((int *)a2 + 8);
      if ((int)v14 >= v13)
      {
        if (v13 == *((_DWORD *)a2 + 10))
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((wireless_diagnostics::google::protobuf::DescriptorProto *)((char *)a2 + 24));
          int v13 = *((_DWORD *)a2 + 9);
        }

        *((_DWORD *)a2 + 9) = v13 + 1;
        uint64_t v16 = wireless_diagnostics::google::protobuf::internal::GenericTypeHandler<wireless_diagnostics::google::protobuf::FieldDescriptorProto>::New();
        uint64_t v17 = *((void *)a2 + 3);
        uint64_t v18 = *((int *)a2 + 8);
        *((_DWORD *)a2 + 8) = v18 + 1;
        *(void *)(v17 + 8 * v18) = v16;
      }

      else
      {
        uint64_t v15 = *((void *)a2 + 3);
        *((_DWORD *)a2 + 8) = v14 + 1;
        uint64_t v16 = *(wireless_diagnostics::google::protobuf::FieldDescriptorProto **)(v15 + 8 * v14);
      }

      wireless_diagnostics::google::protobuf::FieldDescriptor::CopyTo( (wireless_diagnostics::google::protobuf::FieldDescriptor *)(v12 + v10),  v16);
      ++v11;
      v10 += 120LL;
    }

    while (v11 < *((int *)this + 11));
  }

  if (*((int *)this + 14) >= 1)
  {
    uint64_t v19 = 0LL;
    uint64_t v20 = 0LL;
    do
    {
      uint64_t v21 = *((void *)this + 8);
      int v22 = *((_DWORD *)a2 + 21);
      uint64_t v23 = *((int *)a2 + 20);
      if ((int)v23 >= v22)
      {
        if (v22 == *((_DWORD *)a2 + 22))
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((wireless_diagnostics::google::protobuf::DescriptorProto *)((char *)a2 + 72));
          int v22 = *((_DWORD *)a2 + 21);
        }

        *((_DWORD *)a2 + 21) = v22 + 1;
        uint64_t v25 = wireless_diagnostics::google::protobuf::internal::GenericTypeHandler<wireless_diagnostics::google::protobuf::DescriptorProto>::New();
        uint64_t v26 = *((void *)a2 + 9);
        uint64_t v27 = *((int *)a2 + 20);
        *((_DWORD *)a2 + 20) = v27 + 1;
        *(void *)(v26 + 8 * v27) = v25;
      }

      else
      {
        uint64_t v24 = *((void *)a2 + 9);
        *((_DWORD *)a2 + 20) = v23 + 1;
        uint64_t v25 = *(wireless_diagnostics::google::protobuf::DescriptorProto **)(v24 + 8 * v23);
      }

      uint64_t v6 = (wireless_diagnostics::google::protobuf::MessageOptions *)wireless_diagnostics::google::protobuf::Descriptor::CopyTo( (wireless_diagnostics::google::protobuf::Descriptor *)(v21 + v19),  v25);
      ++v20;
      v19 += 120LL;
    }

    while (v20 < *((int *)this + 14));
  }

  if (*((int *)this + 18) >= 1)
  {
    uint64_t v28 = 0LL;
    uint64_t v29 = 0LL;
    do
    {
      uint64_t v30 = *((void *)this + 10);
      int v31 = *((_DWORD *)a2 + 27);
      uint64_t v32 = *((int *)a2 + 26);
      if ((int)v32 >= v31)
      {
        if (v31 == *((_DWORD *)a2 + 28))
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((wireless_diagnostics::google::protobuf::DescriptorProto *)((char *)a2 + 96));
          int v31 = *((_DWORD *)a2 + 27);
        }

        *((_DWORD *)a2 + 27) = v31 + 1;
        uint64_t v34 = wireless_diagnostics::google::protobuf::internal::GenericTypeHandler<wireless_diagnostics::google::protobuf::EnumDescriptorProto>::New();
        uint64_t v35 = *((void *)a2 + 12);
        uint64_t v36 = *((int *)a2 + 26);
        *((_DWORD *)a2 + 26) = v36 + 1;
        *(void *)(v35 + 8 * v36) = v34;
      }

      else
      {
        uint64_t v33 = *((void *)a2 + 12);
        *((_DWORD *)a2 + 26) = v32 + 1;
        uint64_t v34 = *(wireless_diagnostics::google::protobuf::EnumDescriptorProto **)(v33 + 8 * v32);
      }

      wireless_diagnostics::google::protobuf::EnumDescriptor::CopyTo( (wireless_diagnostics::google::protobuf::EnumDescriptor *)(v30 + v28),  v34);
      ++v29;
      v28 += 56LL;
    }

    while (v29 < *((int *)this + 18));
  }

  if (*((int *)this + 22) >= 1)
  {
    uint64_t v37 = 0LL;
    uint64_t v38 = 0LL;
    do
    {
      int v39 = *((_DWORD *)a2 + 33);
      uint64_t v40 = *((int *)a2 + 32);
      if ((int)v40 >= v39)
      {
        if (v39 == *((_DWORD *)a2 + 34))
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((wireless_diagnostics::google::protobuf::DescriptorProto *)((char *)a2 + 120));
          int v39 = *((_DWORD *)a2 + 33);
        }

        *((_DWORD *)a2 + 33) = v39 + 1;
        uint64_t v6 = wireless_diagnostics::google::protobuf::internal::GenericTypeHandler<wireless_diagnostics::google::protobuf::DescriptorProto_ExtensionRange>::New();
        uint64_t v42 = *((void *)a2 + 15);
        uint64_t v43 = *((int *)a2 + 32);
        *((_DWORD *)a2 + 32) = v43 + 1;
        *(void *)(v42 + 8 * v43) = v6;
      }

      else
      {
        uint64_t v41 = *((void *)a2 + 15);
        *((_DWORD *)a2 + 32) = v40 + 1;
        uint64_t v6 = *(wireless_diagnostics::google::protobuf::MessageOptions **)(v41 + 8 * v40);
      }

      uint64_t v44 = (int *)(*((void *)this + 12) + v37);
      int v45 = *v44;
      int v46 = *((_DWORD *)v6 + 7);
      *((_DWORD *)v6 + 7) = v46 | 1;
      LODWORD(v44) = v44[1];
      *((_DWORD *)v6 + 7) = v46 | 3;
      *((_DWORD *)v6 + 4) = v45;
      *((_DWORD *)v6 + 5) = (_DWORD)v44;
      ++v38;
      v37 += 8LL;
    }

    while (v38 < *((int *)this + 22));
  }

  if (*((int *)this + 26) >= 1)
  {
    uint64_t v47 = 0LL;
    uint64_t v48 = 0LL;
    do
    {
      uint64_t v49 = *((void *)this + 14);
      int v50 = *((_DWORD *)a2 + 15);
      uint64_t v51 = *((int *)a2 + 14);
      if ((int)v51 >= v50)
      {
        if (v50 == *((_DWORD *)a2 + 16))
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((wireless_diagnostics::google::protobuf::DescriptorProto *)((char *)a2 + 48));
          int v50 = *((_DWORD *)a2 + 15);
        }

        *((_DWORD *)a2 + 15) = v50 + 1;
        uint64_t v53 = wireless_diagnostics::google::protobuf::internal::GenericTypeHandler<wireless_diagnostics::google::protobuf::FieldDescriptorProto>::New();
        uint64_t v54 = *((void *)a2 + 6);
        uint64_t v55 = *((int *)a2 + 14);
        *((_DWORD *)a2 + 14) = v55 + 1;
        *(void *)(v54 + 8 * v55) = v53;
      }

      else
      {
        uint64_t v52 = *((void *)a2 + 6);
        *((_DWORD *)a2 + 14) = v51 + 1;
        uint64_t v53 = *(wireless_diagnostics::google::protobuf::FieldDescriptorProto **)(v52 + 8 * v51);
      }

      wireless_diagnostics::google::protobuf::FieldDescriptor::CopyTo( (wireless_diagnostics::google::protobuf::FieldDescriptor *)(v49 + v47),  v53);
      ++v48;
      v47 += 120LL;
    }

    while (v48 < *((int *)this + 26));
  }

  uint64_t v56 = *((void *)this + 4);
  if (v56 != wireless_diagnostics::google::protobuf::MessageOptions::default_instance(v6, v7, v8, v9))
  {
    *((_DWORD *)a2 + 39) |= 0x40u;
    uint64_t v57 = (wireless_diagnostics::google::protobuf::MessageOptions *)*((void *)a2 + 18);
    if (!v57)
    {
      uint64_t v57 = (wireless_diagnostics::google::protobuf::MessageOptions *)operator new(0x50uLL);
      wireless_diagnostics::google::protobuf::MessageOptions::MessageOptions(v57);
      *((void *)a2 + 18) = v57;
    }

    wireless_diagnostics::google::protobuf::MessageOptions::CopyFrom( v57,  *((const wireless_diagnostics::google::protobuf::MessageOptions **)this + 4));
  }

void sub_187C45F2C(_Unwind_Exception *a1)
{
}

void wireless_diagnostics::google::protobuf::EnumDescriptor::CopyTo( wireless_diagnostics::google::protobuf::EnumDescriptor *this, wireless_diagnostics::google::protobuf::EnumDescriptorProto *a2)
{
  int v4 = *(const std::string **)this;
  *((_DWORD *)a2 + 15) |= 1u;
  BOOL v5 = (std::string *)*((void *)a2 + 2);
  if (v5 == (std::string *)MEMORY[0x189616DE8])
  {
    BOOL v5 = (std::string *)operator new(0x18uLL);
    v5->__r_.__value_.__l.__size_ = 0LL;
    v5->__r_.__value_.__l.__cap_ = 0LL;
    v5->__r_.__value_.__r.__words[0] = 0LL;
    *((void *)a2 + 2) = v5;
  }

  uint64_t v6 = std::string::operator=(v5, v4);
  if (*((int *)this + 11) >= 1)
  {
    uint64_t v10 = 0LL;
    uint64_t v11 = 0LL;
    do
    {
      uint64_t v12 = *((void *)this + 6);
      int v13 = *((_DWORD *)a2 + 9);
      uint64_t v14 = *((int *)a2 + 8);
      if ((int)v14 >= v13)
      {
        if (v13 == *((_DWORD *)a2 + 10))
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((wireless_diagnostics::google::protobuf::EnumDescriptorProto *)((char *)a2 + 24));
          int v13 = *((_DWORD *)a2 + 9);
        }

        *((_DWORD *)a2 + 9) = v13 + 1;
        uint64_t v16 = wireless_diagnostics::google::protobuf::internal::GenericTypeHandler<wireless_diagnostics::google::protobuf::EnumValueDescriptorProto>::New();
        uint64_t v17 = *((void *)a2 + 3);
        uint64_t v18 = *((int *)a2 + 8);
        *((_DWORD *)a2 + 8) = v18 + 1;
        *(void *)(v17 + 8 * v18) = v16;
      }

      else
      {
        uint64_t v15 = *((void *)a2 + 3);
        *((_DWORD *)a2 + 8) = v14 + 1;
        uint64_t v16 = *(wireless_diagnostics::google::protobuf::EnumValueDescriptorProto **)(v15 + 8 * v14);
      }

      wireless_diagnostics::google::protobuf::EnumValueDescriptor::CopyTo( (wireless_diagnostics::google::protobuf::EnumValueDescriptor *)(v12 + v10),  v16);
      ++v11;
      v10 += 40LL;
    }

    while (v11 < *((int *)this + 11));
  }

  uint64_t v19 = *((void *)this + 4);
  if (v19 != wireless_diagnostics::google::protobuf::EnumOptions::default_instance( (wireless_diagnostics::google::protobuf::EnumOptions *)v6,  v7,  v8,  v9))
  {
    *((_DWORD *)a2 + 15) |= 4u;
    uint64_t v20 = (wireless_diagnostics::google::protobuf::EnumOptions *)*((void *)a2 + 6);
    if (!v20)
    {
      uint64_t v20 = (wireless_diagnostics::google::protobuf::EnumOptions *)operator new(0x50uLL);
      wireless_diagnostics::google::protobuf::EnumOptions::EnumOptions(v20);
      *((void *)a2 + 6) = v20;
    }

    wireless_diagnostics::google::protobuf::EnumOptions::CopyFrom( v20,  *((const wireless_diagnostics::google::protobuf::EnumOptions **)this + 4));
  }

void sub_187C460A0(_Unwind_Exception *a1)
{
}

void wireless_diagnostics::google::protobuf::ServiceDescriptor::CopyTo( wireless_diagnostics::google::protobuf::ServiceDescriptor *this, wireless_diagnostics::google::protobuf::ServiceDescriptorProto *a2)
{
  int v4 = *(const std::string **)this;
  *((_DWORD *)a2 + 15) |= 1u;
  BOOL v5 = (std::string *)*((void *)a2 + 2);
  if (v5 == (std::string *)MEMORY[0x189616DE8])
  {
    BOOL v5 = (std::string *)operator new(0x18uLL);
    v5->__r_.__value_.__l.__size_ = 0LL;
    v5->__r_.__value_.__l.__cap_ = 0LL;
    v5->__r_.__value_.__r.__words[0] = 0LL;
    *((void *)a2 + 2) = v5;
  }

  uint64_t v6 = std::string::operator=(v5, v4);
  if (*((int *)this + 8) >= 1)
  {
    uint64_t v10 = 0LL;
    uint64_t v11 = 0LL;
    do
    {
      uint64_t v12 = *((void *)this + 5);
      int v13 = *((_DWORD *)a2 + 9);
      uint64_t v14 = *((int *)a2 + 8);
      if ((int)v14 >= v13)
      {
        if (v13 == *((_DWORD *)a2 + 10))
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((wireless_diagnostics::google::protobuf::ServiceDescriptorProto *)((char *)a2 + 24));
          int v13 = *((_DWORD *)a2 + 9);
        }

        *((_DWORD *)a2 + 9) = v13 + 1;
        uint64_t v16 = wireless_diagnostics::google::protobuf::internal::GenericTypeHandler<wireless_diagnostics::google::protobuf::MethodDescriptorProto>::New();
        uint64_t v17 = *((void *)a2 + 3);
        uint64_t v18 = *((int *)a2 + 8);
        *((_DWORD *)a2 + 8) = v18 + 1;
        *(void *)(v17 + 8 * v18) = v16;
      }

      else
      {
        uint64_t v15 = *((void *)a2 + 3);
        *((_DWORD *)a2 + 8) = v14 + 1;
        uint64_t v16 = *(wireless_diagnostics::google::protobuf::MethodDescriptorProto **)(v15 + 8 * v14);
      }

      wireless_diagnostics::google::protobuf::MethodDescriptor::CopyTo( (wireless_diagnostics::google::protobuf::MethodDescriptor *)(v12 + v10),  v16);
      ++v11;
      v10 += 48LL;
    }

    while (v11 < *((int *)this + 8));
  }

  uint64_t v19 = *((void *)this + 3);
  if (v19 != wireless_diagnostics::google::protobuf::ServiceOptions::default_instance( (wireless_diagnostics::google::protobuf::ServiceOptions *)v6,  v7,  v8,  v9))
  {
    *((_DWORD *)a2 + 15) |= 4u;
    uint64_t v20 = (wireless_diagnostics::google::protobuf::ServiceOptions *)*((void *)a2 + 6);
    if (!v20)
    {
      uint64_t v20 = (wireless_diagnostics::google::protobuf::ServiceOptions *)operator new(0x48uLL);
      wireless_diagnostics::google::protobuf::ServiceOptions::ServiceOptions(v20);
      *((void *)a2 + 6) = v20;
    }

    wireless_diagnostics::google::protobuf::ServiceOptions::CopyFrom( v20,  *((const wireless_diagnostics::google::protobuf::ServiceOptions **)this + 3));
  }

void sub_187C46214(_Unwind_Exception *a1)
{
}

void wireless_diagnostics::google::protobuf::FieldDescriptor::CopyTo( wireless_diagnostics::google::protobuf::FieldDescriptor *this, wireless_diagnostics::google::protobuf::FieldDescriptorProto *a2)
{
  int v4 = *(const std::string **)this;
  *((_DWORD *)a2 + 18) |= 1u;
  BOOL v5 = (std::string *)*((void *)a2 + 2);
  uint64_t v6 = (std::string *)MEMORY[0x189616DE8];
  if (v5 == (std::string *)MEMORY[0x189616DE8])
  {
    BOOL v5 = (std::string *)operator new(0x18uLL);
    v5->__r_.__value_.__l.__size_ = 0LL;
    v5->__r_.__value_.__l.__cap_ = 0LL;
    v5->__r_.__value_.__r.__words[0] = 0LL;
    *((void *)a2 + 2) = v5;
  }

  uint64_t v7 = std::string::operator=(v5, v4);
  int v11 = *((_DWORD *)a2 + 18);
  *((_DWORD *)a2 + 6) = *((_DWORD *)this + 10);
  *((_DWORD *)a2 + 7) = *((_DWORD *)this + 12);
  int v12 = *((_DWORD *)this + 11);
  int v13 = v11 | 0xE;
  *((_DWORD *)a2 + 18) = v11 | 0xE;
  *((_DWORD *)a2 + 16) = v12;
  if (*((_BYTE *)this + 52))
  {
    if (!*(_BYTE *)(*((void *)this + 7) + 41LL))
    {
      *((_DWORD *)a2 + 18) = v11 | 0x2E;
      if (*((std::string **)a2 + 5) == v6)
      {
        uint64_t v14 = operator new(0x18uLL);
        v14[1] = 0LL;
        void v14[2] = 0LL;
        void *v14 = 0LL;
        *((void *)a2 + 5) = v14;
      }

      MEMORY[0x1895B3A84]();
      int v13 = *((_DWORD *)a2 + 18);
    }

    *((_DWORD *)a2 + 18) = v13 | 0x20;
    uint64_t v15 = (std::string *)*((void *)a2 + 5);
    if (v15 == v6)
    {
      uint64_t v15 = (std::string *)operator new(0x18uLL);
      v15->__r_.__value_.__l.__size_ = 0LL;
      v15->__r_.__value_.__l.__cap_ = 0LL;
      v15->__r_.__value_.__r.__words[0] = 0LL;
      *((void *)a2 + 5) = v15;
    }

    uint64_t v16 = *(void *)(*((void *)this + 7) + 8LL);
    int v17 = *(char *)(v16 + 23);
    if (v17 >= 0) {
      uint64_t v18 = *(const std::string::value_type **)(*((void *)this + 7) + 8LL);
    }
    else {
      uint64_t v18 = *(const std::string::value_type **)v16;
    }
    if (v17 >= 0) {
      std::string::size_type v19 = *(unsigned __int8 *)(v16 + 23);
    }
    else {
      std::string::size_type v19 = *(void *)(v16 + 8);
    }
    uint64_t v7 = std::string::append(v15, v18, v19);
    int v12 = *((_DWORD *)this + 11);
  }

  int v20 = wireless_diagnostics::google::protobuf::FieldDescriptor::kTypeToCppTypeMap[v12];
  if (v20 == 8)
  {
    int v26 = *((_DWORD *)a2 + 18);
    if (!*(_BYTE *)(*((void *)this + 10) + 41LL))
    {
      *((_DWORD *)a2 + 18) = v26 | 0x10;
      if (*((std::string **)a2 + 4) == v6)
      {
        uint64_t v27 = operator new(0x18uLL);
        v27[1] = 0LL;
        v27[2] = 0LL;
        void *v27 = 0LL;
        *((void *)a2 + 4) = v27;
      }

      MEMORY[0x1895B3A84]();
      int v26 = *((_DWORD *)a2 + 18);
    }

    *((_DWORD *)a2 + 18) = v26 | 0x10;
    uint64_t v24 = (std::string *)*((void *)a2 + 4);
    if (v24 == v6)
    {
      uint64_t v24 = (std::string *)operator new(0x18uLL);
      v24->__r_.__value_.__l.__size_ = 0LL;
      v24->__r_.__value_.__l.__cap_ = 0LL;
      v24->__r_.__value_.__r.__words[0] = 0LL;
      *((void *)a2 + 4) = v24;
    }

    uint64_t v25 = *((void *)this + 10);
  }

  else
  {
    if (v20 != 10) {
      goto LABEL_42;
    }
    uint64_t v21 = *((void *)this + 9);
    int v22 = *((_DWORD *)a2 + 18);
    if (*(_BYTE *)(v21 + 40))
    {
      *((_DWORD *)a2 + 16) = 1;
      v22 &= ~8u;
      *((_DWORD *)a2 + 18) = v22;
    }

    if (!*(_BYTE *)(v21 + 41))
    {
      *((_DWORD *)a2 + 18) = v22 | 0x10;
      if (*((std::string **)a2 + 4) == v6)
      {
        uint64_t v23 = operator new(0x18uLL);
        v23[1] = 0LL;
        v23[2] = 0LL;
        *uint64_t v23 = 0LL;
        *((void *)a2 + 4) = v23;
      }

      MEMORY[0x1895B3A84]();
      int v22 = *((_DWORD *)a2 + 18);
    }

    *((_DWORD *)a2 + 18) = v22 | 0x10;
    uint64_t v24 = (std::string *)*((void *)a2 + 4);
    if (v24 == v6)
    {
      uint64_t v24 = (std::string *)operator new(0x18uLL);
      v24->__r_.__value_.__l.__size_ = 0LL;
      v24->__r_.__value_.__l.__cap_ = 0LL;
      v24->__r_.__value_.__r.__words[0] = 0LL;
      *((void *)a2 + 4) = v24;
    }

    uint64_t v25 = *((void *)this + 9);
  }

  uint64_t v28 = *(void *)(v25 + 8);
  int v29 = *(char *)(v28 + 23);
  if (v29 >= 0) {
    uint64_t v30 = (const std::string::value_type *)v28;
  }
  else {
    uint64_t v30 = *(const std::string::value_type **)v28;
  }
  if (v29 >= 0) {
    std::string::size_type v31 = *(unsigned __int8 *)(v28 + 23);
  }
  else {
    std::string::size_type v31 = *(void *)(v28 + 8);
  }
  uint64_t v7 = std::string::append(v24, v30, v31);
LABEL_42:
  if (*((_BYTE *)this + 104))
  {
    wireless_diagnostics::google::protobuf::FieldDescriptor::DefaultValueAsString(this, 0LL, v9, &__str);
    *((_DWORD *)a2 + 18) |= 0x40u;
    uint64_t v32 = (std::string *)*((void *)a2 + 6);
    if (v32 == v6)
    {
      uint64_t v32 = (std::string *)operator new(0x18uLL);
      v32->__r_.__value_.__r.__words[0] = 0LL;
      v32->__r_.__value_.__l.__size_ = 0LL;
      v32->__r_.__value_.__l.__cap_ = 0LL;
      *((void *)a2 + 6) = v32;
    }

    uint64_t v7 = std::string::operator=(v32, &__str);
  }

  uint64_t v33 = *((void *)this + 12);
  if (v33 != wireless_diagnostics::google::protobuf::FieldOptions::default_instance( (wireless_diagnostics::google::protobuf::FieldOptions *)v7,  v8,  (uint64_t)v9,  v10))
  {
    *((_DWORD *)a2 + 18) |= 0x80u;
    uint64_t v34 = (wireless_diagnostics::google::protobuf::FieldOptions *)*((void *)a2 + 7);
    if (!v34)
    {
      uint64_t v34 = (wireless_diagnostics::google::protobuf::FieldOptions *)operator new(0x58uLL);
      wireless_diagnostics::google::protobuf::FieldOptions::FieldOptions(v34);
      *((void *)a2 + 7) = v34;
    }

    wireless_diagnostics::google::protobuf::FieldOptions::CopyFrom( v34,  *((const wireless_diagnostics::google::protobuf::FieldOptions **)this + 12));
  }

void sub_187C4653C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
}

void wireless_diagnostics::google::protobuf::FileDescriptor::CopySourceCodeInfoTo( wireless_diagnostics::google::protobuf::FileDescriptor *this, wireless_diagnostics::google::protobuf::FileDescriptorProto *a2, uint64_t a3, const char *a4)
{
  uint64_t v6 = *((void *)this + 19);
  if (v6 != wireless_diagnostics::google::protobuf::SourceCodeInfo::default_instance(this, (uint64_t)a2, a3, a4))
  {
    *((_DWORD *)a2 + 51) |= 0x400u;
    uint64_t v7 = (wireless_diagnostics::google::protobuf::SourceCodeInfo *)*((void *)a2 + 24);
    if (!v7)
    {
      uint64_t v7 = (wireless_diagnostics::google::protobuf::SourceCodeInfo *)operator new(0x30uLL);
      wireless_diagnostics::google::protobuf::SourceCodeInfo::SourceCodeInfo(v7);
      *((void *)a2 + 24) = v7;
    }

    wireless_diagnostics::google::protobuf::SourceCodeInfo::CopyFrom( v7,  *((const wireless_diagnostics::google::protobuf::SourceCodeInfo **)this + 19));
  }

void sub_187C465DC(_Unwind_Exception *a1)
{
}

void wireless_diagnostics::google::protobuf::EnumValueDescriptor::CopyTo( wireless_diagnostics::google::protobuf::EnumValueDescriptor *this, wireless_diagnostics::google::protobuf::EnumValueDescriptorProto *a2)
{
  int v4 = *(const std::string **)this;
  *((_DWORD *)a2 + 10) |= 1u;
  BOOL v5 = (std::string *)*((void *)a2 + 2);
  if (v5 == (std::string *)MEMORY[0x189616DE8])
  {
    BOOL v5 = (std::string *)operator new(0x18uLL);
    v5->__r_.__value_.__l.__size_ = 0LL;
    v5->__r_.__value_.__l.__cap_ = 0LL;
    v5->__r_.__value_.__r.__words[0] = 0LL;
    *((void *)a2 + 2) = v5;
  }

  uint64_t v6 = std::string::operator=(v5, v4);
  int v7 = *((_DWORD *)this + 4);
  *((_DWORD *)a2 + 10) |= 2u;
  *((_DWORD *)a2 + 8) = v7;
  uint64_t v8 = *((void *)this + 4);
  if (v8 != wireless_diagnostics::google::protobuf::EnumValueOptions::default_instance( (wireless_diagnostics::google::protobuf::EnumValueOptions *)v6,  v9,  v10,  v11))
  {
    *((_DWORD *)a2 + 10) |= 4u;
    int v12 = (wireless_diagnostics::google::protobuf::EnumValueOptions *)*((void *)a2 + 3);
    if (!v12)
    {
      int v12 = (wireless_diagnostics::google::protobuf::EnumValueOptions *)operator new(0x48uLL);
      wireless_diagnostics::google::protobuf::EnumValueOptions::EnumValueOptions(v12);
      *((void *)a2 + 3) = v12;
    }

    wireless_diagnostics::google::protobuf::EnumValueOptions::CopyFrom( v12,  *((const wireless_diagnostics::google::protobuf::EnumValueOptions **)this + 4));
  }

void sub_187C466BC(_Unwind_Exception *a1)
{
}

void wireless_diagnostics::google::protobuf::MethodDescriptor::CopyTo( wireless_diagnostics::google::protobuf::MethodDescriptor *this, wireless_diagnostics::google::protobuf::MethodDescriptorProto *a2)
{
  int v4 = *(const std::string **)this;
  *((_DWORD *)a2 + 13) |= 1u;
  BOOL v5 = (std::string *)*((void *)a2 + 2);
  uint64_t v6 = (std::string *)MEMORY[0x189616DE8];
  if (v5 == (std::string *)MEMORY[0x189616DE8])
  {
    BOOL v5 = (std::string *)operator new(0x18uLL);
    v5->__r_.__value_.__l.__size_ = 0LL;
    v5->__r_.__value_.__l.__cap_ = 0LL;
    v5->__r_.__value_.__r.__words[0] = 0LL;
    *((void *)a2 + 2) = v5;
  }

  std::string::operator=(v5, v4);
  if (!*(_BYTE *)(*((void *)this + 3) + 41LL))
  {
    *((_DWORD *)a2 + 13) |= 2u;
    if (*((std::string **)a2 + 3) == v6)
    {
      int v7 = operator new(0x18uLL);
      v7[1] = 0LL;
      std::string v7[2] = 0LL;
      *int v7 = 0LL;
      *((void *)a2 + 3) = v7;
    }

    MEMORY[0x1895B3A84]();
  }

  *((_DWORD *)a2 + 13) |= 2u;
  uint64_t v8 = (std::string *)*((void *)a2 + 3);
  if (v8 == v6)
  {
    uint64_t v8 = (std::string *)operator new(0x18uLL);
    v8->__r_.__value_.__l.__size_ = 0LL;
    v8->__r_.__value_.__l.__cap_ = 0LL;
    v8->__r_.__value_.__r.__words[0] = 0LL;
    *((void *)a2 + 3) = v8;
  }

  uint64_t v9 = *(void *)(*((void *)this + 3) + 8LL);
  int v10 = *(char *)(v9 + 23);
  if (v10 >= 0) {
    int v11 = *(const std::string::value_type **)(*((void *)this + 3) + 8LL);
  }
  else {
    int v11 = *(const std::string::value_type **)v9;
  }
  if (v10 >= 0) {
    std::string::size_type v12 = *(unsigned __int8 *)(v9 + 23);
  }
  else {
    std::string::size_type v12 = *(void *)(v9 + 8);
  }
  std::string::append(v8, v11, v12);
  if (!*(_BYTE *)(*((void *)this + 4) + 41LL))
  {
    *((_DWORD *)a2 + 13) |= 4u;
    if (*((std::string **)a2 + 4) == v6)
    {
      int v13 = operator new(0x18uLL);
      v13[1] = 0LL;
      v13[2] = 0LL;
      void *v13 = 0LL;
      *((void *)a2 + 4) = v13;
    }

    MEMORY[0x1895B3A84]();
  }

  *((_DWORD *)a2 + 13) |= 4u;
  uint64_t v14 = (std::string *)*((void *)a2 + 4);
  if (v14 == v6)
  {
    uint64_t v14 = (std::string *)operator new(0x18uLL);
    v14->__r_.__value_.__l.__size_ = 0LL;
    v14->__r_.__value_.__l.__cap_ = 0LL;
    v14->__r_.__value_.__r.__words[0] = 0LL;
    *((void *)a2 + 4) = v14;
  }

  uint64_t v15 = *(void *)(*((void *)this + 4) + 8LL);
  int v16 = *(char *)(v15 + 23);
  if (v16 >= 0) {
    int v17 = *(const std::string::value_type **)(*((void *)this + 4) + 8LL);
  }
  else {
    int v17 = *(const std::string::value_type **)v15;
  }
  if (v16 >= 0) {
    std::string::size_type v18 = *(unsigned __int8 *)(v15 + 23);
  }
  else {
    std::string::size_type v18 = *(void *)(v15 + 8);
  }
  std::string::size_type v19 = std::string::append(v14, v17, v18);
  uint64_t v20 = *((void *)this + 5);
  if (v20 != wireless_diagnostics::google::protobuf::MethodOptions::default_instance( (wireless_diagnostics::google::protobuf::MethodOptions *)v19,  v21,  v22,  v23))
  {
    *((_DWORD *)a2 + 13) |= 8u;
    uint64_t v24 = (wireless_diagnostics::google::protobuf::MethodOptions *)*((void *)a2 + 5);
    if (!v24)
    {
      uint64_t v24 = (wireless_diagnostics::google::protobuf::MethodOptions *)operator new(0x48uLL);
      wireless_diagnostics::google::protobuf::MethodOptions::MethodOptions(v24);
      *((void *)a2 + 5) = v24;
    }

    wireless_diagnostics::google::protobuf::MethodOptions::CopyFrom( v24,  *((const wireless_diagnostics::google::protobuf::MethodOptions **)this + 5));
  }

void sub_187C468B0(_Unwind_Exception *a1)
{
}

void wireless_diagnostics::google::protobuf::FileDescriptor::DebugString( wireless_diagnostics::google::protobuf::FileDescriptor *this@<X0>, std::string *a2@<X8>)
{
  uint64_t v89 = *MEMORY[0x1895F89C0];
  std::string::basic_string[abi:ne180100]<0>(a2, "syntax = proto2;\n\n");
  v68[0] = 0LL;
  v68[1] = 0LL;
  v66[1] = 0LL;
  uint64_t v67 = (uint64_t *)v68;
  uint64_t v65 = (uint64_t *)v66;
  v66[0] = 0LL;
  uint64_t v4 = *((int *)this + 10);
  if ((_DWORD)v4)
  {
    BOOL v5 = (int *)*((void *)this + 6);
    uint64_t v6 = 4 * v4;
    do
    {
      std::__tree<int>::__emplace_hint_unique_key_args<int,int const&>(&v67, (uint64_t *)v68, v5, v5);
      ++v5;
      v6 -= 4LL;
    }

    while (v6);
  }

  uint64_t v7 = *((int *)this + 14);
  if ((_DWORD)v7)
  {
    uint64_t v8 = (int *)*((void *)this + 8);
    uint64_t v9 = 4 * v7;
    do
    {
      std::__tree<int>::__emplace_hint_unique_key_args<int,int const&>(&v65, (uint64_t *)v66, v8, v8);
      ++v8;
      v9 -= 4LL;
    }

    while (v9);
  }

  uint64_t v10 = 0LL;
  do
  {
    int v11 = v68[0];
    if (!v68[0])
    {
LABEL_14:
      int v13 = v66[0];
      if (!v66[0])
      {
LABEL_19:
        uint64_t v15 = **(void **)(*((void *)this + 4) + 8 * v10);
        int v16 = *(char *)(v15 + 23);
        uint64_t v17 = *(void *)(v15 + 8);
        if (v16 < 0) {
          uint64_t v15 = *(void *)v15;
        }
        v87 = (void *)v15;
        int v18 = v16;
        if (v16 < 0) {
          int v18 = v17;
        }
        int v88 = v18;
        uint64_t v85 = 0LL;
        int v86 = -1;
        uint64_t v83 = 0LL;
        int v84 = -1;
        uint64_t v81 = 0LL;
        int v82 = -1;
        uint64_t v79 = 0LL;
        int v80 = -1;
        uint64_t v77 = 0LL;
        int v78 = -1;
        uint64_t v75 = 0LL;
        int v76 = -1;
        uint64_t v73 = 0LL;
        int v74 = -1;
        uint64_t v71 = 0LL;
        int v72 = -1;
        uint64_t v69 = 0LL;
        int v70 = -1;
        *(void *)&__int128 v57 = &v75;
        *((void *)&v57 + 1) = &v73;
        wireless_diagnostics::google::protobuf::strings::SubstituteAndAppend( a2,  "import $0;\n",
          (uint64_t)&v87,
          (uint64_t)&v85,
          (uint64_t)&v83,
          (uint64_t)&v81,
          (uint64_t)&v79,
          (uint64_t)&v77,
          v57,
          (uint64_t)&v71,
          (uint64_t)&v69);
        goto LABEL_34;
      }

      while (1)
      {
        uint64_t v14 = *((int *)v13 + 7);
        if (v10 >= v14)
        {
          if (v10 <= v14)
          {
            uint64_t v23 = **(void **)(*((void *)this + 4) + 8 * v10);
            int v24 = *(char *)(v23 + 23);
            uint64_t v25 = *(void *)(v23 + 8);
            if (v24 < 0) {
              uint64_t v23 = *(void *)v23;
            }
            v87 = (void *)v23;
            int v26 = v24;
            if (v24 < 0) {
              int v26 = v25;
            }
            int v88 = v26;
            uint64_t v85 = 0LL;
            int v86 = -1;
            uint64_t v83 = 0LL;
            int v84 = -1;
            uint64_t v81 = 0LL;
            int v82 = -1;
            uint64_t v79 = 0LL;
            int v80 = -1;
            uint64_t v77 = 0LL;
            int v78 = -1;
            uint64_t v75 = 0LL;
            int v76 = -1;
            uint64_t v73 = 0LL;
            int v74 = -1;
            uint64_t v71 = 0LL;
            int v72 = -1;
            uint64_t v69 = 0LL;
            int v70 = -1;
            *(void *)&__int128 v59 = &v75;
            *((void *)&v59 + 1) = &v73;
            wireless_diagnostics::google::protobuf::strings::SubstituteAndAppend( a2,  "import weak $0;\n",
              (uint64_t)&v87,
              (uint64_t)&v85,
              (uint64_t)&v83,
              (uint64_t)&v81,
              (uint64_t)&v79,
              (uint64_t)&v77,
              v59,
              (uint64_t)&v71,
              (uint64_t)&v69);
            goto LABEL_34;
          }

          ++v13;
        }

        int v13 = (void *)*v13;
        if (!v13) {
          goto LABEL_19;
        }
      }
    }

    while (1)
    {
      uint64_t v12 = *((int *)v11 + 7);
      if (v10 >= v12) {
        break;
      }
LABEL_13:
      int v11 = (void *)*v11;
      if (!v11) {
        goto LABEL_14;
      }
    }

    if (v10 > v12)
    {
      ++v11;
      goto LABEL_13;
    }

    uint64_t v19 = **(void **)(*((void *)this + 4) + 8 * v10);
    int v20 = *(char *)(v19 + 23);
    uint64_t v21 = *(void *)(v19 + 8);
    if (v20 < 0) {
      uint64_t v19 = *(void *)v19;
    }
    v87 = (void *)v19;
    int v22 = v20;
    if (v20 < 0) {
      int v22 = v21;
    }
    int v88 = v22;
    uint64_t v85 = 0LL;
    int v86 = -1;
    uint64_t v83 = 0LL;
    int v84 = -1;
    uint64_t v81 = 0LL;
    int v82 = -1;
    uint64_t v79 = 0LL;
    int v80 = -1;
    uint64_t v77 = 0LL;
    int v78 = -1;
    uint64_t v75 = 0LL;
    int v76 = -1;
    uint64_t v73 = 0LL;
    int v74 = -1;
    uint64_t v71 = 0LL;
    int v72 = -1;
    uint64_t v69 = 0LL;
    int v70 = -1;
    *(void *)&__int128 v58 = &v75;
    *((void *)&v58 + 1) = &v73;
    wireless_diagnostics::google::protobuf::strings::SubstituteAndAppend( a2,  "import public $0;\n",
      (uint64_t)&v87,
      (uint64_t)&v85,
      (uint64_t)&v83,
      (uint64_t)&v81,
      (uint64_t)&v79,
      (uint64_t)&v77,
      v58,
      (uint64_t)&v71,
      (uint64_t)&v69);
LABEL_34:
    ++v10;
  }

  while (v10 < *((int *)this + 6));
LABEL_35:
  uint64_t v27 = *((void *)this + 1);
  int v28 = *(unsigned __int8 *)(v27 + 23);
  if (*(char *)(v27 + 23) < 0)
  {
    if (!*(void *)(v27 + 8)) {
      goto LABEL_45;
    }
  }

  else if (!*(_BYTE *)(v27 + 23))
  {
    goto LABEL_45;
  }

  uint64_t v29 = *(void *)(v27 + 8);
  if ((v28 & 0x80u) != 0) {
    uint64_t v27 = *(void *)v27;
  }
  v87 = (void *)v27;
  if ((v28 & 0x80u) == 0) {
    int v30 = v28;
  }
  else {
    int v30 = v29;
  }
  int v88 = v30;
  uint64_t v85 = 0LL;
  int v86 = -1;
  uint64_t v83 = 0LL;
  int v84 = -1;
  uint64_t v81 = 0LL;
  int v82 = -1;
  uint64_t v79 = 0LL;
  int v80 = -1;
  uint64_t v77 = 0LL;
  int v78 = -1;
  uint64_t v75 = 0LL;
  int v76 = -1;
  uint64_t v73 = 0LL;
  int v74 = -1;
  uint64_t v71 = 0LL;
  int v72 = -1;
  uint64_t v69 = 0LL;
  int v70 = -1;
  *(void *)&__int128 v60 = &v75;
  *((void *)&v60 + 1) = &v73;
  wireless_diagnostics::google::protobuf::strings::SubstituteAndAppend( a2,  "package $0;\n\n",
    (uint64_t)&v87,
    (uint64_t)&v85,
    (uint64_t)&v83,
    (uint64_t)&v81,
    (uint64_t)&v79,
    (uint64_t)&v77,
    v60,
    (uint64_t)&v71,
    (uint64_t)&v69);
LABEL_45:
  {
    std::string::append(a2, "\n");
  }

  if (*((int *)this + 22) >= 1)
  {
    uint64_t v31 = 0LL;
    uint64_t v32 = 0LL;
    do
    {
      wireless_diagnostics::google::protobuf::EnumDescriptor::DebugString((int *)(*((void *)this + 12) + v31), 0, a2);
      std::string::append(a2, "\n");
      ++v32;
      v31 += 56LL;
    }

    while (v32 < *((int *)this + 22));
  }

  v64[0] = 0LL;
  v64[1] = 0LL;
  uint64_t v63 = (uint64_t *)v64;
  int v33 = *((_DWORD *)this + 30);
  if (v33 >= 1)
  {
    uint64_t v34 = 0LL;
    for (uint64_t i = 0LL; i < v33; ++i)
    {
      uint64_t v36 = *((void *)this + 16) + v34;
      if (*(_DWORD *)(v36 + 44) == 10)
      {
        v87 = *(void **)(v36 + 72);
        std::__tree<wireless_diagnostics::google::protobuf::Descriptor const*>::__emplace_unique_key_args<wireless_diagnostics::google::protobuf::Descriptor const*,wireless_diagnostics::google::protobuf::Descriptor const*>( &v63,  (unint64_t *)&v87,  (uint64_t *)&v87);
        int v33 = *((_DWORD *)this + 30);
      }

      v34 += 120LL;
    }
  }

  int v37 = *((_DWORD *)this + 18);
  if (v37 >= 1)
  {
    for (uint64_t j = 0LL; j < v37; ++j)
    {
      unint64_t v39 = *((void *)this + 10) + 120 * j;
      for (k = v64[0]; k; k = (void *)*k)
      {
        unint64_t v41 = k[4];
        if (v39 >= v41)
        {
          if (v41 >= v39) {
            goto LABEL_67;
          }
          ++k;
        }
      }

      uint64_t v42 = *(void **)v39;
      int v43 = *(char *)(*(void *)v39 + 23LL);
      uint64_t v44 = v42[1];
      if (v43 < 0) {
        uint64_t v42 = (void *)*v42;
      }
      v87 = v42;
      int v45 = v43;
      if (v43 < 0) {
        int v45 = v44;
      }
      int v88 = v45;
      uint64_t v85 = 0LL;
      int v86 = -1;
      uint64_t v83 = 0LL;
      int v84 = -1;
      uint64_t v81 = 0LL;
      int v82 = -1;
      uint64_t v79 = 0LL;
      int v80 = -1;
      uint64_t v77 = 0LL;
      int v78 = -1;
      uint64_t v75 = 0LL;
      int v76 = -1;
      uint64_t v73 = 0LL;
      int v74 = -1;
      uint64_t v71 = 0LL;
      int v72 = -1;
      uint64_t v69 = 0LL;
      int v70 = -1;
      *(void *)&__int128 v61 = &v75;
      *((void *)&v61 + 1) = &v73;
      wireless_diagnostics::google::protobuf::strings::SubstituteAndAppend( a2,  "message $0",  (uint64_t)&v87,  (uint64_t)&v85,  (uint64_t)&v83,  (uint64_t)&v81,  (uint64_t)&v79,  (uint64_t)&v77,  v61,  (uint64_t)&v71,  (uint64_t)&v69);
      wireless_diagnostics::google::protobuf::Descriptor::DebugString(*((void *)this + 10) + 120 * j, 0, a2);
      std::string::append(a2, "\n");
      int v37 = *((_DWORD *)this + 18);
LABEL_67:
      ;
    }
  }

  if (*((int *)this + 26) >= 1)
  {
    uint64_t v46 = 0LL;
    uint64_t v47 = 0LL;
    do
    {
      wireless_diagnostics::google::protobuf::ServiceDescriptor::DebugString((int *)(*((void *)this + 14) + v46), a2);
      std::string::append(a2, "\n");
      ++v47;
      v46 += 48LL;
    }

    while (v47 < *((int *)this + 26));
  }

  if (*((int *)this + 30) >= 1)
  {
    uint64_t v48 = 0LL;
    uint64_t v49 = 0LL;
    uint64_t v50 = 56LL;
    do
    {
      uint64_t v51 = *((void *)this + 16);
      if (*(void *)(v51 + v50) != v49)
      {
        uint64_t v49 = *(void *)(v51 + v50);
        if (v50 != 56)
        {
          std::string::append(a2, "}\n\n");
          uint64_t v49 = *(void *)(*((void *)this + 16) + v50);
        }

        uint64_t v52 = *(void *)(v49 + 8);
        int v53 = *(char *)(v52 + 23);
        uint64_t v54 = *(void *)(v52 + 8);
        if (v53 < 0) {
          uint64_t v52 = *(void *)v52;
        }
        v87 = (void *)v52;
        int v55 = v53;
        if (v53 < 0) {
          int v55 = v54;
        }
        int v88 = v55;
        uint64_t v85 = 0LL;
        int v86 = -1;
        uint64_t v83 = 0LL;
        int v84 = -1;
        uint64_t v81 = 0LL;
        int v82 = -1;
        uint64_t v79 = 0LL;
        int v80 = -1;
        uint64_t v77 = 0LL;
        int v78 = -1;
        uint64_t v75 = 0LL;
        int v76 = -1;
        uint64_t v73 = 0LL;
        int v74 = -1;
        uint64_t v71 = 0LL;
        int v72 = -1;
        uint64_t v69 = 0LL;
        int v70 = -1;
        *(void *)&__int128 v62 = &v75;
        *((void *)&v62 + 1) = &v73;
        wireless_diagnostics::google::protobuf::strings::SubstituteAndAppend( a2,  "extend .$0 {\n",  (uint64_t)&v87,  (uint64_t)&v85,  (uint64_t)&v83,  (uint64_t)&v81,  (uint64_t)&v79,  (uint64_t)&v77,  v62,  (uint64_t)&v71,  (uint64_t)&v69);
        uint64_t v51 = *((void *)this + 16);
      }

      wireless_diagnostics::google::protobuf::FieldDescriptor::DebugString(v51 + v50 - 56, 1, a2);
      ++v48;
      uint64_t v56 = *((int *)this + 30);
      v50 += 120LL;
    }

    while (v48 < v56);
  }

  std::__tree<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::__map_value_compare<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::less<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>,true>,std::allocator<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>>>::destroy( (uint64_t)&v63,  v64[0]);
  std::__tree<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::__map_value_compare<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::less<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>,true>,std::allocator<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>>>::destroy( (uint64_t)&v65,  v66[0]);
  std::__tree<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::__map_value_compare<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::less<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>,true>,std::allocator<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>>>::destroy( (uint64_t)&v67,  v68[0]);
}

void sub_187C470C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, void *a15, uint64_t a16, char a17, void *a18, uint64_t a19, char a20, void *a21)
{
}

BOOL wireless_diagnostics::google::protobuf::anonymous namespace'::FormatLineOptions( int a1, const wireless_diagnostics::google::protobuf::Message *a2, std::string *a3)
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  std::string::basic_string[abi:ne180100](&__p, 2 * a1, 32);
  uint64_t v19 = 0LL;
  uint64_t v20 = 0LL;
  uint64_t v21 = 0LL;
  uint64_t v8 = v19;
  uint64_t v7 = v20;
  if (Options)
  {
    if (v20 == v19)
    {
      uint64_t v7 = v19;
    }

    else
    {
      uint64_t v9 = 0LL;
      unint64_t v10 = 0LL;
      do
      {
        int v11 = v24;
        p_p = (void **)__p;
        if ((v24 & 0x80u) == 0) {
          p_p = &__p;
        }
        int v43 = p_p;
        if ((v24 & 0x80u) != 0) {
          int v11 = v23;
        }
        int v44 = v11;
        uint64_t v13 = v8 + v9;
        else {
          uint64_t v14 = *(void *)(v8 + v9);
        }
        uint64_t v41 = v14;
        int v15 = *(unsigned __int8 *)(v13 + 23);
        uint64_t v16 = *(void *)(v13 + 8);
        if ((v15 & 0x80u) == 0) {
          LODWORD(v16) = v15;
        }
        int v42 = v16;
        uint64_t v39 = 0LL;
        int v40 = -1;
        uint64_t v37 = 0LL;
        int v38 = -1;
        uint64_t v35 = 0LL;
        int v36 = -1;
        uint64_t v33 = 0LL;
        int v34 = -1;
        uint64_t v31 = 0LL;
        int v32 = -1;
        uint64_t v29 = 0LL;
        int v30 = -1;
        uint64_t v27 = 0LL;
        int v28 = -1;
        uint64_t v25 = 0LL;
        int v26 = -1;
        *((void *)&v18 + 1) = &v29;
        *(void *)&__int128 v18 = &v31;
        wireless_diagnostics::google::protobuf::strings::SubstituteAndAppend( a3,  "$0option $1;\n",
          (uint64_t)&v43,
          (uint64_t)&v41,
          (uint64_t)&v39,
          (uint64_t)&v37,
          (uint64_t)&v35,
          (uint64_t)&v33,
          v18,
          (uint64_t)&v27,
          (uint64_t)&v25);
        ++v10;
        uint64_t v8 = v19;
        uint64_t v7 = v20;
        v9 += 24LL;
      }

      while (0xAAAAAAAAAAAAAAABLL * ((v20 - v19) >> 3) > v10);
    }
  }

  int v43 = (void **)&v19;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v43);
  return v8 != v7;
}

void sub_187C47334( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
  *(void *)(v21 - 144) = &a13;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v21 - 144));
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void wireless_diagnostics::google::protobuf::EnumDescriptor::DebugString(int *a1, int a2, std::string *a3)
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  std::string::basic_string[abi:ne180100](&__p, 2 * a2, 32);
  int v6 = v21;
  p_p = __p;
  if ((v21 & 0x80u) == 0) {
    p_p = &__p;
  }
  int v40 = p_p;
  if ((v21 & 0x80u) != 0) {
    int v6 = v20;
  }
  int v41 = v6;
  uint64_t v8 = *(uint64_t **)a1;
  int v9 = *(char *)(*(void *)a1 + 23LL);
  uint64_t v10 = *(void *)(*(void *)a1 + 8LL);
  if (v9 < 0) {
    uint64_t v8 = **(uint64_t ***)a1;
  }
  int v38 = v8;
  int v11 = v9;
  if (v9 < 0) {
    int v11 = v10;
  }
  int v39 = v11;
  uint64_t v36 = 0LL;
  int v37 = -1;
  uint64_t v34 = 0LL;
  int v35 = -1;
  uint64_t v32 = 0LL;
  int v33 = -1;
  uint64_t v30 = 0LL;
  int v31 = -1;
  uint64_t v28 = 0LL;
  int v29 = -1;
  uint64_t v26 = 0LL;
  int v27 = -1;
  uint64_t v24 = 0LL;
  int v25 = -1;
  uint64_t v22 = 0LL;
  int v23 = -1;
  *(void *)&__int128 v17 = &v28;
  *((void *)&v17 + 1) = &v26;
  wireless_diagnostics::google::protobuf::strings::SubstituteAndAppend( a3,  "$0enum $1 {\n",  (uint64_t)&v40,  (uint64_t)&v38,  (uint64_t)&v36,  (uint64_t)&v34,  (uint64_t)&v32,  (uint64_t)&v30,  v17,  (uint64_t)&v24,  (uint64_t)&v22);
  int v12 = a2 + 1;
  if (a1[11] >= 1)
  {
    uint64_t v13 = 0LL;
    uint64_t v14 = 0LL;
    do
    {
      wireless_diagnostics::google::protobuf::EnumValueDescriptor::DebugString( (uint64_t ***)(*((void *)a1 + 6) + v13),  v12,  a3);
      ++v14;
      v13 += 40LL;
    }

    while (v14 < a1[11]);
  }

  int v15 = v21;
  uint64_t v16 = &__p;
  if ((v21 & 0x80u) != 0) {
    uint64_t v16 = __p;
  }
  int v40 = v16;
  if ((v21 & 0x80u) != 0) {
    int v15 = v20;
  }
  int v41 = v15;
  int v38 = 0LL;
  int v39 = -1;
  uint64_t v36 = 0LL;
  int v37 = -1;
  uint64_t v34 = 0LL;
  int v35 = -1;
  uint64_t v32 = 0LL;
  int v33 = -1;
  uint64_t v30 = 0LL;
  int v31 = -1;
  uint64_t v28 = 0LL;
  int v29 = -1;
  uint64_t v26 = 0LL;
  int v27 = -1;
  uint64_t v24 = 0LL;
  int v25 = -1;
  uint64_t v22 = 0LL;
  int v23 = -1;
  *(void *)&__int128 v18 = &v28;
  *((void *)&v18 + 1) = &v26;
  wireless_diagnostics::google::protobuf::strings::SubstituteAndAppend( a3,  "$0}\n",  (uint64_t)&v40,  (uint64_t)&v38,  (uint64_t)&v36,  (uint64_t)&v34,  (uint64_t)&v32,  (uint64_t)&v30,  v18,  (uint64_t)&v24,  (uint64_t)&v22);
}

void sub_187C475C4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void wireless_diagnostics::google::protobuf::Descriptor::DebugString(uint64_t a1, int a2, std::string *a3)
{
  uint64_t v87 = *MEMORY[0x1895F89C0];
  std::string::basic_string[abi:ne180100](&__p, 2 * a2, 32);
  std::string::append(a3, " {\n");
  uint64_t v6 = (a2 + 1);
  v61[0] = 0LL;
  v61[1] = 0LL;
  __int128 v60 = (uint64_t *)v61;
  int v8 = *(_DWORD *)(a1 + 44);
  if (v8 >= 1)
  {
    uint64_t v9 = 0LL;
    for (uint64_t i = 0LL; i < v8; ++i)
    {
      uint64_t v11 = *(void *)(a1 + 48) + v9;
      if (*(_DWORD *)(v11 + 44) == 10)
      {
        uint64_t v85 = *(void **)(v11 + 72);
        std::__tree<wireless_diagnostics::google::protobuf::Descriptor const*>::__emplace_unique_key_args<wireless_diagnostics::google::protobuf::Descriptor const*,wireless_diagnostics::google::protobuf::Descriptor const*>( &v60,  (unint64_t *)&v85,  (uint64_t *)&v85);
        int v8 = *(_DWORD *)(a1 + 44);
      }

      v9 += 120LL;
    }
  }

  int v12 = *(_DWORD *)(a1 + 104);
  if (v12 >= 1)
  {
    uint64_t v13 = 0LL;
    for (uint64_t j = 0LL; j < v12; ++j)
    {
      uint64_t v15 = *(void *)(a1 + 112) + v13;
      if (*(_DWORD *)(v15 + 44) == 10)
      {
        uint64_t v85 = *(void **)(v15 + 72);
        std::__tree<wireless_diagnostics::google::protobuf::Descriptor const*>::__emplace_unique_key_args<wireless_diagnostics::google::protobuf::Descriptor const*,wireless_diagnostics::google::protobuf::Descriptor const*>( &v60,  (unint64_t *)&v85,  (uint64_t *)&v85);
        int v12 = *(_DWORD *)(a1 + 104);
      }

      v13 += 120LL;
    }
  }

  int v59 = a2;
  int v16 = *(_DWORD *)(a1 + 56);
  if (v16 >= 1)
  {
    for (uint64_t k = 0LL; k < v16; ++k)
    {
      unint64_t v18 = *(void *)(a1 + 64) + 120 * k;
      for (m = v61[0]; m; m = (void *)*m)
      {
        unint64_t v20 = m[4];
        if (v18 >= v20)
        {
          if (v20 >= v18) {
            goto LABEL_27;
          }
          ++m;
        }
      }

      int v21 = v64;
      p_p = __p;
      if ((v64 & 0x80u) == 0) {
        p_p = &__p;
      }
      uint64_t v85 = p_p;
      if ((v64 & 0x80u) != 0) {
        int v21 = v63;
      }
      int v86 = v21;
      int v23 = *(const char **)v18;
      int v24 = *(char *)(*(void *)v18 + 23LL);
      uint64_t v25 = *((void *)v23 + 1);
      if (v24 < 0) {
        int v23 = *(const char **)v23;
      }
      int v82 = v23;
      int v26 = v24;
      if (v24 < 0) {
        int v26 = v25;
      }
      int v83 = v26;
      uint64_t v79 = 0LL;
      int v80 = -1;
      uint64_t v77 = 0LL;
      int v78 = -1;
      uint64_t v75 = 0LL;
      int v76 = -1;
      uint64_t v73 = 0LL;
      int v74 = -1;
      uint64_t v71 = 0LL;
      int v72 = -1;
      uint64_t v69 = 0LL;
      int v70 = -1;
      uint64_t v67 = 0LL;
      int v68 = -1;
      uint64_t v65 = 0LL;
      int v66 = -1;
      *(void *)&__int128 v53 = &v71;
      *((void *)&v53 + 1) = &v69;
      wireless_diagnostics::google::protobuf::strings::SubstituteAndAppend( a3,  "$0  message $1",  (uint64_t)&v85,  (uint64_t)&v82,  (uint64_t)&v79,  (uint64_t)&v77,  (uint64_t)&v75,  (uint64_t)&v73,  v53,  (uint64_t)&v67,  (uint64_t)&v65);
      wireless_diagnostics::google::protobuf::Descriptor::DebugString(*(void *)(a1 + 64) + 120 * k, v6, a3);
      int v16 = *(_DWORD *)(a1 + 56);
LABEL_27:
      ;
    }
  }

  if (*(int *)(a1 + 72) >= 1)
  {
    uint64_t v27 = 0LL;
    uint64_t v28 = 0LL;
    do
    {
      wireless_diagnostics::google::protobuf::EnumDescriptor::DebugString((int *)(*(void *)(a1 + 80) + v27), v6, a3);
      ++v28;
      v27 += 56LL;
    }

    while (v28 < *(int *)(a1 + 72));
  }

  if (*(int *)(a1 + 44) >= 1)
  {
    uint64_t v29 = 0LL;
    uint64_t v30 = 0LL;
    do
    {
      wireless_diagnostics::google::protobuf::FieldDescriptor::DebugString(*(void *)(a1 + 48) + v29, v6, a3);
      ++v30;
      v29 += 120LL;
    }

    while (v30 < *(int *)(a1 + 44));
  }

  if (*(int *)(a1 + 88) >= 1)
  {
    uint64_t v31 = 0LL;
    uint64_t v32 = 0LL;
    do
    {
      int v33 = v64;
      uint64_t v34 = __p;
      if ((v64 & 0x80u) == 0) {
        uint64_t v34 = &__p;
      }
      uint64_t v85 = v34;
      if ((v64 & 0x80u) != 0) {
        int v33 = v63;
      }
      int v86 = v33;
      int v82 = wireless_diagnostics::google::protobuf::FastInt32ToBuffer( (wireless_diagnostics::google::protobuf *)*(unsigned int *)(*(void *)(a1 + 96) + v31),  v84,  v7);
      int v83 = strlen(v82);
      uint64_t v79 = wireless_diagnostics::google::protobuf::FastInt32ToBuffer( (wireless_diagnostics::google::protobuf *)(*(_DWORD *)(*(void *)(a1 + 96) + v31 + 4) - 1),  v81,  v35);
      int v80 = strlen(v79);
      uint64_t v77 = 0LL;
      int v78 = -1;
      uint64_t v75 = 0LL;
      int v76 = -1;
      uint64_t v73 = 0LL;
      int v74 = -1;
      uint64_t v71 = 0LL;
      int v72 = -1;
      uint64_t v69 = 0LL;
      int v70 = -1;
      uint64_t v67 = 0LL;
      int v68 = -1;
      uint64_t v65 = 0LL;
      int v66 = -1;
      *((void *)&v54 + 1) = &v69;
      *(void *)&__int128 v54 = &v71;
      wireless_diagnostics::google::protobuf::strings::SubstituteAndAppend( a3,  "$0  extensions $1 to $2;\n",
        (uint64_t)&v85,
        (uint64_t)&v82,
        (uint64_t)&v79,
        (uint64_t)&v77,
        (uint64_t)&v75,
        (uint64_t)&v73,
        v54,
        (uint64_t)&v67,
        (uint64_t)&v65);
      ++v32;
      v31 += 8LL;
    }

    while (v32 < *(int *)(a1 + 88));
  }

  if (*(int *)(a1 + 104) >= 1)
  {
    uint64_t v36 = 0LL;
    uint64_t v37 = 0LL;
    uint64_t v38 = 56LL;
    do
    {
      uint64_t v39 = *(void *)(a1 + 112);
      if (*(void *)(v39 + v38) != v37)
      {
        uint64_t v37 = *(void *)(v39 + v38);
        if (v38 != 56)
        {
          int v40 = v64;
          int v41 = __p;
          if ((v64 & 0x80u) == 0) {
            int v41 = &__p;
          }
          uint64_t v85 = v41;
          if ((v64 & 0x80u) != 0) {
            int v40 = v63;
          }
          int v86 = v40;
          int v82 = 0LL;
          int v83 = -1;
          uint64_t v79 = 0LL;
          int v80 = -1;
          uint64_t v77 = 0LL;
          int v78 = -1;
          uint64_t v75 = 0LL;
          int v76 = -1;
          uint64_t v73 = 0LL;
          int v74 = -1;
          uint64_t v71 = 0LL;
          int v72 = -1;
          uint64_t v69 = 0LL;
          int v70 = -1;
          uint64_t v67 = 0LL;
          int v68 = -1;
          uint64_t v65 = 0LL;
          int v66 = -1;
          *(void *)&__int128 v55 = &v71;
          *((void *)&v55 + 1) = &v69;
          wireless_diagnostics::google::protobuf::strings::SubstituteAndAppend( a3,  "$0  }\n",  (uint64_t)&v85,  (uint64_t)&v82,  (uint64_t)&v79,  (uint64_t)&v77,  (uint64_t)&v75,  (uint64_t)&v73,  v55,  (uint64_t)&v67,  (uint64_t)&v65);
          uint64_t v37 = *(void *)(*(void *)(a1 + 112) + v38);
        }

        int v42 = v64;
        int v43 = __p;
        if ((v64 & 0x80u) == 0) {
          int v43 = &__p;
        }
        uint64_t v85 = v43;
        if ((v64 & 0x80u) != 0) {
          int v42 = v63;
        }
        int v86 = v42;
        int v44 = *(const char **)(v37 + 8);
        int v45 = v44[23];
        uint64_t v46 = *((void *)v44 + 1);
        if (v45 < 0) {
          int v44 = *(const char **)v44;
        }
        int v82 = v44;
        int v47 = v45;
        if (v45 < 0) {
          int v47 = v46;
        }
        int v83 = v47;
        uint64_t v79 = 0LL;
        int v80 = -1;
        uint64_t v77 = 0LL;
        int v78 = -1;
        uint64_t v75 = 0LL;
        int v76 = -1;
        uint64_t v73 = 0LL;
        int v74 = -1;
        uint64_t v71 = 0LL;
        int v72 = -1;
        uint64_t v69 = 0LL;
        int v70 = -1;
        uint64_t v67 = 0LL;
        int v68 = -1;
        uint64_t v65 = 0LL;
        int v66 = -1;
        *(void *)&__int128 v56 = &v71;
        *((void *)&v56 + 1) = &v69;
        wireless_diagnostics::google::protobuf::strings::SubstituteAndAppend( a3,  "$0  extend .$1 {\n",  (uint64_t)&v85,  (uint64_t)&v82,  (uint64_t)&v79,  (uint64_t)&v77,  (uint64_t)&v75,  (uint64_t)&v73,  v56,  (uint64_t)&v67,  (uint64_t)&v65);
        uint64_t v39 = *(void *)(a1 + 112);
      }

      wireless_diagnostics::google::protobuf::FieldDescriptor::DebugString(v39 + v38 - 56, (v59 + 2), a3);
      ++v36;
      uint64_t v48 = *(int *)(a1 + 104);
      v38 += 120LL;
    }

    while (v36 < v48);
    if ((int)v48 > 0)
    {
      int v49 = v64;
      uint64_t v50 = &__p;
      if ((v64 & 0x80u) != 0) {
        uint64_t v50 = __p;
      }
      uint64_t v85 = v50;
      if ((v64 & 0x80u) != 0) {
        int v49 = v63;
      }
      int v86 = v49;
      int v82 = 0LL;
      int v83 = -1;
      uint64_t v79 = 0LL;
      int v80 = -1;
      uint64_t v77 = 0LL;
      int v78 = -1;
      uint64_t v75 = 0LL;
      int v76 = -1;
      uint64_t v73 = 0LL;
      int v74 = -1;
      uint64_t v71 = 0LL;
      int v72 = -1;
      uint64_t v69 = 0LL;
      int v70 = -1;
      uint64_t v67 = 0LL;
      int v68 = -1;
      uint64_t v65 = 0LL;
      int v66 = -1;
      *(void *)&__int128 v57 = &v71;
      *((void *)&v57 + 1) = &v69;
      wireless_diagnostics::google::protobuf::strings::SubstituteAndAppend( a3,  "$0  }\n",  (uint64_t)&v85,  (uint64_t)&v82,  (uint64_t)&v79,  (uint64_t)&v77,  (uint64_t)&v75,  (uint64_t)&v73,  v57,  (uint64_t)&v67,  (uint64_t)&v65);
    }
  }

  int v51 = v64;
  uint64_t v52 = &__p;
  if ((v64 & 0x80u) != 0) {
    uint64_t v52 = __p;
  }
  uint64_t v85 = v52;
  if ((v64 & 0x80u) != 0) {
    int v51 = v63;
  }
  int v86 = v51;
  int v82 = 0LL;
  int v83 = -1;
  uint64_t v79 = 0LL;
  int v80 = -1;
  uint64_t v77 = 0LL;
  int v78 = -1;
  uint64_t v75 = 0LL;
  int v76 = -1;
  uint64_t v73 = 0LL;
  int v74 = -1;
  uint64_t v71 = 0LL;
  int v72 = -1;
  uint64_t v69 = 0LL;
  int v70 = -1;
  uint64_t v67 = 0LL;
  int v68 = -1;
  uint64_t v65 = 0LL;
  int v66 = -1;
  *(void *)&__int128 v58 = &v71;
  *((void *)&v58 + 1) = &v69;
  wireless_diagnostics::google::protobuf::strings::SubstituteAndAppend( a3,  "$0}\n",  (uint64_t)&v85,  (uint64_t)&v82,  (uint64_t)&v79,  (uint64_t)&v77,  (uint64_t)&v75,  (uint64_t)&v73,  v58,  (uint64_t)&v67,  (uint64_t)&v65);
  std::__tree<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::__map_value_compare<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::less<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>,true>,std::allocator<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>>>::destroy( (uint64_t)&v60,  v61[0]);
}

void sub_187C47D90( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, void *a16, uint64_t a17, void *__p, uint64_t a19, int a20, __int16 a21, char a22, char a23)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

std::string *wireless_diagnostics::google::protobuf::ServiceDescriptor::DebugString( int *a1, std::string *this)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(uint64_t **)a1;
  int v5 = *(char *)(*(void *)a1 + 23LL);
  uint64_t v6 = *(void *)(*(void *)a1 + 8LL);
  if (v5 < 0) {
    uint64_t v4 = **(uint64_t ***)a1;
  }
  uint64_t v30 = v4;
  int v7 = v5;
  if (v5 < 0) {
    int v7 = v6;
  }
  int v31 = v7;
  uint64_t v28 = 0LL;
  int v29 = -1;
  uint64_t v26 = 0LL;
  int v27 = -1;
  uint64_t v24 = 0LL;
  int v25 = -1;
  uint64_t v22 = 0LL;
  int v23 = -1;
  uint64_t v20 = 0LL;
  int v21 = -1;
  uint64_t v18 = 0LL;
  int v19 = -1;
  uint64_t v16 = 0LL;
  int v17 = -1;
  uint64_t v14 = 0LL;
  int v15 = -1;
  uint64_t v12 = 0LL;
  int v13 = -1;
  *(void *)&__int128 v11 = &v18;
  *((void *)&v11 + 1) = &v16;
  wireless_diagnostics::google::protobuf::strings::SubstituteAndAppend( this,  "service $0 {\n",  (uint64_t)&v30,  (uint64_t)&v28,  (uint64_t)&v26,  (uint64_t)&v24,  (uint64_t)&v22,  (uint64_t)&v20,  v11,  (uint64_t)&v14,  (uint64_t)&v12);
  if (a1[8] >= 1)
  {
    uint64_t v8 = 0LL;
    uint64_t v9 = 0LL;
    do
    {
      wireless_diagnostics::google::protobuf::MethodDescriptor::DebugString(*((void *)a1 + 5) + v8, 1, this);
      ++v9;
      v8 += 48LL;
    }

    while (v9 < a1[8]);
  }

  return std::string::append(this, "}\n");
}

void wireless_diagnostics::google::protobuf::FieldDescriptor::DebugString( uint64_t a1, int a2, std::string *a3)
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  std::string::basic_string[abi:ne180100](&__b, 2 * a2, 32);
  memset(&__p, 0, sizeof(__p));
  uint64_t v6 = *(unsigned int *)(a1 + 44);
  if ((_DWORD)v6 == 11 || (_DWORD)v6 == 14)
  {
    std::operator+<char>();
    std::string __p = v50[0];
  }

  else
  {
    MEMORY[0x1895B3A84](&__p, wireless_diagnostics::google::protobuf::FieldDescriptor::kTypeToName[v6]);
  }

  int v7 = v30;
  p_b = &__b;
  if ((v30 & 0x80u) != 0) {
    p_b = __b;
  }
  v50[0].__r_.__value_.__r.__words[0] = (std::string::size_type)p_b;
  if ((v30 & 0x80u) != 0) {
    int v7 = v29;
  }
  LODWORD(v50[0].__r_.__value_.__r.__words[1]) = v7;
  uint64_t v48 = wireless_diagnostics::google::protobuf::FieldDescriptor::kLabelToName[*(unsigned int *)(a1 + 48)];
  int v49 = strlen(v48);
  int size = __p.__r_.__value_.__s.__size_;
  p_p = &__p;
  if ((__p.__r_.__value_.__s.__size_ & 0x80u) != 0) {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  uint64_t v46 = p_p;
  if ((__p.__r_.__value_.__s.__size_ & 0x80u) != 0) {
    int size = __p.__r_.__value_.__r.__words[1];
  }
  int v47 = size;
  uint64_t v12 = (uint64_t **)a1;
  if (*(_DWORD *)(a1 + 44) == 10) {
    uint64_t v12 = *(uint64_t ***)(a1 + 72);
  }
  int v13 = *v12;
  int v14 = *((char *)v13 + 23);
  uint64_t v15 = v13[1];
  if (v14 < 0) {
    int v13 = (uint64_t *)*v13;
  }
  int v44 = v13;
  int v16 = v14;
  if (v14 < 0) {
    int v16 = v15;
  }
  int v45 = v16;
  int v41 = wireless_diagnostics::google::protobuf::FastInt32ToBuffer( (wireless_diagnostics::google::protobuf *)*(unsigned int *)(a1 + 40),  v43,  v9);
  int v42 = strlen(v41);
  uint64_t v39 = 0LL;
  int v40 = -1;
  uint64_t v37 = 0LL;
  int v38 = -1;
  uint64_t v35 = 0LL;
  int v36 = -1;
  uint64_t v33 = 0LL;
  int v34 = -1;
  uint64_t v31 = 0LL;
  int v32 = -1;
  *(void *)&__int128 v24 = &v37;
  *((void *)&v24 + 1) = &v35;
  wireless_diagnostics::google::protobuf::strings::SubstituteAndAppend( a3,  "$0$1 $2 $3 = $4",  (uint64_t)v50,  (uint64_t)&v48,  (uint64_t)&v46,  (uint64_t)&v44,  (uint64_t)&v41,  (uint64_t)&v39,  v24,  (uint64_t)&v33,  (uint64_t)&v31);
  int v18 = *(unsigned __int8 *)(a1 + 104);
  if (*(_BYTE *)(a1 + 104))
  {
    wireless_diagnostics::google::protobuf::FieldDescriptor::DefaultValueAsString( (wireless_diagnostics::google::protobuf::FieldDescriptor *)a1,  (char *)1,  v17,  &v26);
    int v19 = (std::string *)v26.__r_.__value_.__r.__words[0];
    if ((v26.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      int v19 = &v26;
    }
    v50[0].__r_.__value_.__r.__words[0] = (std::string::size_type)v19;
    int v20 = v26.__r_.__value_.__s.__size_;
    if ((v26.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      int v20 = v26.__r_.__value_.__r.__words[1];
    }
    LODWORD(v50[0].__r_.__value_.__r.__words[1]) = v20;
    uint64_t v48 = 0LL;
    int v49 = -1;
    uint64_t v46 = 0LL;
    int v47 = -1;
    int v44 = 0LL;
    int v45 = -1;
    int v41 = 0LL;
    int v42 = -1;
    uint64_t v39 = 0LL;
    int v40 = -1;
    uint64_t v37 = 0LL;
    int v38 = -1;
    uint64_t v35 = 0LL;
    int v36 = -1;
    uint64_t v33 = 0LL;
    int v34 = -1;
    uint64_t v31 = 0LL;
    int v32 = -1;
    *(void *)&__int128 v25 = &v37;
    *((void *)&v25 + 1) = &v35;
    wireless_diagnostics::google::protobuf::strings::SubstituteAndAppend( a3,  " [default = $0",  (uint64_t)v50,  (uint64_t)&v48,  (uint64_t)&v46,  (uint64_t)&v44,  (uint64_t)&v41,  (uint64_t)&v39,  v25,  (uint64_t)&v33,  (uint64_t)&v31);
  }

  memset(v50, 0, 24);
  {
    if (v18) {
      int v21 = ", ";
    }
    else {
      int v21 = " [";
    }
    std::string::append(a3, v21);
    if ((v50[0].__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v22 = v50;
    }
    else {
      uint64_t v22 = (std::string *)v50[0].__r_.__value_.__r.__words[0];
    }
    if ((v50[0].__r_.__value_.__s.__size_ & 0x80u) == 0) {
      std::string::size_type v23 = v50[0].__r_.__value_.__s.__size_;
    }
    else {
      std::string::size_type v23 = v50[0].__r_.__value_.__l.__size_;
    }
    std::string::append(a3, (const std::string::value_type *)v22, v23);
  }

  else if (!v18)
  {
    goto LABEL_41;
  }

  std::string::append(a3, "]");
LABEL_41:
  if (*(_DWORD *)(a1 + 44) == 10) {
    wireless_diagnostics::google::protobuf::Descriptor::DebugString(*(void *)(a1 + 72), a2, a3);
  }
  else {
    std::string::append(a3, ";\n");
  }
}

void sub_187C48344( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *__p, uint64_t a21, int a22, __int16 a23, char a24, char a25, uint64_t a26, void *a27, uint64_t a28, int a29, __int16 a30, char a31, char a32)
{
  if (a25 < 0) {
    operator delete(__p);
  }
  if (a32 < 0) {
    operator delete(a27);
  }
  _Unwind_Resume(exception_object);
}

void wireless_diagnostics::google::protobuf::Descriptor::DebugString( uint64_t ***this@<X0>, std::string *a2@<X8>)
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  a2->__r_.__value_.__r.__words[0] = 0LL;
  a2->__r_.__value_.__l.__size_ = 0LL;
  a2->__r_.__value_.__l.__cap_ = 0LL;
  uint64_t v4 = (uint64_t *)*this;
  int v5 = *((char *)*this + 23);
  uint64_t v6 = (*this)[1];
  if (v5 < 0) {
    uint64_t v4 = **this;
  }
  int v27 = v4;
  int v7 = v5;
  if (v5 < 0) {
    int v7 = (int)v6;
  }
  int v28 = v7;
  uint64_t v25 = 0LL;
  int v26 = -1;
  uint64_t v23 = 0LL;
  int v24 = -1;
  uint64_t v21 = 0LL;
  int v22 = -1;
  uint64_t v19 = 0LL;
  int v20 = -1;
  uint64_t v17 = 0LL;
  int v18 = -1;
  uint64_t v15 = 0LL;
  int v16 = -1;
  uint64_t v13 = 0LL;
  int v14 = -1;
  uint64_t v11 = 0LL;
  int v12 = -1;
  uint64_t v9 = 0LL;
  int v10 = -1;
  *(void *)&__int128 v8 = &v15;
  *((void *)&v8 + 1) = &v13;
  wireless_diagnostics::google::protobuf::strings::SubstituteAndAppend( a2,  "message $0",  (uint64_t)&v27,  (uint64_t)&v25,  (uint64_t)&v23,  (uint64_t)&v21,  (uint64_t)&v19,  (uint64_t)&v17,  v8,  (uint64_t)&v11,  (uint64_t)&v9);
  wireless_diagnostics::google::protobuf::Descriptor::DebugString((uint64_t)this, 0, a2);
}

void sub_187C484DC(_Unwind_Exception *exception_object)
{
}

void wireless_diagnostics::google::protobuf::FieldDescriptor::DebugString( wireless_diagnostics::google::protobuf::FieldDescriptor *this@<X0>, std::string *a2@<X8>)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  a2->__r_.__value_.__r.__words[0] = 0LL;
  a2->__r_.__value_.__l.__size_ = 0LL;
  a2->__r_.__value_.__l.__cap_ = 0LL;
  if (*((_BYTE *)this + 52))
  {
    uint64_t v4 = *(uint64_t **)(*((void *)this + 7) + 8LL);
    int v5 = *((char *)v4 + 23);
    uint64_t v6 = v4[1];
    if (v5 < 0) {
      uint64_t v4 = (uint64_t *)*v4;
    }
    int v28 = v4;
    int v7 = v5;
    if (v5 < 0) {
      int v7 = v6;
    }
    int v29 = v7;
    uint64_t v26 = 0LL;
    int v27 = -1;
    uint64_t v24 = 0LL;
    int v25 = -1;
    uint64_t v22 = 0LL;
    int v23 = -1;
    uint64_t v20 = 0LL;
    int v21 = -1;
    uint64_t v18 = 0LL;
    int v19 = -1;
    uint64_t v16 = 0LL;
    int v17 = -1;
    uint64_t v14 = 0LL;
    int v15 = -1;
    uint64_t v12 = 0LL;
    int v13 = -1;
    uint64_t v10 = 0LL;
    int v11 = -1;
    *(void *)&__int128 v9 = &v16;
    *((void *)&v9 + 1) = &v14;
    wireless_diagnostics::google::protobuf::strings::SubstituteAndAppend( a2,  "extend .$0 {\n",  (uint64_t)&v28,  (uint64_t)&v26,  (uint64_t)&v24,  (uint64_t)&v22,  (uint64_t)&v20,  (uint64_t)&v18,  v9,  (uint64_t)&v12,  (uint64_t)&v10);
    int v8 = 1;
  }

  else
  {
    int v8 = 0;
  }

  wireless_diagnostics::google::protobuf::FieldDescriptor::DebugString((uint64_t)this, v8, a2);
  if (*((_BYTE *)this + 52)) {
    std::string::append(a2, "}\n");
  }
}

void sub_187C4864C(_Unwind_Exception *exception_object)
{
}

BOOL wireless_diagnostics::google::protobuf::anonymous namespace'::FormatBracketedOptions( int a1, const wireless_diagnostics::google::protobuf::Message *a2, std::string *a3)
{
  uint64_t v9 = 0LL;
  uint64_t v10 = 0LL;
  uint64_t v11 = 0LL;
  {
    memset(&__p, 0, sizeof(__p));
    wireless_diagnostics::google::protobuf::JoinStrings(&v9, ", ", &__p);
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      std::string::size_type size = __p.__r_.__value_.__s.__size_;
    }
    else {
      std::string::size_type size = __p.__r_.__value_.__l.__size_;
    }
    std::string::append(a3, (const std::string::value_type *)p_p, size);
  }

  BOOL v6 = v9 != v10;
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v9;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  return v6;
}

void sub_187C48714( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, char *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  std::string __p = &a15;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  _Unwind_Resume(a1);
}

void wireless_diagnostics::google::protobuf::EnumDescriptor::DebugString( wireless_diagnostics::google::protobuf::EnumDescriptor *this@<X0>, std::string *a2@<X8>)
{
  a2->__r_.__value_.__r.__words[0] = 0LL;
  a2->__r_.__value_.__l.__size_ = 0LL;
  a2->__r_.__value_.__l.__cap_ = 0LL;
  wireless_diagnostics::google::protobuf::EnumDescriptor::DebugString((int *)this, 0, a2);
}

void sub_187C4877C(_Unwind_Exception *exception_object)
{
}

void wireless_diagnostics::google::protobuf::EnumValueDescriptor::DebugString( uint64_t ***a1, int a2, std::string *a3)
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  std::string::basic_string[abi:ne180100](&__b, 2 * a2, 32);
  int v7 = v20;
  p_b = (std::string *)__b;
  if ((v20 & 0x80u) == 0) {
    p_b = (std::string *)&__b;
  }
  int v40 = p_b;
  if ((v20 & 0x80u) != 0) {
    int v7 = v19;
  }
  int v41 = v7;
  uint64_t v9 = *a1;
  int v10 = *((char *)*a1 + 23);
  uint64_t v11 = (*a1)[1];
  if (v10 < 0) {
    uint64_t v9 = (uint64_t **)**a1;
  }
  int v38 = v9;
  int v12 = v10;
  if (v10 < 0) {
    int v12 = (int)v11;
  }
  int v39 = v12;
  uint64_t v35 = wireless_diagnostics::google::protobuf::FastInt32ToBuffer( (wireless_diagnostics::google::protobuf *)*((unsigned int *)a1 + 4),  v37,  v6);
  int v36 = strlen(v35);
  uint64_t v33 = 0LL;
  int v34 = -1;
  uint64_t v31 = 0LL;
  int v32 = -1;
  uint64_t v29 = 0LL;
  int v30 = -1;
  uint64_t v27 = 0LL;
  int v28 = -1;
  uint64_t v25 = 0LL;
  int v26 = -1;
  uint64_t v23 = 0LL;
  int v24 = -1;
  uint64_t v21 = 0LL;
  int v22 = -1;
  *(void *)&__int128 v15 = &v27;
  *((void *)&v15 + 1) = &v25;
  wireless_diagnostics::google::protobuf::strings::SubstituteAndAppend( a3,  "$0$1 = $2",  (uint64_t)&v40,  (uint64_t)&v38,  (uint64_t)&v35,  (uint64_t)&v33,  (uint64_t)&v31,  (uint64_t)&v29,  v15,  (uint64_t)&v23,  (uint64_t)&v21);
  memset(&__p, 0, sizeof(__p));
  {
    int size = __p.__r_.__value_.__s.__size_;
    p_p = &__p;
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    int v40 = p_p;
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      int size = __p.__r_.__value_.__r.__words[1];
    }
    int v41 = size;
    int v38 = 0LL;
    int v39 = -1;
    uint64_t v35 = 0LL;
    int v36 = -1;
    uint64_t v33 = 0LL;
    int v34 = -1;
    uint64_t v31 = 0LL;
    int v32 = -1;
    uint64_t v29 = 0LL;
    int v30 = -1;
    uint64_t v27 = 0LL;
    int v28 = -1;
    uint64_t v25 = 0LL;
    int v26 = -1;
    uint64_t v23 = 0LL;
    int v24 = -1;
    uint64_t v21 = 0LL;
    int v22 = -1;
    *(void *)&__int128 v16 = &v27;
    *((void *)&v16 + 1) = &v25;
    wireless_diagnostics::google::protobuf::strings::SubstituteAndAppend( a3,  " [$0]",  (uint64_t)&v40,  (uint64_t)&v38,  (uint64_t)&v35,  (uint64_t)&v33,  (uint64_t)&v31,  (uint64_t)&v29,  v16,  (uint64_t)&v23,  (uint64_t)&v21);
  }

  std::string::append(a3, ";\n");
}

void sub_187C489F0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20, uint64_t a21, int a22, __int16 a23, char a24, char a25)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  if (a25 < 0) {
    operator delete(a20);
  }
  _Unwind_Resume(exception_object);
}

void wireless_diagnostics::google::protobuf::EnumValueDescriptor::DebugString( uint64_t ***this@<X0>, std::string *a2@<X8>)
{
  a2->__r_.__value_.__r.__words[0] = 0LL;
  a2->__r_.__value_.__l.__size_ = 0LL;
  a2->__r_.__value_.__l.__cap_ = 0LL;
  wireless_diagnostics::google::protobuf::EnumValueDescriptor::DebugString(this, 0, a2);
}

void sub_187C48A64(_Unwind_Exception *exception_object)
{
}

std::string *wireless_diagnostics::google::protobuf::ServiceDescriptor::DebugString@<X0>( wireless_diagnostics::google::protobuf::ServiceDescriptor *this@<X0>, std::string *a2@<X8>)
{
  a2->__r_.__value_.__r.__words[0] = 0LL;
  a2->__r_.__value_.__l.__size_ = 0LL;
  a2->__r_.__value_.__l.__cap_ = 0LL;
  return wireless_diagnostics::google::protobuf::ServiceDescriptor::DebugString((int *)this, a2);
}

void sub_187C48AAC(_Unwind_Exception *exception_object)
{
}

void wireless_diagnostics::google::protobuf::MethodDescriptor::DebugString( uint64_t a1, int a2, std::string *a3)
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  std::string::basic_string[abi:ne180100](&__b, 2 * a2, 32);
  int v6 = v30;
  p_b = (std::string *)__b;
  if ((v30 & 0x80u) == 0) {
    p_b = (std::string *)&__b;
  }
  int v49 = p_b;
  if ((v30 & 0x80u) != 0) {
    int v6 = v29;
  }
  int v50 = v6;
  int v8 = *(void **)a1;
  int v9 = *(char *)(*(void *)a1 + 23LL);
  uint64_t v10 = *(void *)(*(void *)a1 + 8LL);
  if (v9 < 0) {
    int v8 = **(void ***)a1;
  }
  int v47 = v8;
  int v11 = v9;
  if (v9 < 0) {
    int v11 = v10;
  }
  int v48 = v11;
  uint64_t v12 = *(void *)(a1 + 32);
  int v13 = *(uint64_t **)(*(void *)(a1 + 24) + 8LL);
  int v14 = *((char *)v13 + 23);
  uint64_t v15 = v13[1];
  if (v14 < 0) {
    int v13 = (uint64_t *)*v13;
  }
  int v45 = v13;
  int v16 = v14;
  if (v14 < 0) {
    int v16 = v15;
  }
  int v46 = v16;
  int v17 = *(uint64_t **)(v12 + 8);
  int v18 = *((char *)v17 + 23);
  uint64_t v19 = v17[1];
  if (v18 < 0) {
    int v17 = (uint64_t *)*v17;
  }
  int v43 = v17;
  int v20 = v18;
  if (v18 < 0) {
    int v20 = v19;
  }
  int v44 = v20;
  uint64_t v41 = 0LL;
  int v42 = -1;
  uint64_t v39 = 0LL;
  int v40 = -1;
  uint64_t v37 = 0LL;
  int v38 = -1;
  uint64_t v35 = 0LL;
  int v36 = -1;
  uint64_t v33 = 0LL;
  int v34 = -1;
  uint64_t v31 = 0LL;
  int v32 = -1;
  *(void *)&__int128 v25 = &v37;
  *((void *)&v25 + 1) = &v35;
  wireless_diagnostics::google::protobuf::strings::SubstituteAndAppend( a3,  "$0rpc $1(.$2) returns (.$3)",  (uint64_t)&v49,  (uint64_t)&v47,  (uint64_t)&v45,  (uint64_t)&v43,  (uint64_t)&v41,  (uint64_t)&v39,  v25,  (uint64_t)&v33,  (uint64_t)&v31);
  memset(&__p, 0, sizeof(__p));
  {
    int size = __p.__r_.__value_.__s.__size_;
    p_p = &__p;
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    int v49 = p_p;
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      int size = __p.__r_.__value_.__r.__words[1];
    }
    int v50 = size;
    int v23 = v30;
    int v24 = &__b;
    if ((v30 & 0x80u) != 0) {
      int v24 = __b;
    }
    int v47 = v24;
    if ((v30 & 0x80u) != 0) {
      int v23 = v29;
    }
    int v48 = v23;
    int v45 = 0LL;
    int v46 = -1;
    int v43 = 0LL;
    int v44 = -1;
    uint64_t v41 = 0LL;
    int v42 = -1;
    uint64_t v39 = 0LL;
    int v40 = -1;
    uint64_t v37 = 0LL;
    int v38 = -1;
    uint64_t v35 = 0LL;
    int v36 = -1;
    uint64_t v33 = 0LL;
    int v34 = -1;
    uint64_t v31 = 0LL;
    int v32 = -1;
    *(void *)&__int128 v26 = &v37;
    *((void *)&v26 + 1) = &v35;
    wireless_diagnostics::google::protobuf::strings::SubstituteAndAppend( a3,  " {\n$0$1}\n",  (uint64_t)&v49,  (uint64_t)&v47,  (uint64_t)&v45,  (uint64_t)&v43,  (uint64_t)&v41,  (uint64_t)&v39,  v26,  (uint64_t)&v33,  (uint64_t)&v31);
  }

  else
  {
    std::string::append(a3, ";\n");
  }

void sub_187C48D68( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20, uint64_t a21, int a22, __int16 a23, char a24, char a25)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  if (a25 < 0) {
    operator delete(a20);
  }
  _Unwind_Resume(exception_object);
}

void wireless_diagnostics::google::protobuf::MethodDescriptor::DebugString( wireless_diagnostics::google::protobuf::MethodDescriptor *this@<X0>, std::string *a2@<X8>)
{
  a2->__r_.__value_.__r.__words[0] = 0LL;
  a2->__r_.__value_.__l.__size_ = 0LL;
  a2->__r_.__value_.__l.__cap_ = 0LL;
  wireless_diagnostics::google::protobuf::MethodDescriptor::DebugString((uint64_t)this, 0, a2);
}

void sub_187C48DD8(_Unwind_Exception *exception_object)
{
}

uint64_t wireless_diagnostics::google::protobuf::FileDescriptor::GetSourceLocation( uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 152);
  if (!v6) {
    return 0LL;
  }
  int v7 = *(_DWORD *)(v6 + 24);
  int v9 = *(_DWORD **)a2;
  int v8 = *(_DWORD **)(a2 + 8);
  unint64_t v10 = ((uint64_t)v8 - *(void *)a2) >> 2;
  uint64_t v11 = v10 <= 1 ? 1LL : ((uint64_t)v8 - *(void *)a2) >> 2;
  if (v7 < 1) {
    return 0LL;
  }
  uint64_t v12 = 0LL;
  uint64_t v13 = v7 & ~(v7 >> 31);
  while (1)
  {
    uint64_t v14 = *(void *)(*(void *)(v6 + 16) + 8 * v12);
    if (v10 == *(_DWORD *)(v14 + 24))
    {
      if (v8 == v9) {
        goto LABEL_20;
      }
      uint64_t v15 = *(_DWORD **)(v14 + 16);
      if (*v9 == *v15)
      {
        uint64_t v16 = 1LL;
        do
        {
          unint64_t v17 = v16;
          if (v11 == v16) {
            break;
          }
          int v18 = v9[v16];
          int v19 = v15[v16++];
        }

        while (v18 == v19);
        if (v10 <= v17)
        {
LABEL_20:
          int v20 = *(_DWORD *)(v14 + 48);
        }
      }
    }

    if (++v12 == v13) {
      return 0LL;
    }
  }

  int v22 = *(_DWORD **)(v14 + 40);
  *(_DWORD *)a3 = *v22;
  *(_DWORD *)(a3 + 8) = v22[1];
  *(_DWORD *)(a3 + 4) = v22[2 * (v20 != 3)];
  *(_DWORD *)(a3 + 12) = v22[v20 - 1];
  std::string::operator=((std::string *)(a3 + 16), *(const std::string **)(v14 + 64));
  std::string::operator=( (std::string *)(a3 + 40),  *(const std::string **)(*(void *)(*(void *)(v6 + 16) + 8 * v12) + 72LL));
  return 1LL;
}

uint64_t wireless_diagnostics::google::protobuf::internal::CheckNotNull<wireless_diagnostics::google::protobuf::SourceLocation>( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a4)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v6);
  }

  return a4;
}

void sub_187C48FAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

BOOL wireless_diagnostics::google::protobuf::FieldDescriptor::is_packed( wireless_diagnostics::google::protobuf::FieldDescriptor *this)
{
  return *((_DWORD *)this + 12) == 3
      && (*((_DWORD *)this + 11) - 13) <= 0xFFFFFFFB
      && (uint64_t v1 = *((void *)this + 12)) != 0
      && *(_BYTE *)(v1 + 44) != 0;
}

uint64_t wireless_diagnostics::google::protobuf::Descriptor::GetSourceLocation(uint64_t a1, uint64_t a2)
{
  std::string __p = 0LL;
  int v7 = 0LL;
  uint64_t v8 = 0LL;
  wireless_diagnostics::google::protobuf::Descriptor::GetLocationPath(a1, (uint64_t)&__p);
  uint64_t SourceLocation = wireless_diagnostics::google::protobuf::FileDescriptor::GetSourceLocation( *(void *)(a1 + 16),  (uint64_t)&__p,  a2);
  if (__p)
  {
    int v7 = __p;
    operator delete(__p);
  }

  return SourceLocation;
}

void sub_187C49060( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void wireless_diagnostics::google::protobuf::Descriptor::GetLocationPath(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 24);
  if (!v4)
  {
    unint64_t v10 = (void *)(a2 + 16);
    unint64_t v9 = *(void *)(a2 + 16);
    uint64_t v11 = *(_DWORD **)(a2 + 8);
    if ((unint64_t)v11 >= v9)
    {
      int v18 = *(_DWORD **)a2;
      uint64_t v19 = ((uint64_t)v11 - *(void *)a2) >> 2;
      unint64_t v20 = v19 + 1;
      uint64_t v21 = v9 - (void)v18;
      if (v21 >> 1 > v20) {
        unint64_t v20 = v21 >> 1;
      }
      else {
        unint64_t v22 = v20;
      }
      if (v22)
      {
        int v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(a2 + 16, v22);
        int v18 = *(_DWORD **)a2;
        uint64_t v11 = *(_DWORD **)(a2 + 8);
      }

      else
      {
        int v23 = 0LL;
      }

      int v40 = &v23[4 * v19];
      uint64_t v41 = &v23[4 * v22];
      *(_DWORD *)int v40 = 4;
      uint64_t v8 = v40 + 4;
      while (v11 != v18)
      {
        int v42 = *--v11;
        *((_DWORD *)v40 - 1) = v42;
        v40 -= 4;
      }

      *(void *)a2 = v40;
      *(void *)(a2 + 8) = v8;
      *(void *)(a2 + 16) = v41;
      if (v18) {
        operator delete(v18);
      }
    }

    else
    {
      *uint64_t v11 = 4;
      uint64_t v8 = v11 + 1;
    }

    *(void *)(a2 + 8) = v8;
    uint64_t v43 = *(void *)(a1 + 24);
    if (v43) {
      int v44 = (void *)(v43 + 64);
    }
    else {
      int v44 = (void *)(*(void *)(a1 + 16) + 80LL);
    }
    int v29 = -286331153 * ((unint64_t)(a1 - *v44) >> 3);
    if ((unint64_t)v8 >= *v10)
    {
      unsigned __int8 v30 = *(_DWORD **)a2;
      uint64_t v45 = ((uint64_t)v8 - *(void *)a2) >> 2;
      unint64_t v46 = v45 + 1;
      if (!((unint64_t)(v45 + 1) >> 62))
      {
        uint64_t v47 = *v10 - (void)v30;
        if (v47 >> 1 > v46) {
          unint64_t v46 = v47 >> 1;
        }
        else {
          unint64_t v48 = v46;
        }
        if (v48)
        {
          int v49 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(a2 + 16, v48);
          unsigned __int8 v30 = *(_DWORD **)a2;
          uint64_t v8 = *(_DWORD **)(a2 + 8);
        }

        else
        {
          int v49 = 0LL;
        }

        int v36 = &v49[4 * v45];
        uint64_t v37 = &v49[4 * v48];
        *(_DWORD *)int v36 = v29;
        int v38 = v36 + 4;
        while (v8 != v30)
        {
          int v50 = *--v8;
          *((_DWORD *)v36 - 1) = v50;
          v36 -= 4;
        }

        goto LABEL_67;
      }

LABEL_54:
    *uint64_t v8 = v29;
    int v38 = v8 + 1;
    goto LABEL_69;
  }

  wireless_diagnostics::google::protobuf::Descriptor::GetLocationPath(v4, a2);
  uint64_t v6 = (void *)(a2 + 16);
  unint64_t v5 = *(void *)(a2 + 16);
  int v7 = *(_DWORD **)(a2 + 8);
  if ((unint64_t)v7 >= v5)
  {
    uint64_t v12 = *(_DWORD **)a2;
    uint64_t v13 = ((uint64_t)v7 - *(void *)a2) >> 2;
    unint64_t v14 = v13 + 1;
    uint64_t v15 = v5 - (void)v12;
    if (v15 >> 1 > v14) {
      unint64_t v14 = v15 >> 1;
    }
    else {
      unint64_t v16 = v14;
    }
    if (v16)
    {
      unint64_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(a2 + 16, v16);
      uint64_t v12 = *(_DWORD **)a2;
      int v7 = *(_DWORD **)(a2 + 8);
    }

    else
    {
      unint64_t v17 = 0LL;
    }

    int v24 = &v17[4 * v13];
    __int128 v25 = &v17[4 * v16];
    *(_DWORD *)int v24 = 3;
    uint64_t v8 = v24 + 4;
    while (v7 != v12)
    {
      int v26 = *--v7;
      *((_DWORD *)v24 - 1) = v26;
      v24 -= 4;
    }

    *(void *)a2 = v24;
    *(void *)(a2 + 8) = v8;
    *(void *)(a2 + 16) = v25;
    if (v12) {
      operator delete(v12);
    }
  }

  else
  {
    *int v7 = 3;
    uint64_t v8 = v7 + 1;
  }

  *(void *)(a2 + 8) = v8;
  uint64_t v27 = *(void *)(a1 + 24);
  if (v27) {
    int v28 = (void *)(v27 + 64);
  }
  else {
    int v28 = (void *)(*(void *)(a1 + 16) + 80LL);
  }
  int v29 = -286331153 * ((unint64_t)(a1 - *v28) >> 3);
  unsigned __int8 v30 = *(_DWORD **)a2;
  uint64_t v31 = ((uint64_t)v8 - *(void *)a2) >> 2;
  unint64_t v32 = v31 + 1;
  uint64_t v33 = *v6 - (void)v30;
  if (v33 >> 1 > v32) {
    unint64_t v32 = v33 >> 1;
  }
  else {
    unint64_t v34 = v32;
  }
  if (v34)
  {
    uint64_t v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(a2 + 16, v34);
    unsigned __int8 v30 = *(_DWORD **)a2;
    uint64_t v8 = *(_DWORD **)(a2 + 8);
  }

  else
  {
    uint64_t v35 = 0LL;
  }

  int v36 = &v35[4 * v31];
  uint64_t v37 = &v35[4 * v34];
  *(_DWORD *)int v36 = v29;
  int v38 = v36 + 4;
  while (v8 != v30)
  {
    int v39 = *--v8;
    *((_DWORD *)v36 - 1) = v39;
    v36 -= 4;
  }

    *(_DWORD *)uint64_t v8 = v29;
    int v38 = v8 + 4;
    goto LABEL_69;
  }

  wireless_diagnostics::google::protobuf::Descriptor::GetLocationPath(v4, (uint64_t)a2);
  uint64_t v6 = a2 + 2;
  unint64_t v5 = (unint64_t)a2[2];
  int v7 = a2[1];
  if ((unint64_t)v7 >= v5)
  {
    uint64_t v12 = *a2;
    uint64_t v13 = (v7 - *a2) >> 2;
    unint64_t v14 = v13 + 1;
    uint64_t v15 = v5 - (void)v12;
    if (v15 >> 1 > v14) {
      unint64_t v14 = v15 >> 1;
    }
    else {
      unint64_t v16 = v14;
    }
    if (v16)
    {
      unint64_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(a2 + 2), v16);
      uint64_t v12 = *a2;
      int v7 = a2[1];
    }

    else
    {
      unint64_t v17 = 0LL;
    }

    int v24 = &v17[4 * v13];
    __int128 v25 = &v17[4 * v16];
    *(_DWORD *)int v24 = 4;
    uint64_t v8 = v24 + 4;
    while (v7 != v12)
    {
      int v26 = *((_DWORD *)v7 - 1);
      v7 -= 4;
      *((_DWORD *)v24 - 1) = v26;
      v24 -= 4;
    }

    *a2 = v24;
    a2[1] = v8;
    a2[2] = v25;
    if (v12) {
      operator delete(v12);
    }
  }

  else
  {
    *(_DWORD *)int v7 = 4;
    uint64_t v8 = v7 + 4;
  }

  a2[1] = v8;
  uint64_t v27 = *(void *)(a1 + 24);
  if (v27) {
    int v28 = (void *)(v27 + 80);
  }
  else {
    int v28 = (void *)(*(void *)(a1 + 16) + 96LL);
  }
  int v29 = -1227133513 * ((unint64_t)(a1 - *v28) >> 3);
  unsigned __int8 v30 = *a2;
  uint64_t v31 = (v8 - *a2) >> 2;
  unint64_t v32 = v31 + 1;
  uint64_t v33 = *v6 - (void)v30;
  if (v33 >> 1 > v32) {
    unint64_t v32 = v33 >> 1;
  }
  else {
    unint64_t v34 = v32;
  }
  if (v34)
  {
    uint64_t v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(a2 + 2), v34);
    unsigned __int8 v30 = *a2;
    uint64_t v8 = a2[1];
  }

  else
  {
    uint64_t v35 = 0LL;
  }

  int v36 = &v35[4 * v31];
  uint64_t v37 = &v35[4 * v34];
  *(_DWORD *)int v36 = v29;
  int v38 = v36 + 4;
  while (v8 != v30)
  {
    int v39 = *((_DWORD *)v8 - 1);
    v8 -= 4;
    *((_DWORD *)v36 - 1) = v39;
    v36 -= 4;
  }

      a1 = v4;
LABEL_55:
      *i++ = v3;
      uint64_t v4 = a1;
      goto LABEL_56;
    }

    if (v3 == 63) {
      goto LABEL_54;
    }
    if (v3 != 88) {
      goto LABEL_56;
    }
LABEL_28:
    if ((a1[2] - 48) < 0xAu || (uint64_t v11 = a1[2] - 65, v11 <= 0x25) && ((1LL << v11) & 0x3F0000003FLL) != 0)
    {
      LOBYTE(v3) = 0;
      uint64_t v12 = a1 + 1;
      while (1)
      {
        unint64_t v14 = *++v12;
        uint64_t v13 = v14;
        if ((v14 - 48) >= 0xAu
          && (v13 - 65 > 0x25 || ((1LL << (v13 - 65)) & 0x3F0000003FLL) == 0))
        {
          break;
        }

        unint64_t v16 = v13;
        unint64_t v17 = v13 + 9;
        if (v16 <= 0x39) {
          unint64_t v17 = v16;
        }
        uint64_t v4 = v12;
        LOBYTE(v3) = v17 & 0xF | (16 * v3);
      }

      goto LABEL_54;
    }

LABEL_67:
  *(void *)a2 = v36;
  *(void *)(a2 + 8) = v38;
  *(void *)(a2 + 16) = v37;
  if (v30) {
    operator delete(v30);
  }
LABEL_69:
  *(void *)(a2 + 8) = v38;
}

  *a2 = v36;
  a2[1] = v38;
  a2[2] = v37;
  if (v30) {
    operator delete(v30);
  }
LABEL_69:
  a2[1] = v38;
}

  int v42 = *(void *)a3;
  uint64_t v41 = *(void *)(a3 + 8);
  if (v8)
  {
    int v50 = v8;
    operator delete(v8);
  }

  return v42 != v41;
}

uint64_t wireless_diagnostics::google::protobuf::FieldDescriptor::GetSourceLocation(uint64_t a1, uint64_t a2)
{
  std::string __p = 0LL;
  int v7 = 0LL;
  uint64_t v8 = 0LL;
  wireless_diagnostics::google::protobuf::FieldDescriptor::GetLocationPath(a1, (char **)&__p);
  uint64_t SourceLocation = wireless_diagnostics::google::protobuf::FileDescriptor::GetSourceLocation( *(void *)(a1 + 32),  (uint64_t)&__p,  a2);
  if (__p)
  {
    int v7 = __p;
    operator delete(__p);
  }

  return SourceLocation;
}

void sub_187C49414( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void wireless_diagnostics::google::protobuf::FieldDescriptor::GetLocationPath(uint64_t a1, char **a2)
{
  unint64_t v5 = a2 + 2;
  unint64_t v4 = (unint64_t)a2[2];
  uint64_t v6 = a2[1];
  if ((unint64_t)v6 >= v4)
  {
    uint64_t v8 = *a2;
    uint64_t v9 = (v6 - *a2) >> 2;
    unint64_t v10 = v9 + 1;
    uint64_t v11 = v4 - (void)v8;
    if (v11 >> 1 > v10) {
      unint64_t v10 = v11 >> 1;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      uint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(a2 + 2), v12);
      uint64_t v8 = *a2;
      uint64_t v6 = a2[1];
    }

    else
    {
      uint64_t v13 = 0LL;
    }

    unint64_t v14 = &v13[4 * v9];
    uint64_t v15 = &v13[4 * v12];
    *(_DWORD *)unint64_t v14 = 2;
    int v7 = v14 + 4;
    while (v6 != v8)
    {
      int v16 = *((_DWORD *)v6 - 1);
      v6 -= 4;
      *((_DWORD *)v14 - 1) = v16;
      v14 -= 4;
    }

    *a2 = v14;
    a2[1] = v7;
    a2[2] = v15;
    if (v8) {
      operator delete(v8);
    }
  }

  else
  {
    *(_DWORD *)uint64_t v6 = 2;
    int v7 = v6 + 4;
  }

  a2[1] = v7;
  if (*(_BYTE *)(a1 + 52))
  {
    uint64_t v17 = *(void *)(a1 + 64);
    if (v17) {
      int v18 = (void *)(v17 + 112);
    }
    else {
      int v18 = (void *)(*(void *)(a1 + 32) + 128LL);
    }
  }

  else
  {
    int v18 = (void *)(*(void *)(a1 + 56) + 48LL);
  }

  int v19 = -286331153 * ((unint64_t)(a1 - *v18) >> 3);
  if ((unint64_t)v7 < *v5)
  {
    *(_DWORD *)int v7 = v19;
    unint64_t v20 = v7 + 4;
    goto LABEL_38;
  }

  uint64_t v21 = *a2;
  uint64_t v22 = (v7 - *a2) >> 2;
  unint64_t v23 = v22 + 1;
  if ((unint64_t)(v22 + 1) >> 62) {
LABEL_39:
  }
    std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>::__throw_length_error[abi:ne180100]();
  uint64_t v24 = *v5 - (void)v21;
  if (v24 >> 1 > v23) {
    unint64_t v23 = v24 >> 1;
  }
  else {
    unint64_t v25 = v23;
  }
  if (v25)
  {
    int v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(a2 + 2), v25);
    uint64_t v21 = *a2;
    int v7 = a2[1];
  }

  else
  {
    int v26 = 0LL;
  }

  uint64_t v27 = &v26[4 * v22];
  int v28 = &v26[4 * v25];
  *(_DWORD *)uint64_t v27 = v19;
  unint64_t v20 = v27 + 4;
  while (v7 != v21)
  {
    int v29 = *((_DWORD *)v7 - 1);
    v7 -= 4;
    *((_DWORD *)v27 - 1) = v29;
    v27 -= 4;
  }

  *a2 = v27;
  a2[1] = v20;
  a2[2] = v28;
  if (v21) {
    operator delete(v21);
  }
LABEL_38:
  a2[1] = v20;
}

uint64_t wireless_diagnostics::google::protobuf::EnumDescriptor::GetSourceLocation(uint64_t a1, uint64_t a2)
{
  std::string __p = 0LL;
  int v7 = 0LL;
  uint64_t v8 = 0LL;
  wireless_diagnostics::google::protobuf::EnumDescriptor::GetLocationPath(a1, (char **)&__p);
  uint64_t SourceLocation = wireless_diagnostics::google::protobuf::FileDescriptor::GetSourceLocation( *(void *)(a1 + 16),  (uint64_t)&__p,  a2);
  if (__p)
  {
    int v7 = __p;
    operator delete(__p);
  }

  return SourceLocation;
}

void sub_187C4966C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void wireless_diagnostics::google::protobuf::EnumDescriptor::GetLocationPath(uint64_t a1, char **a2)
{
  uint64_t v4 = *(void *)(a1 + 24);
  if (!v4)
  {
    unint64_t v10 = a2 + 2;
    unint64_t v9 = (unint64_t)a2[2];
    uint64_t v11 = a2[1];
    if ((unint64_t)v11 >= v9)
    {
      int v18 = *a2;
      uint64_t v19 = (v11 - *a2) >> 2;
      unint64_t v20 = v19 + 1;
      uint64_t v21 = v9 - (void)v18;
      if (v21 >> 1 > v20) {
        unint64_t v20 = v21 >> 1;
      }
      else {
        unint64_t v22 = v20;
      }
      if (v22)
      {
        unint64_t v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(a2 + 2), v22);
        int v18 = *a2;
        uint64_t v11 = a2[1];
      }

      else
      {
        unint64_t v23 = 0LL;
      }

      int v40 = &v23[4 * v19];
      uint64_t v41 = &v23[4 * v22];
      *(_DWORD *)int v40 = 5;
      uint64_t v8 = v40 + 4;
      while (v11 != v18)
      {
        int v42 = *((_DWORD *)v11 - 1);
        v11 -= 4;
        *((_DWORD *)v40 - 1) = v42;
        v40 -= 4;
      }

      *a2 = v40;
      a2[1] = v8;
      a2[2] = v41;
      if (v18) {
        operator delete(v18);
      }
    }

    else
    {
      *(_DWORD *)uint64_t v11 = 5;
      uint64_t v8 = v11 + 4;
    }

    a2[1] = v8;
    uint64_t v43 = *(void *)(a1 + 24);
    if (v43) {
      int v44 = (void *)(v43 + 80);
    }
    else {
      int v44 = (void *)(*(void *)(a1 + 16) + 96LL);
    }
    int v29 = -1227133513 * ((unint64_t)(a1 - *v44) >> 3);
    if ((unint64_t)v8 >= *v10)
    {
      unsigned __int8 v30 = *a2;
      uint64_t v45 = (v8 - *a2) >> 2;
      unint64_t v46 = v45 + 1;
      if (!((unint64_t)(v45 + 1) >> 62))
      {
        uint64_t v47 = *v10 - (void)v30;
        if (v47 >> 1 > v46) {
          unint64_t v46 = v47 >> 1;
        }
        else {
          unint64_t v48 = v46;
        }
        if (v48)
        {
          int v49 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(a2 + 2), v48);
          unsigned __int8 v30 = *a2;
          uint64_t v8 = a2[1];
        }

        else
        {
          int v49 = 0LL;
        }

        int v36 = &v49[4 * v45];
        uint64_t v37 = &v49[4 * v48];
        *(_DWORD *)int v36 = v29;
        int v38 = v36 + 4;
        while (v8 != v30)
        {
          int v50 = *((_DWORD *)v8 - 1);
          v8 -= 4;
          *((_DWORD *)v36 - 1) = v50;
          v36 -= 4;
        }

        goto LABEL_67;
      }

uint64_t wireless_diagnostics::google::protobuf::MethodDescriptor::GetSourceLocation(uint64_t a1, uint64_t a2)
{
  std::string __p = 0LL;
  int v7 = 0LL;
  uint64_t v8 = 0LL;
  wireless_diagnostics::google::protobuf::MethodDescriptor::GetLocationPath(a1, (char **)&__p);
  uint64_t SourceLocation = wireless_diagnostics::google::protobuf::FileDescriptor::GetSourceLocation( *(void *)(*(void *)(a1 + 16) + 16LL),  (uint64_t)&__p,  a2);
  if (__p)
  {
    int v7 = __p;
    operator delete(__p);
  }

  return SourceLocation;
}

void sub_187C49A24( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void wireless_diagnostics::google::protobuf::MethodDescriptor::GetLocationPath(uint64_t a1, char **a2)
{
  uint64_t v4 = a2[2];
  unint64_t v5 = a2[1];
  if (v5 >= v4)
  {
    int v7 = *a2;
    uint64_t v8 = (v5 - *a2) >> 2;
    unint64_t v9 = v8 + 1;
    uint64_t v10 = v4 - v7;
    if (v10 >> 1 > v9) {
      unint64_t v9 = v10 >> 1;
    }
    else {
      unint64_t v11 = v9;
    }
    if (v11)
    {
      unint64_t v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(a2 + 2), v11);
      int v7 = *a2;
      unint64_t v5 = a2[1];
    }

    else
    {
      unint64_t v12 = 0LL;
    }

    uint64_t v13 = &v12[4 * v8];
    uint64_t v4 = &v12[4 * v11];
    *(_DWORD *)uint64_t v13 = 2;
    uint64_t v6 = v13 + 4;
    while (v5 != v7)
    {
      int v14 = *((_DWORD *)v5 - 1);
      v5 -= 4;
      *((_DWORD *)v13 - 1) = v14;
      v13 -= 4;
    }

    *a2 = v13;
    a2[1] = v6;
    a2[2] = v4;
    if (v7)
    {
      operator delete(v7);
      uint64_t v4 = a2[2];
    }
  }

  else
  {
    *(_DWORD *)unint64_t v5 = 2;
    uint64_t v6 = v5 + 4;
  }

  a2[1] = v6;
  int v15 = -1431655765 * ((unint64_t)(a1 - *(void *)(*(void *)(a1 + 16) + 40LL)) >> 4);
  if (v6 < v4)
  {
    *(_DWORD *)uint64_t v6 = v15;
    unint64_t v16 = v6 + 4;
    goto LABEL_33;
  }

  uint64_t v17 = *a2;
  uint64_t v18 = (v6 - *a2) >> 2;
  unint64_t v19 = v18 + 1;
  if ((unint64_t)(v18 + 1) >> 62) {
LABEL_34:
  }
    std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>::__throw_length_error[abi:ne180100]();
  uint64_t v20 = v4 - v17;
  if (v20 >> 1 > v19) {
    unint64_t v19 = v20 >> 1;
  }
  else {
    unint64_t v21 = v19;
  }
  if (v21)
  {
    unint64_t v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(a2 + 2), v21);
    uint64_t v17 = *a2;
    uint64_t v6 = a2[1];
  }

  else
  {
    unint64_t v22 = 0LL;
  }

  unint64_t v23 = &v22[4 * v18];
  uint64_t v24 = &v22[4 * v21];
  *(_DWORD *)unint64_t v23 = v15;
  unint64_t v16 = v23 + 4;
  while (v6 != v17)
  {
    int v25 = *((_DWORD *)v6 - 1);
    v6 -= 4;
    *((_DWORD *)v23 - 1) = v25;
    v23 -= 4;
  }

  *a2 = v23;
  a2[1] = v16;
  a2[2] = v24;
  if (v17) {
    operator delete(v17);
  }
LABEL_33:
  a2[1] = v16;
}

uint64_t wireless_diagnostics::google::protobuf::ServiceDescriptor::GetSourceLocation(uint64_t a1, uint64_t a2)
{
  std::string __p = 0LL;
  int v7 = 0LL;
  uint64_t v8 = 0LL;
  wireless_diagnostics::google::protobuf::ServiceDescriptor::GetLocationPath(a1, (char **)&__p);
  uint64_t SourceLocation = wireless_diagnostics::google::protobuf::FileDescriptor::GetSourceLocation( *(void *)(a1 + 16),  (uint64_t)&__p,  a2);
  if (__p)
  {
    int v7 = __p;
    operator delete(__p);
  }

  return SourceLocation;
}

void sub_187C49C54( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void wireless_diagnostics::google::protobuf::ServiceDescriptor::GetLocationPath(uint64_t a1, char **a2)
{
  unint64_t v5 = a2 + 2;
  uint64_t v4 = a2[2];
  uint64_t v6 = a2[1];
  if (v6 >= v4)
  {
    uint64_t v8 = *a2;
    uint64_t v9 = (v6 - *a2) >> 2;
    unint64_t v10 = v9 + 1;
    uint64_t v11 = v4 - v8;
    if (v11 >> 1 > v10) {
      unint64_t v10 = v11 >> 1;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      uint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)v5, v12);
      uint64_t v8 = *a2;
      uint64_t v6 = a2[1];
    }

    else
    {
      uint64_t v13 = 0LL;
    }

    int v14 = &v13[4 * v9];
    uint64_t v4 = &v13[4 * v12];
    *(_DWORD *)int v14 = 6;
    int v7 = v14 + 4;
    while (v6 != v8)
    {
      int v15 = *((_DWORD *)v6 - 1);
      v6 -= 4;
      *((_DWORD *)v14 - 1) = v15;
      v14 -= 4;
    }

    *a2 = v14;
    a2[1] = v7;
    a2[2] = v4;
    if (v8)
    {
      operator delete(v8);
      uint64_t v4 = *v5;
    }
  }

  else
  {
    *(_DWORD *)uint64_t v6 = 6;
    int v7 = v6 + 4;
  }

  a2[1] = v7;
  int v16 = -1431655765 * ((unint64_t)(a1 - *(void *)(*(void *)(a1 + 16) + 112LL)) >> 4);
  if (v7 < v4)
  {
    *(_DWORD *)int v7 = v16;
    uint64_t v17 = v7 + 4;
    goto LABEL_33;
  }

  uint64_t v18 = *a2;
  uint64_t v19 = (v7 - *a2) >> 2;
  unint64_t v20 = v19 + 1;
  if ((unint64_t)(v19 + 1) >> 62) {
LABEL_34:
  }
    std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>::__throw_length_error[abi:ne180100]();
  uint64_t v21 = v4 - v18;
  if (v21 >> 1 > v20) {
    unint64_t v20 = v21 >> 1;
  }
  else {
    unint64_t v22 = v20;
  }
  if (v22)
  {
    unint64_t v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)v5, v22);
    uint64_t v18 = *a2;
    int v7 = a2[1];
  }

  else
  {
    unint64_t v23 = 0LL;
  }

  uint64_t v24 = &v23[4 * v19];
  int v25 = &v23[4 * v22];
  *(_DWORD *)uint64_t v24 = v16;
  uint64_t v17 = v24 + 4;
  while (v7 != v18)
  {
    int v26 = *((_DWORD *)v7 - 1);
    v7 -= 4;
    *((_DWORD *)v24 - 1) = v26;
    v24 -= 4;
  }

  *a2 = v24;
  a2[1] = v17;
  a2[2] = v25;
  if (v18) {
    operator delete(v18);
  }
LABEL_33:
  a2[1] = v17;
}

uint64_t wireless_diagnostics::google::protobuf::EnumValueDescriptor::GetSourceLocation( uint64_t a1, uint64_t a2)
{
  std::string __p = 0LL;
  int v7 = 0LL;
  uint64_t v8 = 0LL;
  wireless_diagnostics::google::protobuf::EnumValueDescriptor::GetLocationPath(a1, (char **)&__p);
  uint64_t SourceLocation = wireless_diagnostics::google::protobuf::FileDescriptor::GetSourceLocation( *(void *)(*(void *)(a1 + 24) + 16LL),  (uint64_t)&__p,  a2);
  if (__p)
  {
    int v7 = __p;
    operator delete(__p);
  }

  return SourceLocation;
}

void sub_187C49E80( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void wireless_diagnostics::google::protobuf::EnumValueDescriptor::GetLocationPath(uint64_t a1, char **a2)
{
  uint64_t v4 = a2[2];
  unint64_t v5 = a2[1];
  if (v5 >= v4)
  {
    int v7 = *a2;
    uint64_t v8 = (v5 - *a2) >> 2;
    unint64_t v9 = v8 + 1;
    uint64_t v10 = v4 - v7;
    if (v10 >> 1 > v9) {
      unint64_t v9 = v10 >> 1;
    }
    else {
      unint64_t v11 = v9;
    }
    if (v11)
    {
      unint64_t v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(a2 + 2), v11);
      int v7 = *a2;
      unint64_t v5 = a2[1];
    }

    else
    {
      unint64_t v12 = 0LL;
    }

    uint64_t v13 = &v12[4 * v8];
    uint64_t v4 = &v12[4 * v11];
    *(_DWORD *)uint64_t v13 = 2;
    uint64_t v6 = v13 + 4;
    while (v5 != v7)
    {
      int v14 = *((_DWORD *)v5 - 1);
      v5 -= 4;
      *((_DWORD *)v13 - 1) = v14;
      v13 -= 4;
    }

    *a2 = v13;
    a2[1] = v6;
    a2[2] = v4;
    if (v7)
    {
      operator delete(v7);
      uint64_t v4 = a2[2];
    }
  }

  else
  {
    *(_DWORD *)unint64_t v5 = 2;
    uint64_t v6 = v5 + 4;
  }

  a2[1] = v6;
  int v15 = -858993459 * ((unint64_t)(a1 - *(void *)(*(void *)(a1 + 24) + 48LL)) >> 3);
  if (v6 < v4)
  {
    *(_DWORD *)uint64_t v6 = v15;
    int v16 = v6 + 4;
    goto LABEL_33;
  }

  uint64_t v17 = *a2;
  uint64_t v18 = (v6 - *a2) >> 2;
  unint64_t v19 = v18 + 1;
  if ((unint64_t)(v18 + 1) >> 62) {
LABEL_34:
  }
    std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>::__throw_length_error[abi:ne180100]();
  uint64_t v20 = v4 - v17;
  if (v20 >> 1 > v19) {
    unint64_t v19 = v20 >> 1;
  }
  else {
    unint64_t v21 = v19;
  }
  if (v21)
  {
    unint64_t v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(a2 + 2), v21);
    uint64_t v17 = *a2;
    uint64_t v6 = a2[1];
  }

  else
  {
    unint64_t v22 = 0LL;
  }

  unint64_t v23 = &v22[4 * v18];
  uint64_t v24 = &v22[4 * v21];
  *(_DWORD *)unint64_t v23 = v15;
  int v16 = v23 + 4;
  while (v6 != v17)
  {
    int v25 = *((_DWORD *)v6 - 1);
    v6 -= 4;
    *((_DWORD *)v23 - 1) = v25;
    v23 -= 4;
  }

  *a2 = v23;
  a2[1] = v16;
  a2[2] = v24;
  if (v17) {
    operator delete(v17);
  }
LABEL_33:
  a2[1] = v16;
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorPool::BuildFile( wireless_diagnostics::google::protobuf::DescriptorPool *this, const wireless_diagnostics::google::protobuf::FileDescriptorProto *a2)
{
  if (*((void *)this + 1))
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v7);
  }

  if (*(void *)this)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v7);
  }

  uint64_t v4 = (void *)*((void *)this + 4);
  v7[0] = this;
  v7[1] = v4;
  uint64_t v11 = 0LL;
  uint64_t v12 = 0LL;
  v15[0] = 0LL;
  v15[1] = 0LL;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  char v10 = 0;
  uint64_t v13 = 0LL;
  int v14 = v15;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v5 = wireless_diagnostics::google::protobuf::DescriptorBuilder::BuildFile( (wireless_diagnostics::google::protobuf::DescriptorBuilder *)v7,  a2);
  wireless_diagnostics::google::protobuf::DescriptorBuilder::~DescriptorBuilder(v7);
  return v5;
}

void sub_187C4A15C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

double wireless_diagnostics::google::protobuf::DescriptorBuilder::DescriptorBuilder( wireless_diagnostics::google::protobuf::DescriptorBuilder *this, const wireless_diagnostics::google::protobuf::DescriptorPool *a2, wireless_diagnostics::google::protobuf::DescriptorPool::Tables *a3, wireless_diagnostics::google::protobuf::DescriptorPool::ErrorCollector *a4)
{
  *(void *)this = a2;
  *((void *)this + 1) = a3;
  *((void *)this + 8) = 0LL;
  *((void *)this + 9) = 0LL;
  *((void *)this + 7) = 0LL;
  *((void *)this + 14) = 0LL;
  *((void *)this + 13) = 0LL;
  *((void *)this + 2) = a4;
  *((void *)this + 3) = 0LL;
  *((void *)this + 4) = 0LL;
  *((void *)this + 5) = 0LL;
  *((_BYTE *)this + MEMORY[0x1895B3490](v1 - 48) = 0;
  *((void *)this + 12) = (char *)this + 104;
  double result = 0.0;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  return result;
}

{
  double result;
  *(void *)this = a2;
  *((void *)this + 1) = a3;
  *((void *)this + 8) = 0LL;
  *((void *)this + 9) = 0LL;
  *((void *)this + 7) = 0LL;
  *((void *)this + 14) = 0LL;
  *((void *)this + 13) = 0LL;
  *((void *)this + 2) = a4;
  *((void *)this + 3) = 0LL;
  *((void *)this + 4) = 0LL;
  *((void *)this + 5) = 0LL;
  *((_BYTE *)this + MEMORY[0x1895B3490](v1 - 48) = 0;
  *((void *)this + 12) = (char *)this + 104;
  double result = 0.0;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorBuilder::BuildFile( wireless_diagnostics::google::protobuf::DescriptorBuilder *this, const wireless_diagnostics::google::protobuf::FileDescriptorProto *a2)
{
  uint64_t v139 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (char *)this + 56;
  std::string::operator=((std::string *)((char *)this + 56), *((const std::string **)a2 + 2));
  uint64_t v5 = (void *)(*((void *)this + 1) + 240LL);
  else {
    std::string::size_type v6 = *((void *)this + 7);
  }
  v134.__r_.__value_.__r.__words[0] = v6;
  int v7 = std::__hash_table<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::hash<char const*>,wireless_diagnostics::google::protobuf::streq,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::streq,wireless_diagnostics::google::protobuf::hash<char const*>,true>,std::allocator<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>>>::find<char const*>( v5,  (const char **)&v134.__r_.__value_.__l.__data_);
  if (!v7) {
    goto LABEL_31;
  }
  uint64_t v8 = (uint64_t)v7[3];
  if (!v8) {
    goto LABEL_31;
  }
  wireless_diagnostics::google::protobuf::FileDescriptorProto::FileDescriptorProto((wireless_diagnostics::google::protobuf::FileDescriptorProto *)&v134);
  wireless_diagnostics::google::protobuf::FileDescriptor::CopyTo( (wireless_diagnostics::google::protobuf::FileDescriptor *)v8,  (wireless_diagnostics::google::protobuf::FileDescriptorProto *)&v134);
  wireless_diagnostics::google::protobuf::MessageLite::SerializeAsString((wireless_diagnostics::google::protobuf::MessageLite *)&v134);
  wireless_diagnostics::google::protobuf::MessageLite::SerializeAsString(a2);
  unsigned __int8 size = v136.__r_.__value_.__s.__size_;
  if ((v136.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    std::string::size_type v10 = v136.__r_.__value_.__s.__size_;
  }
  else {
    std::string::size_type v10 = v136.__r_.__value_.__l.__size_;
  }
  uint64_t v11 = HIBYTE(v138);
  int v12 = SHIBYTE(v138);
  if (v138 < 0) {
    uint64_t v11 = *((void *)&v137 + 1);
  }
  if (v10 != v11)
  {
    BOOL v22 = 0;
    if ((SHIBYTE(v138) & 0x80000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_25;
  }

  if (v138 >= 0) {
    uint64_t v13 = (unsigned __int8 *)&v137;
  }
  else {
    uint64_t v13 = (unsigned __int8 *)v137;
  }
  if ((char)v136.__r_.__value_.__s.__size_ < 0)
  {
    BOOL v22 = memcmp(v136.__r_.__value_.__l.__data_, v13, v136.__r_.__value_.__l.__size_) == 0;
    goto LABEL_28;
  }

  if (v136.__r_.__value_.__s.__size_)
  {
    uint64_t v14 = v136.__r_.__value_.__s.__size_ - 1LL;
    int v15 = &v136;
    do
    {
      int v17 = v15->__r_.__value_.__s.__data_[0];
      int v15 = (std::string *)((char *)v15 + 1);
      int v16 = v17;
      int v19 = *v13++;
      int v18 = v19;
      BOOL v21 = v14-- != 0;
      BOOL v22 = v16 == v18;
    }

    while (v16 == v18 && v21);
LABEL_28:
    if ((v12 & 0x80000000) == 0) {
      goto LABEL_29;
    }
LABEL_25:
    operator delete((void *)v137);
    if ((v136.__r_.__value_.__s.__size_ & 0x80) == 0) {
      goto LABEL_30;
    }
    goto LABEL_26;
  }

  BOOL v22 = 1;
  if (SHIBYTE(v138) < 0) {
    goto LABEL_25;
  }
LABEL_29:
  if ((size & 0x80) != 0) {
LABEL_26:
  }
    operator delete(v136.__r_.__value_.__l.__data_);
LABEL_30:
  wireless_diagnostics::google::protobuf::FileDescriptorProto::~FileDescriptorProto((wireless_diagnostics::google::protobuf::FileDescriptorProto *)&v134);
  if (v22) {
    return v8;
  }
LABEL_31:
  unint64_t v23 = (uint64_t *)*((void *)this + 1);
  uint64_t v24 = *v23;
  unint64_t v131 = v23[1];
  if (v131 != *v23)
  {
    uint64_t v25 = 0LL;
    int v26 = (unsigned __int8 *)*((void *)a2 + 2);
    int v27 = (char)v26[23];
    if (v27 >= 0) {
      uint64_t v28 = v26[23];
    }
    else {
      uint64_t v28 = *((void *)v26 + 1);
    }
    else {
      uint64_t v29 = (uint64_t)(v131 - v24) / 24;
    }
    do
    {
      unsigned __int8 v30 = (unsigned __int8 *)(v24 + 24 * v25);
      uint64_t v31 = v30[23];
      if ((v31 & 0x80u) == 0LL) {
        uint64_t v32 = v30[23];
      }
      else {
        uint64_t v32 = *((void *)v30 + 1);
      }
      if (v32 == v28)
      {
        if (v27 >= 0) {
          uint64_t v33 = v26;
        }
        else {
          uint64_t v33 = *(unsigned __int8 **)v26;
        }
        if ((v31 & 0x80) != 0)
        {
          if (!memcmp(*(const void **)v30, v33, *((void *)v30 + 1)))
          {
LABEL_55:
            std::string::basic_string[abi:ne180100]<0>(&v134, "File recursively imports itself: ");
            uint64_t v36 = **((void **)this + 1);
            if (0xAAAAAAAAAAAAAAABLL * ((*(void *)(*((void *)this + 1) + 8LL) - v36) >> 3) > v25)
            {
              unint64_t v37 = v25;
              uint64_t v38 = 24LL * v25;
              do
              {
                uint64_t v39 = v36 + v38;
                int v40 = *(char *)(v39 + 23);
                if (v40 >= 0) {
                  uint64_t v41 = (const std::string::value_type *)v39;
                }
                else {
                  uint64_t v41 = *(const std::string::value_type **)v39;
                }
                if (v40 >= 0) {
                  std::string::size_type v42 = *(unsigned __int8 *)(v39 + 23);
                }
                else {
                  std::string::size_type v42 = *(void *)(v39 + 8);
                }
                std::string::append(&v134, v41, v42);
                std::string::append(&v134, " -> ");
                ++v37;
                uint64_t v36 = **((void **)this + 1);
                v38 += 24LL;
              }

              while (0xAAAAAAAAAAAAAAABLL * ((*(void *)(*((void *)this + 1) + 8LL) - v36) >> 3) > v37);
            }

            uint64_t v43 = *((void *)a2 + 2);
            int v44 = *(char *)(v43 + 23);
            if (v44 >= 0) {
              uint64_t v45 = (const std::string::value_type *)*((void *)a2 + 2);
            }
            else {
              uint64_t v45 = *(const std::string::value_type **)v43;
            }
            if (v44 >= 0) {
              std::string::size_type v46 = *(unsigned __int8 *)(v43 + 23);
            }
            else {
              std::string::size_type v46 = *(void *)(v43 + 8);
            }
            std::string::append(&v134, v45, v46);
            wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)this,  *((void *)a2 + 2),  (uint64_t)a2,  9LL,  (uint64_t)&v134);
            return 0LL;
          }
        }

        else
        {
          if (!v30[23]) {
            goto LABEL_55;
          }
          while (*v30 == *v33)
          {
            ++v30;
            ++v33;
            if (!--v31) {
              goto LABEL_55;
            }
          }
        }
      }

      ++v25;
    }

    while (v25 != v29);
  }

  if (*(void *)(*(void *)this + 8LL))
  {
    unint64_t v34 = (__int128 *)*((void *)a2 + 2);
    if (v131 >= v23[2])
    {
      uint64_t v35 = std::vector<std::string>::__push_back_slow_path<std::string const&>(v23, v34);
    }

    else
    {
      std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>((uint64_t)v23, v34);
      uint64_t v35 = v131 + 24;
    }

    v23[1] = v35;
    if (*((int *)a2 + 10) >= 1)
    {
      uint64_t v47 = 0LL;
      while (1)
      {
        uint64_t v48 = *(void *)(*((void *)a2 + 4) + 8 * v47);
        int v49 = (void *)(*((void *)this + 1) + 240LL);
        else {
          std::string::size_type v50 = *(void *)v48;
        }
        v134.__r_.__value_.__r.__words[0] = v50;
        uint64_t v51 = std::__hash_table<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::hash<char const*>,wireless_diagnostics::google::protobuf::streq,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::streq,wireless_diagnostics::google::protobuf::hash<char const*>,true>,std::allocator<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>>>::find<char const*>( v49,  (const char **)&v134.__r_.__value_.__l.__data_);
        if (v51 && v51[3]) {
          goto LABEL_84;
        }
        uint64_t v52 = *(wireless_diagnostics::google::protobuf::DescriptorPool **)this;
        if (!*(void *)(*(void *)this + 24LL)) {
          goto LABEL_83;
        }
        if (!wireless_diagnostics::google::protobuf::DescriptorPool::FindFileByName( *(wireless_diagnostics::google::protobuf::internal::Mutex ***)(*(void *)this + 24LL),  *(char **)(*((void *)a2 + 4) + 8 * v47))) {
          break;
        }
LABEL_84:
      }

      uint64_t v52 = *(wireless_diagnostics::google::protobuf::DescriptorPool **)this;
LABEL_83:
      wireless_diagnostics::google::protobuf::DescriptorPool::TryFindFileInFallbackDatabase( v52,  *(_BYTE **)(*((void *)a2 + 4) + 8 * v47));
      goto LABEL_84;
    }

LABEL_85:
    __int128 v53 = (uint64_t *)*((void *)this + 1);
    uint64_t v54 = v53[1];
    __int128 v55 = (void **)(v54 - 24);
    unint64_t v23 = v53;
    if (*(char *)(v54 - 1) < 0)
    {
      operator delete(*v55);
      unint64_t v23 = (uint64_t *)*((void *)this + 1);
    }

    v53[1] = (uint64_t)v55;
  }

  wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AddCheckpoint((wireless_diagnostics::google::protobuf::DescriptorPool::Tables *)v23);
  Bytes = (wireless_diagnostics::google::protobuf::SourceCodeInfo *)wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateBytes( *((wireless_diagnostics::google::protobuf::DescriptorPool::Tables **)this + 1),  160);
  uint64_t v8 = (uint64_t)Bytes;
  *((void *)this + 10) = Bytes;
  if ((*((_BYTE *)a2 + 205) & 4) != 0)
  {
    __int128 v61 = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateMessage<wireless_diagnostics::google::protobuf::SourceCodeInfo>(*((void **)this + 1));
    uint64_t v60 = (uint64_t)v61;
    __int128 v62 = (const wireless_diagnostics::google::protobuf::SourceCodeInfo *)*((void *)a2 + 24);
    if (!v62) {
      __int128 v62 = *(const wireless_diagnostics::google::protobuf::SourceCodeInfo **)(wireless_diagnostics::google::protobuf::FileDescriptorProto::default_instance_
    }
                                                                             + 192);
    wireless_diagnostics::google::protobuf::SourceCodeInfo::CopyFrom(v61, v62);
  }

  else
  {
    uint64_t v60 = wireless_diagnostics::google::protobuf::SourceCodeInfo::default_instance(Bytes, v57, v58, v59);
  }

  *(void *)(v8 + 152) = v60;
  FileTables = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateFileTables(*((wireless_diagnostics::google::protobuf::DescriptorPool::Tables **)this
                                                                                                  + 1));
  *((void *)this + 11) = FileTables;
  *(void *)(*((void *)this + 10) + 144LL) = FileTables;
  if ((*((_BYTE *)a2 + 204) & 1) == 0)
  {
    std::string::basic_string[abi:ne180100]<0>(&v134, "");
    std::string::basic_string[abi:ne180100]<0>(&v136, "Missing field: FileDescriptorProto.name.");
    wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)this,  (uint64_t)&v134,  (uint64_t)a2,  9LL,  (uint64_t)&v136);
  }

  *(void *)uint64_t v8 = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateString( *((void **)this + 1),  *((void *)a2 + 2));
  unsigned __int8 v64 = (void *)*((void *)this + 1);
  if ((*((_BYTE *)a2 + 204) & 2) != 0)
  {
    *(void *)(v8 + 8) = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateString( *((void **)this + 1),  *((void *)a2 + 3));
  }

  else
  {
    std::string::basic_string[abi:ne180100]<0>(&v134, "");
    *(void *)(v8 + 8) = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateString( v64,  (uint64_t)&v134);
  }

  *(void *)(v8 + 16) = *(void *)this;
  if ((wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AddFile(*((void **)this + 1), v8) & 1) == 0)
  {
    uint64_t v66 = *((void *)a2 + 2);
    std::string::basic_string[abi:ne180100]<0>(&v134, "A file with this name is already in the pool.");
    wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)this,  v66,  (uint64_t)a2,  9LL,  (uint64_t)&v134);
    wireless_diagnostics::google::protobuf::DescriptorPool::Tables::RollbackToLastCheckpoint(*((wireless_diagnostics::google::protobuf::DescriptorPool::Tables **)this
                                                                                             + 1));
    return 0LL;
  }

  uint64_t v65 = *(std::string **)(v8 + 8);
  if (((char)v65->__r_.__value_.__s.__size_ & 0x80000000) == 0)
  {
    if (!v65->__r_.__value_.__s.__size_) {
      goto LABEL_112;
    }
    goto LABEL_111;
  }

  if (v65->__r_.__value_.__l.__size_) {
LABEL_111:
  }
    wireless_diagnostics::google::protobuf::DescriptorBuilder::AddPackage((uint64_t)this, v65, (uint64_t)a2, v8);
LABEL_112:
  v133[0] = 0LL;
  v133[1] = 0LL;
  v132 = v133;
  int v67 = *((_DWORD *)a2 + 10);
  *(_DWORD *)(v8 + 24) = v67;
  *(void *)(v8 + 32) = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateBytes( *((wireless_diagnostics::google::protobuf::DescriptorPool::Tables **)this + 1),  8 * v67);
  if (*((int *)a2 + 10) >= 1)
  {
    uint64_t v68 = 0LL;
    while (1)
    {
      uint64_t v69 = *(const void ***)(*((void *)a2 + 4) + 8 * v68);
      std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string const&>( (uint64_t **)&v132,  v69,  (uint64_t)v69);
      if ((v70 & 1) == 0)
      {
        uint64_t v71 = *((void *)a2 + 2);
        std::operator+<char>();
        int v72 = std::string::append(&v136, " was listed twice.");
        __int128 v73 = *(_OWORD *)&v72->__r_.__value_.__l.__data_;
        v134.__r_.__value_.__l.__cap_ = v72->__r_.__value_.__l.__cap_;
        *(_OWORD *)&v134.__r_.__value_.__l.__data_ = v73;
        v72->__r_.__value_.__l.__size_ = 0LL;
        v72->__r_.__value_.__l.__cap_ = 0LL;
        v72->__r_.__value_.__r.__words[0] = 0LL;
        wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)this,  v71,  (uint64_t)a2,  9LL,  (uint64_t)&v134);
      }

      uint64_t v74 = *(void *)(*((void *)a2 + 4) + 8 * v68);
      uint64_t v75 = (void *)(*((void *)this + 1) + 240LL);
      else {
        std::string::size_type v76 = *(void *)v74;
      }
      v134.__r_.__value_.__r.__words[0] = v76;
      uint64_t v77 = std::__hash_table<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::hash<char const*>,wireless_diagnostics::google::protobuf::streq,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::streq,wireless_diagnostics::google::protobuf::hash<char const*>,true>,std::allocator<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>>>::find<char const*>( v75,  (const char **)&v134.__r_.__value_.__l.__data_);
      if (v77)
      {
        uint64_t FileByName = (uint64_t)v77[3];
        if (FileByName) {
          goto LABEL_141;
        }
      }

      uint64_t v79 = *(void *)this;
      int v80 = *(wireless_diagnostics::google::protobuf::internal::Mutex ***)(*(void *)this + 24LL);
      if (!v80) {
        goto LABEL_127;
      }
      uint64_t FileByName = wireless_diagnostics::google::protobuf::DescriptorPool::FindFileByName( v80,  *(char **)(*((void *)a2 + 4) + 8 * v68));
      if (!FileByName) {
        break;
      }
LABEL_141:
      *(void *)(*(void *)(v8 + 32) + 8 * v68++) = FileByName;
    }

    uint64_t v79 = *(void *)this;
LABEL_127:
    if (*(_BYTE *)(v79 + 41))
    {
      uint64_t FileByName = (uint64_t)wireless_diagnostics::google::protobuf::DescriptorBuilder::NewPlaceholderFile( (uint64_t)this,  *(void *)(*((void *)a2 + 4) + 8 * v68));
    }

    else
    {
      memset(&v134, 0, sizeof(v134));
      if (*(void *)(v79 + 8))
      {
        std::operator+<char>();
        uint64_t v81 = std::string::append(&v136, " was not found or had errors.");
        std::string::size_type v82 = v81->__r_.__value_.__r.__words[0];
        *(void *)&__int128 v137 = v81->__r_.__value_.__l.__size_;
        *(void *)((char *)&v137 + 7) = *(std::string::size_type *)((char *)&v81->__r_.__value_.__r.__words[1] + 7);
        unsigned __int8 v83 = v81->__r_.__value_.__s.__size_;
        v81->__r_.__value_.__l.__size_ = 0LL;
        v81->__r_.__value_.__l.__cap_ = 0LL;
        v81->__r_.__value_.__r.__words[0] = 0LL;
        v134.__r_.__value_.__r.__words[0] = v82;
        v134.__r_.__value_.__l.__size_ = v137;
        *(std::string::size_type *)((char *)&v134.__r_.__value_.__r.__words[1] + 7) = *(void *)((char *)&v137 + 7);
        v134.__r_.__value_.__s.__size_ = v83;
      }

      else
      {
        std::operator+<char>();
        int v84 = std::string::append(&v136, " has not been loaded.");
        std::string::size_type v85 = v84->__r_.__value_.__r.__words[0];
        *(void *)&__int128 v137 = v84->__r_.__value_.__l.__size_;
        *(void *)((char *)&v137 + 7) = *(std::string::size_type *)((char *)&v84->__r_.__value_.__r.__words[1] + 7);
        unsigned __int8 v86 = v84->__r_.__value_.__s.__size_;
        v84->__r_.__value_.__l.__size_ = 0LL;
        v84->__r_.__value_.__l.__cap_ = 0LL;
        v84->__r_.__value_.__r.__words[0] = 0LL;
        v134.__r_.__value_.__r.__words[0] = v85;
        v134.__r_.__value_.__l.__size_ = v137;
        *(std::string::size_type *)((char *)&v134.__r_.__value_.__r.__words[1] + 7) = *(void *)((char *)&v137 + 7);
        v134.__r_.__value_.__s.__size_ = v86;
      }

      wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)this,  *((void *)a2 + 2),  (uint64_t)a2,  9LL,  (uint64_t)&v134);
      uint64_t FileByName = 0LL;
    }

    goto LABEL_141;
  }

LABEL_142:
  *(void *)(v8 + MEMORY[0x1895B3490](v1 - 48) = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateBytes( *((wireless_diagnostics::google::protobuf::DescriptorPool::Tables **)this + 1),  4 * *((_DWORD *)a2 + 16));
  if (*((int *)a2 + 16) < 1)
  {
    int v88 = 0;
  }

  else
  {
    uint64_t v87 = 0LL;
    int v88 = 0;
    do
    {
      int v89 = *(_DWORD *)(*((void *)a2 + 7) + 4 * v87);
      if (v89 < 0 || v89 >= *((_DWORD *)a2 + 10))
      {
        uint64_t v90 = *((void *)a2 + 2);
        std::string::basic_string[abi:ne180100]<0>(&v134, "Invalid public dependency index.");
        wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)this,  v90,  (uint64_t)a2,  9LL,  (uint64_t)&v134);
      }

      else
      {
        *(_DWORD *)(*(void *)(v8 + 48) + 4LL * v88++) = v89;
      }

      ++v87;
    }

    while (v87 < *((int *)a2 + 16));
  }

  *(_DWORD *)(v8 + 40) = v88;
  std::__tree<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::__map_value_compare<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::less<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>,true>,std::allocator<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>>>::destroy( (uint64_t)this + 96,  *((void **)this + 13));
  *((void *)this + 12) = (char *)this + 104;
  *((void *)this + 13) = 0LL;
  *((void *)this + 14) = 0LL;
  if (*(int *)(v8 + 24) >= 1)
  {
    uint64_t v91 = 0LL;
    do
      wireless_diagnostics::google::protobuf::DescriptorBuilder::RecordPublicDependencies( (uint64_t *)this,  *(void *)(*(void *)(v8 + 32) + 8 * v91++));
    while (v91 < *(int *)(v8 + 24));
  }

  *(void *)(v8 + MEMORY[0x1895B3334](v2 - 64) = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateBytes( *((wireless_diagnostics::google::protobuf::DescriptorPool::Tables **)this + 1),  4 * *((_DWORD *)a2 + 20));
  if (*((int *)a2 + 20) < 1)
  {
    int v93 = 0;
  }

  else
  {
    uint64_t v92 = 0LL;
    int v93 = 0;
    do
    {
      int v94 = *(_DWORD *)(*((void *)a2 + 9) + 4 * v92);
      if (v94 < 0 || v94 >= *((_DWORD *)a2 + 10))
      {
        uint64_t v95 = *((void *)a2 + 2);
        std::string::basic_string[abi:ne180100]<0>(&v134, "Invalid weak dependency index.");
        wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)this,  v95,  (uint64_t)a2,  9LL,  (uint64_t)&v134);
      }

      else
      {
        *(_DWORD *)(*(void *)(v8 + 64) + 4LL * v93++) = v94;
      }

      ++v92;
    }

    while (v92 < *((int *)a2 + 20));
  }

  *(_DWORD *)(v8 + 56) = v93;
  int v96 = *((_DWORD *)a2 + 24);
  *(_DWORD *)(v8 + 72) = v96;
  *(void *)(v8 + 80) = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateBytes( *((wireless_diagnostics::google::protobuf::DescriptorPool::Tables **)this + 1),  120 * v96);
  if (*((int *)a2 + 24) >= 1)
  {
    uint64_t v97 = 0LL;
    uint64_t v98 = 0LL;
    do
    {
      wireless_diagnostics::google::protobuf::DescriptorBuilder::BuildMessage( this,  *(const wireless_diagnostics::google::protobuf::DescriptorProto **)(*((void *)a2 + 11) + 8 * v98++),  0LL,  (wireless_diagnostics::google::protobuf::Descriptor *)(*(void *)(v8 + 80) + v97));
      v97 += 120LL;
    }

    while (v98 < *((int *)a2 + 24));
  }

  int v99 = *((_DWORD *)a2 + 30);
  *(_DWORD *)(v8 + 88) = v99;
  *(void *)(v8 + 96) = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateBytes( *((wireless_diagnostics::google::protobuf::DescriptorPool::Tables **)this + 1),  56 * v99);
  if (*((int *)a2 + 30) >= 1)
  {
    uint64_t v100 = 0LL;
    uint64_t v101 = 0LL;
    do
    {
      wireless_diagnostics::google::protobuf::DescriptorBuilder::BuildEnum( this,  *(const wireless_diagnostics::google::protobuf::EnumDescriptorProto **)(*((void *)a2 + 14) + 8 * v101++),  0LL,  (wireless_diagnostics::google::protobuf::EnumDescriptor *)(*(void *)(v8 + 96) + v100));
      v100 += 56LL;
    }

    while (v101 < *((int *)a2 + 30));
  }

  int v102 = *((_DWORD *)a2 + 36);
  *(_DWORD *)(v8 + 104) = v102;
  *(void *)(v8 + 112) = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateBytes( *((wireless_diagnostics::google::protobuf::DescriptorPool::Tables **)this + 1),  48 * v102);
  if (*((int *)a2 + 36) >= 1)
  {
    uint64_t v104 = 0LL;
    uint64_t v105 = 0LL;
    do
    {
      wireless_diagnostics::google::protobuf::DescriptorBuilder::BuildService( (uint64_t)this,  *(void *)(*((void *)a2 + 17) + 8 * v105++),  v103,  *(void *)(v8 + 112) + v104);
      v104 += 48LL;
    }

    while (v105 < *((int *)a2 + 36));
  }

  int v106 = *((_DWORD *)a2 + 42);
  *(_DWORD *)(v8 + 120) = v106;
  *(void *)(v8 + 128) = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateBytes( *((wireless_diagnostics::google::protobuf::DescriptorPool::Tables **)this + 1),  120 * v106);
  if (*((int *)a2 + 42) >= 1)
  {
    uint64_t v108 = 0LL;
    uint64_t v109 = 0LL;
    do
    {
      wireless_diagnostics::google::protobuf::DescriptorBuilder::BuildFieldOrExtension( this,  *(const wireless_diagnostics::google::protobuf::FieldDescriptorProto **)(*((void *)a2 + 20) + 8 * v109++),  0LL,  (wireless_diagnostics::google::protobuf::FieldDescriptor *)(*(void *)(v8 + 128) + v108),  1);
      v108 += 120LL;
    }

    while (v109 < *((int *)a2 + 42));
  }

  if ((*((_BYTE *)a2 + 205) & 2) != 0)
  {
    v110 = (wireless_diagnostics::google::protobuf::MessageLite *)*((void *)a2 + 23);
    if (!v110) {
      v110 = *(wireless_diagnostics::google::protobuf::MessageLite **)(wireless_diagnostics::google::protobuf::FileDescriptorProto::default_instance_
    }
                                                                     + 184);
    wireless_diagnostics::google::protobuf::DescriptorBuilder::AllocateOptions((uint64_t)this, v110, v8);
  }

  else
  {
    *(void *)(v8 + 136) = 0LL;
  }

  wireless_diagnostics::google::protobuf::DescriptorBuilder::CrossLinkFile( this,  (wireless_diagnostics::google::protobuf::FileDescriptor *)v8,  a2,  v107);
  if (*((_BYTE *)this + 48)) {
    goto LABEL_212;
  }
  wireless_diagnostics::google::protobuf::DescriptorBuilder::OptionInterpreter::OptionInterpreter( (wireless_diagnostics::google::protobuf::DescriptorBuilder::OptionInterpreter *)&v134,  this);
  std::string::size_type v111 = *((void *)this + 3);
  if (v111 == *((void *)this + 4)) {
    goto LABEL_210;
  }
  do
  {
    uint64_t v112 = *(void *)(v111 + 48);
    v113 = *(wireless_diagnostics::google::protobuf::Message **)(v111 + 56);
    v134.__r_.__value_.__l.__size_ = v111;
    uint64_t v114 = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::Message *))(*(void *)v113 + 152LL))(v113);
    std::string::basic_string[abi:ne180100]<0>(&v136, "uninterpreted_option");
    uint64_t FieldByName = wireless_diagnostics::google::protobuf::Descriptor::FindFieldByName(v114, (uint64_t)&v136);
    uint64_t v116 = FieldByName;
    if ((char)v136.__r_.__value_.__s.__size_ < 0)
    {
      operator delete(v136.__r_.__value_.__l.__data_);
      if (v116) {
        goto LABEL_189;
      }
    }

    else if (FieldByName)
    {
      goto LABEL_189;
    }

    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)&v136);
LABEL_189:
    uint64_t v117 = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::Message *))(*(void *)v113 + 144LL))(v113);
    (*(void (**)(uint64_t, wireless_diagnostics::google::protobuf::Message *, uint64_t))(*(void *)v117 + 56LL))( v117,  v113,  v116);
    uint64_t v118 = (*(uint64_t (**)(uint64_t))(*(void *)v112 + 152LL))(v112);
    std::string::basic_string[abi:ne180100]<0>(&v136, "uninterpreted_option");
    uint64_t v119 = wireless_diagnostics::google::protobuf::Descriptor::FindFieldByName(v118, (uint64_t)&v136);
    uint64_t v120 = v119;
    if ((char)v136.__r_.__value_.__s.__size_ < 0)
    {
      operator delete(v136.__r_.__value_.__l.__data_);
      if (v120) {
        goto LABEL_194;
      }
    }

    else if (v119)
    {
      goto LABEL_194;
    }

    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)&v136);
LABEL_194:
    uint64_t v121 = (*(uint64_t (**)(uint64_t))(*(void *)v112 + 144LL))(v112);
    int v122 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v121 + 48LL))(v121, v112, v120);
    if (v122 < 1)
    {
LABEL_198:
      *(_OWORD *)&v134.__r_.__value_.__r.__words[1] = 0uLL;
      __int128 v137 = 0uLL;
      uint64_t v138 = 0LL;
      wireless_diagnostics::google::protobuf::MessageLite::AppendToString();
      if ((wireless_diagnostics::google::protobuf::MessageLite::ParseFromString() & 1) == 0)
      {
        wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
        wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
        wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
        wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
        wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)&v136);
      }

      if (SHIBYTE(v138) < 0) {
        operator delete((void *)v137);
      }
    }

    else
    {
      uint64_t v123 = 0LL;
      while (1)
      {
        uint64_t v124 = (*(uint64_t (**)(uint64_t))(*(void *)v112 + 144LL))(v112);
        v134.__r_.__value_.__l.__cap_ = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v124 + 352LL))( v124,  v112,  v120,  v123);
        if ((wireless_diagnostics::google::protobuf::DescriptorBuilder::OptionInterpreter::InterpretSingleOption( (wireless_diagnostics::google::protobuf::DescriptorBuilder::OptionInterpreter *)&v134,  v113) & 1) == 0) {
          break;
        }
        uint64_t v123 = (v123 + 1);
        if (v122 == (_DWORD)v123) {
          goto LABEL_198;
        }
      }

      *(_OWORD *)&v134.__r_.__value_.__r.__words[1] = 0uLL;
    }

    v111 += 64LL;
  }

  while (v111 != *((void *)this + 4));
  std::string::size_type v125 = *((void *)this + 3);
  while (v111 != v125)
  {
    v111 -= 64LL;
  }

  std::string::size_type v111 = v125;
LABEL_210:
  *((void *)this + 4) = v111;
  wireless_diagnostics::google::protobuf::DynamicMessageFactory::~DynamicMessageFactory((wireless_diagnostics::google::protobuf::DynamicMessageFactory *)&v135);
  if (*((_BYTE *)this + 48)
    || (wireless_diagnostics::google::protobuf::DescriptorBuilder::ValidateFileOptions( (wireless_diagnostics::google::protobuf::DescriptorPool::Tables **)this,  (wireless_diagnostics::google::protobuf::FileDescriptor *)v8,  a2,  v126),  *((_BYTE *)this + 48)))
  {
LABEL_212:
    wireless_diagnostics::google::protobuf::DescriptorPool::Tables::RollbackToLastCheckpoint(*((wireless_diagnostics::google::protobuf::DescriptorPool::Tables **)this
                                                                                             + 1));
    uint64_t v8 = 0LL;
  }

  else
  {
    v128 = (void *)*((void *)this + 1);
    uint64_t v129 = v128[38];
    uint64_t v130 = v128[39] - 28LL;
    v128[39] = v130;
    if (v129 == v130)
    {
      v128[42] = v128[41];
      v128[45] = v128[44];
      v128[48] = v128[47];
    }
  }

  std::__tree<std::string>::destroy((uint64_t)&v132, v133[0]);
  return v8;
}

void sub_187C4B0F4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, char *a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorPool::BuildFileCollectingErrors( wireless_diagnostics::google::protobuf::DescriptorPool *this, const wireless_diagnostics::google::protobuf::FileDescriptorProto *a2, wireless_diagnostics::google::protobuf::DescriptorPool::ErrorCollector *a3)
{
  if (*((void *)this + 1))
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v9);
  }

  if (*(void *)this)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v9);
  }

  std::string::size_type v6 = (void *)*((void *)this + 4);
  v9[0] = this;
  v9[1] = v6;
  uint64_t v11 = 0LL;
  uint64_t v12 = 0LL;
  v15[0] = 0LL;
  v15[1] = 0LL;
  uint64_t v9[2] = a3;
  memset(&v9[3], 0, 24);
  char v10 = 0;
  uint64_t v13 = 0LL;
  uint64_t v14 = v15;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v7 = wireless_diagnostics::google::protobuf::DescriptorBuilder::BuildFile( (wireless_diagnostics::google::protobuf::DescriptorBuilder *)v9,  a2);
  wireless_diagnostics::google::protobuf::DescriptorBuilder::~DescriptorBuilder(v9);
  return v7;
}

void sub_187C4B3A8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void wireless_diagnostics::google::protobuf::DescriptorBuilder::~DescriptorBuilder(void **this)
{
  unint64_t v2 = this[3];
  if (v2)
  {
    uint64_t v3 = (uint64_t)this[4];
    uint64_t v4 = this[3];
    if ((void *)v3 != v2)
    {
      do
      {
        v3 -= 64LL;
      }

      while ((void *)v3 != v2);
      uint64_t v4 = this[3];
    }

    this[4] = v2;
    operator delete(v4);
  }

void wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v6 + 16LL))( v6,  a1 + 56,  a2,  a3,  a4,  a5);
  }

  else
  {
    if (!*(_BYTE *)(a1 + 48))
    {
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
      wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v7);
    }

    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v7);
  }

  *(_BYTE *)(a1 + MEMORY[0x1895B3490](v1 - 48) = 1;
}

void sub_187C4B5B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void wireless_diagnostics::google::protobuf::DescriptorBuilder::AddNotDefinedError( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(void *)(a1 + 120))
  {
    std::operator+<char>();
    uint64_t v8 = std::string::append(&v28, " seems to be defined in ");
    __int128 v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
    v29.__r_.__value_.__l.__cap_ = v8->__r_.__value_.__l.__cap_;
    *(_OWORD *)&v29.__r_.__value_.__l.__data_ = v9;
    v8->__r_.__value_.__l.__size_ = 0LL;
    v8->__r_.__value_.__l.__cap_ = 0LL;
    v8->__r_.__value_.__r.__words[0] = 0LL;
    uint64_t v10 = **(void **)(a1 + 120);
    int v11 = *(char *)(v10 + 23);
    if (v11 >= 0) {
      uint64_t v12 = **(const std::string::value_type ***)(a1 + 120);
    }
    else {
      uint64_t v12 = *(const std::string::value_type **)v10;
    }
    if (v11 >= 0) {
      std::string::size_type v13 = *(unsigned __int8 *)(v10 + 23);
    }
    else {
      std::string::size_type v13 = *(void *)(v10 + 8);
    }
    uint64_t v14 = std::string::append(&v29, v12, v13);
    __int128 v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
    v30.__r_.__value_.__l.__cap_ = v14->__r_.__value_.__l.__cap_;
    *(_OWORD *)&v30.__r_.__value_.__l.__data_ = v15;
    v14->__r_.__value_.__l.__size_ = 0LL;
    v14->__r_.__value_.__l.__cap_ = 0LL;
    v14->__r_.__value_.__r.__words[0] = 0LL;
    __int128 v16 = std::string::append(&v30, ", which is not imported by ");
    __int128 v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
    v31.__r_.__value_.__l.__cap_ = v16->__r_.__value_.__l.__cap_;
    *(_OWORD *)&v31.__r_.__value_.__l.__data_ = v17;
    v16->__r_.__value_.__l.__size_ = 0LL;
    v16->__r_.__value_.__l.__cap_ = 0LL;
    v16->__r_.__value_.__r.__words[0] = 0LL;
    int v18 = *(char *)(a1 + 79);
    if (v18 >= 0) {
      int v19 = (const std::string::value_type *)(a1 + 56);
    }
    else {
      int v19 = *(const std::string::value_type **)(a1 + 56);
    }
    if (v18 >= 0) {
      std::string::size_type v20 = *(unsigned __int8 *)(a1 + 79);
    }
    else {
      std::string::size_type v20 = *(void *)(a1 + 64);
    }
    BOOL v21 = std::string::append(&v31, v19, v20);
    __int128 v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
    v32.__r_.__value_.__l.__cap_ = v21->__r_.__value_.__l.__cap_;
    *(_OWORD *)&v32.__r_.__value_.__l.__data_ = v22;
    v21->__r_.__value_.__l.__size_ = 0LL;
    v21->__r_.__value_.__l.__cap_ = 0LL;
    v21->__r_.__value_.__r.__words[0] = 0LL;
    unint64_t v23 = std::string::append(&v32, ".  To use it here, please add the necessary import.");
    __int128 v24 = *(_OWORD *)&v23->__r_.__value_.__l.__data_;
    std::string::size_type cap = v23->__r_.__value_.__l.__cap_;
    __int128 v33 = v24;
    v23->__r_.__value_.__l.__size_ = 0LL;
    v23->__r_.__value_.__l.__cap_ = 0LL;
    v23->__r_.__value_.__r.__words[0] = 0LL;
    wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError(a1, a2, a3, a4, (uint64_t)&v33);
    if (SHIBYTE(cap) < 0) {
      operator delete((void *)v33);
    }
    if ((char)v28.__r_.__value_.__s.__size_ < 0)
    {
      uint64_t v25 = (void *)v28.__r_.__value_.__r.__words[0];
LABEL_30:
      operator delete(v25);
    }
  }

  else
  {
    std::operator+<char>();
    int v26 = std::string::append(&v32, " is not defined.");
    __int128 v27 = *(_OWORD *)&v26->__r_.__value_.__l.__data_;
    std::string::size_type cap = v26->__r_.__value_.__l.__cap_;
    __int128 v33 = v27;
    v26->__r_.__value_.__l.__size_ = 0LL;
    v26->__r_.__value_.__l.__cap_ = 0LL;
    v26->__r_.__value_.__r.__words[0] = 0LL;
    wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError(a1, a2, a3, a4, (uint64_t)&v33);
    if (SHIBYTE(cap) < 0) {
      operator delete((void *)v33);
    }
    if ((char)v32.__r_.__value_.__s.__size_ < 0)
    {
      uint64_t v25 = (void *)v32.__r_.__value_.__r.__words[0];
      goto LABEL_30;
    }
  }

void sub_187C4B818( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21, uint64_t a22, void *a23, uint64_t a24, int a25, __int16 a26, char a27, char a28, uint64_t a29, void *__p, uint64_t a31, int a32, __int16 a33, char a34, char a35)
{
}

BOOL wireless_diagnostics::google::protobuf::DescriptorBuilder::IsInPackage( uint64_t a1, uint64_t a2, const void **a3)
{
  uint64_t v4 = *(const void ***)(a2 + 8);
  size_t v5 = *((unsigned __int8 *)v4 + 23);
  if ((v5 & 0x80u) == 0LL) {
    size_t v6 = *((unsigned __int8 *)v4 + 23);
  }
  else {
    size_t v6 = (size_t)v4[1];
  }
  uint64_t v7 = (_BYTE *)*((unsigned __int8 *)a3 + 23);
  if (*((char *)a3 + 23) < 0)
  {
    size_t v8 = (size_t)a3[1];
    if (v6 < v8) {
      return 0LL;
    }
  }

  else
  {
    size_t v8 = *((unsigned __int8 *)a3 + 23);
  }

  if ((v5 & 0x80) == 0)
  {
    if (v8 != -1LL)
    {
      if (v5 >= v8) {
        size_t v9 = v8;
      }
      else {
        size_t v9 = *((unsigned __int8 *)v4 + 23);
      }
      uint64_t v10 = *(const void ***)(a2 + 8);
      goto LABEL_19;
    }

LABEL_34:
    std::string::__throw_out_of_range[abi:ne180100]();
  }

  if (v8 == -1LL) {
    goto LABEL_34;
  }
  else {
    size_t v9 = (size_t)v4[1];
  }
  uint64_t v10 = (const void **)*v4;
LABEL_19:
  else {
    int v11 = *a3;
  }
  int v12 = memcmp(v10, v11, v9);
  if (v9 != v8 || v12 != 0) {
    return 0LL;
  }
  if ((_BYTE *)v6 == v7) {
    return 1LL;
  }
  if ((v5 & 0x80) != 0) {
    uint64_t v4 = (const void **)*v4;
  }
  return v7[(void)v4] == 46;
}

  unint64_t v23 = *((void *)a2 + 1);
  std::operator+<char>();
  __int128 v24 = std::string::append(&v36, " in type ");
  uint64_t v25 = *(_OWORD *)&v24->__r_.__value_.__l.__data_;
  v37.__r_.__value_.__l.__cap_ = v24->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v37.__r_.__value_.__l.__data_ = v25;
  v24->__r_.__value_.__l.__size_ = 0LL;
  v24->__r_.__value_.__l.__cap_ = 0LL;
  v24->__r_.__value_.__r.__words[0] = 0LL;
  int v26 = *(void *)(v6 + 8);
  __int128 v27 = *(char *)(v26 + 23);
  if (v27 >= 0) {
    std::string v28 = *(const std::string::value_type **)(v6 + 8);
  }
  else {
    std::string v28 = *(const std::string::value_type **)v26;
  }
  if (v27 >= 0) {
    std::string v29 = *(unsigned __int8 *)(v26 + 23);
  }
  else {
    std::string v29 = *(void *)(v26 + 8);
  }
  std::string v30 = std::string::append(&v37, v28, v29);
  std::string v31 = *(_OWORD *)&v30->__r_.__value_.__l.__data_;
  v38.__r_.__value_.__l.__cap_ = v30->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v31;
  v30->__r_.__value_.__l.__size_ = 0LL;
  v30->__r_.__value_.__l.__cap_ = 0LL;
  v30->__r_.__value_.__r.__words[0] = 0LL;
  std::string v32 = std::string::append(&v38, ".");
  __int128 v33 = *(_OWORD *)&v32->__r_.__value_.__l.__data_;
  __p.__r_.__value_.__l.__cap_ = v32->__r_.__value_.__l.__cap_;
  *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v33;
  v32->__r_.__value_.__l.__size_ = 0LL;
  v32->__r_.__value_.__l.__cap_ = 0LL;
  v32->__r_.__value_.__r.__words[0] = 0LL;
  wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)this,  v23,  (uint64_t)a3,  2LL,  (uint64_t)&__p);
  if ((char)v36.__r_.__value_.__s.__size_ < 0)
  {
    __int128 v22 = (void *)v36.__r_.__value_.__r.__words[0];
LABEL_30:
    operator delete(v22);
  }

uint64_t *wireless_diagnostics::google::protobuf::DescriptorBuilder::RecordPublicDependencies( uint64_t *result, uint64_t a2)
{
  uint64_t v6 = a2;
  if (a2)
  {
    unint64_t v2 = (wireless_diagnostics::google::protobuf::DescriptorBuilder *)result;
    double result = std::__tree<wireless_diagnostics::google::protobuf::Descriptor const*>::__emplace_unique_key_args<wireless_diagnostics::google::protobuf::Descriptor const*,wireless_diagnostics::google::protobuf::Descriptor const*>( (uint64_t **)result + 12,  (unint64_t *)&v6,  &v6);
    if ((v3 & 1) != 0)
    {
      uint64_t v4 = v6;
      if (v6)
      {
        uint64_t v5 = 0LL;
        do
        {
          double result = (uint64_t *)wireless_diagnostics::google::protobuf::DescriptorBuilder::RecordPublicDependencies( v2,  *(const wireless_diagnostics::google::protobuf::FileDescriptor **)(*(void *)(v4 + 32)
                                                                                                 + 8LL
                                                                                                 * *(int *)(*(void *)(v4 + 48) + 4 * v5++)));
          uint64_t v4 = v6;
        }

        while (v6);
      }
    }
  }

  return result;
}

_OWORD *wireless_diagnostics::google::protobuf::DescriptorBuilder::NewPlaceholderFile( uint64_t a1, uint64_t a2)
{
  Bytes = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateBytes( *(wireless_diagnostics::google::protobuf::DescriptorPool::Tables **)(a1 + 8),  160);
  _OWORD *Bytes = 0u;
  Bytes[1] = 0u;
  Bytes[2] = 0u;
  Bytes[3] = 0u;
  Bytes[4] = 0u;
  Bytes[5] = 0u;
  Bytes[6] = 0u;
  Bytes[7] = 0u;
  Bytes[8] = 0u;
  Bytes[9] = 0u;
  uint64_t String = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateString(*(void **)(a1 + 8), a2);
  *(void *)Bytes = String;
  *((void *)Bytes + 2) = *(void *)a1;
  *((void *)Bytes + 17) = wireless_diagnostics::google::protobuf::FileOptions::default_instance( (wireless_diagnostics::google::protobuf::FileOptions *)String,  v6,  v7,  v8);
  *((void *)Bytes + 18) = &wireless_diagnostics::google::protobuf::FileDescriptorTables::kEmpty;
  return Bytes;
}

void wireless_diagnostics::google::protobuf::DescriptorBuilder::AddPackage( uint64_t a1, std::string *a2, uint64_t a3, uint64_t a4)
{
  if (wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AddSymbol( *(void *)(a1 + 8),  (const char *)a2,  7LL,  a4))
  {
    std::string::size_type v8 = std::string::rfind(a2, 46, 0xFFFFFFFFFFFFFFFFLL);
    if (v8 == -1LL)
    {
      wireless_diagnostics::google::protobuf::DescriptorBuilder::ValidateSymbolName(a1, (uint64_t *)a2, (uint64_t)a2, a3);
    }

    else
    {
      std::string::size_type v9 = v8;
      uint64_t v10 = *(void **)(a1 + 8);
      std::string::basic_string(&v31, a2, 0LL, v8, (std::allocator<char> *)&v30);
      uint64_t String = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateString(v10, (uint64_t)&v31);
      wireless_diagnostics::google::protobuf::DescriptorBuilder::AddPackage(a1, String, a3, a4);
      std::string::basic_string(&v31, a2, v9 + 1, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v30);
      wireless_diagnostics::google::protobuf::DescriptorBuilder::ValidateSymbolName( a1,  (uint64_t *)&v31,  (uint64_t)a2,  a3);
    }

    return;
  }

  int v12 = *(int8x8_t **)(a1 + 8);
  if ((a2->__r_.__value_.__s.__size_ & 0x80u) == 0) {
    std::string::size_type v13 = (const char *)a2;
  }
  else {
    std::string::size_type v13 = (const char *)a2->__r_.__value_.__r.__words[0];
  }
  char v14 = *v13;
  if (*v13)
  {
    unint64_t v15 = 0LL;
    __int128 v16 = (unsigned __int8 *)(v13 + 1);
    do
    {
      unint64_t v15 = 5 * v15 + v14;
      int v17 = *v16++;
      char v14 = v17;
    }

    while (v17);
  }

  else
  {
    unint64_t v15 = 0LL;
  }

  int8x8_t v18 = v12[26];
  if (v18)
  {
    uint8x8_t v19 = (uint8x8_t)vcnt_s8(v18);
    v19.i16[0] = vaddlv_u8(v19);
    unint64_t v20 = v19.u32[0];
    if (v19.u32[0] > 1uLL)
    {
      unint64_t v21 = v15;
      if (v15 >= *(void *)&v18) {
        unint64_t v21 = v15 % *(void *)&v18;
      }
    }

    else
    {
      unint64_t v21 = (*(void *)&v18 - 1LL) & v15;
    }

    __int128 v22 = *(uint64_t **)(*(void *)&v12[25] + 8 * v21);
    if (!v22) {
      goto LABEL_33;
    }
    for (uint64_t i = *v22; i; uint64_t i = *(void *)i)
    {
      unint64_t v24 = *(void *)(i + 8);
      if (v15 == v24)
      {
        if (!strcmp(*(const char **)(i + 16), v13))
        {
          __int128 v22 = (uint64_t *)(i + 24);
          goto LABEL_33;
        }
      }

      else
      {
        if (v20 > 1)
        {
          if (v24 >= *(void *)&v18) {
            v24 %= *(void *)&v18;
          }
        }

        else
        {
          v24 &= *(void *)&v18 - 1LL;
        }

        if (v24 != v21) {
          break;
        }
      }
    }
  }

  __int128 v22 = 0LL;
LABEL_33:
  if (!v22) {
  int v25 = *(_DWORD *)v22;
  }
  if (*(_DWORD *)v22 != 7)
  {
    std::operator+<char>();
    int v26 = std::string::append(&v28, " is already defined (as something other than a package) in file ");
    __int128 v27 = *(_OWORD *)&v26->__r_.__value_.__l.__data_;
    v29.__r_.__value_.__l.__cap_ = v26->__r_.__value_.__l.__cap_;
    *(_OWORD *)&v29.__r_.__value_.__l.__data_ = v27;
    v26->__r_.__value_.__l.__size_ = 0LL;
    v26->__r_.__value_.__l.__cap_ = 0LL;
    v26->__r_.__value_.__r.__words[0] = 0LL;
    __asm { BR              X10 }
  }

void sub_187C4BE58( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21, uint64_t a22, void *a23, uint64_t a24, int a25, __int16 a26, char a27, char a28, uint64_t a29, void *__p, uint64_t a31, int a32, __int16 a33, char a34, char a35)
{
  if (a35 < 0) {
    operator delete(__p);
  }
  if (a28 < 0) {
    operator delete(a23);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AddSymbol( uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a4;
  if (a2[23] >= 0) {
    std::string::size_type v9 = a2;
  }
  else {
    std::string::size_type v9 = *(const char **)a2;
  }
  char v10 = *v9;
  if (*v9)
  {
    unint64_t v11 = 0LL;
    int v12 = (unsigned __int8 *)(v9 + 1);
    do
    {
      unint64_t v11 = 5 * v11 + v10;
      int v13 = *v12++;
      char v10 = v13;
    }

    while (v13);
  }

  else
  {
    unint64_t v11 = 0LL;
  }

  unint64_t v14 = *(void *)(a1 + 208);
  if (v14)
  {
    uint8x8_t v15 = (uint8x8_t)vcnt_s8((int8x8_t)v14);
    v15.i16[0] = vaddlv_u8(v15);
    unint64_t v16 = v15.u32[0];
    if (v15.u32[0] > 1uLL)
    {
      unint64_t v4 = v11;
      if (v11 >= v14) {
        unint64_t v4 = v11 % v14;
      }
    }

    else
    {
      unint64_t v4 = (v14 - 1) & v11;
    }

    int v17 = *(uint64_t ****)(*(void *)(a1 + 200) + 8 * v4);
    if (v17)
    {
      int8x8_t v18 = *v17;
      if (*v17)
      {
        while (1)
        {
          unint64_t v19 = (unint64_t)v18[1];
          if (v19 == v11)
          {
            uint64_t result = strcmp((const char *)v18[2], v9);
            if (!(_DWORD)result) {
              return result;
            }
          }

          else
          {
            if (v16 > 1)
            {
              if (v19 >= v14) {
                v19 %= v14;
              }
            }

            else
            {
              v19 &= v14 - 1;
            }

            if (v19 != v4)
            {
LABEL_26:
              uint64_t v5 = a4;
              break;
            }
          }

          int8x8_t v18 = (uint64_t **)*v18;
          if (!v18) {
            goto LABEL_26;
          }
        }
      }
    }
  }

  unint64_t v21 = operator new(0x28uLL);
  *unint64_t v21 = 0LL;
  v21[1] = v11;
  v21[2] = v9;
  v21[3] = a3;
  v21[4] = v5;
  float v22 = (float)(unint64_t)(*(void *)(a1 + 224) + 1LL);
  float v23 = *(float *)(a1 + 232);
  if (v14 && (float)(v23 * (float)v14) >= v22)
  {
    unint64_t v11 = v4;
    goto LABEL_73;
  }

  BOOL v24 = (v14 & (v14 - 1)) == 0;
  if (v14 < 3) {
    BOOL v24 = 0;
  }
  unint64_t v25 = (2 * v14) | !v24;
  unint64_t v26 = vcvtps_u32_f32(v22 / v23);
  if (v25 <= v26) {
    int8x8_t prime = (int8x8_t)v26;
  }
  else {
    int8x8_t prime = (int8x8_t)v25;
  }
  if (*(void *)&prime == 1LL)
  {
    int8x8_t prime = (int8x8_t)2LL;
  }

  else if ((*(void *)&prime & (*(void *)&prime - 1LL)) != 0)
  {
    int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    unint64_t v14 = *(void *)(a1 + 208);
  }

  if (*(void *)&prime <= v14)
  {
    if (*(void *)&prime >= v14) {
      goto LABEL_69;
    }
    unint64_t v34 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 224) / *(float *)(a1 + 232));
    if (v14 < 3 || (uint8x8_t v35 = (uint8x8_t)vcnt_s8((int8x8_t)v14), v35.i16[0] = vaddlv_u8(v35), v35.u32[0] > 1uLL))
    {
      unint64_t v34 = std::__next_prime(v34);
    }

    else
    {
      uint64_t v36 = 1LL << -(char)__clz(v34 - 1);
      if (v34 >= 2) {
        unint64_t v34 = v36;
      }
    }

    if (*(void *)&prime <= v34) {
      int8x8_t prime = (int8x8_t)v34;
    }
    if (*(void *)&prime >= v14)
    {
      unint64_t v14 = *(void *)(a1 + 208);
      goto LABEL_69;
    }

    if (!*(void *)&prime)
    {
      uint64_t v58 = *(void **)(a1 + 200);
      *(void *)(a1 + 200) = 0LL;
      if (v58) {
        operator delete(v58);
      }
      unint64_t v14 = 0LL;
      *(void *)(a1 + 208) = 0LL;
      goto LABEL_69;
    }
  }

  if (*(void *)&prime >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  std::string v28 = operator new(8LL * *(void *)&prime);
  std::string v29 = *(void **)(a1 + 200);
  *(void *)(a1 + 200) = v28;
  if (v29) {
    operator delete(v29);
  }
  uint64_t v30 = 0LL;
  *(int8x8_t *)(a1 + 208) = prime;
  do
    *(void *)(*(void *)(a1 + 200) + 8 * v30++) = 0LL;
  while (*(void *)&prime != v30);
  std::string v31 = *(void **)(a1 + 216);
  if (v31)
  {
    unint64_t v32 = v31[1];
    uint8x8_t v33 = (uint8x8_t)vcnt_s8(prime);
    v33.i16[0] = vaddlv_u8(v33);
    if (v33.u32[0] > 1uLL)
    {
      if (v32 >= *(void *)&prime) {
        v32 %= *(void *)&prime;
      }
    }

    else
    {
      v32 &= *(void *)&prime - 1LL;
    }

    *(void *)(*(void *)(a1 + 200) + 8 * v32) = a1 + 216;
    unint64_t v37 = (void *)*v31;
    if (*v31)
    {
      do
      {
        unint64_t v38 = v37[1];
        if (v33.u32[0] > 1uLL)
        {
          if (v38 >= *(void *)&prime) {
            v38 %= *(void *)&prime;
          }
        }

        else
        {
          v38 &= *(void *)&prime - 1LL;
        }

        if (v38 != v32)
        {
          uint64_t v39 = *(void *)(a1 + 200);
          if (!*(void *)(v39 + 8 * v38))
          {
            *(void *)(v39 + 8 * v38) = v31;
            goto LABEL_65;
          }

          *std::string v31 = *v37;
          *unint64_t v37 = **(void **)(*(void *)(a1 + 200) + 8 * v38);
          **(void **)(*(void *)(a1 + 200) + 8 * v38) = v37;
          unint64_t v37 = v31;
        }

        unint64_t v38 = v32;
LABEL_65:
        std::string v31 = v37;
        unint64_t v37 = (void *)*v37;
        unint64_t v32 = v38;
      }

      while (v37);
    }
  }

  unint64_t v14 = (unint64_t)prime;
LABEL_69:
  if ((v14 & (v14 - 1)) != 0)
  {
    if (v11 >= v14) {
      v11 %= v14;
    }
  }

  else
  {
    v11 &= v14 - 1;
  }

LABEL_73:
  uint64_t v40 = *(void *)(a1 + 200);
  uint64_t v41 = *(void **)(v40 + 8 * v11);
  if (v41)
  {
    *unint64_t v21 = *v41;
LABEL_81:
    void *v41 = v21;
    goto LABEL_82;
  }

  *unint64_t v21 = *(void *)(a1 + 216);
  *(void *)(a1 + 216) = v21;
  *(void *)(v40 + 8 * v11) = a1 + 216;
  if (*v21)
  {
    unint64_t v42 = *(void *)(*v21 + 8LL);
    if ((v14 & (v14 - 1)) != 0)
    {
      if (v42 >= v14) {
        v42 %= v14;
      }
    }

    else
    {
      v42 &= v14 - 1;
    }

    uint64_t v41 = (void *)(*(void *)(a1 + 200) + 8 * v42);
    goto LABEL_81;
  }

LABEL_82:
  ++*(void *)(a1 + 224);
  if (a2[23] >= 0) {
    uint64_t v43 = a2;
  }
  else {
    uint64_t v43 = *(const char **)a2;
  }
  uint64_t v45 = *(const char ***)(a1 + 336);
  unint64_t v44 = *(void *)(a1 + 344);
  if ((unint64_t)v45 >= v44)
  {
    uint64_t v47 = *(void *)(a1 + 328);
    uint64_t v48 = ((uint64_t)v45 - v47) >> 3;
    uint64_t v49 = v44 - v47;
    uint64_t v50 = v49 >> 2;
    else {
      unint64_t v51 = v50;
    }
    if (v51) {
      uint64_t v52 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>( a1 + 344,  v51);
    }
    else {
      uint64_t v52 = 0LL;
    }
    __int128 v53 = &v52[8 * v48];
    uint64_t v54 = &v52[8 * v51];
    *(void *)__int128 v53 = v43;
    std::string::size_type v46 = v53 + 8;
    __int128 v56 = *(char **)(a1 + 328);
    __int128 v55 = *(char **)(a1 + 336);
    if (v55 != v56)
    {
      do
      {
        uint64_t v57 = *((void *)v55 - 1);
        v55 -= 8;
        *((void *)v53 - 1) = v57;
        v53 -= 8;
      }

      while (v55 != v56);
      __int128 v55 = *(char **)(a1 + 328);
    }

    *(void *)(a1 + 328) = v53;
    *(void *)(a1 + 336) = v46;
    *(void *)(a1 + 344) = v54;
    if (v55) {
      operator delete(v55);
    }
  }

  else
  {
    const std::string::value_type *v45 = v43;
    std::string::size_type v46 = v45 + 1;
  }

  *(void *)(a1 + 336) = v46;
  return 1LL;
}

void sub_187C4C3C8(_Unwind_Exception *a1)
{
}

void wireless_diagnostics::google::protobuf::DescriptorBuilder::ValidateSymbolName( uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  unint64_t v7 = *((unsigned __int8 *)a2 + 23);
  BOOL v8 = *((char *)a2 + 23) < 0;
  unint64_t v9 = a2[1];
  else {
    uint64_t v10 = a2[1];
  }
  if (v10)
  {
    for (unint64_t i = 0LL; i < v16; ++i)
    {
      if (v8) {
        int v13 = (uint64_t *)*a2;
      }
      else {
        int v13 = a2;
      }
      if (*((unsigned __int8 *)v13 + i) - 123 <= 0xFFFFFFE5
        && *((unsigned __int8 *)v13 + i) - 91 <= 0xFFFFFFE5
        && *((unsigned __int8 *)v13 + i) - 58 <= 0xFFFFFFF5
        && *((_BYTE *)v13 + i) != 95)
      {
        std::operator+<char>();
        unint64_t v14 = std::string::append(&v17, " is not a valid identifier.");
        __int128 v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
        std::string::size_type cap = v14->__r_.__value_.__l.__cap_;
        *(_OWORD *)std::string __p = v15;
        v14->__r_.__value_.__l.__size_ = 0LL;
        v14->__r_.__value_.__l.__cap_ = 0LL;
        v14->__r_.__value_.__r.__words[0] = 0LL;
        wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError(a1, a3, a4, 0LL, (uint64_t)__p);
        if (SHIBYTE(cap) < 0) {
          operator delete(__p[0]);
        }
        unint64_t v7 = *((unsigned __int8 *)a2 + 23);
        unint64_t v9 = a2[1];
      }

      BOOL v8 = (v7 & 0x80u) != 0LL;
      if ((v7 & 0x80u) == 0LL) {
        unint64_t v16 = v7;
      }
      else {
        unint64_t v16 = v9;
      }
    }
  }

  else
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "Missing name.");
    wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError(a1, a3, a4, 0LL, (uint64_t)__p);
    if (SHIBYTE(cap) < 0) {
      operator delete(__p[0]);
    }
  }

void sub_187C4C568( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorBuilder::ValidateQualifiedName( uint64_t a1, uint64_t *a2)
{
  unint64_t v2 = 0LL;
  int v3 = 0;
  unint64_t v4 = *((unsigned __int8 *)a2 + 23);
  if ((v4 & 0x80) != 0) {
    goto LABEL_4;
  }
LABEL_2:
  uint64_t v5 = a2;
  if (v2 >= v4) {
    return (v4 != 0) & ~v3;
  }
  while (1)
  {
    if (*((unsigned __int8 *)v5 + v2) - 97 >= 0x1A
      && *((unsigned __int8 *)v5 + v2) - 65 >= 0x1A
      && *((unsigned __int8 *)v5 + v2) - 48 >= 0xA)
    {
      int v6 = *((unsigned __int8 *)v5 + v2);
      if (v6 != 95) {
        break;
      }
    }

    int v3 = 0;
LABEL_10:
    ++v2;
    if ((v4 & 0x80) == 0) {
      goto LABEL_2;
    }
LABEL_4:
    uint64_t v5 = (uint64_t *)*a2;
    if (a2[1] <= v2)
    {
      unint64_t v4 = a2[1];
      return (v4 != 0) & ~v3;
    }
  }

  if (!(v3 & 1 | (v6 != 46)))
  {
    int v3 = 1;
    goto LABEL_10;
  }

  return 0LL;
}

void wireless_diagnostics::google::protobuf::DescriptorBuilder::AllocateOptions( uint64_t a1, wireless_diagnostics::google::protobuf::MessageLite *a2, uint64_t a3)
{
  int v6 = *(const void ***)(a3 + 8);
  else {
    size_t v7 = (size_t)v6[1];
  }
  BOOL v8 = __p;
  std::string::basic_string[abi:ne180100]((uint64_t)__p, v7 + 6);
  if (v11 < 0) {
    BOOL v8 = (void **)__p[0];
  }
  if (v7)
  {
    else {
      unint64_t v9 = *v6;
    }
    memmove(v8, v9, v7);
  }

  strcpy((char *)v8 + v7, ".dummy");
  wireless_diagnostics::google::protobuf::DescriptorBuilder::AllocateOptionsImpl<wireless_diagnostics::google::protobuf::FileDescriptor>( a1,  (__int128 *)__p,  *(__int128 **)a3,  a2,  a3);
  if (v11 < 0) {
    operator delete(__p[0]);
  }
}

void sub_187C4C73C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void wireless_diagnostics::google::protobuf::DescriptorBuilder::AllocateOptionsImpl<wireless_diagnostics::google::protobuf::FileDescriptor>( uint64_t a1, __int128 *a2, __int128 *a3, wireless_diagnostics::google::protobuf::MessageLite *a4, uint64_t a5)
{
  uint64_t v10 = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateMessage<wireless_diagnostics::google::protobuf::FileOptions>(*(void **)(a1 + 8));
  wireless_diagnostics::google::protobuf::MessageLite::SerializeAsString(a4);
  wireless_diagnostics::google::protobuf::MessageLite::ParseFromString();
  *(void *)(a5 + 136) = v10;
  if (*((int *)v10 + 20) >= 1)
  {
    if (v13 < 0) {
      operator delete(v12);
    }
  }

void sub_187C4C82C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
}

wireless_diagnostics::google::protobuf::SourceCodeInfo *wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateMessage<wireless_diagnostics::google::protobuf::SourceCodeInfo>( void *a1)
{
  unint64_t v2 = (wireless_diagnostics::google::protobuf::SourceCodeInfo *)operator new(0x30uLL);
  wireless_diagnostics::google::protobuf::SourceCodeInfo::SourceCodeInfo(v2);
  unint64_t v3 = a1[18];
  unint64_t v4 = (wireless_diagnostics::google::protobuf::SourceCodeInfo **)a1[17];
  if ((unint64_t)v4 >= v3)
  {
    uint64_t v6 = a1[16];
    uint64_t v7 = ((uint64_t)v4 - v6) >> 3;
    uint64_t v8 = v3 - v6;
    uint64_t v9 = v8 >> 2;
    else {
      unint64_t v10 = v9;
    }
    if (v10) {
      char v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>( (uint64_t)(a1 + 18),  v10);
    }
    else {
      char v11 = 0LL;
    }
    int v12 = (wireless_diagnostics::google::protobuf::SourceCodeInfo **)&v11[8 * v7];
    char v13 = &v11[8 * v10];
    *int v12 = v2;
    uint64_t v5 = v12 + 1;
    __int128 v15 = (char *)a1[16];
    unint64_t v14 = (char *)a1[17];
    if (v14 != v15)
    {
      do
      {
        unint64_t v16 = (wireless_diagnostics::google::protobuf::SourceCodeInfo *)*((void *)v14 - 1);
        v14 -= 8;
        *--int v12 = v16;
      }

      while (v14 != v15);
      unint64_t v14 = (char *)a1[16];
    }

    a1[16] = v12;
    a1[17] = v5;
    a1[18] = v13;
    if (v14) {
      operator delete(v14);
    }
  }

  else
  {
    *unint64_t v4 = v2;
    uint64_t v5 = v4 + 1;
  }

  a1[17] = v5;
  return v2;
}

void sub_187C4C944(_Unwind_Exception *a1)
{
}

void wireless_diagnostics::google::protobuf::DescriptorBuilder::BuildMessage( wireless_diagnostics::google::protobuf::DescriptorBuilder *this, const wireless_diagnostics::google::protobuf::DescriptorProto *a2, const wireless_diagnostics::google::protobuf::Descriptor *a3, wireless_diagnostics::google::protobuf::Descriptor *a4)
{
  uint64_t v96 = *MEMORY[0x1895F89C0];
  if (a3) {
    uint64_t v8 = (uint64_t *)((char *)a3 + 8);
  }
  else {
    uint64_t v8 = (uint64_t *)(*((void *)this + 10) + 8LL);
  }
  uint64_t String = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateString(*((void **)this + 1), *v8);
  unint64_t v10 = String;
  if (((char)String->__r_.__value_.__s.__size_ & 0x80000000) == 0)
  {
    if (!String->__r_.__value_.__s.__size_) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  if (String->__r_.__value_.__l.__size_) {
LABEL_6:
  }
    std::string::append(String, 1uLL, 46);
LABEL_7:
  uint64_t v11 = *((void *)a2 + 2);
  int v12 = *(char *)(v11 + 23);
  if (v12 >= 0) {
    char v13 = (const std::string::value_type *)*((void *)a2 + 2);
  }
  else {
    char v13 = *(const std::string::value_type **)v11;
  }
  if (v12 >= 0) {
    std::string::size_type v14 = *(unsigned __int8 *)(v11 + 23);
  }
  else {
    std::string::size_type v14 = *(void *)(v11 + 8);
  }
  std::string::append(v10, v13, v14);
  wireless_diagnostics::google::protobuf::DescriptorBuilder::ValidateSymbolName( (uint64_t)this,  *((uint64_t **)a2 + 2),  (uint64_t)v10,  (uint64_t)a2);
  *(void *)a4 = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateString( *((void **)this + 1),  *((void *)a2 + 2));
  *((void *)a4 + 1) = v10;
  *((void *)a4 + 2) = *((void *)this + 10);
  *((void *)a4 + 3) = a3;
  *((_WORD *)a4 + 20) = 0;
  int v15 = *((_DWORD *)a2 + 8);
  *((_DWORD *)a4 + 11) = v15;
  *((void *)a4 + 6) = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateBytes( *((wireless_diagnostics::google::protobuf::DescriptorPool::Tables **)this + 1),  120 * v15);
  if (*((int *)a2 + 8) >= 1)
  {
    uint64_t v16 = 0LL;
    uint64_t v17 = 0LL;
    do
    {
      wireless_diagnostics::google::protobuf::DescriptorBuilder::BuildFieldOrExtension( this,  *(const wireless_diagnostics::google::protobuf::FieldDescriptorProto **)(*((void *)a2 + 3) + 8 * v17++),  a4,  (wireless_diagnostics::google::protobuf::FieldDescriptor *)(*((void *)a4 + 6) + v16),  0);
      v16 += 120LL;
    }

    while (v17 < *((int *)a2 + 8));
  }

  int v18 = *((_DWORD *)a2 + 20);
  *((_DWORD *)a4 + 14) = v18;
  *((void *)a4 + 8) = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateBytes( *((wireless_diagnostics::google::protobuf::DescriptorPool::Tables **)this + 1),  120 * v18);
  if (*((int *)a2 + 20) >= 1)
  {
    uint64_t v19 = 0LL;
    uint64_t v20 = 0LL;
    do
    {
      wireless_diagnostics::google::protobuf::DescriptorBuilder::BuildMessage( this,  *(const wireless_diagnostics::google::protobuf::DescriptorProto **)(*((void *)a2 + 9) + 8 * v20++),  a4,  (wireless_diagnostics::google::protobuf::Descriptor *)(*((void *)a4 + 8) + v19));
      v19 += 120LL;
    }

    while (v20 < *((int *)a2 + 20));
  }

  int v21 = *((_DWORD *)a2 + 26);
  *((_DWORD *)a4 + 18) = v21;
  *((void *)a4 + 10) = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateBytes( *((wireless_diagnostics::google::protobuf::DescriptorPool::Tables **)this + 1),  56 * v21);
  if (*((int *)a2 + 26) >= 1)
  {
    uint64_t v22 = 0LL;
    uint64_t v23 = 0LL;
    do
    {
      wireless_diagnostics::google::protobuf::DescriptorBuilder::BuildEnum( this,  *(const wireless_diagnostics::google::protobuf::EnumDescriptorProto **)(*((void *)a2 + 12) + 8 * v23++),  a4,  (wireless_diagnostics::google::protobuf::EnumDescriptor *)(*((void *)a4 + 10) + v22));
      v22 += 56LL;
    }

    while (v23 < *((int *)a2 + 26));
  }

  int v24 = *((_DWORD *)a2 + 32);
  *((_DWORD *)a4 + 22) = v24;
  *((void *)a4 + 12) = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateBytes( *((wireless_diagnostics::google::protobuf::DescriptorPool::Tables **)this + 1),  8 * v24);
  if (*((int *)a2 + 32) >= 1)
  {
    uint64_t v25 = 0LL;
    uint64_t v26 = 0LL;
    do
    {
      wireless_diagnostics::google::protobuf::DescriptorBuilder::BuildExtensionRange( (uint64_t)this,  *(void *)(*((void *)a2 + 15) + v25),  (uint64_t)a4,  (int *)(*((void *)a4 + 12) + v25));
      ++v26;
      v25 += 8LL;
    }

    while (v26 < *((int *)a2 + 32));
  }

  int v27 = *((_DWORD *)a2 + 14);
  *((_DWORD *)a4 + 26) = v27;
  *((void *)a4 + 14) = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateBytes( *((wireless_diagnostics::google::protobuf::DescriptorPool::Tables **)this + 1),  120 * v27);
  if (*((int *)a2 + 14) >= 1)
  {
    uint64_t v28 = 0LL;
    uint64_t v29 = 0LL;
    do
    {
      wireless_diagnostics::google::protobuf::DescriptorBuilder::BuildFieldOrExtension( this,  *(const wireless_diagnostics::google::protobuf::FieldDescriptorProto **)(*((void *)a2 + 6) + 8 * v29++),  a4,  (wireless_diagnostics::google::protobuf::FieldDescriptor *)(*((void *)a4 + 14) + v28),  1);
      v28 += 120LL;
    }

    while (v29 < *((int *)a2 + 14));
  }

  if ((*((_BYTE *)a2 + 156) & 0x40) != 0)
  {
    uint64_t v30 = (wireless_diagnostics::google::protobuf::MessageLite *)*((void *)a2 + 18);
    if (!v30) {
      uint64_t v30 = *(wireless_diagnostics::google::protobuf::MessageLite **)(wireless_diagnostics::google::protobuf::DescriptorProto::default_instance_
    }
                                                                    + 144);
    wireless_diagnostics::google::protobuf::DescriptorBuilder::AllocateOptionsImpl<wireless_diagnostics::google::protobuf::Descriptor>( (uint64_t)this,  *((__int128 **)a4 + 1),  *((__int128 **)a4 + 1),  v30,  (uint64_t)a4);
  }

  else
  {
    *((void *)a4 + 4) = 0LL;
  }

  uint64_t v69 = this;
  char v70 = a2;
  wireless_diagnostics::google::protobuf::DescriptorBuilder::AddSymbol( (uint64_t)this,  *((const std::string **)a4 + 1),  (uint64_t *)a3,  *(void *)a4,  (uint64_t)a2,  1LL,  (uint64_t)a4);
  int v32 = *((_DWORD *)a4 + 11);
  int v33 = *((_DWORD *)a4 + 22);
  if (v32 >= 1)
  {
    for (uint64_t i = 0LL; i < v32; ++i)
    {
      if (v33 >= 1)
      {
        uint64_t v35 = 0LL;
        uint64_t v36 = 0LL;
        uint64_t v68 = (const char ***)(*((void *)a4 + 6) + 120 * i);
        unint64_t v37 = v68 + 5;
        do
        {
          uint64_t v38 = *((void *)a4 + 12);
          uint64_t v39 = (wireless_diagnostics::google::protobuf *)*(unsigned int *)(v38 + v35);
          if ((int)v39 <= *v37)
          {
            uint64_t v40 = v38 + v35;
            if (*v37 < *(_DWORD *)(v38 + v35 + 4))
            {
              uint64_t v41 = (uint64_t)v68[1];
              uint64_t v42 = *(void *)(*((void *)a2 + 15) + v35);
              int v93 = wireless_diagnostics::google::protobuf::FastInt32ToBuffer(v39, v95, v31);
              int v94 = strlen(v93);
              uint64_t v90 = wireless_diagnostics::google::protobuf::FastInt32ToBuffer( (wireless_diagnostics::google::protobuf *)(*(_DWORD *)(v40 + 4) - 1),  v92,  v43);
              int v91 = strlen(v90);
              uint64_t v45 = (const char *)*v68;
              int v46 = *((char *)*v68 + 23);
              uint64_t v47 = (*v68)[1];
              if (v46 < 0) {
                uint64_t v45 = **v68;
              }
              uint64_t v87 = v45;
              int v48 = v46;
              if (v46 < 0) {
                int v48 = (int)v47;
              }
              int v88 = v48;
              int v84 = wireless_diagnostics::google::protobuf::FastInt32ToBuffer( (wireless_diagnostics::google::protobuf *)*v37,  v86,  v44);
              int v85 = strlen(v84);
              uint64_t v82 = 0LL;
              int v83 = -1;
              uint64_t v80 = 0LL;
              int v81 = -1;
              uint64_t v78 = 0LL;
              int v79 = -1;
              uint64_t v76 = 0LL;
              int v77 = -1;
              uint64_t v74 = 0LL;
              int v75 = -1;
              uint64_t v72 = 0LL;
              int v73 = -1;
              *((void *)&v64 + 1) = &v74;
              *(void *)&__int128 v64 = &v76;
              wireless_diagnostics::google::protobuf::strings::Substitute( "Extension range $0 to $1 includes field $2 ($3).",  (uint64_t)&v93,  (uint64_t)&v90,  (uint64_t)&v87,  (uint64_t)&v84,  (uint64_t)&v82,  (uint64_t)&v80,  (uint64_t)&v78,  &__p,  v64,  (uint64_t)&v72);
              wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)this,  v41,  v42,  1LL,  (uint64_t)&__p);
              int v33 = *((_DWORD *)a4 + 22);
            }
          }

          ++v36;
          v35 += 8LL;
        }

        while (v36 < v33);
        int v32 = *((_DWORD *)a4 + 11);
      }
    }
  }

  if (v33 >= 1)
  {
    uint64_t v49 = 0LL;
    uint64_t v50 = 0LL;
    uint64_t v51 = 1LL;
    do
    {
      uint64_t v52 = v50 + 1;
      if (v50 + 1 >= v33)
      {
        uint64_t v63 = v33;
      }

      else
      {
        uint64_t v66 = v50 + 1;
        uint64_t v67 = v49;
        __int128 v53 = (_DWORD *)(*((void *)a4 + 12) + 8 * v50);
        uint64_t v54 = v53 + 1;
        uint64_t v55 = v51;
        do
        {
          uint64_t v56 = *((void *)a4 + 12) + v49;
          uint64_t v57 = (wireless_diagnostics::google::protobuf *)*(unsigned int *)(v56 + 8);
          if (*v54 > (int)v57 && *(_DWORD *)(v56 + 12) > *v53)
          {
            uint64_t v58 = *((void *)a4 + 1);
            uint64_t v59 = *(void *)(*((void *)v70 + 15) + 8 * v55);
            int v93 = wireless_diagnostics::google::protobuf::FastInt32ToBuffer(v57, v95, v31);
            int v94 = strlen(v93);
            uint64_t v90 = wireless_diagnostics::google::protobuf::FastInt32ToBuffer( (wireless_diagnostics::google::protobuf *)(*(_DWORD *)(v56 + 12) - 1),  v92,  v60);
            int v91 = strlen(v90);
            uint64_t v87 = wireless_diagnostics::google::protobuf::FastInt32ToBuffer( (wireless_diagnostics::google::protobuf *)*v53,  v89,  v61);
            int v88 = strlen(v87);
            int v84 = wireless_diagnostics::google::protobuf::FastInt32ToBuffer( (wireless_diagnostics::google::protobuf *)(*v54 - 1),  v86,  v62);
            int v85 = strlen(v84);
            uint64_t v82 = 0LL;
            int v83 = -1;
            uint64_t v80 = 0LL;
            int v81 = -1;
            uint64_t v78 = 0LL;
            int v79 = -1;
            uint64_t v76 = 0LL;
            int v77 = -1;
            uint64_t v74 = 0LL;
            int v75 = -1;
            uint64_t v72 = 0LL;
            int v73 = -1;
            *((void *)&v65 + 1) = &v74;
            *(void *)&__int128 v65 = &v76;
            wireless_diagnostics::google::protobuf::strings::Substitute( "Extension range $0 to $1 overlaps with already-defined range $2 to $3.",  (uint64_t)&v93,  (uint64_t)&v90,  (uint64_t)&v87,  (uint64_t)&v84,  (uint64_t)&v82,  (uint64_t)&v80,  (uint64_t)&v78,  &__p,  v65,  (uint64_t)&v72);
            wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)v69,  v58,  v59,  1LL,  (uint64_t)&__p);
            int v33 = *((_DWORD *)a4 + 22);
          }

          ++v55;
          v49 += 8LL;
        }

        while (v33 > (int)v55);
        uint64_t v63 = v33;
        uint64_t v52 = v66;
        uint64_t v49 = v67;
      }

      ++v51;
      v49 += 8LL;
      uint64_t v50 = v52;
    }

    while (v52 < v63);
  }

void sub_187C4D054( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p, uint64_t a21, int a22, __int16 a23, char a24, char a25)
{
  if (a25 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorBuilder::BuildEnum( wireless_diagnostics::google::protobuf::DescriptorBuilder *this, const wireless_diagnostics::google::protobuf::EnumDescriptorProto *a2, const wireless_diagnostics::google::protobuf::Descriptor *a3, wireless_diagnostics::google::protobuf::EnumDescriptor *a4)
{
  if (a3) {
    uint64_t v8 = (uint64_t *)((char *)a3 + 8);
  }
  else {
    uint64_t v8 = (uint64_t *)(*((void *)this + 10) + 8LL);
  }
  uint64_t String = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateString(*((void **)this + 1), *v8);
  unint64_t v10 = String;
  if (((char)String->__r_.__value_.__s.__size_ & 0x80000000) == 0)
  {
    if (!String->__r_.__value_.__s.__size_) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  if (String->__r_.__value_.__l.__size_) {
LABEL_6:
  }
    std::string::append(String, 1uLL, 46);
LABEL_7:
  uint64_t v11 = *((void *)a2 + 2);
  int v12 = *(char *)(v11 + 23);
  if (v12 >= 0) {
    char v13 = (const std::string::value_type *)*((void *)a2 + 2);
  }
  else {
    char v13 = *(const std::string::value_type **)v11;
  }
  if (v12 >= 0) {
    std::string::size_type v14 = *(unsigned __int8 *)(v11 + 23);
  }
  else {
    std::string::size_type v14 = *(void *)(v11 + 8);
  }
  std::string::append(v10, v13, v14);
  wireless_diagnostics::google::protobuf::DescriptorBuilder::ValidateSymbolName( (uint64_t)this,  *((uint64_t **)a2 + 2),  (uint64_t)v10,  (uint64_t)a2);
  *(void *)a4 = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateString( *((void **)this + 1),  *((void *)a2 + 2));
  *((void *)a4 + 1) = v10;
  *((void *)a4 + 2) = *((void *)this + 10);
  *((void *)a4 + 3) = a3;
  *((_WORD *)a4 + 20) = 0;
  int v15 = *((_DWORD *)a2 + 8);
  if (!v15)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "Enums must contain at least one value.");
    wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)this,  (uint64_t)v10,  (uint64_t)a2,  0LL,  (uint64_t)__p);
    if (v21 < 0) {
      operator delete(__p[0]);
    }
    int v15 = *((_DWORD *)a2 + 8);
  }

  *((_DWORD *)a4 + 11) = v15;
  *((void *)a4 + 6) = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateBytes( *((wireless_diagnostics::google::protobuf::DescriptorPool::Tables **)this + 1),  40 * v15);
  if (*((int *)a2 + 8) >= 1)
  {
    uint64_t v16 = 0LL;
    uint64_t v17 = 0LL;
    do
    {
      wireless_diagnostics::google::protobuf::DescriptorBuilder::BuildEnumValue( (uint64_t)this,  *(void *)(*((void *)a2 + 3) + 8 * v17++),  (uint64_t *)a4,  (uint64_t *)(*((void *)a4 + 6) + v16));
      v16 += 40LL;
    }

    while (v17 < *((int *)a2 + 8));
  }

  if ((*((_BYTE *)a2 + 60) & 4) != 0)
  {
    int v18 = (wireless_diagnostics::google::protobuf::MessageLite *)*((void *)a2 + 6);
    if (!v18) {
      int v18 = *(wireless_diagnostics::google::protobuf::MessageLite **)(wireless_diagnostics::google::protobuf::EnumDescriptorProto::default_instance_
    }
                                                                    + 48);
    wireless_diagnostics::google::protobuf::DescriptorBuilder::AllocateOptionsImpl<wireless_diagnostics::google::protobuf::EnumDescriptor>( (uint64_t)this,  *((__int128 **)a4 + 1),  *((__int128 **)a4 + 1),  v18,  (uint64_t)a4);
  }

  else
  {
    *((void *)a4 + 4) = 0LL;
  }

  return wireless_diagnostics::google::protobuf::DescriptorBuilder::AddSymbol( (uint64_t)this,  *((const std::string **)a4 + 1),  (uint64_t *)a3,  *(void *)a4,  (uint64_t)a2,  3LL,  (uint64_t)a4);
}

void sub_187C4D258( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorBuilder::BuildService( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t String = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateString( *(void **)(a1 + 8),  *(void *)(*(void *)(a1 + 80) + 8LL));
  uint64_t v8 = String;
  if (((char)String->__r_.__value_.__s.__size_ & 0x80000000) == 0)
  {
    if (!String->__r_.__value_.__s.__size_) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  if (String->__r_.__value_.__l.__size_) {
LABEL_3:
  }
    std::string::append(String, 1uLL, 46);
LABEL_4:
  uint64_t v9 = *(void *)(a2 + 16);
  int v10 = *(char *)(v9 + 23);
  if (v10 >= 0) {
    uint64_t v11 = *(const std::string::value_type **)(a2 + 16);
  }
  else {
    uint64_t v11 = *(const std::string::value_type **)v9;
  }
  if (v10 >= 0) {
    std::string::size_type v12 = *(unsigned __int8 *)(v9 + 23);
  }
  else {
    std::string::size_type v12 = *(void *)(v9 + 8);
  }
  std::string::append(v8, v11, v12);
  wireless_diagnostics::google::protobuf::DescriptorBuilder::ValidateSymbolName( a1,  *(uint64_t **)(a2 + 16),  (uint64_t)v8,  a2);
  *(void *)a4 = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateString( *(void **)(a1 + 8),  *(void *)(a2 + 16));
  *(void *)(a4 + 8) = v8;
  *(void *)(a4 + 16) = *(void *)(a1 + 80);
  int v13 = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(a4 + 32) = v13;
  *(void *)(a4 + 40) = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateBytes( *(wireless_diagnostics::google::protobuf::DescriptorPool::Tables **)(a1 + 8),  48 * v13);
  if (*(int *)(a2 + 32) >= 1)
  {
    uint64_t v14 = 0LL;
    uint64_t v15 = 0LL;
    do
    {
      wireless_diagnostics::google::protobuf::DescriptorBuilder::BuildMethod( a1,  *(void *)(*(void *)(a2 + 24) + 8 * v15++),  (uint64_t *)a4,  (uint64_t *)(*(void *)(a4 + 40) + v14));
      v14 += 48LL;
    }

    while (v15 < *(int *)(a2 + 32));
  }

  if ((*(_BYTE *)(a2 + 60) & 4) != 0)
  {
    uint64_t v16 = *(wireless_diagnostics::google::protobuf::MessageLite **)(a2 + 48);
    if (!v16) {
      uint64_t v16 = *(wireless_diagnostics::google::protobuf::MessageLite **)(wireless_diagnostics::google::protobuf::ServiceDescriptorProto::default_instance_
    }
                                                                    + 48);
    wireless_diagnostics::google::protobuf::DescriptorBuilder::AllocateOptionsImpl<wireless_diagnostics::google::protobuf::ServiceDescriptor>( a1,  *(__int128 **)(a4 + 8),  *(__int128 **)(a4 + 8),  v16,  a4);
  }

  else
  {
    *(void *)(a4 + 24) = 0LL;
  }

  return wireless_diagnostics::google::protobuf::DescriptorBuilder::AddSymbol( a1,  *(const std::string **)(a4 + 8),  0LL,  *(void *)a4,  a2,  5LL,  a4);
}

void wireless_diagnostics::google::protobuf::DescriptorBuilder::CrossLinkFile( wireless_diagnostics::google::protobuf::DescriptorBuilder *this, wireless_diagnostics::google::protobuf::FileDescriptor *a2, const wireless_diagnostics::google::protobuf::FileDescriptorProto *a3, const char *a4)
{
  uint64_t v6 = this;
  if (!*((void *)a2 + 17))
  {
    this = (wireless_diagnostics::google::protobuf::DescriptorBuilder *)wireless_diagnostics::google::protobuf::FileOptions::default_instance( this,  (uint64_t)a2,  (uint64_t)a3,  a4);
    *((void *)a2 + 17) = this;
  }

  if (*((int *)a2 + 18) >= 1)
  {
    uint64_t v7 = 0LL;
    uint64_t v8 = 0LL;
    do
    {
      wireless_diagnostics::google::protobuf::DescriptorBuilder::CrossLinkMessage( v6,  (wireless_diagnostics::google::protobuf::Descriptor *)(*((void *)a2 + 10) + v7),  *(const wireless_diagnostics::google::protobuf::DescriptorProto **)(*((void *)a3 + 11) + 8 * v8++),  a4);
      v7 += 120LL;
    }

    while (v8 < *((int *)a2 + 18));
  }

  if (*((int *)a2 + 30) >= 1)
  {
    uint64_t v9 = 0LL;
    uint64_t v10 = 0LL;
    do
    {
      wireless_diagnostics::google::protobuf::DescriptorBuilder::CrossLinkField( v6,  (wireless_diagnostics::google::protobuf::FieldDescriptor *)(*((void *)a2 + 16) + v9),  *(std::string ***)(*((void *)a3 + 20) + 8 * v10++),  a4);
      v9 += 120LL;
    }

    while (v10 < *((int *)a2 + 30));
  }

  if (*((int *)a2 + 22) >= 1)
  {
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    do
    {
      this = wireless_diagnostics::google::protobuf::DescriptorBuilder::CrossLinkEnum( this,  (wireless_diagnostics::google::protobuf::EnumDescriptor *)(*((void *)a2 + 12) + v11),  a3,  a4);
      ++v12;
      v11 += 56LL;
    }

    while (v12 < *((int *)a2 + 22));
  }

  if (*((int *)a2 + 26) >= 1)
  {
    uint64_t v13 = 0LL;
    uint64_t v14 = 0LL;
    do
    {
      wireless_diagnostics::google::protobuf::DescriptorBuilder::CrossLinkService( v6,  (wireless_diagnostics::google::protobuf::ServiceDescriptor *)(*((void *)a2 + 14) + v13),  *(const wireless_diagnostics::google::protobuf::ServiceDescriptorProto **)(*((void *)a3 + 17) + 8 * v14++),  a4);
      v13 += 48LL;
    }

    while (v14 < *((int *)a2 + 26));
  }

void wireless_diagnostics::google::protobuf::DescriptorBuilder::OptionInterpreter::~OptionInterpreter( wireless_diagnostics::google::protobuf::DescriptorBuilder::OptionInterpreter *this)
{
}

{
  wireless_diagnostics::google::protobuf::DynamicMessageFactory::~DynamicMessageFactory((wireless_diagnostics::google::protobuf::DescriptorBuilder::OptionInterpreter *)((char *)this + 24));
}

void wireless_diagnostics::google::protobuf::DescriptorBuilder::ValidateFileOptions( wireless_diagnostics::google::protobuf::DescriptorPool::Tables **this, wireless_diagnostics::google::protobuf::FileDescriptor *a2, const wireless_diagnostics::google::protobuf::FileDescriptorProto *a3, const char *a4)
{
  if (*((int *)a2 + 18) >= 1)
  {
    uint64_t v7 = 0LL;
    uint64_t v8 = 0LL;
    do
    {
      wireless_diagnostics::google::protobuf::DescriptorBuilder::ValidateMessageOptions( this,  (wireless_diagnostics::google::protobuf::Descriptor *)(*((void *)a2 + 10) + v7),  *(const wireless_diagnostics::google::protobuf::DescriptorProto **)(*((void *)a3 + 11) + 8 * v8++),  a4);
      v7 += 120LL;
    }

    while (v8 < *((int *)a2 + 18));
  }

  if (*((int *)a2 + 22) >= 1)
  {
    uint64_t v9 = 0LL;
    uint64_t v10 = 0LL;
    do
    {
      wireless_diagnostics::google::protobuf::DescriptorBuilder::ValidateEnumOptions( (wireless_diagnostics::google::protobuf::DescriptorBuilder *)this,  (wireless_diagnostics::google::protobuf::EnumDescriptor *)(*((void *)a2 + 12) + v9),  *(const wireless_diagnostics::google::protobuf::EnumDescriptorProto **)(*((void *)a3 + 14) + 8 * v10++));
      v9 += 56LL;
    }

    while (v10 < *((int *)a2 + 22));
  }

  if (*((int *)a2 + 26) >= 1)
  {
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    do
    {
      wireless_diagnostics::google::protobuf::DescriptorBuilder::ValidateServiceOptions( (wireless_diagnostics::google::protobuf::DescriptorBuilder *)this,  (wireless_diagnostics::google::protobuf::ServiceDescriptor *)(*((void *)a2 + 14) + v11),  *(const wireless_diagnostics::google::protobuf::ServiceDescriptorProto **)(*((void *)a3 + 17) + 8 * v12++),  a4);
      v11 += 48LL;
    }

    while (v12 < *((int *)a2 + 26));
  }

  if (*((int *)a2 + 30) >= 1)
  {
    uint64_t v13 = 0LL;
    uint64_t v14 = 0LL;
    do
    {
      wireless_diagnostics::google::protobuf::DescriptorBuilder::ValidateFieldOptions( this,  (wireless_diagnostics::google::protobuf::FieldDescriptor *)(*((void *)a2 + 16) + v13),  *(const wireless_diagnostics::google::protobuf::FieldDescriptorProto **)(*((void *)a3 + 20) + 8 * v14++),  a4);
      v13 += 120LL;
    }

    while (v14 < *((int *)a2 + 30));
  }

  uint64_t v15 = (wireless_diagnostics::google::protobuf::FileOptions *)*((void *)a2 + 17);
  uint64_t v16 = (wireless_diagnostics::google::protobuf::FileOptions *)wireless_diagnostics::google::protobuf::FileOptions::default_instance( (wireless_diagnostics::google::protobuf::FileOptions *)this,  (uint64_t)a2,  (uint64_t)a3,  a4);
  if ((v15 == v16 || *(_DWORD *)(*((void *)a2 + 17) + 56LL) != 3) && *((int *)a2 + 6) >= 1)
  {
    uint64_t v20 = 0LL;
    while (1)
    {
      uint64_t v21 = *(void *)(*((void *)a2 + 4) + 8 * v20);
      if (v21)
      {
        uint64_t v22 = *(wireless_diagnostics::google::protobuf::FileOptions **)(v21 + 136);
        uint64_t v16 = (wireless_diagnostics::google::protobuf::FileOptions *)wireless_diagnostics::google::protobuf::FileOptions::default_instance( v16,  v17,  v18,  v19);
        if (v22 != v16 && *(_DWORD *)(*(void *)(v21 + 136) + 56LL) == 3) {
          break;
        }
      }
    }

    uint64_t v23 = *(void *)a2;
    std::operator+<char>();
    int v24 = std::string::append(&v26, " which is.");
    __int128 v25 = *(_OWORD *)&v24->__r_.__value_.__l.__data_;
    std::string::size_type cap = v24->__r_.__value_.__l.__cap_;
    *(_OWORD *)std::string __p = v25;
    v24->__r_.__value_.__l.__size_ = 0LL;
    v24->__r_.__value_.__l.__cap_ = 0LL;
    v24->__r_.__value_.__r.__words[0] = 0LL;
    wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)this,  v23,  (uint64_t)a3,  9LL,  (uint64_t)__p);
    if (SHIBYTE(cap) < 0) {
      operator delete(__p[0]);
    }
  }

void sub_187C4D77C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  _Unwind_Resume(exception_object);
}

void wireless_diagnostics::google::protobuf::DescriptorBuilder::BuildExtensionRange( uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  int v7 = *(_DWORD *)(a2 + 16);
  *a4 = v7;
  int v8 = *(_DWORD *)(a2 + 20);
  a4[1] = v8;
  if (v7 <= 0)
  {
    uint64_t v10 = *(void *)(a3 + 8);
    std::string::basic_string[abi:ne180100]<0>(__p, "Extension numbers must be positive integers.");
    wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError(a1, v10, a2, 1LL, (uint64_t)__p);
    if (v13 < 0) {
      operator delete(__p[0]);
    }
    int v7 = *a4;
    int v8 = a4[1];
  }

  if (v7 >= v8)
  {
    uint64_t v11 = *(void *)(a3 + 8);
    std::string::basic_string[abi:ne180100]<0>(__p, "Extension range end number must be greater than start number.");
    wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError(a1, v11, a2, 1LL, (uint64_t)__p);
    if (v13 < 0) {
      operator delete(__p[0]);
    }
  }

void sub_187C4D88C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorBuilder::AddSymbol( uint64_t a1, const std::string *a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11 = a3;
  if (!a3) {
    uint64_t v11 = *(uint64_t **)(a1 + 80);
  }
  if (wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AddSymbol( *(void *)(a1 + 8),  (const char *)a2,  a6,  a7))
  {
    if ((wireless_diagnostics::google::protobuf::FileDescriptorTables::AddAliasUnderParent( *(float **)(a1 + 88),  v11,  a4,  a6,  a7) & 1) != 0) {
      return 1LL;
    }
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)__p);
    return 0LL;
  }

  uint64_t v15 = *(int8x8_t **)(a1 + 8);
  if ((a2->__r_.__value_.__s.__size_ & 0x80u) == 0) {
    uint64_t v16 = (const char *)a2;
  }
  else {
    uint64_t v16 = (const char *)a2->__r_.__value_.__r.__words[0];
  }
  char v17 = *v16;
  if (*v16)
  {
    unint64_t v18 = 0LL;
    uint64_t v19 = (unsigned __int8 *)(v16 + 1);
    do
    {
      unint64_t v18 = 5 * v18 + v17;
      int v20 = *v19++;
      char v17 = v20;
    }

    while (v20);
  }

  else
  {
    unint64_t v18 = 0LL;
  }

  int8x8_t v21 = v15[26];
  if (v21)
  {
    uint8x8_t v22 = (uint8x8_t)vcnt_s8(v21);
    v22.i16[0] = vaddlv_u8(v22);
    unint64_t v23 = v22.u32[0];
    if (v22.u32[0] > 1uLL)
    {
      unint64_t v24 = v18;
      if (v18 >= *(void *)&v21) {
        unint64_t v24 = v18 % *(void *)&v21;
      }
    }

    else
    {
      unint64_t v24 = (*(void *)&v21 - 1LL) & v18;
    }

    __int128 v25 = *(uint64_t **)(*(void *)&v15[25] + 8 * v24);
    if (!v25) {
      goto LABEL_32;
    }
    for (uint64_t i = *v25; i; uint64_t i = *(void *)i)
    {
      unint64_t v27 = *(void *)(i + 8);
      if (v18 == v27)
      {
        if (!strcmp(*(const char **)(i + 16), v16))
        {
          __int128 v25 = (uint64_t *)(i + 24);
          goto LABEL_32;
        }
      }

      else
      {
        if (v23 > 1)
        {
          if (v27 >= *(void *)&v21) {
            v27 %= *(void *)&v21;
          }
        }

        else
        {
          v27 &= *(void *)&v21 - 1LL;
        }

        if (v27 != v24) {
          break;
        }
      }
    }
  }

  __int128 v25 = 0LL;
LABEL_32:
  if (v25) {
    uint64_t v28 = v25;
  }
  uint64_t v29 = (const std::string::value_type ***)v28[1];
  switch(*(_DWORD *)v28)
  {
    case 1:
    case 3:
    case 5:
      uint64_t v30 = (const std::string::value_type ****)(v29 + 2);
      goto LABEL_41;
    case 2:
      uint64_t v30 = (const std::string::value_type ****)(v29 + 4);
      goto LABEL_41;
    case 4:
      std::string v31 = v29[3];
      goto LABEL_40;
    case 6:
      std::string v31 = v29[2];
LABEL_40:
      uint64_t v30 = (const std::string::value_type ****)(v31 + 2);
LABEL_41:
      uint64_t v29 = *v30;
      break;
    case 7:
      break;
    default:
      uint64_t v29 = 0LL;
      break;
  }

  if (v29 == *(const std::string::value_type ****)(a1 + 80))
  {
    std::string::size_type v42 = std::string::rfind(a2, 46, 0xFFFFFFFFFFFFFFFFLL);
    if (v42 == -1LL)
    {
      std::operator+<char>();
      uint64_t v54 = std::string::append(&v60, " is already defined.");
      __int128 v55 = *(_OWORD *)&v54->__r_.__value_.__l.__data_;
      std::string::size_type cap = v54->__r_.__value_.__l.__cap_;
      *(_OWORD *)std::string __p = v55;
      v54->__r_.__value_.__l.__size_ = 0LL;
      v54->__r_.__value_.__l.__cap_ = 0LL;
      v54->__r_.__value_.__r.__words[0] = 0LL;
      wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError(a1, (uint64_t)a2, a5, 0LL, (uint64_t)__p);
      if (SHIBYTE(cap) < 0) {
        operator delete(__p[0]);
      }
      uint64_t v41 = (void *)v60.__r_.__value_.__r.__words[0];
    }

    else
    {
      std::string::size_type v43 = v42;
      std::string::basic_string(&v57, a2, v42 + 1, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v56);
      unint64_t v44 = std::string::insert(&v57, 0LL, "");
      __int128 v45 = *(_OWORD *)&v44->__r_.__value_.__l.__data_;
      v58.__r_.__value_.__l.__cap_ = v44->__r_.__value_.__l.__cap_;
      *(_OWORD *)&v58.__r_.__value_.__l.__data_ = v45;
      v44->__r_.__value_.__l.__size_ = 0LL;
      v44->__r_.__value_.__l.__cap_ = 0LL;
      v44->__r_.__value_.__r.__words[0] = 0LL;
      int v46 = std::string::append(&v58, " is already defined in ");
      __int128 v47 = *(_OWORD *)&v46->__r_.__value_.__l.__data_;
      v59.__r_.__value_.__l.__cap_ = v46->__r_.__value_.__l.__cap_;
      *(_OWORD *)&v59.__r_.__value_.__l.__data_ = v47;
      v46->__r_.__value_.__l.__size_ = 0LL;
      v46->__r_.__value_.__l.__cap_ = 0LL;
      v46->__r_.__value_.__r.__words[0] = 0LL;
      std::string::basic_string(&v56, a2, 0LL, v43, (std::allocator<char> *)v63);
      if ((v56.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        int v48 = &v56;
      }
      else {
        int v48 = (std::string *)v56.__r_.__value_.__r.__words[0];
      }
      if ((v56.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        std::string::size_type size = v56.__r_.__value_.__s.__size_;
      }
      else {
        std::string::size_type size = v56.__r_.__value_.__l.__size_;
      }
      uint64_t v50 = std::string::append(&v59, (const std::string::value_type *)v48, size);
      __int128 v51 = *(_OWORD *)&v50->__r_.__value_.__l.__data_;
      v60.__r_.__value_.__l.__cap_ = v50->__r_.__value_.__l.__cap_;
      *(_OWORD *)&v60.__r_.__value_.__l.__data_ = v51;
      v50->__r_.__value_.__l.__size_ = 0LL;
      v50->__r_.__value_.__l.__cap_ = 0LL;
      v50->__r_.__value_.__r.__words[0] = 0LL;
      uint64_t v52 = std::string::append(&v60, ".");
      __int128 v53 = *(_OWORD *)&v52->__r_.__value_.__l.__data_;
      std::string::size_type cap = v52->__r_.__value_.__l.__cap_;
      *(_OWORD *)std::string __p = v53;
      v52->__r_.__value_.__l.__size_ = 0LL;
      v52->__r_.__value_.__l.__cap_ = 0LL;
      v52->__r_.__value_.__r.__words[0] = 0LL;
      wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError(a1, (uint64_t)a2, a5, 0LL, (uint64_t)__p);
      if (SHIBYTE(cap) < 0) {
        operator delete(__p[0]);
      }
      uint64_t v41 = (void *)v57.__r_.__value_.__r.__words[0];
    }
  }

  else
  {
    std::operator+<char>();
    int v32 = std::string::append(&v58, " is already defined in file ");
    __int128 v33 = *(_OWORD *)&v32->__r_.__value_.__l.__data_;
    v59.__r_.__value_.__l.__cap_ = v32->__r_.__value_.__l.__cap_;
    *(_OWORD *)&v59.__r_.__value_.__l.__data_ = v33;
    v32->__r_.__value_.__l.__size_ = 0LL;
    v32->__r_.__value_.__l.__cap_ = 0LL;
    v32->__r_.__value_.__r.__words[0] = 0LL;
    int v34 = *((char *)*v29 + 23);
    if (v34 >= 0) {
      uint64_t v35 = (const std::string::value_type *)*v29;
    }
    else {
      uint64_t v35 = **v29;
    }
    if (v34 >= 0) {
      std::string::size_type v36 = *((unsigned __int8 *)*v29 + 23);
    }
    else {
      std::string::size_type v36 = (std::string::size_type)(*v29)[1];
    }
    unint64_t v37 = std::string::append(&v59, v35, v36);
    __int128 v38 = *(_OWORD *)&v37->__r_.__value_.__l.__data_;
    v60.__r_.__value_.__l.__cap_ = v37->__r_.__value_.__l.__cap_;
    *(_OWORD *)&v60.__r_.__value_.__l.__data_ = v38;
    v37->__r_.__value_.__l.__size_ = 0LL;
    v37->__r_.__value_.__l.__cap_ = 0LL;
    v37->__r_.__value_.__r.__words[0] = 0LL;
    uint64_t v39 = std::string::append(&v60, ".");
    __int128 v40 = *(_OWORD *)&v39->__r_.__value_.__l.__data_;
    std::string::size_type cap = v39->__r_.__value_.__l.__cap_;
    *(_OWORD *)std::string __p = v40;
    v39->__r_.__value_.__l.__size_ = 0LL;
    v39->__r_.__value_.__l.__cap_ = 0LL;
    v39->__r_.__value_.__r.__words[0] = 0LL;
    wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError(a1, (uint64_t)a2, a5, 0LL, (uint64_t)__p);
    if (SHIBYTE(cap) < 0) {
      operator delete(__p[0]);
    }
    uint64_t v41 = (void *)v58.__r_.__value_.__r.__words[0];
  }

  operator delete(v41);
  return 0LL;
}

void sub_187C4DDF0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, int a17, __int16 a18, char a19, char a20, void *a21, uint64_t a22, int a23, __int16 a24, char a25, char a26, uint64_t a27, void *a28, uint64_t a29, int a30, __int16 a31, char a32, char a33, uint64_t a34, void *a35, uint64_t a36, int a37, __int16 a38, char a39, char a40, uint64_t a41, void *__p, uint64_t a43, int a44, __int16 a45, char a46, char a47)
{
  if (a47 < 0) {
    operator delete(__p);
  }
  if (a40 < 0) {
    operator delete(a35);
  }
  _Unwind_Resume(exception_object);
}

void wireless_diagnostics::google::protobuf::DescriptorBuilder::BuildFieldOrExtension( wireless_diagnostics::google::protobuf::DescriptorBuilder *this, const wireless_diagnostics::google::protobuf::FieldDescriptorProto *a2, const wireless_diagnostics::google::protobuf::Descriptor *a3, wireless_diagnostics::google::protobuf::FieldDescriptor *a4, int a5)
{
  uint64_t v115 = *MEMORY[0x1895F89C0];
  if (a3) {
    uint64_t v10 = (uint64_t *)((char *)a3 + 8);
  }
  else {
    uint64_t v10 = (uint64_t *)(*((void *)this + 10) + 8LL);
  }
  uint64_t String = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateString(*((void **)this + 1), *v10);
  uint64_t v12 = String;
  if (((char)String->__r_.__value_.__s.__size_ & 0x80000000) == 0)
  {
    if (!String->__r_.__value_.__s.__size_) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  if (String->__r_.__value_.__l.__size_) {
LABEL_6:
  }
    std::string::append(String, 1uLL, 46);
LABEL_7:
  uint64_t v13 = *((void *)a2 + 2);
  int v14 = *(char *)(v13 + 23);
  if (v14 >= 0) {
    uint64_t v15 = (const std::string::value_type *)*((void *)a2 + 2);
  }
  else {
    uint64_t v15 = *(const std::string::value_type **)v13;
  }
  if (v14 >= 0) {
    std::string::size_type v16 = *(unsigned __int8 *)(v13 + 23);
  }
  else {
    std::string::size_type v16 = *(void *)(v13 + 8);
  }
  std::string::append(v12, v15, v16);
  wireless_diagnostics::google::protobuf::DescriptorBuilder::ValidateSymbolName( (uint64_t)this,  *((uint64_t **)a2 + 2),  (uint64_t)v12,  (uint64_t)a2);
  *(void *)a4 = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateString( *((void **)this + 1),  *((void *)a2 + 2));
  *((void *)a4 + 1) = v12;
  *((void *)a4 + 4) = *((void *)this + 10);
  *((_DWORD *)a4 + 10) = *((_DWORD *)a2 + 6);
  *((_BYTE *)a4 + 52) = a5;
  char v17 = (__int128 *)*((void *)a2 + 2);
  if (*((char *)v17 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v94, *(const std::string::value_type **)v17, *((void *)v17 + 1));
  }

  else
  {
    __int128 v18 = *v17;
    v94.__r_.__value_.__l.__cap_ = *((void *)v17 + 2);
    *(_OWORD *)&v94.__r_.__value_.__l.__data_ = v18;
  }

  size_t size = v94.__r_.__value_.__s.__size_;
  size_t v20 = v94.__r_.__value_.__l.__size_;
  int8x8_t v21 = (std::string *)v94.__r_.__value_.__r.__words[0];
  if ((v94.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    uint8x8_t v22 = (std::string *)((char *)&v94 + v94.__r_.__value_.__s.__size_);
  }
  else {
    uint8x8_t v22 = (std::string *)(v94.__r_.__value_.__r.__words[0] + v94.__r_.__value_.__l.__size_);
  }
  if ((v94.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    int8x8_t v21 = &v94;
  }
  if (v21 != v22)
  {
    do
    {
      int v23 = v21->__r_.__value_.__s.__data_[0];
      int8x8_t v21 = (std::string *)((char *)v21 + 1);
    }

    while (v21 != v22);
    size_t size = v94.__r_.__value_.__s.__size_;
    size_t v20 = v94.__r_.__value_.__l.__size_;
  }

  unint64_t v24 = (unsigned __int8 **)*((void *)a2 + 2);
  if ((size & 0x80u) == 0LL) {
    size_t v25 = size;
  }
  else {
    size_t v25 = v20;
  }
  std::string v26 = (unsigned __int8 *)*((unsigned __int8 *)v24 + 23);
  int v27 = (char)v26;
  if (v27 >= 0) {
    uint64_t v28 = (unsigned __int8 *)*((void *)a2 + 2);
  }
  else {
    uint64_t v28 = *v24;
  }
  if ((size & 0x80) != 0)
  {
    if (!memcmp(v94.__r_.__value_.__l.__data_, v28, v20)) {
      goto LABEL_45;
    }
LABEL_44:
    *((void *)a4 + 2) = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateString( *((void **)this + 1),  (uint64_t)&v94);
    unint64_t v24 = (unsigned __int8 **)*((void *)a2 + 2);
    goto LABEL_46;
  }

  if ((_DWORD)size)
  {
    uint64_t v29 = &v94;
    while (v29->__r_.__value_.__s.__data_[0] == *v28)
    {
      uint64_t v29 = (std::string *)((char *)v29 + 1);
      ++v28;
      if (!--size) {
        goto LABEL_45;
      }
    }

    goto LABEL_44;
  }

LABEL_45:
  *((void *)a4 + 2) = *(void *)a4;
LABEL_46:
  uint64_t v30 = (void *)*((void *)this + 1);
  memset(&v114, 0, sizeof(v114));
  else {
    std::string::size_type v31 = (std::string::size_type)v24[1];
  }
  std::string::reserve(&v114, v31);
  int v32 = (unsigned __int8 *)*((unsigned __int8 *)v24 + 23);
  BOOL v33 = *((char *)v24 + 23) < 0;
  int v34 = v24[1];
  else {
    uint64_t v35 = v24[1];
  }
  if (v35)
  {
    unint64_t v36 = 0LL;
    BOOL v37 = 0;
    do
    {
      __int128 v38 = (unsigned __int8 **)*v24;
      if (!v33) {
        __int128 v38 = v24;
      }
      int v39 = *((unsigned __int8 *)v38 + v36);
      BOOL v40 = v39 == 95;
      if (v39 != 95)
      {
        if (v37)
        {
          else {
            LOBYTE(v39) = v39 - 32;
          }
        }

        std::string::push_back(&v114, v39);
        int v32 = (unsigned __int8 *)*((unsigned __int8 *)v24 + 23);
        int v34 = v24[1];
      }

      ++v36;
      BOOL v33 = (char)v32 < 0;
      else {
        uint64_t v41 = v34;
      }
      BOOL v37 = v40;
    }

    while ((unint64_t)v41 > v36);
  }

  if ((char)v114.__r_.__value_.__s.__size_ < 0)
  {
    if (v114.__r_.__value_.__l.__size_)
    {
      std::string::size_type v43 = (std::string *)v114.__r_.__value_.__r.__words[0];
      int v42 = *v114.__r_.__value_.__l.__data_;
    }
  }

  else if (v114.__r_.__value_.__s.__size_)
  {
    LOBYTE(v42) = v114.__r_.__value_.__s.__data_[0];
    if (v114.__r_.__value_.__s.__data_[0] - 65 < 0x1A)
    {
      std::string::size_type v43 = &v114;
LABEL_72:
      v43->__r_.__value_.__s.__data_[0] = v42 + 32;
    }
  }

  *((void *)a4 + 3) = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateString( v30,  (uint64_t)&v114);
  int v45 = *((_DWORD *)a2 + 16);
  int v46 = *((_DWORD *)a2 + 7);
  *(_OWORD *)((char *)a4 + 56) = 0u;
  __int128 v47 = (char *)a4 + 56;
  *((_DWORD *)a4 + 11) = v45;
  *((_DWORD *)a4 + 12) = v46;
  *((void *)a4 + 11) = 0LL;
  *(_OWORD *)((char *)a4 + 72) = 0u;
  int v48 = *((_DWORD *)a2 + 18);
  *((_BYTE *)a4 + 104) = (v48 & 0x40) != 0;
  if ((v48 & 0x40) != 0 && v46 == 3)
  {
    uint64_t v49 = *((void *)a4 + 1);
    std::string::basic_string[abi:ne180100]<0>(&v114, "Repeated fields can't have default values.");
    wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)this,  v49,  (uint64_t)a2,  4LL,  (uint64_t)&v114);
    int v48 = *((_DWORD *)a2 + 18);
  }

  if ((v48 & 8) != 0)
  {
    if ((v48 & 0x40) == 0)
    {
      switch(*((_DWORD *)a4 + 11))
      {
        case 1:
        case 3:
        case 4:
        case 6:
          *((void *)a4 + 14) = 0LL;
          break;
        case 2:
        case 5:
        case 7:
          *((_DWORD *)a4 + 28) = 0;
          break;
        case 8:
          *((_BYTE *)a4 + 112) = 0;
          break;
        case 9:
          break;
        default:
          goto LABEL_81;
      }

      goto LABEL_81;
    }

    __endptr = 0LL;
    switch(*((_DWORD *)a4 + 11))
    {
      case 1:
        uint64_t v66 = (unsigned __int16 **)*((void *)a2 + 6);
        int v67 = *((char *)v66 + 23);
        if (v67 < 0)
        {
          if (v66[1] != (unsigned __int16 *)3)
          {
LABEL_151:
            if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v66, "-inf"))
            {
              unint64_t v80 = 0xFFF0000000000000LL;
LABEL_180:
              *((void *)a4 + 14) = v80;
              goto LABEL_183;
            }

            if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>( *((void **)a2 + 6),  "nan"))
            {
              unint64_t v80 = 0x7FF8000000000000LL;
              goto LABEL_180;
            }

            unsigned __int8 v86 = (char *)*((void *)a2 + 6);
            if (v86[23] < 0) {
              unsigned __int8 v86 = *(char **)v86;
            }
            *((double *)a4 + 14) = wireless_diagnostics::google::protobuf::NoLocaleStrtod( (wireless_diagnostics::google::protobuf *)v86,  (char *)&__endptr,  v44);
LABEL_183:
            if (!__endptr) {
              break;
            }
            uint64_t v89 = *((void *)a2 + 6);
            if (*(char *)(v89 + 23) < 0)
            {
              if (!*(void *)(v89 + 8)) {
                goto LABEL_189;
              }
            }

            else if (!*(_BYTE *)(v89 + 23))
            {
LABEL_189:
              uint64_t v90 = *((void *)a4 + 1);
              std::string::basic_string[abi:ne180100]<0>(&v114, "Couldn't parse default value.");
              wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)this,  v90,  (uint64_t)a2,  4LL,  (uint64_t)&v114);
              break;
            }

            if (!*__endptr) {
              break;
            }
            goto LABEL_189;
          }

          uint64_t v68 = *v66;
        }

        else
        {
          uint64_t v68 = (unsigned __int16 *)*((void *)a2 + 6);
          if (v67 != 3) {
            goto LABEL_151;
          }
        }

        int v77 = *v68;
        int v78 = *((unsigned __int8 *)v68 + 2);
        if (v77 == 28265 && v78 == 102)
        {
          unint64_t v80 = 0x7FF0000000000000LL;
          goto LABEL_180;
        }

        goto LABEL_151;
      case 2:
        uint64_t v69 = (unsigned __int16 **)*((void *)a2 + 6);
        int v70 = *((char *)v69 + 23);
        if (v70 < 0)
        {
          uint64_t v71 = *v69;
        }

        else
        {
          uint64_t v71 = (unsigned __int16 *)*((void *)a2 + 6);
          if (v70 != 3) {
            goto LABEL_161;
          }
        }

        int v81 = *v71;
        int v82 = *((unsigned __int8 *)v71 + 2);
        if (v81 == 28265 && v82 == 102)
        {
          int v84 = 2139095040;
          goto LABEL_182;
        }

LABEL_161:
        if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v69, "-inf"))
        {
          int v84 = -8388608;
        }

        else
        {
          if (!std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>( *((void **)a2 + 6),  "nan"))
          {
            uint64_t v87 = (char *)*((void *)a2 + 6);
            if (v87[23] < 0) {
              uint64_t v87 = *(char **)v87;
            }
            float v88 = wireless_diagnostics::google::protobuf::NoLocaleStrtod( (wireless_diagnostics::google::protobuf *)v87,  (char *)&__endptr,  v44);
            *((float *)a4 + 28) = v88;
            goto LABEL_183;
          }

          int v84 = 2143289344;
        }

LABEL_182:
        *((_DWORD *)a4 + 28) = v84;
        goto LABEL_183;
      case 3:
      case 0x10:
      case 0x12:
        __int128 v62 = (const char *)*((void *)a2 + 6);
        if (v62[23] < 0) {
          __int128 v62 = *(const char **)v62;
        }
        unint64_t v63 = strtoll(v62, &__endptr, 0);
        goto LABEL_144;
      case 4:
      case 6:
        __int128 v65 = (const char *)*((void *)a2 + 6);
        if (v65[23] < 0) {
          __int128 v65 = *(const char **)v65;
        }
        unint64_t v63 = strtoull(v65, &__endptr, 0);
        goto LABEL_144;
      case 5:
      case 0xF:
      case 0x11:
        std::string v60 = (const char *)*((void *)a2 + 6);
        if (v60[23] < 0) {
          std::string v60 = *(const char **)v60;
        }
        int v61 = strtol(v60, &__endptr, 0);
        goto LABEL_124;
      case 7:
      case 0xD:
        __int128 v64 = (const char *)*((void *)a2 + 6);
        if (v64[23] < 0) {
          __int128 v64 = *(const char **)v64;
        }
        int v61 = strtoul(v64, &__endptr, 0);
LABEL_124:
        *((_DWORD *)a4 + 28) = v61;
        goto LABEL_183;
      case 8:
        uint64_t v72 = *((void *)a2 + 6);
        int v73 = *(char *)(v72 + 23);
        if (v73 < 0)
        {
          if (*(void *)(v72 + 8) != 4LL) {
            goto LABEL_168;
          }
          uint64_t v74 = *(_DWORD **)v72;
        }

        else
        {
          uint64_t v74 = (_DWORD *)*((void *)a2 + 6);
          if (v73 != 4) {
            goto LABEL_168;
          }
        }

        if (*v74 == 1702195828)
        {
          *((_BYTE *)a4 + 112) = 1;
          goto LABEL_183;
        }

LABEL_168:
        if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((void *)v72, "false"))
        {
          *((_BYTE *)a4 + 112) = 0;
          goto LABEL_183;
        }

        uint64_t v85 = *((void *)a4 + 1);
        std::string::basic_string[abi:ne180100]<0>(&v114, "Boolean default must be true or false.");
        wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)this,  v85,  (uint64_t)a2,  4LL,  (uint64_t)&v114);
        goto LABEL_171;
      case 9:
      case 0xC:
        int v75 = (void *)*((void *)this + 1);
        if (*((_DWORD *)a4 + 11) == 12)
        {
          wireless_diagnostics::google::protobuf::UnescapeCEscapeString(*((void *)a2 + 6), &v114);
          *((void *)a4 + 14) = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateString( v75,  (uint64_t)&v114);
LABEL_171:
        }

        else
        {
          unint64_t v63 = (unint64_t)wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateString( *((void **)this + 1),  *((void *)a2 + 6));
LABEL_144:
          *((void *)a4 + 14) = v63;
        }

        goto LABEL_183;
      case 0xA:
      case 0xB:
        uint64_t v76 = *((void *)a4 + 1);
        std::string::basic_string[abi:ne180100]<0>(&v114, "Messages can't have default values.");
        wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)this,  v76,  (uint64_t)a2,  4LL,  (uint64_t)&v114);
        *((_BYTE *)a4 + 104) = 0;
        goto LABEL_183;
      case 0xE:
        *((void *)a4 + 14) = 0LL;
        goto LABEL_183;
      default:
        break;
    }
  }

LABEL_81:
  int v50 = *((_DWORD *)a4 + 10);
  if (v50 <= 0)
  {
    uint64_t v53 = *((void *)a4 + 1);
    std::string::basic_string[abi:ne180100]<0>(&v114, "Field numbers must be positive integers.");
    wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)this,  v53,  (uint64_t)a2,  1LL,  (uint64_t)&v114);
    uint64_t v54 = (void *)v114.__r_.__value_.__r.__words[0];
    goto LABEL_95;
  }

  if (v50 >> 29 && (a5 & 1) == 0)
  {
    uint64_t v51 = *((void *)a4 + 1);
    v114.__r_.__value_.__r.__words[0] = (std::string::size_type)wireless_diagnostics::google::protobuf::FastInt32ToBuffer( (wireless_diagnostics::google::protobuf *)0x1FFFFFFF,  &v114.__r_.__value_.__s.__data_[12],  (char *)v44);
    LODWORD(v114.__r_.__value_.__r.__words[1]) = strlen(v114.__r_.__value_.__l.__data_);
    __endptr = 0LL;
    int v112 = -1;
    uint64_t v109 = 0LL;
    int v110 = -1;
    uint64_t v107 = 0LL;
    int v108 = -1;
    uint64_t v105 = 0LL;
    int v106 = -1;
    uint64_t v103 = 0LL;
    int v104 = -1;
    uint64_t v101 = 0LL;
    int v102 = -1;
    uint64_t v99 = 0LL;
    int v100 = -1;
    uint64_t v97 = 0LL;
    int v98 = -1;
    uint64_t v95 = 0LL;
    int v96 = -1;
    *(void *)&__int128 v91 = &v99;
    *((void *)&v91 + 1) = &v97;
    wireless_diagnostics::google::protobuf::strings::Substitute( "Field numbers cannot be greater than $0.",  (uint64_t)&v114,  (uint64_t)&__endptr,  (uint64_t)&v109,  (uint64_t)&v107,  (uint64_t)&v105,  (uint64_t)&v103,  (uint64_t)&v101,  &__p,  v91,  (uint64_t)&v95);
    wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)this,  v51,  (uint64_t)a2,  1LL,  (uint64_t)&__p);
    int v52 = *((_DWORD *)a2 + 18);
    goto LABEL_99;
  }

  if ((v50 - 19000) <= 0x3E7)
  {
    uint64_t v55 = *((void *)a4 + 1);
    v114.__r_.__value_.__r.__words[0] = (std::string::size_type)wireless_diagnostics::google::protobuf::FastInt32ToBuffer( (wireless_diagnostics::google::protobuf *)0x4A38,  &v114.__r_.__value_.__s.__data_[12],  (char *)v44);
    LODWORD(v114.__r_.__value_.__r.__words[1]) = strlen(v114.__r_.__value_.__l.__data_);
    __endptr = wireless_diagnostics::google::protobuf::FastInt32ToBuffer( (wireless_diagnostics::google::protobuf *)0x4E1F,  v113,  v56);
    int v112 = strlen(__endptr);
    uint64_t v109 = 0LL;
    int v110 = -1;
    uint64_t v107 = 0LL;
    int v108 = -1;
    uint64_t v105 = 0LL;
    int v106 = -1;
    uint64_t v103 = 0LL;
    int v104 = -1;
    uint64_t v101 = 0LL;
    int v102 = -1;
    uint64_t v99 = 0LL;
    int v100 = -1;
    uint64_t v97 = 0LL;
    int v98 = -1;
    uint64_t v95 = 0LL;
    int v96 = -1;
    *(void *)&__int128 v92 = &v99;
    *((void *)&v92 + 1) = &v97;
    wireless_diagnostics::google::protobuf::strings::Substitute( "Field numbers $0 through $1 are reserved for the protocol buffer library implementation.",  (uint64_t)&v114,  (uint64_t)&__endptr,  (uint64_t)&v109,  (uint64_t)&v107,  (uint64_t)&v105,  (uint64_t)&v103,  (uint64_t)&v101,  &__p,  v92,  (uint64_t)&v95);
    wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)this,  v55,  (uint64_t)a2,  1LL,  (uint64_t)&__p);
    if ((char)__p.__r_.__value_.__s.__size_ < 0)
    {
      uint64_t v54 = (void *)__p.__r_.__value_.__r.__words[0];
LABEL_95:
      operator delete(v54);
    }
  }

LABEL_96:
  int v52 = *((_DWORD *)a2 + 18);
  if (a5)
  {
    __int128 v47 = (char *)a4 + 64;
    if ((v52 & 0x20) != 0) {
      goto LABEL_103;
    }
    uint64_t v57 = *((void *)a4 + 1);
    std::string::basic_string[abi:ne180100]<0>(&v114, "FieldDescriptorProto.extendee not set for extension field.");
    wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)this,  v57,  (uint64_t)a2,  3LL,  (uint64_t)&v114);
    goto LABEL_101;
  }

LABEL_99:
  if ((v52 & 0x20) == 0) {
    goto LABEL_103;
  }
  uint64_t v58 = *((void *)a4 + 1);
  std::string::basic_string[abi:ne180100]<0>(&v114, "FieldDescriptorProto.extendee set for non-extension field.");
  wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)this,  v58,  (uint64_t)a2,  3LL,  (uint64_t)&v114);
LABEL_101:
LABEL_103:
  *(void *)__int128 v47 = a3;
  if ((*((_BYTE *)a2 + 72) & 0x80) != 0)
  {
    std::string v59 = (wireless_diagnostics::google::protobuf::MessageLite *)*((void *)a2 + 7);
    if (!v59) {
      std::string v59 = *(wireless_diagnostics::google::protobuf::MessageLite **)(wireless_diagnostics::google::protobuf::FieldDescriptorProto::default_instance_
    }
                                                                    + 56);
    wireless_diagnostics::google::protobuf::DescriptorBuilder::AllocateOptionsImpl<wireless_diagnostics::google::protobuf::FieldDescriptor>( (uint64_t)this,  *((__int128 **)a4 + 1),  *((__int128 **)a4 + 1),  v59,  (uint64_t)a4);
  }

  else
  {
    *((void *)a4 + 12) = 0LL;
  }

  wireless_diagnostics::google::protobuf::DescriptorBuilder::AddSymbol( (uint64_t)this,  *((const std::string **)a4 + 1),  (uint64_t *)a3,  *(void *)a4,  (uint64_t)a2,  2LL,  (uint64_t)a4);
}

void sub_187C4EA20( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20, __int16 a21, char a22, char a23)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorBuilder::BuildEnumValue( uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  *a4 = (uint64_t)wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateString( *(void **)(a1 + 8),  *(void *)(a2 + 16));
  *((_DWORD *)a4 + 4) = *(_DWORD *)(a2 + 32);
  a4[3] = (uint64_t)a3;
  uint64_t String = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateString(*(void **)(a1 + 8), a3[1]);
  uint64_t v9 = String;
  else {
    std::string::size_type size = String->__r_.__value_.__s.__size_;
  }
  else {
    uint64_t v11 = *(unsigned __int8 *)(*a3 + 23);
  }
  std::string::resize(String, size - v11, 0);
  int v12 = *(char *)(*a4 + 23);
  if (v12 >= 0) {
    uint64_t v13 = (const std::string::value_type *)*a4;
  }
  else {
    uint64_t v13 = *(const std::string::value_type **)*a4;
  }
  if (v12 >= 0) {
    std::string::size_type v14 = *(unsigned __int8 *)(*a4 + 23);
  }
  else {
    std::string::size_type v14 = *(void *)(*a4 + 8);
  }
  std::string::append(v9, v13, v14);
  a4[1] = (uint64_t)v9;
  wireless_diagnostics::google::protobuf::DescriptorBuilder::ValidateSymbolName( a1,  *(uint64_t **)(a2 + 16),  (uint64_t)v9,  a2);
  if ((*(_BYTE *)(a2 + 40) & 4) != 0)
  {
    uint64_t v15 = *(wireless_diagnostics::google::protobuf::MessageLite **)(a2 + 24);
    if (!v15) {
      uint64_t v15 = *(wireless_diagnostics::google::protobuf::MessageLite **)(wireless_diagnostics::google::protobuf::EnumValueDescriptorProto::default_instance_
    }
                                                                    + 24);
    wireless_diagnostics::google::protobuf::DescriptorBuilder::AllocateOptionsImpl<wireless_diagnostics::google::protobuf::EnumValueDescriptor>( a1,  (__int128 *)a4[1],  (__int128 *)a4[1],  v15,  (uint64_t)a4);
  }

  else
  {
    a4[4] = 0LL;
  }

  char v16 = wireless_diagnostics::google::protobuf::DescriptorBuilder::AddSymbol( a1,  (const std::string *)a4[1],  (uint64_t *)a3[3],  *a4,  a2,  4LL,  (uint64_t)a4);
  if (wireless_diagnostics::google::protobuf::FileDescriptorTables::AddAliasUnderParent( *(float **)(a1 + 88),  a3,  *a4,  4LL,  (uint64_t)a4)
    && (v16 & 1) == 0)
  {
    memset(&v44, 0, sizeof(v44));
    uint64_t v17 = a3[3];
    if (!v17) {
      uint64_t v17 = *(void *)(a1 + 80);
    }
    std::string::operator=(&v44, *(const std::string **)(v17 + 8));
    std::string::size_type v18 = v44.__r_.__value_.__s.__size_;
    if ((v44.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      std::string::size_type v18 = v44.__r_.__value_.__l.__size_;
    }
    if (v18)
    {
      std::operator+<char>();
      uint64_t v19 = std::string::append(&v43, "");
      std::string::size_type v20 = v19->__r_.__value_.__r.__words[0];
      v45.__r_.__value_.__r.__words[0] = v19->__r_.__value_.__l.__size_;
      *(std::string::size_type *)((char *)v45.__r_.__value_.__r.__words + 7) = *(std::string::size_type *)((char *)&v19->__r_.__value_.__r.__words[1] + 7);
      unsigned __int8 v21 = v19->__r_.__value_.__s.__size_;
      v19->__r_.__value_.__l.__size_ = 0LL;
      v19->__r_.__value_.__l.__cap_ = 0LL;
      v19->__r_.__value_.__r.__words[0] = 0LL;
      v44.__r_.__value_.__r.__words[0] = v20;
      v44.__r_.__value_.__l.__size_ = v45.__r_.__value_.__r.__words[0];
      *(std::string::size_type *)((char *)&v44.__r_.__value_.__r.__words[1] + 7) = *(std::string::size_type *)((char *)v45.__r_.__value_.__r.__words + 7);
      v44.__r_.__value_.__s.__size_ = v21;
    }

    else
    {
      MEMORY[0x1895B3A84](&v44, "the global scope");
    }

    uint64_t v22 = a4[1];
    std::operator+<char>();
    uint64_t v23 = std::string::append(&v39, " must be unique within ");
    __int128 v24 = *(_OWORD *)&v23->__r_.__value_.__l.__data_;
    v40.__r_.__value_.__l.__cap_ = v23->__r_.__value_.__l.__cap_;
    *(_OWORD *)&v40.__r_.__value_.__l.__data_ = v24;
    v23->__r_.__value_.__l.__size_ = 0LL;
    v23->__r_.__value_.__l.__cap_ = 0LL;
    v23->__r_.__value_.__r.__words[0] = 0LL;
    if ((v44.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      size_t v25 = &v44;
    }
    else {
      size_t v25 = (std::string *)v44.__r_.__value_.__r.__words[0];
    }
    if ((v44.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      std::string::size_type v26 = v44.__r_.__value_.__s.__size_;
    }
    else {
      std::string::size_type v26 = v44.__r_.__value_.__l.__size_;
    }
    int v27 = std::string::append(&v40, (const std::string::value_type *)v25, v26);
    __int128 v28 = *(_OWORD *)&v27->__r_.__value_.__l.__data_;
    v41.__r_.__value_.__l.__cap_ = v27->__r_.__value_.__l.__cap_;
    *(_OWORD *)&v41.__r_.__value_.__l.__data_ = v28;
    v27->__r_.__value_.__l.__size_ = 0LL;
    v27->__r_.__value_.__l.__cap_ = 0LL;
    v27->__r_.__value_.__r.__words[0] = 0LL;
    uint64_t v29 = std::string::append(&v41, ", not just within ");
    __int128 v30 = *(_OWORD *)&v29->__r_.__value_.__l.__data_;
    v42.__r_.__value_.__l.__cap_ = v29->__r_.__value_.__l.__cap_;
    *(_OWORD *)&v42.__r_.__value_.__l.__data_ = v30;
    v29->__r_.__value_.__l.__size_ = 0LL;
    v29->__r_.__value_.__l.__cap_ = 0LL;
    v29->__r_.__value_.__r.__words[0] = 0LL;
    int v31 = *(char *)(*a3 + 23);
    if (v31 >= 0) {
      int v32 = (const std::string::value_type *)*a3;
    }
    else {
      int v32 = *(const std::string::value_type **)*a3;
    }
    if (v31 >= 0) {
      std::string::size_type v33 = *(unsigned __int8 *)(*a3 + 23);
    }
    else {
      std::string::size_type v33 = *(void *)(*a3 + 8);
    }
    int v34 = std::string::append(&v42, v32, v33);
    __int128 v35 = *(_OWORD *)&v34->__r_.__value_.__l.__data_;
    v45.__r_.__value_.__l.__cap_ = v34->__r_.__value_.__l.__cap_;
    *(_OWORD *)&v45.__r_.__value_.__l.__data_ = v35;
    v34->__r_.__value_.__l.__size_ = 0LL;
    v34->__r_.__value_.__l.__cap_ = 0LL;
    v34->__r_.__value_.__r.__words[0] = 0LL;
    unint64_t v36 = std::string::append(&v45, ".");
    __int128 v37 = *(_OWORD *)&v36->__r_.__value_.__l.__data_;
    v43.__r_.__value_.__l.__cap_ = v36->__r_.__value_.__l.__cap_;
    *(_OWORD *)&v43.__r_.__value_.__l.__data_ = v37;
    v36->__r_.__value_.__l.__size_ = 0LL;
    v36->__r_.__value_.__l.__cap_ = 0LL;
    v36->__r_.__value_.__r.__words[0] = 0LL;
    wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError(a1, v22, a2, 0LL, (uint64_t)&v43);
  }

  return wireless_diagnostics::google::protobuf::FileDescriptorTables::AddEnumValueByNumber( *(void *)(a1 + 88),  (uint64_t)a4);
}

void sub_187C4EED8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21, uint64_t a22, void *a23, uint64_t a24, int a25, __int16 a26, char a27, char a28, uint64_t a29, void *a30, uint64_t a31, int a32, __int16 a33, char a34, char a35, uint64_t a36, void *__p, uint64_t a38, int a39, __int16 a40, char a41, char a42)
{
  if (a42 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t wireless_diagnostics::google::protobuf::FileDescriptorTables::AddAliasUnderParent( float *a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = a5;
  else {
    uint64_t v10 = *(const char **)a3;
  }
  char v11 = *v10;
  if (*v10)
  {
    uint64_t v12 = 0LL;
    uint64_t v13 = (unsigned __int8 *)(v10 + 1);
    do
    {
      uint64_t v12 = 5 * v12 + v11;
      int v14 = *v13++;
      char v11 = v14;
    }

    while (v14);
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  uint64_t v15 = v12 - (void)a2;
  unint64_t v16 = v15 + ((void)a2 << 16);
  unint64_t v17 = *((void *)a1 + 1);
  if (v17)
  {
    uint8x8_t v18 = (uint8x8_t)vcnt_s8((int8x8_t)v17);
    v18.i16[0] = vaddlv_u8(v18);
    unint64_t v19 = v18.u32[0];
    if (v18.u32[0] > 1uLL)
    {
      unint64_t v5 = v15 + ((void)a2 << 16);
      if (v16 >= v17) {
        unint64_t v5 = v16 % v17;
      }
    }

    else
    {
      unint64_t v5 = (v17 - 1) & v16;
    }

    std::string::size_type v20 = *(uint64_t ****)(*(void *)a1 + 8 * v5);
    if (v20)
    {
      unsigned __int8 v21 = *v20;
      if (*v20)
      {
        while (1)
        {
          unint64_t v22 = (unint64_t)v21[1];
          if (v22 == v16)
          {
            if (v21[2] == a2)
            {
              uint64_t result = strcmp((const char *)v21[3], v10);
              if (!(_DWORD)result) {
                return result;
              }
            }
          }

          else
          {
            if (v19 > 1)
            {
              if (v22 >= v17) {
                v22 %= v17;
              }
            }

            else
            {
              v22 &= v17 - 1;
            }

            if (v22 != v5)
            {
LABEL_27:
              uint64_t v6 = a5;
              break;
            }
          }

          unsigned __int8 v21 = (uint64_t **)*v21;
          if (!v21) {
            goto LABEL_27;
          }
        }
      }
    }
  }

  __int128 v24 = operator new(0x30uLL);
  *__int128 v24 = 0LL;
  v24[1] = v16;
  v24[2] = a2;
  v24[3] = v10;
  v24[4] = a4;
  v24[5] = v6;
  float v25 = (float)(unint64_t)(*((void *)a1 + 3) + 1LL);
  float v26 = a1[8];
  if (!v17 || (float)(v26 * (float)v17) < v25)
  {
    BOOL v27 = (v17 & (v17 - 1)) == 0;
    if (v17 < 3) {
      BOOL v27 = 0;
    }
    unint64_t v28 = (2 * v17) | !v27;
    unint64_t v29 = vcvtps_u32_f32(v25 / v26);
    if (v28 <= v29) {
      int8x8_t prime = (int8x8_t)v29;
    }
    else {
      int8x8_t prime = (int8x8_t)v28;
    }
    if (*(void *)&prime == 1LL)
    {
      int8x8_t prime = (int8x8_t)2LL;
    }

    else if ((*(void *)&prime & (*(void *)&prime - 1LL)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v17 = *((void *)a1 + 1);
    }

    if (*(void *)&prime > v17) {
      goto LABEL_40;
    }
    if (*(void *)&prime < v17)
    {
      unint64_t v37 = vcvtps_u32_f32((float)*((unint64_t *)a1 + 3) / a1[8]);
      if (v17 < 3 || (uint8x8_t v38 = (uint8x8_t)vcnt_s8((int8x8_t)v17), v38.i16[0] = vaddlv_u8(v38), v38.u32[0] > 1uLL))
      {
        unint64_t v37 = std::__next_prime(v37);
      }

      else
      {
        uint64_t v39 = 1LL << -(char)__clz(v37 - 1);
        if (v37 >= 2) {
          unint64_t v37 = v39;
        }
      }

      if (*(void *)&prime <= v37) {
        int8x8_t prime = (int8x8_t)v37;
      }
      if (*(void *)&prime >= v17)
      {
        unint64_t v17 = *((void *)a1 + 1);
      }

      else
      {
        if (prime)
        {
LABEL_40:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          int v31 = operator new(8LL * *(void *)&prime);
          int v32 = *(void **)a1;
          *(void *)a1 = v31;
          if (v32) {
            operator delete(v32);
          }
          uint64_t v33 = 0LL;
          *((int8x8_t *)a1 + 1) = prime;
          do
            *(void *)(*(void *)a1 + 8 * v33++) = 0LL;
          while (*(void *)&prime != v33);
          int v34 = (void *)*((void *)a1 + 2);
          if (v34)
          {
            unint64_t v35 = v34[1];
            uint8x8_t v36 = (uint8x8_t)vcnt_s8(prime);
            v36.i16[0] = vaddlv_u8(v36);
            if (v36.u32[0] > 1uLL)
            {
              if (v35 >= *(void *)&prime) {
                v35 %= *(void *)&prime;
              }
            }

            else
            {
              v35 &= *(void *)&prime - 1LL;
            }

            *(void *)(*(void *)a1 + 8 * v35) = a1 + 4;
            std::string v40 = (void *)*v34;
            if (*v34)
            {
              do
              {
                unint64_t v41 = v40[1];
                if (v36.u32[0] > 1uLL)
                {
                  if (v41 >= *(void *)&prime) {
                    v41 %= *(void *)&prime;
                  }
                }

                else
                {
                  v41 &= *(void *)&prime - 1LL;
                }

                if (v41 != v35)
                {
                  if (!*(void *)(*(void *)a1 + 8 * v41))
                  {
                    *(void *)(*(void *)a1 + 8 * v41) = v34;
                    goto LABEL_65;
                  }

                  *int v34 = *v40;
                  void *v40 = **(void **)(*(void *)a1 + 8 * v41);
                  **(void **)(*(void *)a1 + 8 * v41) = v40;
                  std::string v40 = v34;
                }

                unint64_t v41 = v35;
LABEL_65:
                int v34 = v40;
                std::string v40 = (void *)*v40;
                unint64_t v35 = v41;
              }

              while (v40);
            }
          }

          unint64_t v17 = (unint64_t)prime;
          goto LABEL_69;
        }

        std::string v45 = *(void **)a1;
        *(void *)a1 = 0LL;
        if (v45) {
          operator delete(v45);
        }
        unint64_t v17 = 0LL;
        *((void *)a1 + 1) = 0LL;
      }
    }

LABEL_69:
    if ((v17 & (v17 - 1)) != 0)
    {
      if (v16 >= v17) {
        unint64_t v5 = v16 % v17;
      }
      else {
        unint64_t v5 = v16;
      }
    }

    else
    {
      unint64_t v5 = (v17 - 1) & v16;
    }
  }

  uint64_t v42 = *(void **)a1;
  std::string v43 = *(void **)(*(void *)a1 + 8 * v5);
  if (v43)
  {
    *__int128 v24 = *v43;
LABEL_82:
    *std::string v43 = v24;
    goto LABEL_83;
  }

  *__int128 v24 = *((void *)a1 + 2);
  *((void *)a1 + 2) = v24;
  v42[v5] = a1 + 4;
  if (*v24)
  {
    unint64_t v44 = *(void *)(*v24 + 8LL);
    if ((v17 & (v17 - 1)) != 0)
    {
      if (v44 >= v17) {
        v44 %= v17;
      }
    }

    else
    {
      v44 &= v17 - 1;
    }

    std::string v43 = (void *)(*(void *)a1 + 8 * v44);
    goto LABEL_82;
  }

LABEL_83:
  ++*((void *)a1 + 3);
  return 1LL;
}

void sub_187C4F3F0(_Unwind_Exception *a1)
{
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorBuilder::BuildMethod( uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4)
{
  *a4 = (uint64_t)wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateString( *(void **)(a1 + 8),  *(void *)(a2 + 16));
  a4[2] = (uint64_t)a3;
  uint64_t String = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateString(*(void **)(a1 + 8), a3[1]);
  std::string::append(String, 1uLL, 46);
  int v9 = *(char *)(*a4 + 23);
  if (v9 >= 0) {
    uint64_t v10 = (const std::string::value_type *)*a4;
  }
  else {
    uint64_t v10 = *(const std::string::value_type **)*a4;
  }
  if (v9 >= 0) {
    std::string::size_type v11 = *(unsigned __int8 *)(*a4 + 23);
  }
  else {
    std::string::size_type v11 = *(void *)(*a4 + 8);
  }
  std::string::append(String, v10, v11);
  a4[1] = (uint64_t)String;
  wireless_diagnostics::google::protobuf::DescriptorBuilder::ValidateSymbolName( a1,  *(uint64_t **)(a2 + 16),  (uint64_t)String,  a2);
  a4[3] = 0LL;
  a4[4] = 0LL;
  if ((*(_BYTE *)(a2 + 52) & 8) != 0)
  {
    uint64_t v12 = *(wireless_diagnostics::google::protobuf::MessageLite **)(a2 + 40);
    if (!v12) {
      uint64_t v12 = *(wireless_diagnostics::google::protobuf::MessageLite **)(wireless_diagnostics::google::protobuf::MethodDescriptorProto::default_instance_
    }
                                                                    + 40);
    wireless_diagnostics::google::protobuf::DescriptorBuilder::AllocateOptionsImpl<wireless_diagnostics::google::protobuf::MethodDescriptor>( a1,  (__int128 *)a4[1],  (__int128 *)a4[1],  v12,  (uint64_t)a4);
  }

  else
  {
    a4[5] = 0LL;
  }

  return wireless_diagnostics::google::protobuf::DescriptorBuilder::AddSymbol( a1,  (const std::string *)a4[1],  a3,  *a4,  a2,  6LL,  (uint64_t)a4);
}

void wireless_diagnostics::google::protobuf::DescriptorBuilder::CrossLinkMessage( wireless_diagnostics::google::protobuf::DescriptorBuilder *this, wireless_diagnostics::google::protobuf::Descriptor *a2, const wireless_diagnostics::google::protobuf::DescriptorProto *a3, const char *a4)
{
  uint64_t v6 = this;
  if (!*((void *)a2 + 4))
  {
    this = (wireless_diagnostics::google::protobuf::DescriptorBuilder *)wireless_diagnostics::google::protobuf::MessageOptions::default_instance( this,  (uint64_t)a2,  (uint64_t)a3,  a4);
    *((void *)a2 + 4) = this;
  }

  if (*((int *)a2 + 14) >= 1)
  {
    uint64_t v7 = 0LL;
    uint64_t v8 = 0LL;
    do
    {
      this = (wireless_diagnostics::google::protobuf::DescriptorBuilder *)wireless_diagnostics::google::protobuf::DescriptorBuilder::CrossLinkMessage( v6,  (wireless_diagnostics::google::protobuf::Descriptor *)(*((void *)a2 + 8) + v7),  *(const wireless_diagnostics::google::protobuf::DescriptorProto **)(*((void *)a3 + 9) + 8 * v8++));
      v7 += 120LL;
    }

    while (v8 < *((int *)a2 + 14));
  }

  if (*((int *)a2 + 18) >= 1)
  {
    uint64_t v9 = 0LL;
    uint64_t v10 = 0LL;
    do
    {
      this = wireless_diagnostics::google::protobuf::DescriptorBuilder::CrossLinkEnum( this,  (wireless_diagnostics::google::protobuf::EnumDescriptor *)(*((void *)a2 + 10) + v9),  a3,  a4);
      ++v10;
      v9 += 56LL;
    }

    while (v10 < *((int *)a2 + 18));
  }

  if (*((int *)a2 + 11) >= 1)
  {
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    do
    {
      wireless_diagnostics::google::protobuf::DescriptorBuilder::CrossLinkField( v6,  (wireless_diagnostics::google::protobuf::FieldDescriptor *)(*((void *)a2 + 6) + v11),  *(std::string ***)(*((void *)a3 + 3) + 8 * v12++),  a4);
      v11 += 120LL;
    }

    while (v12 < *((int *)a2 + 11));
  }

  if (*((int *)a2 + 26) >= 1)
  {
    uint64_t v13 = 0LL;
    uint64_t v14 = 0LL;
    do
    {
      wireless_diagnostics::google::protobuf::DescriptorBuilder::CrossLinkField( v6,  (wireless_diagnostics::google::protobuf::FieldDescriptor *)(*((void *)a2 + 14) + v13),  *(std::string ***)(*((void *)a3 + 6) + 8 * v14++),  a4);
      v13 += 120LL;
    }

    while (v14 < *((int *)a2 + 26));
  }

void wireless_diagnostics::google::protobuf::DescriptorBuilder::CrossLinkField( wireless_diagnostics::google::protobuf::DescriptorBuilder *this, wireless_diagnostics::google::protobuf::FieldDescriptor *a2, std::string **a3, const char *a4)
{
  uint64_t v105 = *MEMORY[0x1895F89C0];
  if (!*((void *)a2 + 12)) {
    *((void *)a2 + 12) = wireless_diagnostics::google::protobuf::FieldOptions::default_instance( this,  (uint64_t)a2,  (uint64_t)a3,  a4);
  }
  if (((_BYTE)a3[9] & 0x20) != 0)
  {
    int v18 = wireless_diagnostics::google::protobuf::DescriptorBuilder::LookupSymbol( (wireless_diagnostics::google::protobuf::DescriptorPool::Tables **)this,  a3[5],  *((void *)a2 + 1),  2,  0);
    if (v18 != 1)
    {
      if (!v18)
      {
        wireless_diagnostics::google::protobuf::DescriptorBuilder::AddNotDefinedError( (uint64_t)this,  *((void *)a2 + 1),  (uint64_t)a3,  3LL);
        return;
      }

      uint64_t v35 = *((void *)a2 + 1);
      std::operator+<char>();
      uint8x8_t v36 = std::string::append(&v102, " is not a message type.");
      __int128 v37 = *(_OWORD *)&v36->__r_.__value_.__l.__data_;
      std::string::size_type cap = v36->__r_.__value_.__l.__cap_;
      __int128 v103 = v37;
      v36->__r_.__value_.__l.__size_ = 0LL;
      v36->__r_.__value_.__l.__cap_ = 0LL;
      v36->__r_.__value_.__r.__words[0] = 0LL;
      wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)this,  v35,  (uint64_t)a3,  3LL,  (uint64_t)&v103);
      goto LABEL_38;
    }

    *((void *)a2 + 7) = v19;
    float v25 = (wireless_diagnostics::google::protobuf *)*((unsigned int *)a2 + 10);
    unint64_t v26 = *(unsigned int *)(v19 + 88);
    uint64_t v27 = 0LL;
    unint64_t v28 = (_DWORD *)(*(void *)(v19 + 96) + 4LL);
    BOOL v29 = 1;
    do
    {
      BOOL v29 = ++v27 < v26;
      v28 += 2;
    }

    while (v26 != v27);
    if (!v29)
    {
LABEL_31:
      uint64_t v30 = *((void *)a2 + 1);
      int v31 = *(uint64_t ***)(v19 + 8);
      int v32 = *((char *)v31 + 23);
      uint64_t v33 = v31[1];
      if (v32 < 0) {
        int v31 = (uint64_t **)*v31;
      }
      *(void *)&__int128 v103 = v31;
      int v34 = v32;
      if (v32 < 0) {
        int v34 = (int)v33;
      }
      DWORD2(v103) = v34;
      v102.__r_.__value_.__r.__words[0] = (std::string::size_type)wireless_diagnostics::google::protobuf::FastInt32ToBuffer( v25,  &v102.__r_.__value_.__s.__data_[12],  v20);
      LODWORD(v102.__r_.__value_.__r.__words[1]) = strlen(v102.__r_.__value_.__l.__data_);
      v101.__r_.__value_.__r.__words[0] = 0LL;
      LODWORD(v101.__r_.__value_.__r.__words[1]) = -1;
      v100.__r_.__value_.__r.__words[0] = 0LL;
      LODWORD(v100.__r_.__value_.__r.__words[1]) = -1;
      uint64_t v98 = 0LL;
      int v99 = -1;
      uint64_t v96 = 0LL;
      int v97 = -1;
      uint64_t v94 = 0LL;
      int v95 = -1;
      uint64_t v92 = 0LL;
      int v93 = -1;
      uint64_t v90 = 0LL;
      int v91 = -1;
      uint64_t v88 = 0LL;
      int v89 = -1;
      *(void *)&__int128 v84 = &v92;
      *((void *)&v84 + 1) = &v90;
      wireless_diagnostics::google::protobuf::strings::Substitute( "$0 does not declare $1 as an extension number.",  (uint64_t)&v103,  (uint64_t)&v102,  (uint64_t)&v101,  (uint64_t)&v100,  (uint64_t)&v98,  (uint64_t)&v96,  (uint64_t)&v94,  &__p,  v84,  (uint64_t)&v88);
      wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)this,  v30,  (uint64_t)a3,  1LL,  (uint64_t)&__p);
    }
  }

  unsigned int v7 = *((_DWORD *)a3 + 18);
  if ((v7 & 0x10) != 0)
  {
    int v21 = (v7 >> 6) & 1;
    if (*((_DWORD *)a3 + 16) == 14) {
      int v22 = 1;
    }
    else {
      int v22 = v21;
    }
    int v23 = wireless_diagnostics::google::protobuf::DescriptorBuilder::LookupSymbol( (wireless_diagnostics::google::protobuf::DescriptorPool::Tables **)this,  a3[4],  *((void *)a2 + 1),  v22,  1);
    if (!v23)
    {
      wireless_diagnostics::google::protobuf::DescriptorBuilder::AddNotDefinedError( (uint64_t)this,  *((void *)a2 + 1),  (uint64_t)a3,  2LL);
      return;
    }

    if (((_BYTE)a3[9] & 8) != 0)
    {
      int v38 = wireless_diagnostics::google::protobuf::FieldDescriptor::kTypeToCppTypeMap[*((unsigned int *)a2 + 11)];
      if (v38 == 8)
      {
        if (v23 == 3)
        {
LABEL_95:
          *((void *)a2 + 10) = v24;
          if (*(_BYTE *)(v24 + 40))
          {
            *((_BYTE *)a2 + 104) = 0;
          }

          else if (*((_BYTE *)a2 + 104))
          {
            if (wireless_diagnostics::google::protobuf::DescriptorBuilder::LookupSymbolNoPlaceholder( (uint64_t)this,  a3[6],  *(void *)(v24 + 8),  0) == 4 && *(void *)(v68 + 24) == *((void *)a2 + 10))
            {
              *((void *)a2 + 14) = v68;
              goto LABEL_10;
            }

            uint64_t v69 = *((void *)a2 + 1);
            std::operator+<char>();
            int v70 = std::string::append(&v100, " has no value named ");
            __int128 v71 = *(_OWORD *)&v70->__r_.__value_.__l.__data_;
            v101.__r_.__value_.__l.__cap_ = v70->__r_.__value_.__l.__cap_;
            *(_OWORD *)&v101.__r_.__value_.__l.__data_ = v71;
            v70->__r_.__value_.__l.__size_ = 0LL;
            v70->__r_.__value_.__l.__cap_ = 0LL;
            v70->__r_.__value_.__r.__words[0] = 0LL;
            uint64_t v72 = a3[6];
            int size = (char)v72->__r_.__value_.__s.__size_;
            if (size >= 0) {
              uint64_t v74 = (const std::string::value_type *)a3[6];
            }
            else {
              uint64_t v74 = (const std::string::value_type *)v72->__r_.__value_.__r.__words[0];
            }
            if (size >= 0) {
              std::string::size_type v75 = v72->__r_.__value_.__s.__size_;
            }
            else {
              std::string::size_type v75 = v72->__r_.__value_.__l.__size_;
            }
            uint64_t v76 = std::string::append(&v101, v74, v75);
            __int128 v77 = *(_OWORD *)&v76->__r_.__value_.__l.__data_;
            v102.__r_.__value_.__l.__cap_ = v76->__r_.__value_.__l.__cap_;
            *(_OWORD *)&v102.__r_.__value_.__l.__data_ = v77;
            v76->__r_.__value_.__l.__size_ = 0LL;
            v76->__r_.__value_.__l.__cap_ = 0LL;
            v76->__r_.__value_.__r.__words[0] = 0LL;
            int v78 = std::string::append(&v102, ".");
            __int128 v79 = *(_OWORD *)&v78->__r_.__value_.__l.__data_;
            std::string::size_type cap = v78->__r_.__value_.__l.__cap_;
            __int128 v103 = v79;
            v78->__r_.__value_.__l.__size_ = 0LL;
            v78->__r_.__value_.__l.__cap_ = 0LL;
            v78->__r_.__value_.__r.__words[0] = 0LL;
            wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)this,  v69,  (uint64_t)a3,  4LL,  (uint64_t)&v103);
            if (SHIBYTE(cap) < 0) {
              operator delete((void *)v103);
            }
            uint64_t v9 = (void *)v100.__r_.__value_.__r.__words[0];
            goto LABEL_9;
          }

          goto LABEL_10;
        }

        uint64_t v80 = *((void *)a2 + 1);
        std::operator+<char>();
        int v81 = std::string::append(&v102, " is not an enum type.");
        __int128 v82 = *(_OWORD *)&v81->__r_.__value_.__l.__data_;
        std::string::size_type cap = v81->__r_.__value_.__l.__cap_;
        __int128 v103 = v82;
        v81->__r_.__value_.__l.__size_ = 0LL;
        v81->__r_.__value_.__l.__cap_ = 0LL;
        v81->__r_.__value_.__r.__words[0] = 0LL;
        wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)this,  v80,  (uint64_t)a3,  2LL,  (uint64_t)&v103);
LABEL_38:
        if (SHIBYTE(cap) < 0) {
          operator delete((void *)v103);
        }
        return;
      }

      if (v38 != 10)
      {
        uint64_t v67 = *((void *)a2 + 1);
        std::string::basic_string[abi:ne180100]<0>(&v103, "Field with primitive type has type_name.");
        wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)this,  v67,  (uint64_t)a3,  2LL,  (uint64_t)&v103);
        goto LABEL_7;
      }

      if (v23 != 1)
      {
        uint64_t v39 = *((void *)a2 + 1);
        std::operator+<char>();
        std::string v40 = std::string::append(&v102, " is not a message type.");
        __int128 v41 = *(_OWORD *)&v40->__r_.__value_.__l.__data_;
        std::string::size_type cap = v40->__r_.__value_.__l.__cap_;
        __int128 v103 = v41;
        v40->__r_.__value_.__l.__size_ = 0LL;
        v40->__r_.__value_.__l.__cap_ = 0LL;
        v40->__r_.__value_.__r.__words[0] = 0LL;
        wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)this,  v39,  (uint64_t)a3,  2LL,  (uint64_t)&v103);
        goto LABEL_38;
      }
    }

    else
    {
      if (v23 != 1)
      {
        if (v23 == 3)
        {
          *((_DWORD *)a2 + 11) = 14;
          goto LABEL_95;
        }

        uint64_t v64 = *((void *)a2 + 1);
        std::operator+<char>();
        __int128 v65 = std::string::append(&v102, " is not a type.");
        __int128 v66 = *(_OWORD *)&v65->__r_.__value_.__l.__data_;
        std::string::size_type cap = v65->__r_.__value_.__l.__cap_;
        __int128 v103 = v66;
        v65->__r_.__value_.__l.__size_ = 0LL;
        v65->__r_.__value_.__l.__cap_ = 0LL;
        v65->__r_.__value_.__r.__words[0] = 0LL;
        wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)this,  v64,  (uint64_t)a3,  2LL,  (uint64_t)&v103);
        goto LABEL_38;
      }

      *((_DWORD *)a2 + 11) = 11;
    }

    *((void *)a2 + 9) = v24;
    if (!*((_BYTE *)a2 + 104)) {
      goto LABEL_10;
    }
    uint64_t v63 = *((void *)a2 + 1);
    std::string::basic_string[abi:ne180100]<0>(&v103, "Messages can't have default values.");
    wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)this,  v63,  (uint64_t)a3,  4LL,  (uint64_t)&v103);
    goto LABEL_7;
  }

  uint64_t v8 = *((void *)a2 + 1);
  std::string::basic_string[abi:ne180100]<0>(&v103, "Field with message or enum type missing type_name.");
  wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)this,  v8,  (uint64_t)a3,  2LL,  (uint64_t)&v103);
LABEL_7:
  if (SHIBYTE(cap) < 0)
  {
    uint64_t v9 = (void *)v103;
LABEL_9:
    operator delete(v9);
  }

LABEL_10:
  if ((wireless_diagnostics::google::protobuf::FileDescriptorTables::AddFieldByNumber( *((void *)this + 11),  (uint64_t)a2) & 1) == 0)
  {
    uint64_t v11 = (int8x8_t *)*((void *)this + 11);
    uint64_t v12 = (wireless_diagnostics::google::protobuf *)*((int *)a2 + 10);
    int8x8_t v13 = v11[16];
    if (v13)
    {
      uint64_t v14 = *((void *)a2 + 7);
      unint64_t v15 = (unint64_t)v12 + 0x10000 * v14 - v14;
      uint8x8_t v16 = (uint8x8_t)vcnt_s8(v13);
      v16.i16[0] = vaddlv_u8(v16);
      if (v16.u32[0] > 1uLL)
      {
        unint64_t v17 = (unint64_t)v12 + 0x10000 * v14 - v14;
        if (v15 >= *(void *)&v13) {
          unint64_t v17 = v15 % *(void *)&v13;
        }
      }

      else
      {
        unint64_t v17 = (*(void *)&v13 - 1LL) & v15;
      }

      uint64_t v42 = *(uint64_t ***)(*(void *)&v11[15] + 8 * v17);
      if (v42)
      {
        for (uint64_t i = *v42; i; uint64_t i = (uint64_t *)*i)
        {
          unint64_t v44 = (char *)i[1];
          if ((char *)v15 == v44)
          {
            if (i[2] == v14 && *((_DWORD *)i + 6) == (_DWORD)v12)
            {
              int v83 = (std::string::size_type *)i[4];
              goto LABEL_65;
            }
          }

          else
          {
            if (v16.u32[0] > 1uLL)
            {
            }

            else
            {
              unint64_t v44 = (char *)((unint64_t)v44 & (*(void *)&v13 - 1LL));
            }
          }
        }
      }
    }

    int v83 = 0LL;
LABEL_65:
    uint64_t v46 = *((void *)a2 + 1);
    if (*((_BYTE *)a2 + 52))
    {
      *(void *)&__int128 v103 = wireless_diagnostics::google::protobuf::FastInt32ToBuffer(v12, (_BYTE *)&v103 + 12, v10);
      DWORD2(v103) = strlen((const char *)v103);
      std::string::size_type v47 = *(void *)(*((void *)a2 + 7) + 8LL);
      int v48 = *(char *)(v47 + 23);
      uint64_t v49 = *(void *)(v47 + 8);
      if (v48 < 0) {
        std::string::size_type v47 = *(void *)v47;
      }
      v102.__r_.__value_.__r.__words[0] = v47;
      int v50 = v48;
      if (v48 < 0) {
        int v50 = v49;
      }
      LODWORD(v102.__r_.__value_.__r.__words[1]) = v50;
      std::string::size_type v51 = v83[1];
      int v52 = *(char *)(v51 + 23);
      uint64_t v53 = *(void *)(v51 + 8);
      if (v52 < 0) {
        std::string::size_type v51 = *(void *)v51;
      }
      v101.__r_.__value_.__r.__words[0] = v51;
      int v54 = v52;
      if (v52 < 0) {
        int v54 = v53;
      }
      LODWORD(v101.__r_.__value_.__r.__words[1]) = v54;
      v100.__r_.__value_.__r.__words[0] = 0LL;
      LODWORD(v100.__r_.__value_.__r.__words[1]) = -1;
      uint64_t v98 = 0LL;
      int v99 = -1;
      uint64_t v96 = 0LL;
      int v97 = -1;
      uint64_t v94 = 0LL;
      int v95 = -1;
      uint64_t v92 = 0LL;
      int v93 = -1;
      uint64_t v90 = 0LL;
      int v91 = -1;
      uint64_t v88 = 0LL;
      int v89 = -1;
      *(void *)&__int128 v85 = &v92;
      *((void *)&v85 + 1) = &v90;
      wireless_diagnostics::google::protobuf::strings::Substitute( "Extension number $0 has already been used in $1 by extension $2.",  (uint64_t)&v103,  (uint64_t)&v102,  (uint64_t)&v101,  (uint64_t)&v100,  (uint64_t)&v98,  (uint64_t)&v96,  (uint64_t)&v94,  &__p,  v85,  (uint64_t)&v88);
      wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)this,  v46,  (uint64_t)a3,  1LL,  (uint64_t)&__p);
    }

    else
    {
      *(void *)&__int128 v103 = wireless_diagnostics::google::protobuf::FastInt32ToBuffer(v12, (_BYTE *)&v103 + 12, v10);
      DWORD2(v103) = strlen((const char *)v103);
      std::string::size_type v55 = *(void *)(*((void *)a2 + 7) + 8LL);
      int v56 = *(char *)(v55 + 23);
      uint64_t v57 = *(void *)(v55 + 8);
      if (v56 < 0) {
        std::string::size_type v55 = *(void *)v55;
      }
      v102.__r_.__value_.__r.__words[0] = v55;
      int v58 = v56;
      if (v56 < 0) {
        int v58 = v57;
      }
      LODWORD(v102.__r_.__value_.__r.__words[1]) = v58;
      std::string::size_type v59 = *v83;
      int v60 = *(char *)(*v83 + 23);
      uint64_t v61 = *(void *)(*v83 + 8);
      if (v60 < 0) {
        std::string::size_type v59 = *(void *)*v83;
      }
      v101.__r_.__value_.__r.__words[0] = v59;
      int v62 = v60;
      if (v60 < 0) {
        int v62 = v61;
      }
      LODWORD(v101.__r_.__value_.__r.__words[1]) = v62;
      v100.__r_.__value_.__r.__words[0] = 0LL;
      LODWORD(v100.__r_.__value_.__r.__words[1]) = -1;
      uint64_t v98 = 0LL;
      int v99 = -1;
      uint64_t v96 = 0LL;
      int v97 = -1;
      uint64_t v94 = 0LL;
      int v95 = -1;
      uint64_t v92 = 0LL;
      int v93 = -1;
      uint64_t v90 = 0LL;
      int v91 = -1;
      uint64_t v88 = 0LL;
      int v89 = -1;
      *(void *)&__int128 v86 = &v92;
      *((void *)&v86 + 1) = &v90;
      wireless_diagnostics::google::protobuf::strings::Substitute( "Field number $0 has already been used in $1 by field $2.",  (uint64_t)&v103,  (uint64_t)&v102,  (uint64_t)&v101,  (uint64_t)&v100,  (uint64_t)&v98,  (uint64_t)&v96,  (uint64_t)&v94,  &__p,  v86,  (uint64_t)&v88);
      wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)this,  v46,  (uint64_t)a3,  1LL,  (uint64_t)&__p);
    }
  }

  if (*((_BYTE *)a2 + 52)) {
    wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AddExtension(*((uint64_t ***)this + 1), a2);
  }
  wireless_diagnostics::google::protobuf::FileDescriptorTables::AddFieldByStylizedNames( *((wireless_diagnostics::google::protobuf::FileDescriptorTables **)this + 11),  a2);
}

  *a2 = v8;
  return v5;
}

  *(_WORD *)a2 = *(_WORD *)&wireless_diagnostics::google::protobuf::two_ASCII_digits[2 * (int)this];
  unsigned int v7 = a2 + 2;
LABEL_11:
  *unsigned int v7 = 0;
  return v7;
}

void sub_187C4FFD8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
}

wireless_diagnostics::google::protobuf::EnumOptions *wireless_diagnostics::google::protobuf::DescriptorBuilder::CrossLinkEnum( wireless_diagnostics::google::protobuf::EnumOptions *this, wireless_diagnostics::google::protobuf::EnumDescriptor *a2, const wireless_diagnostics::google::protobuf::EnumDescriptorProto *a3, const char *a4)
{
  if (!*((void *)a2 + 4))
  {
    this = (wireless_diagnostics::google::protobuf::EnumOptions *)wireless_diagnostics::google::protobuf::EnumOptions::default_instance( this,  (uint64_t)a2,  (uint64_t)a3,  a4);
    *((void *)a2 + 4) = this;
  }

  int v5 = *((_DWORD *)a2 + 11);
  if (v5 >= 1)
  {
    uint64_t v6 = 0LL;
    uint64_t v7 = 32LL;
    do
    {
      uint64_t v8 = *((void *)a2 + 6);
      if (!*(void *)(v8 + v7))
      {
        this = (wireless_diagnostics::google::protobuf::EnumOptions *)wireless_diagnostics::google::protobuf::EnumValueOptions::default_instance( this,  (uint64_t)a2,  (uint64_t)a3,  a4);
        *(void *)(v8 + v7) = this;
        int v5 = *((_DWORD *)a2 + 11);
      }

      ++v6;
      v7 += 40LL;
    }

    while (v6 < v5);
  }

  return this;
}

void wireless_diagnostics::google::protobuf::DescriptorBuilder::CrossLinkService( wireless_diagnostics::google::protobuf::DescriptorBuilder *this, wireless_diagnostics::google::protobuf::ServiceDescriptor *a2, const wireless_diagnostics::google::protobuf::ServiceDescriptorProto *a3, const char *a4)
{
  if (!*((void *)a2 + 3)) {
    *((void *)a2 + 3) = wireless_diagnostics::google::protobuf::ServiceOptions::default_instance( this,  (uint64_t)a2,  (uint64_t)a3,  a4);
  }
  if (*((int *)a2 + 8) >= 1)
  {
    uint64_t v7 = 0LL;
    uint64_t v8 = 0LL;
    do
    {
      wireless_diagnostics::google::protobuf::DescriptorBuilder::CrossLinkMethod( this,  (wireless_diagnostics::google::protobuf::MethodDescriptor *)(*((void *)a2 + 5) + v7),  *(std::string ***)(*((void *)a3 + 3) + 8 * v8++),  a4);
      v7 += 48LL;
    }

    while (v8 < *((int *)a2 + 8));
  }

unint64_t wireless_diagnostics::google::protobuf::DescriptorBuilder::LookupSymbol( wireless_diagnostics::google::protobuf::DescriptorPool::Tables **a1, std::string *a2, uint64_t a3, int a4, int a5)
{
  uint64_t v8 = wireless_diagnostics::google::protobuf::DescriptorBuilder::LookupSymbolNoPlaceholder((uint64_t)a1, a2, a3, a5);
  if ((_DWORD)v8) {
    goto LABEL_61;
  }
  if (*((_BYTE *)*a1 + 41))
  {
    if ((wireless_diagnostics::google::protobuf::DescriptorBuilder::ValidateQualifiedName(v8, (uint64_t *)a2) & 1) == 0)
    {
LABEL_60:
      uint64_t v8 = v14 | v13;
LABEL_61:
      unsigned int v12 = v8;
      return v8 & 0xFFFFFFFF00000000LL | v12;
    }

    if ((a2->__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v9 = a2;
    }
    else {
      uint64_t v9 = (std::string *)a2->__r_.__value_.__r.__words[0];
    }
    uint64_t v10 = a1[1];
    if (v9->__r_.__value_.__s.__data_[0] == 46)
    {
      std::string::basic_string(&__p, a2, 1uLL, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v57);
      uint64_t String = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateString(v10, (uint64_t)&__p);
    }

    else
    {
      uint64_t String = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateString(a1[1], (uint64_t)a2);
    }

    std::string::size_type v15 = std::string::rfind(String, 46, 0xFFFFFFFFFFFFFFFFLL);
    if (v15 == -1LL)
    {
      std::string::size_type v20 = String;
    }

    else
    {
      std::string::size_type v16 = v15;
      uint64_t v17 = a1[1];
      std::string::basic_string(&__p, String, 0LL, v15, (std::allocator<char> *)&v57);
      int v18 = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateString(v17, (uint64_t)&__p);
      uint64_t v19 = a1[1];
      std::string::basic_string(&__p, String, v16 + 1, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v57);
      std::string::size_type v20 = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateString(v19, (uint64_t)&__p);
    }

    Bytes = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateBytes(a1[1], 160);
    _OWORD *Bytes = 0u;
    Bytes[1] = 0u;
    Bytes[2] = 0u;
    Bytes[3] = 0u;
    Bytes[4] = 0u;
    Bytes[5] = 0u;
    Bytes[6] = 0u;
    Bytes[7] = 0u;
    Bytes[8] = 0u;
    Bytes[9] = 0u;
    *((void *)Bytes + 19) = wireless_diagnostics::google::protobuf::SourceCodeInfo::default_instance( (wireless_diagnostics::google::protobuf::SourceCodeInfo *)Bytes,  v22,  v23,  v24);
    float v25 = a1[1];
    if ((String->__r_.__value_.__s.__size_ & 0x80u) == 0) {
      size_t size = String->__r_.__value_.__s.__size_;
    }
    else {
      size_t size = String->__r_.__value_.__l.__size_;
    }
    p_p = &__p;
    std::string::basic_string[abi:ne180100]((uint64_t)&__p, size + 18);
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if (size)
    {
      if ((String->__r_.__value_.__s.__size_ & 0x80u) == 0) {
        unint64_t v28 = String;
      }
      else {
        unint64_t v28 = (std::string *)String->__r_.__value_.__r.__words[0];
      }
      memmove(p_p, v28, size);
    }

    strcpy((char *)p_p + size, ".placeholder.proto");
    BOOL v29 = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateString(v25, (uint64_t)&__p);
    *(void *)Bytes = v29;
    *((void *)Bytes + 1) = v18;
    *((void *)Bytes + 2) = *a1;
    *((void *)Bytes + 17) = wireless_diagnostics::google::protobuf::FileOptions::default_instance( (wireless_diagnostics::google::protobuf::FileOptions *)v29,  v30,  v31,  v32);
    *((void *)Bytes + 18) = &wireless_diagnostics::google::protobuf::FileDescriptorTables::kEmpty;
    if (a4 != 1)
    {
      uint64_t v14 = 1LL;
      *((_DWORD *)Bytes + 18) = 1;
      int v48 = (char *)wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateBytes(a1[1], 120);
      *((void *)Bytes + 10) = v48;
      *(_OWORD *)(v48 + 24) = 0u;
      *(_OWORD *)(v48 + 40) = 0u;
      *(_OWORD *)(v48 + 56) = 0u;
      *(_OWORD *)(v48 + 72) = 0u;
      *(_OWORD *)(v48 + 88) = 0u;
      *(_OWORD *)(v48 + 104) = 0u;
      *(void *)int v48 = v20;
      *((void *)v48 + 1) = String;
      *((void *)v48 + 2) = Bytes;
      *((void *)v48 + 4) = wireless_diagnostics::google::protobuf::MessageOptions::default_instance( (wireless_diagnostics::google::protobuf::MessageOptions *)v48,  v49,  v50,  v51);
      v48[40] = 1;
      if ((a2->__r_.__value_.__s.__size_ & 0x80u) == 0) {
        int v52 = a2;
      }
      else {
        int v52 = (std::string *)a2->__r_.__value_.__r.__words[0];
      }
      v48[41] = v52->__r_.__value_.__s.__data_[0] != 46;
      if (a4 == 2)
      {
        *((_DWORD *)v48 + 22) = 1;
        uint64_t v53 = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateBytes(a1[1], 8);
        unint64_t v13 = 0LL;
        *((void *)v48 + 12) = v53;
        *uint64_t v53 = 0x2000000000000001LL;
      }

      else
      {
        unint64_t v13 = 0LL;
      }

      goto LABEL_60;
    }

    *((_DWORD *)Bytes + 22) = 1;
    uint64_t v33 = (char *)wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateBytes(a1[1], 56);
    *((void *)Bytes + 12) = v33;
    *(_OWORD *)(v33 + 24) = 0u;
    *(_OWORD *)(v33 + 40) = 0u;
    *(void *)uint64_t v33 = v20;
    *((void *)v33 + 1) = String;
    *((void *)v33 + 2) = Bytes;
    *((void *)v33 + 4) = wireless_diagnostics::google::protobuf::EnumOptions::default_instance( (wireless_diagnostics::google::protobuf::EnumOptions *)v33,  v34,  v35,  v36);
    v33[40] = 1;
    if ((a2->__r_.__value_.__s.__size_ & 0x80u) == 0) {
      __int128 v37 = a2;
    }
    else {
      __int128 v37 = (std::string *)a2->__r_.__value_.__r.__words[0];
    }
    v33[41] = v37->__r_.__value_.__s.__data_[0] != 46;
    *((_DWORD *)v33 + 11) = 1;
    int v38 = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateBytes(a1[1], 40);
    *((void *)v33 + 6) = v38;
    *int v38 = 0u;
    v38[1] = 0u;
    *((void *)v38 + 4) = 0LL;
    uint64_t v39 = a1[1];
    std::string::basic_string[abi:ne180100]<0>(&__p, "PLACEHOLDER_VALUE");
    std::string v40 = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateString(v39, (uint64_t)&__p);
    *(void *)int v38 = v40;
    if ((char)v18->__r_.__value_.__s.__size_ < 0)
    {
      if (v18->__r_.__value_.__l.__size_) {
        goto LABEL_39;
      }
    }

    else if (v18->__r_.__value_.__s.__size_)
    {
LABEL_39:
      unint64_t v44 = a1[1];
      if ((v18->__r_.__value_.__s.__size_ & 0x80u) == 0) {
        size_t v45 = v18->__r_.__value_.__s.__size_;
      }
      else {
        size_t v45 = v18->__r_.__value_.__l.__size_;
      }
      uint64_t v46 = &__p;
      std::string::basic_string[abi:ne180100]((uint64_t)&__p, v45 + 18);
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) != 0) {
        uint64_t v46 = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      if (v45)
      {
        if ((v18->__r_.__value_.__s.__size_ & 0x80u) == 0) {
          std::string::size_type v47 = v18;
        }
        else {
          std::string::size_type v47 = (std::string *)v18->__r_.__value_.__r.__words[0];
        }
        memmove(v46, v47, v45);
      }

      strcpy((char *)v46 + v45, ".PLACEHOLDER_VALUE");
      std::string v40 = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateString(v44, (uint64_t)&__p);
      *((void *)v38 + 1) = v40;
      goto LABEL_59;
    }

    *((void *)v38 + 1) = *(void *)v38;
LABEL_59:
    *((_DWORD *)v38 + 4) = 0;
    *((void *)v38 + 3) = v33;
    uint64_t v54 = wireless_diagnostics::google::protobuf::EnumValueOptions::default_instance( (wireless_diagnostics::google::protobuf::EnumValueOptions *)v40,  v41,  v42,  v43);
    unint64_t v13 = 0LL;
    *((void *)v38 + 4) = v54;
    uint64_t v14 = 3LL;
    goto LABEL_60;
  }

  unsigned int v12 = 0;
  return v8 & 0xFFFFFFFF00000000LL | v12;
}

void sub_187C50684( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorBuilder::LookupSymbolNoPlaceholder( uint64_t a1, std::string *__str, uint64_t a3, int a4)
{
  *(void *)(a1 + 120) = 0LL;
  if ((char)__str->__r_.__value_.__s.__size_ < 0)
  {
    if (!__str->__r_.__value_.__l.__size_) {
      goto LABEL_8;
    }
    uint64_t v8 = (std::string *)__str->__r_.__value_.__r.__words[0];
  }

  else
  {
    uint64_t v8 = __str;
    if (!__str->__r_.__value_.__s.__size_) {
      goto LABEL_8;
    }
  }

  if (v8->__r_.__value_.__s.__data_[0] == 46)
  {
    std::string::basic_string(&v21, __str, 1uLL, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&__p);
    uint64_t Symbol = wireless_diagnostics::google::protobuf::DescriptorBuilder::FindSymbol(a1, &v21);
    goto LABEL_42;
  }

LABEL_8:
  std::string::size_type v10 = std::string::find(__str, 46, 0LL);
  memset(&v21, 0, sizeof(v21));
  if (v10 == -1LL)
  {
    std::string::operator=(&v21, __str);
  }

  else
  {
    std::string::basic_string(&__p, __str, 0LL, v10, (std::allocator<char> *)&v22);
    std::string v21 = __p;
  }

  else {
    std::string __p = *(std::string *)a3;
  }
  while (1)
  {
    std::string::size_type v11 = std::string::rfind(&__p, 46, 0xFFFFFFFFFFFFFFFFLL);
    if (v11 == -1LL) {
      break;
    }
    std::string::erase(&__p, v11, 0xFFFFFFFFFFFFFFFFLL);
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      std::string::size_type size = __p.__r_.__value_.__s.__size_;
    }
    else {
      std::string::size_type size = __p.__r_.__value_.__l.__size_;
    }
    std::string::append(&__p, 1uLL, 46);
    if ((v21.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      unint64_t v13 = &v21;
    }
    else {
      unint64_t v13 = (std::string *)v21.__r_.__value_.__r.__words[0];
    }
    if ((v21.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      std::string::size_type v14 = v21.__r_.__value_.__s.__size_;
    }
    else {
      std::string::size_type v14 = v21.__r_.__value_.__l.__size_;
    }
    std::string::append(&__p, (const std::string::value_type *)v13, v14);
    uint64_t v15 = wireless_diagnostics::google::protobuf::DescriptorBuilder::FindSymbol(a1, &__p);
    uint64_t Symbol = v15;
    if ((_DWORD)v15)
    {
      if ((v21.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        std::string::size_type v16 = v21.__r_.__value_.__s.__size_;
      }
      else {
        std::string::size_type v16 = v21.__r_.__value_.__l.__size_;
      }
      std::string::size_type v17 = __str->__r_.__value_.__s.__size_;
      if ((v17 & 0x80u) != 0LL) {
        std::string::size_type v17 = __str->__r_.__value_.__l.__size_;
      }
      if (v17 <= v16)
      {
        if (a4 != 1 || (v15 & 0xFFFFFFFD) == 1) {
          goto LABEL_40;
        }
      }

      else if ((((_DWORD)v15 - 1) & 0xFFFFFFF9) == 0)
      {
        std::string::append(&__p, __str, v16, v17 - v16);
        uint64_t v18 = wireless_diagnostics::google::protobuf::DescriptorBuilder::FindSymbol(a1, &__p);
        goto LABEL_39;
      }
    }

    std::string::erase(&__p, size, 0xFFFFFFFFFFFFFFFFLL);
  }

  uint64_t v18 = wireless_diagnostics::google::protobuf::DescriptorBuilder::FindSymbol(a1, __str);
LABEL_39:
  uint64_t Symbol = v18;
LABEL_40:
LABEL_42:
  return Symbol;
}

      uint64_t v6 = this / 0x64uLL;
      *(_WORD *)a2 = *(_WORD *)&wireless_diagnostics::google::protobuf::two_ASCII_digits[2 * v6];
      a2 += 2;
LABEL_9:
      LODWORD(wireless_diagnostics::google::protobuf::DescriptorPool::Tables::CheckPoint::CheckPoint(v18, this) = (_DWORD)this - 100 * v6;
      goto LABEL_10;
    }

    if (this < 0xF4240)
    {
      if (this >> 5 <= 0xC34)
      {
        LODWORD(v5) = this / 0x2710;
        *a2++ = this / 0x2710 + 48;
        goto LABEL_7;
      }

void sub_187C50934( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  _Unwind_Resume(exception_object);
}

wireless_diagnostics::google::protobuf::EnumValueOptions *wireless_diagnostics::google::protobuf::DescriptorBuilder::CrossLinkEnumValue( wireless_diagnostics::google::protobuf::EnumValueOptions *this, wireless_diagnostics::google::protobuf::EnumValueDescriptor *a2, const wireless_diagnostics::google::protobuf::EnumValueDescriptorProto *a3, const char *a4)
{
  if (!*((void *)a2 + 4))
  {
    this = (wireless_diagnostics::google::protobuf::EnumValueOptions *)wireless_diagnostics::google::protobuf::EnumValueOptions::default_instance( this,  (uint64_t)a2,  (uint64_t)a3,  a4);
    *((void *)a2 + 4) = this;
  }

  return this;
}

void wireless_diagnostics::google::protobuf::DescriptorBuilder::CrossLinkMethod( wireless_diagnostics::google::protobuf::DescriptorBuilder *this, wireless_diagnostics::google::protobuf::MethodDescriptor *a2, std::string **a3, const char *a4)
{
  if (!*((void *)a2 + 5)) {
    *((void *)a2 + 5) = wireless_diagnostics::google::protobuf::MethodOptions::default_instance( this,  (uint64_t)a2,  (uint64_t)a3,  a4);
  }
  int v7 = wireless_diagnostics::google::protobuf::DescriptorBuilder::LookupSymbol( (wireless_diagnostics::google::protobuf::DescriptorPool::Tables **)this,  a3[3],  *((void *)a2 + 1),  0,  0);
  if (v7 == 1)
  {
    *((void *)a2 + 3) = v8;
  }

  else if (v7)
  {
    uint64_t v9 = *((void *)a2 + 1);
    std::operator+<char>();
    std::string::size_type v10 = std::string::append(&v17, " is not a message type.");
    __int128 v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
    std::string::size_type cap = v10->__r_.__value_.__l.__cap_;
    *(_OWORD *)std::string __p = v11;
    v10->__r_.__value_.__l.__size_ = 0LL;
    v10->__r_.__value_.__l.__cap_ = 0LL;
    v10->__r_.__value_.__r.__words[0] = 0LL;
    wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)this,  v9,  (uint64_t)a3,  5LL,  (uint64_t)__p);
    if (SHIBYTE(cap) < 0) {
      operator delete(__p[0]);
    }
  }

  else
  {
    wireless_diagnostics::google::protobuf::DescriptorBuilder::AddNotDefinedError( (uint64_t)this,  *((void *)a2 + 1),  (uint64_t)a3,  5LL);
  }

  int v12 = wireless_diagnostics::google::protobuf::DescriptorBuilder::LookupSymbol( (wireless_diagnostics::google::protobuf::DescriptorPool::Tables **)this,  a3[4],  *((void *)a2 + 1),  0,  0);
  if (v12 == 1)
  {
    *((void *)a2 + 4) = v13;
  }

  else if (v12)
  {
    uint64_t v14 = *((void *)a2 + 1);
    std::operator+<char>();
    uint64_t v15 = std::string::append(&v17, " is not a message type.");
    __int128 v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
    std::string::size_type cap = v15->__r_.__value_.__l.__cap_;
    *(_OWORD *)std::string __p = v16;
    v15->__r_.__value_.__l.__size_ = 0LL;
    v15->__r_.__value_.__l.__cap_ = 0LL;
    v15->__r_.__value_.__r.__words[0] = 0LL;
    wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)this,  v14,  (uint64_t)a3,  6LL,  (uint64_t)__p);
    if (SHIBYTE(cap) < 0) {
      operator delete(__p[0]);
    }
  }

  else
  {
    wireless_diagnostics::google::protobuf::DescriptorBuilder::AddNotDefinedError( (uint64_t)this,  *((void *)a2 + 1),  (uint64_t)a3,  6LL);
  }

void sub_187C50B74( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  _Unwind_Resume(exception_object);
}

void wireless_diagnostics::google::protobuf::DescriptorBuilder::ValidateMessageOptions( wireless_diagnostics::google::protobuf::DescriptorPool::Tables **this, wireless_diagnostics::google::protobuf::Descriptor *a2, const wireless_diagnostics::google::protobuf::DescriptorProto *a3, const char *a4)
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  if (*((int *)a2 + 11) >= 1)
  {
    uint64_t v7 = 0LL;
    uint64_t v8 = 0LL;
    do
    {
      wireless_diagnostics::google::protobuf::DescriptorBuilder::ValidateFieldOptions( this,  (wireless_diagnostics::google::protobuf::FieldDescriptor *)(*((void *)a2 + 6) + v7),  *(const wireless_diagnostics::google::protobuf::FieldDescriptorProto **)(*((void *)a3 + 3) + 8 * v8++),  a4);
      v7 += 120LL;
    }

    while (v8 < *((int *)a2 + 11));
  }

  if (*((int *)a2 + 14) >= 1)
  {
    uint64_t v9 = 0LL;
    uint64_t v10 = 0LL;
    do
    {
      wireless_diagnostics::google::protobuf::DescriptorBuilder::ValidateMessageOptions( (wireless_diagnostics::google::protobuf::DescriptorBuilder *)this,  (wireless_diagnostics::google::protobuf::Descriptor *)(*((void *)a2 + 8) + v9),  *(const wireless_diagnostics::google::protobuf::DescriptorProto **)(*((void *)a3 + 9) + 8 * v10++));
      v9 += 120LL;
    }

    while (v10 < *((int *)a2 + 14));
  }

  if (*((int *)a2 + 18) >= 1)
  {
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    do
    {
      wireless_diagnostics::google::protobuf::DescriptorBuilder::ValidateEnumOptions( (wireless_diagnostics::google::protobuf::DescriptorBuilder *)this,  (wireless_diagnostics::google::protobuf::EnumDescriptor *)(*((void *)a2 + 10) + v11),  *(const wireless_diagnostics::google::protobuf::EnumDescriptorProto **)(*((void *)a3 + 12) + 8 * v12++));
      v11 += 56LL;
    }

    while (v12 < *((int *)a2 + 18));
  }

  if (*((int *)a2 + 26) >= 1)
  {
    uint64_t v13 = 0LL;
    uint64_t v14 = 0LL;
    do
    {
      wireless_diagnostics::google::protobuf::DescriptorBuilder::ValidateFieldOptions( this,  (wireless_diagnostics::google::protobuf::FieldDescriptor *)(*((void *)a2 + 14) + v13),  *(const wireless_diagnostics::google::protobuf::FieldDescriptorProto **)(*((void *)a3 + 6) + 8 * v14++),  a4);
      v13 += 120LL;
    }

    while (v14 < *((int *)a2 + 26));
  }

  if (*(_BYTE *)(*((void *)a2 + 4) + 64LL)) {
    unint64_t v15 = 0x7FFFFFFFLL;
  }
  else {
    unint64_t v15 = 0x1FFFFFFFLL;
  }
  int v16 = *((_DWORD *)a2 + 22);
  if (v16 >= 1)
  {
    uint64_t v17 = 0LL;
    uint64_t v18 = 4LL;
    do
    {
      if ((uint64_t)(v15 + 1) < *(int *)(*((void *)a2 + 12) + v18))
      {
        uint64_t v19 = *((void *)a2 + 1);
        uint64_t v20 = *(void *)(*((void *)a3 + 15) + 8 * v17);
        uint64_t v41 = wireless_diagnostics::google::protobuf::FastInt64ToBuffer(v15, v43, (char *)a3);
        int v42 = strlen(v41);
        uint64_t v39 = 0LL;
        int v40 = -1;
        uint64_t v37 = 0LL;
        int v38 = -1;
        uint64_t v35 = 0LL;
        int v36 = -1;
        uint64_t v33 = 0LL;
        int v34 = -1;
        uint64_t v31 = 0LL;
        int v32 = -1;
        uint64_t v29 = 0LL;
        int v30 = -1;
        uint64_t v27 = 0LL;
        int v28 = -1;
        uint64_t v25 = 0LL;
        int v26 = -1;
        uint64_t v23 = 0LL;
        int v24 = -1;
        *((void *)&v21 + 1) = &v25;
        *(void *)&__int128 v21 = &v27;
        wireless_diagnostics::google::protobuf::strings::Substitute( "Extension numbers cannot be greater than $0.",  (uint64_t)&v41,  (uint64_t)&v39,  (uint64_t)&v37,  (uint64_t)&v35,  (uint64_t)&v33,  (uint64_t)&v31,  (uint64_t)&v29,  &__p,  v21,  (uint64_t)&v23);
        wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError((uint64_t)this, v19, v20, 1LL, (uint64_t)&__p);
        int v16 = *((_DWORD *)a2 + 22);
      }

      ++v17;
      v18 += 8LL;
    }

    while (v17 < v16);
  }

void sub_187C50E64( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void wireless_diagnostics::google::protobuf::DescriptorBuilder::ValidateEnumOptions( wireless_diagnostics::google::protobuf::DescriptorBuilder *this, wireless_diagnostics::google::protobuf::EnumDescriptor *a2, const wireless_diagnostics::google::protobuf::EnumDescriptorProto *a3)
{
  uint64_t v6 = *((void *)a2 + 4);
  if ((*(_BYTE *)(v6 + 72) & 1) == 0 || !*(_BYTE *)(v6 + 64))
  {
    v42[0] = 0LL;
    v42[1] = 0LL;
    uint64_t v41 = v42;
    if (*((int *)a2 + 11) < 1)
    {
      int v34 = 0LL;
    }

    else
    {
      uint64_t v7 = 0LL;
      do
      {
        uint64_t v8 = *((void *)a2 + 6);
        uint64_t v9 = v8 + 40 * v7;
        int v12 = *(_DWORD *)(v9 + 16);
        uint64_t v11 = (int *)(v9 + 16);
        int v10 = v12;
        uint64_t v13 = v42[0];
        if (!v42[0]) {
          goto LABEL_14;
        }
        uint64_t v14 = v42;
        do
        {
          unint64_t v15 = (uint64_t *)v13;
          int v16 = v14;
          int v17 = *(_DWORD *)(v13 + 32);
          uint64_t v18 = (uint64_t *)(v13 + 8);
          if (v17 >= v10)
          {
            uint64_t v18 = v15;
            uint64_t v14 = v15;
          }

          uint64_t v13 = *v18;
        }

        while (v13);
        if (v14 == v42) {
          goto LABEL_14;
        }
        if (v17 < v10) {
          unint64_t v15 = v16;
        }
        if (v10 >= *((_DWORD *)v15 + 8))
        {
          std::operator+<char>();
          __int128 v21 = std::string::append(&v37, " uses the same enum value as ");
          __int128 v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
          v38.__r_.__value_.__l.__cap_ = v21->__r_.__value_.__l.__cap_;
          *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v22;
          v21->__r_.__value_.__l.__size_ = 0LL;
          v21->__r_.__value_.__l.__cap_ = 0LL;
          v21->__r_.__value_.__r.__words[0] = 0LL;
          int v36 = *v11;
          std::string v43 = &v36;
          uint64_t v23 = std::__tree<std::__value_type<int,std::string>,std::__map_value_compare<int,std::__value_type<int,std::string>,std::less<int>,true>,std::allocator<std::__value_type<int,std::string>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int &&>,std::tuple<>>( &v41,  &v36,  (uint64_t)&std::piecewise_construct,  &v43);
          int v26 = v23[5];
          int v24 = v23 + 5;
          uint64_t v25 = (const std::string::value_type *)v26;
          int v27 = *((char *)v24 + 23);
          if (v27 >= 0) {
            int v28 = (const std::string::value_type *)v24;
          }
          else {
            int v28 = v25;
          }
          if (v27 >= 0) {
            std::string::size_type v29 = *((unsigned __int8 *)v24 + 23);
          }
          else {
            std::string::size_type v29 = (std::string::size_type)v24[1];
          }
          int v30 = std::string::append(&v38, v28, v29);
          __int128 v31 = *(_OWORD *)&v30->__r_.__value_.__l.__data_;
          __p[0].__r_.__value_.__l.__cap_ = v30->__r_.__value_.__l.__cap_;
          *(_OWORD *)&__p[0].__r_.__value_.__l.__data_ = v31;
          v30->__r_.__value_.__l.__size_ = 0LL;
          v30->__r_.__value_.__l.__cap_ = 0LL;
          v30->__r_.__value_.__r.__words[0] = 0LL;
          int v32 = std::string::append( __p,  ". If this is intended, set 'option allow_alias = true;' to the enum definition.");
          __int128 v33 = *(_OWORD *)&v32->__r_.__value_.__l.__data_;
          std::string::size_type cap = v32->__r_.__value_.__l.__cap_;
          *(_OWORD *)uint64_t v39 = v33;
          v32->__r_.__value_.__l.__size_ = 0LL;
          v32->__r_.__value_.__l.__cap_ = 0LL;
          v32->__r_.__value_.__r.__words[0] = 0LL;
          if (*(_BYTE *)(*((void *)a2 + 4) + 64LL))
          {
            wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
            wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
            wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
            wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)__p);
          }

          else
          {
            wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)this,  *((void *)a2 + 1),  (uint64_t)a3,  1LL,  (uint64_t)v39);
          }

          if (SHIBYTE(cap) < 0) {
            operator delete(v39[0]);
          }
        }

        else
        {
LABEL_14:
          uint64_t v19 = *(const std::string **)(v8 + 40 * v7 + 8);
          LODWORD(v39[0]) = v10;
          __p[0].__r_.__value_.__r.__words[0] = (std::string::size_type)v39;
          uint64_t v20 = std::__tree<std::__value_type<int,std::string>,std::__map_value_compare<int,std::__value_type<int,std::string>,std::less<int>,true>,std::allocator<std::__value_type<int,std::string>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int &&>,std::tuple<>>( &v41,  (int *)v39,  (uint64_t)&std::piecewise_construct,  __p);
          std::string::operator=((std::string *)(v20 + 5), v19);
        }

        ++v7;
      }

      while (v7 < *((int *)a2 + 11));
      int v34 = (char *)v42[0];
    }

    std::__tree<std::__value_type<int,std::string>,std::__map_value_compare<int,std::__value_type<int,std::string>,std::less<int>,true>,std::allocator<std::__value_type<int,std::string>>>::destroy( (uint64_t)&v41,  v34);
  }

void sub_187C51140( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, int a21, __int16 a22, char a23, char a24, void *a25, uint64_t a26, int a27, __int16 a28, char a29, char a30, uint64_t a31, void *__p, uint64_t a33, int a34, __int16 a35, char a36, char a37)
{
  if (a37 < 0) {
    operator delete(__p);
  }
  std::__tree<std::__value_type<int,std::string>,std::__map_value_compare<int,std::__value_type<int,std::string>,std::less<int>,true>,std::allocator<std::__value_type<int,std::string>>>::destroy( v37 - 128,  *(char **)(v37 - 120));
  _Unwind_Resume(a1);
}

void wireless_diagnostics::google::protobuf::DescriptorBuilder::ValidateServiceOptions( wireless_diagnostics::google::protobuf::DescriptorBuilder *this, wireless_diagnostics::google::protobuf::ServiceDescriptor *a2, const wireless_diagnostics::google::protobuf::ServiceDescriptorProto *a3, const char *a4)
{
  uint64_t v4 = *((void *)a2 + 2);
  if (v4)
  {
    uint64_t v8 = *(void *)(v4 + 136);
    if (v8 != wireless_diagnostics::google::protobuf::FileOptions::default_instance(this, (uint64_t)a2, (uint64_t)a3, a4)
      && *(_DWORD *)(*(void *)(v4 + 136) + 56LL) == 3)
    {
      uint64_t v9 = *(void *)(*((void *)a2 + 2) + 136LL);
      if (*(_BYTE *)(v9 + 62) || *(_BYTE *)(v9 + 63))
      {
        uint64_t v10 = *((void *)a2 + 1);
        std::string::basic_string[abi:ne180100]<0>( __p,  "Files with optimize_for = LITE_RUNTIME cannot define services unless you set both options cc_generic_services and java_generic_sevices to false.");
        wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)this,  v10,  (uint64_t)a3,  0LL,  (uint64_t)__p);
        if (v12 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

void sub_187C51288( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void wireless_diagnostics::google::protobuf::DescriptorBuilder::ValidateFieldOptions( wireless_diagnostics::google::protobuf::DescriptorPool::Tables **this, wireless_diagnostics::google::protobuf::FieldDescriptor *a2, const wireless_diagnostics::google::protobuf::FieldDescriptorProto *a3, const char *a4)
{
  uint64_t v6 = (wireless_diagnostics::google::protobuf::DescriptorBuilder *)this;
  uint64_t v7 = (_BYTE *)*((void *)a2 + 12);
  if ((v7[84] & 0x10) != 0)
  {
    wireless_diagnostics::google::protobuf::DescriptorBuilder::ValidateMapKey(this, a2, a3);
    uint64_t v7 = (_BYTE *)*((void *)a2 + 12);
  }

  if (v7[45] && *((_DWORD *)a2 + 11) != 11)
  {
    uint64_t v8 = *((void *)a2 + 1);
    std::string::basic_string[abi:ne180100]<0>(__p, "[lazy = true] can only be specified for submessage fields.");
    wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError((uint64_t)v6, v8, (uint64_t)a3, 2LL, (uint64_t)__p);
    if (v25 < 0) {
      operator delete(__p[0]);
    }
    uint64_t v7 = (_BYTE *)*((void *)a2 + 12);
  }

  if (v7[44] && (*((_DWORD *)a2 + 12) != 3 || (*((_DWORD *)a2 + 11) - 13) >= 0xFFFFFFFC))
  {
    uint64_t v9 = *((void *)a2 + 1);
    std::string::basic_string[abi:ne180100]<0>( __p,  "[packed = true] can only be specified for repeated primitive fields.");
    wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError((uint64_t)v6, v9, (uint64_t)a3, 2LL, (uint64_t)__p);
    if (v25 < 0) {
      operator delete(__p[0]);
    }
  }

  uint64_t v10 = *((void *)a2 + 7);
  if (v10)
  {
    uint64_t v11 = *(wireless_diagnostics::google::protobuf::DescriptorBuilder **)(v10 + 32);
    this = (wireless_diagnostics::google::protobuf::DescriptorPool::Tables **)wireless_diagnostics::google::protobuf::MessageOptions::default_instance( (wireless_diagnostics::google::protobuf::MessageOptions *)this,  (uint64_t)a2,  (uint64_t)a3,  a4);
    if (v11 != (wireless_diagnostics::google::protobuf::DescriptorBuilder *)this)
    {
      if (*(_BYTE *)(*(void *)(*((void *)a2 + 7) + 32LL) + 64LL))
      {
        if (*((_BYTE *)a2 + 52))
        {
          if (*((_DWORD *)a2 + 12) == 1 && *((_DWORD *)a2 + 11) == 11) {
            goto LABEL_23;
          }
          uint64_t v12 = *((void *)a2 + 1);
          std::string::basic_string[abi:ne180100]<0>(__p, "Extensions of MessageSets must be optional messages.");
          wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)v6,  v12,  (uint64_t)a3,  2LL,  (uint64_t)__p);
        }

        else
        {
          uint64_t v13 = *((void *)a2 + 1);
          std::string::basic_string[abi:ne180100]<0>(__p, "MessageSets cannot have fields, only extensions.");
          wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)v6,  v13,  (uint64_t)a3,  0LL,  (uint64_t)__p);
        }

        if (v25 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

LABEL_23:
  uint64_t v14 = *((void *)a2 + 4);
  if (v14)
  {
    unint64_t v15 = *(wireless_diagnostics::google::protobuf::FileOptions **)(v14 + 136);
    int v16 = (wireless_diagnostics::google::protobuf::FileOptions *)wireless_diagnostics::google::protobuf::FileOptions::default_instance( (wireless_diagnostics::google::protobuf::FileOptions *)this,  (uint64_t)a2,  (uint64_t)a3,  a4);
    if (v15 != v16 && *(_DWORD *)(*(void *)(v14 + 136) + 56LL) == 3)
    {
      uint64_t v20 = *((void *)a2 + 7);
      if (v20)
      {
        uint64_t v21 = *(void *)(v20 + 16);
        if (!v21
          || (uint64_t v22 = *(void *)(v21 + 136),
              v22 == wireless_diagnostics::google::protobuf::FileOptions::default_instance(v16, v17, v18, v19))
          || *(_DWORD *)(*(void *)(v21 + 136) + 56LL) != 3)
        {
          uint64_t v23 = *((void *)a2 + 1);
          std::string::basic_string[abi:ne180100]<0>( __p,  "Extensions to non-lite types can only be declared in non-lite files.  Note that you cannot extend a non-lite type to contain a lite type, but the reverse is allowed.");
          wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)v6,  v23,  (uint64_t)a3,  3LL,  (uint64_t)__p);
          if (v25 < 0) {
            operator delete(__p[0]);
          }
        }
      }
    }
  }

void sub_187C514FC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void wireless_diagnostics::google::protobuf::DescriptorBuilder::ValidateMapKey( wireless_diagnostics::google::protobuf::DescriptorPool::Tables **this, wireless_diagnostics::google::protobuf::FieldDescriptor *a2, const wireless_diagnostics::google::protobuf::FieldDescriptorProto *a3)
{
  if (*((_DWORD *)a2 + 12) != 3)
  {
    uint64_t v19 = *((void *)a2 + 1);
    std::string::basic_string[abi:ne180100]<0>(&__p, "map type is only allowed for repeated fields.");
    wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)this,  v19,  (uint64_t)a3,  2LL,  (uint64_t)&__p);
    goto LABEL_28;
  }

  if ((*((_DWORD *)a2 + 11) & 0xFFFFFFFE) != 0xA)
  {
    uint64_t v20 = *((void *)a2 + 1);
    std::string::basic_string[abi:ne180100]<0>(&__p, "map type is only allowed for fields with a message type.");
    wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)this,  v20,  (uint64_t)a3,  2LL,  (uint64_t)&__p);
    goto LABEL_28;
  }

  uint64_t v6 = *((void *)a2 + 9);
  if (!v6)
  {
    uint64_t v21 = *((void *)a2 + 1);
    std::string::basic_string[abi:ne180100]<0>(&__p, "Could not find field type.");
    wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)this,  v21,  (uint64_t)a3,  2LL,  (uint64_t)&__p);
    goto LABEL_28;
  }

  uint64_t v7 = *(std::string **)(*((void *)a2 + 12) + 48LL);
  uint64_t v8 = *(const void ***)(v6 + 8);
  else {
    size_t v9 = (size_t)v8[1];
  }
  uint64_t v10 = &v38;
  std::string::basic_string[abi:ne180100]((uint64_t)&v38, v9 + 1);
  if ((v38.__r_.__value_.__s.__size_ & 0x80u) != 0) {
    uint64_t v10 = (std::string *)v38.__r_.__value_.__r.__words[0];
  }
  if (v9)
  {
    else {
      uint64_t v11 = *v8;
    }
    memmove(v10, v11, v9);
  }

  *(_WORD *)((char *)&v10->__r_.__value_.__l.__data_ + v9) = 46;
  int size = (char)v7->__r_.__value_.__s.__size_;
  if (size >= 0) {
    uint64_t v13 = (const std::string::value_type *)v7;
  }
  else {
    uint64_t v13 = (const std::string::value_type *)v7->__r_.__value_.__r.__words[0];
  }
  if (size >= 0) {
    std::string::size_type v14 = v7->__r_.__value_.__s.__size_;
  }
  else {
    std::string::size_type v14 = v7->__r_.__value_.__l.__size_;
  }
  unint64_t v15 = std::string::append(&v38, v13, v14);
  std::string __p = *v15;
  v15->__r_.__value_.__l.__size_ = 0LL;
  v15->__r_.__value_.__l.__cap_ = 0LL;
  v15->__r_.__value_.__r.__words[0] = 0LL;
  int v16 = wireless_diagnostics::google::protobuf::DescriptorBuilder::LookupSymbol(this, v7, (uint64_t)&__p, 0, 0);
  uint64_t v18 = v17;
  if ((char)v38.__r_.__value_.__s.__size_ < 0)
  {
    operator delete(v38.__r_.__value_.__l.__data_);
    if (!v16) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }

  if (v16)
  {
LABEL_33:
    if (*(_BYTE *)(v18 + 52)) {
      goto LABEL_34;
    }
    if (*(_DWORD *)(v18 + 48) == 3)
    {
      uint64_t v34 = *((void *)a2 + 1);
      std::string::basic_string[abi:ne180100]<0>(&__p, "map_key must not name a repeated field.");
      wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)this,  v34,  (uint64_t)a3,  2LL,  (uint64_t)&__p);
    }

    else
    {
      if ((*(_DWORD *)(v18 + 44) & 0xFFFFFFFE) != 0xA)
      {
        *((void *)a2 + 11) = v18;
        return;
      }

      uint64_t v35 = *((void *)a2 + 1);
      std::string::basic_string[abi:ne180100]<0>(&__p, "map key must name a scalar or string field.");
      wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( (uint64_t)this,  v35,  (uint64_t)a3,  2LL,  (uint64_t)&__p);
    }

void sub_187C518A4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21, uint64_t a22, void *a23, uint64_t a24, int a25, __int16 a26, char a27, char a28, uint64_t a29, void *__p, uint64_t a31, int a32, __int16 a33, char a34, char a35)
{
  if (a35 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

wireless_diagnostics::google::protobuf::DescriptorBuilder::OptionInterpreter *wireless_diagnostics::google::protobuf::DescriptorBuilder::OptionInterpreter::OptionInterpreter( wireless_diagnostics::google::protobuf::DescriptorBuilder::OptionInterpreter *this, wireless_diagnostics::google::protobuf::DescriptorBuilder *a2)
{
  *(void *)this = a2;
  wireless_diagnostics::google::protobuf::DynamicMessageFactory::DynamicMessageFactory((wireless_diagnostics::google::protobuf::DescriptorBuilder::OptionInterpreter *)((char *)this + 24));
  if (!*(void *)this)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v4);
  }

  return this;
}

void sub_187C519DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorBuilder::OptionInterpreter::InterpretSingleOption( wireless_diagnostics::google::protobuf::DescriptorBuilder::OptionInterpreter *this, wireless_diagnostics::google::protobuf::Message *a2)
{
  uint64_t v3 = *((void *)this + 2);
  if (!*(_DWORD *)(v3 + 24))
  {
    std::string::basic_string[abi:ne180100]<0>(&v86, "Option must have a name.");
    wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( *(void *)this,  *((void *)this + 1) + 24LL,  *((void *)this + 2),  7LL,  (uint64_t)&v86);
LABEL_84:
    if (SHIBYTE(cap) < 0) {
      operator delete((void *)v86);
    }
    return 0LL;
  }

  int v5 = *(uint64_t **)(**(void **)(v3 + 16) + 16LL);
  int v6 = *((char *)v5 + 23);
  if (v6 < 0)
  {
    if (v5[1] != 20) {
      goto LABEL_15;
    }
    int v5 = (uint64_t *)*v5;
  }

  else if (v6 != 20)
  {
    goto LABEL_15;
  }

  uint64_t v7 = (uint64_t *)*v5;
  uint64_t v8 = v5[1];
  int v9 = *((_DWORD *)v5 + 4);
  if (v7 == (uint64_t *)0x707265746E696E75LL && v8 == 0x706F5F6465746572LL && v9 == 1852795252)
  {
    std::string::basic_string[abi:ne180100]<0>(&v86, "Option must not use reserved name uninterpreted_option.");
    wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( *(void *)this,  *((void *)this + 1) + 24LL,  *((void *)this + 2),  7LL,  (uint64_t)&v86);
    goto LABEL_84;
  }

LABEL_15:
  uint64_t v12 = *(wireless_diagnostics::google::protobuf::internal::Mutex ****)this;
  uint64_t v13 = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::Message *))(*(void *)a2 + 152LL))(a2);
  if (wireless_diagnostics::google::protobuf::DescriptorBuilder::FindSymbolNotEnforcingDepsHelper( v12,  *v12,  *(std::string **)(v13 + 8)) == 1)
  {
    unint64_t v15 = v14;
    if (!v14) {
      goto LABEL_19;
    }
  }

  else
  {
    unint64_t v15 = (const std::string::value_type **)(*(uint64_t (**)(wireless_diagnostics::google::protobuf::Message *))(*(void *)a2 + 152LL))(a2);
    if (!v15)
    {
LABEL_19:
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
      wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)&v86);
    }
  }

  std::string __p = 0LL;
  __int128 v84 = 0LL;
  __int128 v85 = 0LL;
  std::string::basic_string[abi:ne180100]<0>(&v82, "");
  uint64_t v16 = *((void *)this + 2);
  if (*(int *)(v16 + 24) >= 1)
  {
    uint64_t v17 = 0LL;
    uint64_t v18 = 0LL;
    while (1)
    {
      uint64_t v19 = *(void *)(*(void *)(v16 + 16) + 8 * v17);
      uint64_t v20 = *(std::string **)(v19 + 16);
      std::string::size_type size = v82.__r_.__value_.__s.__size_;
      if ((v82.__r_.__value_.__s.__size_ & 0x80u) != 0) {
        std::string::size_type size = v82.__r_.__value_.__l.__size_;
      }
      if (size)
      {
        std::string::append(&v82, ".");
        uint64_t v19 = *(void *)(*(void *)(*((void *)this + 2) + 16LL) + 8 * v17);
      }

      if (*(_BYTE *)(v19 + 24))
      {
        std::operator+<char>();
        uint64_t v22 = std::string::append(&v77, ")");
        __int128 v23 = *(_OWORD *)&v22->__r_.__value_.__l.__data_;
        int64_t cap = v22->__r_.__value_.__l.__cap_;
        __int128 v86 = v23;
        v22->__r_.__value_.__l.__size_ = 0LL;
        v22->__r_.__value_.__l.__cap_ = 0LL;
        v22->__r_.__value_.__r.__words[0] = 0LL;
        if (cap >= 0) {
          int v24 = (const std::string::value_type *)&v86;
        }
        else {
          int v24 = (const std::string::value_type *)v86;
        }
        if (cap >= 0) {
          std::string::size_type v25 = HIBYTE(cap);
        }
        else {
          std::string::size_type v25 = *((void *)&v86 + 1);
        }
        std::string::append(&v82, v24, v25);
        if (SHIBYTE(cap) < 0) {
          operator delete((void *)v86);
        }
        uint64_t FieldByName = (wireless_diagnostics::google::protobuf::DescriptorBuilder::OptionInterpreter *)wireless_diagnostics::google::protobuf::DescriptorBuilder::LookupSymbol(*(wireless_diagnostics::google::protobuf::DescriptorPool::Tables ***)this, v20, *((void *)this + 1), 0, 0);
        if ((_DWORD)FieldByName == 2) {
          uint64_t v18 = v27;
        }
        if (!v18)
        {
LABEL_87:
          if (!*(_BYTE *)(**(void **)this + 41LL))
          {
            std::operator+<char>();
            int v58 = std::string::append(&v77, " unknown.");
            __int128 v59 = *(_OWORD *)&v58->__r_.__value_.__l.__data_;
            int64_t cap = v58->__r_.__value_.__l.__cap_;
            __int128 v86 = v59;
            v58->__r_.__value_.__l.__size_ = 0LL;
            v58->__r_.__value_.__l.__cap_ = 0LL;
            v58->__r_.__value_.__r.__words[0] = 0LL;
            wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( *(void *)this,  *((void *)this + 1) + 24LL,  *((void *)this + 2),  7LL,  (uint64_t)&v86);
            goto LABEL_93;
          }

        wireless_diagnostics::google::protobuf::io::Tokenizer::NextChar((uint64_t)this);
      }

      else
      {
LABEL_20:
        std::string::basic_string[abi:ne180100]<0>(__p, "Invalid escape sequence in string literal.");
        (*(void (**)(void, void, void, void **))(**((void **)this + 13) + 16LL))( *((void *)this + 13),  *((unsigned int *)this + 35),  *((unsigned int *)this + 36),  __p);
LABEL_46:
        if (v20 < 0) {
          operator delete(__p[0]);
        }
      }
    }

    if (v4 == 10 || v4 == 0) {
      break;
    }
    int v6 = *((unsigned __int8 *)this + 112);
    wireless_diagnostics::google::protobuf::io::Tokenizer::NextChar((uint64_t)this);
    if (v6 == a2) {
      return;
    }
  }

  std::string::basic_string[abi:ne180100]<0>(__p, "String literals cannot cross line boundaries.");
  (*(void (**)(void, void, void, void **))(**((void **)this + 13) + 16LL))( *((void *)this + 13),  *((unsigned int *)this + 35),  *((unsigned int *)this + 36),  __p);
  if (v20 < 0) {
    operator delete(__p[0]);
  }
}

LABEL_111:
    uint64_t v57 = 0LL;
    goto LABEL_116;
  }

  uint64_t v18 = 0LL;
LABEL_72:
  std::string v43 = __p;
  uint64_t v44 = (uint64_t)v84;
  uint64_t v45 = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::Message *))(*(void *)a2 + 144LL))(a2);
  uint64_t v46 = (uint64_t **)(*(uint64_t (**)(uint64_t, wireless_diagnostics::google::protobuf::Message *))(*(void *)v45 + 16LL))( v45,  a2);
  if ((wireless_diagnostics::google::protobuf::DescriptorBuilder::OptionInterpreter::ExamineIfOptionIsSet( (uint64_t *)this,  (uint64_t)v43,  v44,  v18,  (uint64_t)&v82,  v46) & 1) == 0) {
    goto LABEL_111;
  }
  std::string::size_type v47 = (void ***)operator new(8uLL);
  wireless_diagnostics::google::protobuf::UnknownFieldSet::UnknownFieldSet(v47);
  v80.__r_.__value_.__r.__words[0] = (std::string::size_type)v47;
  if ((wireless_diagnostics::google::protobuf::DescriptorBuilder::OptionInterpreter::SetOptionValue( this,  (const wireless_diagnostics::google::protobuf::FieldDescriptor *)v18,  v47) & 1) == 0) {
    goto LABEL_113;
  }
  int v48 = v84;
  if (v84 == __p)
  {
LABEL_82:
    uint64_t v55 = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::Message *))(*(void *)a2 + 144LL))(a2);
    int v56 = (void ***)(*(uint64_t (**)(uint64_t, wireless_diagnostics::google::protobuf::Message *))(*(void *)v55 + 24LL))( v55,  a2);
    wireless_diagnostics::google::protobuf::UnknownFieldSet::MergeFrom( v56,  (const wireless_diagnostics::google::protobuf::UnknownFieldSet *)v80.__r_.__value_.__l.__data_);
    uint64_t v57 = 1LL;
    goto LABEL_114;
  }

  while (1)
  {
    uint64_t v49 = (void ***)operator new(8uLL);
    wireless_diagnostics::google::protobuf::UnknownFieldSet::UnknownFieldSet(v49);
    __int128 v79 = v49;
    std::string::size_type v51 = v48 - 1;
    uint64_t v50 = *(v48 - 1);
    int v52 = *(_DWORD *)(v50 + 44);
    if (v52 != 10) {
      break;
    }
    uint64_t v54 = (void ***)wireless_diagnostics::google::protobuf::UnknownFieldSet::AddGroup(v49, *(_DWORD *)(v50 + 40));
    wireless_diagnostics::google::protobuf::UnknownFieldSet::MergeFrom( v54,  (const wireless_diagnostics::google::protobuf::UnknownFieldSet *)v80.__r_.__value_.__l.__data_);
LABEL_81:
    wireless_diagnostics::google::protobuf::internal::scoped_ptr<wireless_diagnostics::google::protobuf::UnknownFieldSet>::reset( (wireless_diagnostics::google::protobuf::UnknownFieldSet **)&v80,  (wireless_diagnostics::google::protobuf::UnknownFieldSet *)v49);
    --v48;
    if (v51 == __p) {
      goto LABEL_82;
    }
  }

  if (v52 == 11)
  {
    wireless_diagnostics::google::protobuf::UnknownFieldSet::AddLengthDelimited(v49, *(_DWORD *)(v50 + 40));
    wireless_diagnostics::google::protobuf::io::StringOutputStream::StringOutputStream();
    wireless_diagnostics::google::protobuf::io::CodedOutputStream::CodedOutputStream();
    wireless_diagnostics::google::protobuf::internal::WireFormat::SerializeUnknownFields( (uint64_t **)v80.__r_.__value_.__l.__data_,  (const wireless_diagnostics::google::protobuf::UnknownFieldSet *)&v77,  v53);
    if (v78)
    {
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
      wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)&v86);
    }

    MEMORY[0x1895B3460](&v77);
    MEMORY[0x1895B3490](&v81);
    goto LABEL_81;
  }

  wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
  wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
  wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
  wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)&v86);
  wireless_diagnostics::google::protobuf::UnknownFieldSet::~UnknownFieldSet((wireless_diagnostics::google::protobuf::UnknownFieldSet *)v49);
  operator delete(v74);
LABEL_113:
  uint64_t v57 = 0LL;
LABEL_114:
  if (v80.__r_.__value_.__r.__words[0])
  {
    wireless_diagnostics::google::protobuf::UnknownFieldSet::~UnknownFieldSet((wireless_diagnostics::google::protobuf::UnknownFieldSet *)v80.__r_.__value_.__l.__data_);
    operator delete(v75);
  }

LABEL_116:
  if (__p)
  {
    __int128 v84 = (uint64_t *)__p;
    operator delete(__p);
  }

  return v57;
}

void sub_187C52304( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, wireless_diagnostics::google::protobuf::UnknownFieldSet *a18, void *a19, uint64_t a20, int a21, __int16 a22, char a23, char a24, void *a25, uint64_t a26, int a27, __int16 a28, char a29, char a30, uint64_t a31, void *__p, uint64_t a33, int a34, __int16 a35, char a36, char a37, void *a38)
{
  if (a37 < 0) {
    operator delete(__p);
  }
  uint64_t v41 = a38;
  if (a38)
  {
    *(void *)(v38 + 8) = a38;
    operator delete(v41);
  }

  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorBuilder::OptionInterpreter::AddWithoutInterpreting( wireless_diagnostics::google::protobuf::DescriptorBuilder::OptionInterpreter *this, const wireless_diagnostics::google::protobuf::UninterpretedOption *a2, wireless_diagnostics::google::protobuf::Message *a3)
{
  uint64_t v5 = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::Message *))(*(void *)a3 + 152LL))(a3);
  std::string::basic_string[abi:ne180100]<0>(__p, "uninterpreted_option");
  uint64_t FieldByName = wireless_diagnostics::google::protobuf::Descriptor::FindFieldByName(v5, (uint64_t)__p);
  uint64_t v7 = FieldByName;
  if (v12 < 0)
  {
    operator delete(__p[0]);
    if (!v7)
    {
LABEL_5:
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
      wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)__p);
    }
  }

  else if (!FieldByName)
  {
    goto LABEL_5;
  }

  uint64_t v8 = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::Message *))(*(void *)a3 + 144LL))(a3);
  uint64_t v9 = (*(uint64_t (**)(uint64_t, wireless_diagnostics::google::protobuf::Message *, uint64_t, void))(*(void *)v8 + 520LL))( v8,  a3,  v7,  0LL);
  return (*(uint64_t (**)(uint64_t, const wireless_diagnostics::google::protobuf::UninterpretedOption *))(*(void *)v9 + 104LL))( v9,  a2);
}

void sub_187C525B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorBuilder::OptionInterpreter::ExamineIfOptionIsSet( uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t **a6)
{
  if (a2 == a3)
  {
    uint64_t v21 = 0LL;
    uint64_t v22 = *a6;
    uint64_t v23 = -1LL;
    do
    {
      if (v22) {
        unint64_t v24 = (unint64_t)(v22[1] - *v22) >> 4;
      }
      else {
        LODWORD(v24) = 0;
      }
      int v25 = *(_DWORD *)(*v22 + v21);
      v21 += 16LL;
    }

    while ((v25 & 0x1FFFFFFF) != *(_DWORD *)(a4 + 40));
    std::operator+<char>();
    uint64_t v26 = std::string::append(&v33, " was already set.");
    __int128 v27 = *(_OWORD *)&v26->__r_.__value_.__l.__data_;
    std::string::size_type cap = v26->__r_.__value_.__l.__cap_;
    *(_OWORD *)std::string __p = v27;
    v26->__r_.__value_.__l.__size_ = 0LL;
    v26->__r_.__value_.__l.__cap_ = 0LL;
    v26->__r_.__value_.__r.__words[0] = 0LL;
    wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError(*a1, a1[1] + 24, a1[2], 7LL, (uint64_t)__p);
    if (SHIBYTE(cap) < 0) {
      operator delete(__p[0]);
    }
    return 0LL;
  }

  else
  {
    uint64_t v10 = 0LL;
    uint64_t v11 = 0LL;
    uint64_t v12 = a2 + 8;
    while (1)
    {
      uint64_t v13 = *a6;
      if (*a6) {
        unint64_t v14 = (unint64_t)(v13[1] - *v13) >> 4;
      }
      else {
        LODWORD(v14) = 0;
      }
      BOOL v15 = v11 >= (int)v14;
      uint64_t v16 = *v13;
      unsigned int v17 = *(_DWORD *)(*v13 + v10);
      if ((v17 & 0x1FFFFFFF) == *(_DWORD *)(*(void *)a2 + 40LL))
      {
        int v18 = *(_DWORD *)(*(void *)a2 + 44LL);
        if (v18 == 10)
        {
          if (v17 >> 29 == 4
            && (wireless_diagnostics::google::protobuf::DescriptorBuilder::OptionInterpreter::ExamineIfOptionIsSet( a1,  v12,  a3,  a4,  a5,  *(void *)(v16 + v10 + 8)) & 1) == 0)
          {
            return v15;
          }
        }

        else
        {
          if (v18 != 11)
          {
            wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
            wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
            wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
            wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
            wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)__p);
            return 0LL;
          }

          if (v17 >> 29 == 3)
          {
            wireless_diagnostics::google::protobuf::UnknownFieldSet::UnknownFieldSet(__p);
            uint64_t v19 = *(void *)(v16 + v10 + 8);
            else {
              uint64_t v20 = *(const void **)v19;
            }
            if (wireless_diagnostics::google::protobuf::UnknownFieldSet::ParseFromArray( (uint64_t **)__p,  v20)
              && (wireless_diagnostics::google::protobuf::DescriptorBuilder::OptionInterpreter::ExamineIfOptionIsSet( a1,  v12,  a3,  a4,  a5,  __p) & 1) == 0)
            {
              wireless_diagnostics::google::protobuf::UnknownFieldSet::~UnknownFieldSet((wireless_diagnostics::google::protobuf::UnknownFieldSet *)__p);
              return 0LL;
            }

            wireless_diagnostics::google::protobuf::UnknownFieldSet::~UnknownFieldSet((wireless_diagnostics::google::protobuf::UnknownFieldSet *)__p);
          }
        }
      }

      ++v11;
      v10 += 16LL;
    }
  }

  return v15;
}

void sub_187C52858( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, void *a21, uint64_t a22, int a23, __int16 a24, char a25, char a26)
{
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorBuilder::OptionInterpreter::SetOptionValue( wireless_diagnostics::google::protobuf::DescriptorBuilder::OptionInterpreter *this, const wireless_diagnostics::google::protobuf::FieldDescriptor *a2, void ***a3)
{
  int v3 = *((_DWORD *)a2 + 11);
  switch(v3)
  {
    case 1:
      uint64_t v13 = *((void *)this + 2);
      int v14 = *(_DWORD *)(v13 + 92);
      if ((v14 & 0x10) != 0)
      {
        double v25 = *(double *)(v13 + 64);
      }

      else if ((v14 & 4) != 0)
      {
        double v25 = (double)*(unint64_t *)(v13 + 48);
      }

      else
      {
        if ((v14 & 8) == 0) {
          goto LABEL_139;
        }
        double v25 = (double)*(uint64_t *)(v13 + 56);
      }

      wireless_diagnostics::google::protobuf::UnknownFieldSet::AddFixed64(a3, *((_DWORD *)a2 + 10), *(uint64_t *)&v25);
      return 1LL;
    case 2:
      uint64_t v15 = *((void *)this + 2);
      int v16 = *(_DWORD *)(v15 + 92);
      if ((v16 & 0x10) != 0)
      {
        float v26 = *(double *)(v15 + 64);
      }

      else if ((v16 & 4) != 0)
      {
        float v26 = (float)*(unint64_t *)(v15 + 48);
      }

      else
      {
        if ((v16 & 8) == 0) {
          goto LABEL_139;
        }
        float v26 = (float)*(uint64_t *)(v15 + 56);
      }

      wireless_diagnostics::google::protobuf::UnknownFieldSet::AddFixed32(a3, *((_DWORD *)a2 + 10), SLODWORD(v26));
      return 1LL;
    case 3:
    case 16:
    case 18:
      uint64_t v9 = *((void *)this + 2);
      int v10 = *(_DWORD *)(v9 + 92);
      if ((v10 & 4) != 0)
      {
        uint64_t v22 = *(void *)(v9 + 48);
        if (v22 < 0) {
          goto LABEL_139;
        }
        int v23 = *((_DWORD *)a2 + 10);
      }

      else
      {
        if ((v10 & 8) == 0) {
          goto LABEL_139;
        }
        int v23 = *((_DWORD *)a2 + 10);
        uint64_t v22 = *(void *)(v9 + 56);
      }

      wireless_diagnostics::google::protobuf::DescriptorBuilder::OptionInterpreter::SetInt64( (int)this,  v23,  v22,  v3,  a3);
      return 1LL;
    case 4:
    case 6:
      uint64_t v12 = *((void *)this + 2);
      if ((*(_BYTE *)(v12 + 92) & 4) == 0) {
        goto LABEL_139;
      }
      wireless_diagnostics::google::protobuf::DescriptorBuilder::OptionInterpreter::SetUInt64( (int)this,  *((_DWORD *)a2 + 10),  *(void *)(v12 + 48),  v3,  a3);
      return 1LL;
    case 5:
    case 15:
    case 17:
      uint64_t v7 = *((void *)this + 2);
      int v8 = *(_DWORD *)(v7 + 92);
      if ((v8 & 4) != 0)
      {
        uint64_t v21 = *(void *)(v7 + 48);
        goto LABEL_46;
      }

      if ((v8 & 8) != 0)
      {
        uint64_t v21 = *(void *)(v7 + 56);
        if (v21 > (uint64_t)0xFFFFFFFF7FFFFFFFLL)
        {
LABEL_46:
          wireless_diagnostics::google::protobuf::DescriptorBuilder::OptionInterpreter::SetInt32( (int)this,  *((_DWORD *)a2 + 10),  v21,  v3,  a3);
          return 1LL;
        }
      }

      goto LABEL_139;
    case 7:
    case 13:
      uint64_t v11 = *((void *)this + 2);
      if ((*(_BYTE *)(v11 + 92) & 4) == 0) {
        goto LABEL_139;
      }
      unint64_t v24 = *(void *)(v11 + 48);
      if (HIDWORD(v24)) {
        goto LABEL_139;
      }
      wireless_diagnostics::google::protobuf::DescriptorBuilder::OptionInterpreter::SetUInt32( (int)this,  *((_DWORD *)a2 + 10),  v24,  v3,  a3);
      return 1LL;
    case 8:
      uint64_t v17 = *((void *)this + 2);
      if ((*(_BYTE *)(v17 + 92) & 2) == 0) {
        goto LABEL_139;
      }
      __int128 v27 = *(_DWORD **)(v17 + 40);
      if (*((char *)v27 + 23) < 0)
      {
        uint64_t v36 = *((void *)v27 + 1);
        if (v36 != 4 || **(_DWORD **)v27 != 1702195828)
        {
          if (v36 != 5) {
            goto LABEL_139;
          }
          __int128 v27 = *(_DWORD **)v27;
          goto LABEL_57;
        }
      }

      else
      {
        int v28 = *((unsigned __int8 *)v27 + 23);
        if (v28 != 4)
        {
          if (v28 != 5) {
            goto LABEL_139;
          }
LABEL_57:
          int v37 = *v27;
          int v38 = *((unsigned __int8 *)v27 + 4);
          if (v37 != 1936482662 || v38 != 101)
          {
LABEL_139:
            std::operator+<char>();
            __int128 v85 = std::string::append(&v92, ".");
            __int128 v86 = *(_OWORD *)&v85->__r_.__value_.__l.__data_;
            v93.__r_.__value_.__l.__cap_ = v85->__r_.__value_.__l.__cap_;
            *(_OWORD *)&v93.__r_.__value_.__l.__data_ = v86;
            v85->__r_.__value_.__l.__size_ = 0LL;
            v85->__r_.__value_.__l.__cap_ = 0LL;
            v85->__r_.__value_.__r.__words[0] = 0LL;
            wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( *(void *)this,  *((void *)this + 1) + 24LL,  *((void *)this + 2),  8LL,  (uint64_t)&v93);
            if ((char)v92.__r_.__value_.__s.__size_ < 0)
            {
              __int128 v84 = (void *)v92.__r_.__value_.__r.__words[0];
LABEL_143:
              operator delete(v84);
            }

            return 0LL;
          }

          uint64_t v40 = 0LL;
LABEL_146:
          int v66 = *((_DWORD *)a2 + 10);
          goto LABEL_147;
        }

        if (*v27 != 1702195828) {
          goto LABEL_139;
        }
      }

      uint64_t v40 = 1LL;
      goto LABEL_146;
    case 9:
    case 12:
      uint64_t v19 = *((void *)this + 2);
      if ((*(_BYTE *)(v19 + 92) & 0x20) == 0) {
        goto LABEL_139;
      }
      uint64_t v34 = *(const std::string **)(v19 + 72);
      uint64_t v35 = (std::string *)wireless_diagnostics::google::protobuf::UnknownFieldSet::AddLengthDelimited( a3,  *((_DWORD *)a2 + 10));
      std::string::operator=(v35, v34);
      return 1LL;
    case 10:
    case 11:
      uint64_t result = wireless_diagnostics::google::protobuf::DescriptorBuilder::OptionInterpreter::SetAggregateOption( this,  a2,  a3);
      if (!(_DWORD)result) {
        return result;
      }
      return 1LL;
    case 14:
      uint64_t v18 = *((void *)this + 2);
      if ((*(_BYTE *)(v18 + 92) & 2) == 0) {
        goto LABEL_139;
      }
      std::string::size_type v29 = (void *)*((void *)a2 + 10);
      uint64_t v30 = *(void *)(v18 + 40);
      uint64_t v31 = *(void *)(v29[2] + 16LL);
      if (v31 == wireless_diagnostics::google::protobuf::DescriptorPool::generated_pool(this))
      {
        uint64_t ValueByName = wireless_diagnostics::google::protobuf::EnumDescriptor::FindValueByName((uint64_t)v29, v30);
        goto LABEL_112;
      }

      uint64_t v32 = (__int128 *)v29[1];
      if (*((char *)v32 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v93, *(const std::string::value_type **)v32, *((void *)v32 + 1));
      }

      else
      {
        __int128 v33 = *v32;
        v93.__r_.__value_.__l.__cap_ = *((void *)v32 + 2);
        *(_OWORD *)&v93.__r_.__value_.__l.__data_ = v33;
      }

      std::string::size_type size = v93.__r_.__value_.__s.__size_;
      if ((v93.__r_.__value_.__s.__size_ & 0x80u) != 0) {
        std::string::size_type size = v93.__r_.__value_.__l.__size_;
      }
      else {
        uint64_t v43 = *(unsigned __int8 *)(*v29 + 23LL);
      }
      std::string::resize(&v93, size - v43, 0);
      int v44 = *(char *)(v30 + 23);
      if (v44 >= 0) {
        uint64_t v45 = (const std::string::value_type *)v30;
      }
      else {
        uint64_t v45 = *(const std::string::value_type **)v30;
      }
      if (v44 >= 0) {
        std::string::size_type v46 = *(unsigned __int8 *)(v30 + 23);
      }
      else {
        std::string::size_type v46 = *(void *)(v30 + 8);
      }
      std::string::append(&v93, v45, v46);
      if (wireless_diagnostics::google::protobuf::DescriptorBuilder::FindSymbolNotEnforcingDepsHelper( *(wireless_diagnostics::google::protobuf::internal::Mutex ****)this,  **(wireless_diagnostics::google::protobuf::internal::Mutex ****)this,  &v93) != 4)
      {
        uint64_t ValueByName = 0LL;
        goto LABEL_108;
      }

      uint64_t ValueByName = v47;
      if (*(void **)(v47 + 24) == v29)
      {
LABEL_108:
        char v65 = 1;
        goto LABEL_109;
      }

      std::operator+<char>();
      int v48 = std::string::append(&v87, " has no value named ");
      __int128 v49 = *(_OWORD *)&v48->__r_.__value_.__l.__data_;
      v88.__r_.__value_.__l.__cap_ = v48->__r_.__value_.__l.__cap_;
      *(_OWORD *)&v88.__r_.__value_.__l.__data_ = v49;
      v48->__r_.__value_.__l.__size_ = 0LL;
      v48->__r_.__value_.__l.__cap_ = 0LL;
      v48->__r_.__value_.__r.__words[0] = 0LL;
      int v50 = *(char *)(v30 + 23);
      if (v50 >= 0) {
        std::string::size_type v51 = (const std::string::value_type *)v30;
      }
      else {
        std::string::size_type v51 = *(const std::string::value_type **)v30;
      }
      if (v50 >= 0) {
        std::string::size_type v52 = *(unsigned __int8 *)(v30 + 23);
      }
      else {
        std::string::size_type v52 = *(void *)(v30 + 8);
      }
      uint64_t v53 = std::string::append(&v88, v51, v52);
      __int128 v54 = *(_OWORD *)&v53->__r_.__value_.__l.__data_;
      v89.__r_.__value_.__l.__cap_ = v53->__r_.__value_.__l.__cap_;
      *(_OWORD *)&v89.__r_.__value_.__l.__data_ = v54;
      v53->__r_.__value_.__l.__size_ = 0LL;
      v53->__r_.__value_.__l.__cap_ = 0LL;
      v53->__r_.__value_.__r.__words[0] = 0LL;
      uint64_t v55 = std::string::append(&v89, " for option ");
      __int128 v56 = *(_OWORD *)&v55->__r_.__value_.__l.__data_;
      v90.__r_.__value_.__l.__cap_ = v55->__r_.__value_.__l.__cap_;
      *(_OWORD *)&v90.__r_.__value_.__l.__data_ = v56;
      v55->__r_.__value_.__l.__size_ = 0LL;
      v55->__r_.__value_.__l.__cap_ = 0LL;
      v55->__r_.__value_.__r.__words[0] = 0LL;
      uint64_t v57 = *((void *)a2 + 1);
      int v58 = *(char *)(v57 + 23);
      if (v58 >= 0) {
        __int128 v59 = (const std::string::value_type *)*((void *)a2 + 1);
      }
      else {
        __int128 v59 = *(const std::string::value_type **)v57;
      }
      if (v58 >= 0) {
        std::string::size_type v60 = *(unsigned __int8 *)(v57 + 23);
      }
      else {
        std::string::size_type v60 = *(void *)(v57 + 8);
      }
      __int128 v61 = std::string::append(&v90, v59, v60);
      __int128 v62 = *(_OWORD *)&v61->__r_.__value_.__l.__data_;
      v91.__r_.__value_.__l.__cap_ = v61->__r_.__value_.__l.__cap_;
      *(_OWORD *)&v91.__r_.__value_.__l.__data_ = v62;
      v61->__r_.__value_.__l.__size_ = 0LL;
      v61->__r_.__value_.__l.__cap_ = 0LL;
      v61->__r_.__value_.__r.__words[0] = 0LL;
      __int128 v63 = std::string::append(&v91, ". This appears to be a value from a sibling type.");
      __int128 v64 = *(_OWORD *)&v63->__r_.__value_.__l.__data_;
      v92.__r_.__value_.__l.__cap_ = v63->__r_.__value_.__l.__cap_;
      *(_OWORD *)&v92.__r_.__value_.__l.__data_ = v64;
      v63->__r_.__value_.__l.__size_ = 0LL;
      v63->__r_.__value_.__l.__cap_ = 0LL;
      v63->__r_.__value_.__r.__words[0] = 0LL;
      wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( *(void *)this,  *((void *)this + 1) + 24LL,  *((void *)this + 2),  8LL,  (uint64_t)&v92);
      char v65 = 0;
      uint64_t ValueByName = 0LL;
LABEL_109:
      if ((v65 & 1) == 0) {
        return 0LL;
      }
LABEL_112:
      if (!ValueByName)
      {
        std::operator+<char>();
        int v67 = std::string::append(&v88, " has no value named ");
        __int128 v68 = *(_OWORD *)&v67->__r_.__value_.__l.__data_;
        v89.__r_.__value_.__l.__cap_ = v67->__r_.__value_.__l.__cap_;
        *(_OWORD *)&v89.__r_.__value_.__l.__data_ = v68;
        v67->__r_.__value_.__l.__size_ = 0LL;
        v67->__r_.__value_.__l.__cap_ = 0LL;
        v67->__r_.__value_.__r.__words[0] = 0LL;
        int v69 = *(char *)(v30 + 23);
        if (v69 >= 0) {
          int v70 = (const std::string::value_type *)v30;
        }
        else {
          int v70 = *(const std::string::value_type **)v30;
        }
        if (v69 >= 0) {
          std::string::size_type v71 = *(unsigned __int8 *)(v30 + 23);
        }
        else {
          std::string::size_type v71 = *(void *)(v30 + 8);
        }
        uint64_t v72 = std::string::append(&v89, v70, v71);
        __int128 v73 = *(_OWORD *)&v72->__r_.__value_.__l.__data_;
        v90.__r_.__value_.__l.__cap_ = v72->__r_.__value_.__l.__cap_;
        *(_OWORD *)&v90.__r_.__value_.__l.__data_ = v73;
        v72->__r_.__value_.__l.__size_ = 0LL;
        v72->__r_.__value_.__l.__cap_ = 0LL;
        v72->__r_.__value_.__r.__words[0] = 0LL;
        uint64_t v74 = std::string::append(&v90, " for option ");
        __int128 v75 = *(_OWORD *)&v74->__r_.__value_.__l.__data_;
        v91.__r_.__value_.__l.__cap_ = v74->__r_.__value_.__l.__cap_;
        *(_OWORD *)&v91.__r_.__value_.__l.__data_ = v75;
        v74->__r_.__value_.__l.__size_ = 0LL;
        v74->__r_.__value_.__l.__cap_ = 0LL;
        v74->__r_.__value_.__r.__words[0] = 0LL;
        uint64_t v76 = *((void *)a2 + 1);
        int v77 = *(char *)(v76 + 23);
        if (v77 >= 0) {
          char v78 = (const std::string::value_type *)*((void *)a2 + 1);
        }
        else {
          char v78 = *(const std::string::value_type **)v76;
        }
        if (v77 >= 0) {
          std::string::size_type v79 = *(unsigned __int8 *)(v76 + 23);
        }
        else {
          std::string::size_type v79 = *(void *)(v76 + 8);
        }
        std::string v80 = std::string::append(&v91, v78, v79);
        __int128 v81 = *(_OWORD *)&v80->__r_.__value_.__l.__data_;
        v92.__r_.__value_.__l.__cap_ = v80->__r_.__value_.__l.__cap_;
        *(_OWORD *)&v92.__r_.__value_.__l.__data_ = v81;
        v80->__r_.__value_.__l.__size_ = 0LL;
        v80->__r_.__value_.__l.__cap_ = 0LL;
        v80->__r_.__value_.__r.__words[0] = 0LL;
        std::string v82 = std::string::append(&v92, ".");
        __int128 v83 = *(_OWORD *)&v82->__r_.__value_.__l.__data_;
        v93.__r_.__value_.__l.__cap_ = v82->__r_.__value_.__l.__cap_;
        *(_OWORD *)&v93.__r_.__value_.__l.__data_ = v83;
        v82->__r_.__value_.__l.__size_ = 0LL;
        v82->__r_.__value_.__l.__cap_ = 0LL;
        v82->__r_.__value_.__r.__words[0] = 0LL;
        wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( *(void *)this,  *((void *)this + 1) + 24LL,  *((void *)this + 2),  8LL,  (uint64_t)&v93);
        if ((char)v88.__r_.__value_.__s.__size_ < 0)
        {
          __int128 v84 = (void *)v88.__r_.__value_.__r.__words[0];
          goto LABEL_143;
        }

        return 0LL;
      }

      int v66 = *((_DWORD *)a2 + 10);
      uint64_t v40 = *(int *)(ValueByName + 16);
LABEL_147:
      wireless_diagnostics::google::protobuf::UnknownFieldSet::AddVarint(a3, v66, v40);
      return 1LL;
    default:
      return 1LL;
  }

void sub_187C5346C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21, uint64_t a22, void *a23, uint64_t a24, int a25, __int16 a26, char a27, char a28, uint64_t a29, void *a30, uint64_t a31, int a32, __int16 a33, char a34, char a35, uint64_t a36, void *__p, uint64_t a38, int a39, __int16 a40, char a41, char a42)
{
  if (a42 < 0) {
    operator delete(__p);
  }
  if (a35 < 0) {
    operator delete(a30);
  }
  if (a28 < 0) {
    operator delete(a23);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  _Unwind_Resume(a1);
}

void wireless_diagnostics::google::protobuf::internal::scoped_ptr<wireless_diagnostics::google::protobuf::UnknownFieldSet>::reset( wireless_diagnostics::google::protobuf::UnknownFieldSet **a1, wireless_diagnostics::google::protobuf::UnknownFieldSet *a2)
{
  int v3 = *a1;
  if (v3 != a2)
  {
    if (v3)
    {
      wireless_diagnostics::google::protobuf::UnknownFieldSet::~UnknownFieldSet(v3);
      operator delete(v5);
    }

    *a1 = a2;
  }

void wireless_diagnostics::google::protobuf::DescriptorBuilder::OptionInterpreter::SetInt32( int a1, int a2, uint64_t a3, int a4, void ***this)
{
  switch(a4)
  {
    case 17:
      a3 = (2 * (_DWORD)a3) ^ ((int)a3 >> 31);
      goto LABEL_6;
    case 15:
      wireless_diagnostics::google::protobuf::UnknownFieldSet::AddFixed32(this, a2, a3);
      break;
    case 5:
      a3 = (int)a3;
LABEL_6:
      wireless_diagnostics::google::protobuf::UnknownFieldSet::AddVarint(this, a2, a3);
      return;
    default:
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
      wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v5);
      break;
  }

void sub_187C53734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void wireless_diagnostics::google::protobuf::DescriptorBuilder::OptionInterpreter::SetInt64( int a1, int a2, uint64_t a3, int a4, void ***this)
{
  if (a4 == 18)
  {
    a3 = (2 * a3) ^ (a3 >> 63);
LABEL_6:
    wireless_diagnostics::google::protobuf::UnknownFieldSet::AddVarint(this, a2, a3);
    return;
  }

  if (a4 != 16)
  {
    if (a4 != 3)
    {
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
      wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v5);
      return;
    }

    goto LABEL_6;
  }

  wireless_diagnostics::google::protobuf::UnknownFieldSet::AddFixed64(this, a2, a3);
}

void sub_187C537FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void wireless_diagnostics::google::protobuf::DescriptorBuilder::OptionInterpreter::SetUInt32( int a1, int a2, unsigned int a3, int a4, void ***this)
{
  if (a4 == 7)
  {
    wireless_diagnostics::google::protobuf::UnknownFieldSet::AddFixed32(this, a2, a3);
  }

  else if (a4 == 13)
  {
    wireless_diagnostics::google::protobuf::UnknownFieldSet::AddVarint(this, a2, a3);
  }

  else
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v5);
  }

void sub_187C538B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void wireless_diagnostics::google::protobuf::DescriptorBuilder::OptionInterpreter::SetUInt64( int a1, int a2, uint64_t a3, int a4, void ***this)
{
  if (a4 == 6)
  {
    wireless_diagnostics::google::protobuf::UnknownFieldSet::AddFixed64(this, a2, a3);
  }

  else if (a4 == 4)
  {
    wireless_diagnostics::google::protobuf::UnknownFieldSet::AddVarint(this, a2, a3);
  }

  else
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v5);
  }

void sub_187C53970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorBuilder::OptionInterpreter::SetAggregateOption( wireless_diagnostics::google::protobuf::DescriptorBuilder::OptionInterpreter *this, const wireless_diagnostics::google::protobuf::FieldDescriptor *a2, void ***a3)
{
  if ((*(_BYTE *)(*((void *)this + 2) + 92LL) & 0x40) == 0)
  {
    std::operator+<char>();
    uint64_t v5 = std::string::append(&v43, " is a message. To set the entire message, use syntax like ");
    __int128 v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
    v44.__r_.__value_.__l.__cap_ = v5->__r_.__value_.__l.__cap_;
    *(_OWORD *)&v44.__r_.__value_.__l.__data_ = v6;
    v5->__r_.__value_.__l.__size_ = 0LL;
    v5->__r_.__value_.__l.__cap_ = 0LL;
    v5->__r_.__value_.__r.__words[0] = 0LL;
    int v7 = *(char *)(*(void *)a2 + 23LL);
    if (v7 >= 0) {
      int v8 = *(const std::string::value_type **)a2;
    }
    else {
      int v8 = **(const std::string::value_type ***)a2;
    }
    if (v7 >= 0) {
      std::string::size_type v9 = *(unsigned __int8 *)(*(void *)a2 + 23LL);
    }
    else {
      std::string::size_type v9 = *(void *)(*(void *)a2 + 8LL);
    }
    int v10 = std::string::append(&v44, v8, v9);
    __int128 v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
    __str.__r_.__value_.__l.__cap_ = v10->__r_.__value_.__l.__cap_;
    *(_OWORD *)&__str.__r_.__value_.__l.__data_ = v11;
    v10->__r_.__value_.__l.__size_ = 0LL;
    v10->__r_.__value_.__l.__cap_ = 0LL;
    v10->__r_.__value_.__r.__words[0] = 0LL;
    uint64_t v12 = std::string::append(&__str, " = { <proto text format> }. To set fields within it, use syntax like ");
    __int128 v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
    v38.__r_.__value_.__l.__cap_ = v12->__r_.__value_.__l.__cap_;
    *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v13;
    v12->__r_.__value_.__l.__size_ = 0LL;
    v12->__r_.__value_.__l.__cap_ = 0LL;
    v12->__r_.__value_.__r.__words[0] = 0LL;
    int v14 = *(char *)(*(void *)a2 + 23LL);
    if (v14 >= 0) {
      uint64_t v15 = *(const std::string::value_type **)a2;
    }
    else {
      uint64_t v15 = **(const std::string::value_type ***)a2;
    }
    if (v14 >= 0) {
      std::string::size_type v16 = *(unsigned __int8 *)(*(void *)a2 + 23LL);
    }
    else {
      std::string::size_type v16 = *(void *)(*(void *)a2 + 8LL);
    }
    uint64_t v17 = std::string::append(&v38, v15, v16);
    __int128 v18 = *(_OWORD *)&v17->__r_.__value_.__l.__data_;
    v39.__r_.__value_.__l.__cap_ = v17->__r_.__value_.__l.__cap_;
    *(_OWORD *)&v39.__r_.__value_.__l.__data_ = v18;
    v17->__r_.__value_.__l.__size_ = 0LL;
    v17->__r_.__value_.__l.__cap_ = 0LL;
    v17->__r_.__value_.__r.__words[0] = 0LL;
    uint64_t v19 = std::string::append(&v39, ".foo = value.");
    __int128 v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
    std::string::size_type cap = v19->__r_.__value_.__l.__cap_;
    *(_OWORD *)std::string __p = v20;
    v19->__r_.__value_.__l.__size_ = 0LL;
    v19->__r_.__value_.__l.__cap_ = 0LL;
    v19->__r_.__value_.__r.__words[0] = 0LL;
    wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( *(void *)this,  *((void *)this + 1) + 24LL,  *((void *)this + 2),  8LL,  (uint64_t)__p);
    if (SHIBYTE(cap) < 0) {
      operator delete(__p[0]);
    }
    return 0LL;
  }

  Prototype = wireless_diagnostics::google::protobuf::DynamicMessageFactory::GetPrototype( (wireless_diagnostics::google::protobuf::DescriptorBuilder::OptionInterpreter *)((char *)this + 24),  *((const wireless_diagnostics::google::protobuf::Descriptor **)a2 + 9));
  unint64_t v24 = (wireless_diagnostics::google::protobuf::Message *)(*(uint64_t (**)(void *))(*(void *)Prototype
                                                                                             + 24LL))(Prototype);
  if (!v24)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::FieldDescriptor::DebugString(a2, &v39);
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)__p);
  }

  v39.__r_.__value_.__r.__words[0] = (std::string::size_type)off_18A11B310;
  *(_OWORD *)&v39.__r_.__value_.__r.__words[1] = 0uLL;
  uint64_t v40 = 0LL;
  std::string::size_type v25 = *(void *)this;
  v43.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_18A11B358;
  v43.__r_.__value_.__l.__size_ = v25;
  wireless_diagnostics::google::protobuf::TextFormat::Parser::Parser((uint64_t)&v38);
  v38.__r_.__value_.__r.__words[0] = (std::string::size_type)&v39;
  v38.__r_.__value_.__l.__size_ = (std::string::size_type)&v43;
  uint64_t v21 = wireless_diagnostics::google::protobuf::TextFormat::Parser::ParseFromString( (uint64_t)&v38,  *(const void ***)(*((void *)this + 2) + 80LL),  v24);
  if ((v21 & 1) != 0)
  {
    memset(&__str, 0, sizeof(__str));
    wireless_diagnostics::google::protobuf::MessageLite::SerializeToString();
    int v26 = *((_DWORD *)a2 + 11);
    if (v26 == 11)
    {
      __int128 v27 = (std::string *)wireless_diagnostics::google::protobuf::UnknownFieldSet::AddLengthDelimited( a3,  *((_DWORD *)a2 + 10));
      std::string::operator=(v27, &__str);
    }

    else
    {
      if (v26 != 10)
      {
        wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
        wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
        wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
        wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)__p);
      }

      uint64_t v35 = (uint64_t **)wireless_diagnostics::google::protobuf::UnknownFieldSet::AddGroup(a3, *((_DWORD *)a2 + 10));
      if ((__str.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        p_str = &__str;
      }
      else {
        p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
      }
      wireless_diagnostics::google::protobuf::UnknownFieldSet::ParseFromArray(v35, p_str);
    }

    uint64_t v34 = (void *)__str.__r_.__value_.__r.__words[0];
  }

  else
  {
    std::operator+<char>();
    int v28 = std::string::append(&v44, ": ");
    __int128 v29 = *(_OWORD *)&v28->__r_.__value_.__l.__data_;
    __str.__r_.__value_.__l.__cap_ = v28->__r_.__value_.__l.__cap_;
    *(_OWORD *)&__str.__r_.__value_.__l.__data_ = v29;
    v28->__r_.__value_.__l.__size_ = 0LL;
    v28->__r_.__value_.__l.__cap_ = 0LL;
    v28->__r_.__value_.__r.__words[0] = 0LL;
    if (v40 >= 0) {
      std::string::size_type size = &v39.__r_.__value_.__s.__data_[8];
    }
    else {
      std::string::size_type size = (const std::string::value_type *)v39.__r_.__value_.__l.__size_;
    }
    if (v40 >= 0) {
      std::string::size_type v31 = HIBYTE(v40);
    }
    else {
      std::string::size_type v31 = v39.__r_.__value_.__l.__cap_;
    }
    uint64_t v32 = std::string::append(&__str, size, v31);
    __int128 v33 = *(_OWORD *)&v32->__r_.__value_.__l.__data_;
    std::string::size_type cap = v32->__r_.__value_.__l.__cap_;
    *(_OWORD *)std::string __p = v33;
    v32->__r_.__value_.__l.__size_ = 0LL;
    v32->__r_.__value_.__l.__cap_ = 0LL;
    v32->__r_.__value_.__r.__words[0] = 0LL;
    wireless_diagnostics::google::protobuf::DescriptorBuilder::AddError( *(void *)this,  *((void *)this + 1) + 24LL,  *((void *)this + 2),  8LL,  (uint64_t)__p);
    if (SHIBYTE(cap) < 0) {
      operator delete(__p[0]);
    }
    uint64_t v34 = (void *)v44.__r_.__value_.__r.__words[0];
  }

  operator delete(v34);
LABEL_55:
  wireless_diagnostics::google::protobuf::TextFormat::Parser::~Parser((wireless_diagnostics::google::protobuf::TextFormat::Parser *)&v38);
  wireless_diagnostics::google::protobuf::TextFormat::Finder::~Finder((wireless_diagnostics::google::protobuf::TextFormat::Finder *)&v43);
  v39.__r_.__value_.__r.__words[0] = (std::string::size_type)off_18A11B310;
  if (SHIBYTE(v40) < 0) {
    operator delete((void *)v39.__r_.__value_.__l.__size_);
  }
  wireless_diagnostics::google::protobuf::io::ErrorCollector::~ErrorCollector((wireless_diagnostics::google::protobuf::io::ErrorCollector *)&v39);
  if (v24) {
    (*(void (**)(wireless_diagnostics::google::protobuf::Message *))(*(void *)v24 + 8LL))(v24);
  }
  return v21;
}

void sub_187C53E04( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20, char a21, uint64_t a22, void *a23, uint64_t a24, int a25, __int16 a26, char a27, char a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, void *a33, uint64_t a34, int a35, __int16 a36, char a37, char a38)
{
  if (v38) {
    (*(void (**)(uint64_t))(*(void *)v38 + 8LL))(v38);
  }
  _Unwind_Resume(a1);
}

void wireless_diagnostics::google::protobuf::anonymous namespace'::AggregateErrorCollector::~AggregateErrorCollector( void **this)
{
  *this = off_18A11B310;
  wireless_diagnostics::google::protobuf::io::ErrorCollector::~ErrorCollector((wireless_diagnostics::google::protobuf::io::ErrorCollector *)this);
}

{
  void *v2;
  *this = off_18A11B310;
  wireless_diagnostics::google::protobuf::io::ErrorCollector::~ErrorCollector((wireless_diagnostics::google::protobuf::io::ErrorCollector *)this);
  operator delete(v2);
}

uint64_t std::__hash_table<wireless_diagnostics::google::protobuf::Descriptor const*,wireless_diagnostics::google::protobuf::hash<wireless_diagnostics::google::protobuf::Descriptor const*>,std::equal_to<wireless_diagnostics::google::protobuf::Descriptor const*>,std::allocator<wireless_diagnostics::google::protobuf::Descriptor const*>>::~__hash_table( uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      int v3 = (void *)*v2;
      operator delete(v2);
      unint64_t v2 = v3;
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

uint64_t std::__hash_table<std::string,wireless_diagnostics::google::protobuf::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table( uint64_t a1)
{
  unint64_t v2 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::string,wireless_diagnostics::google::protobuf::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__deallocate_node( int a1, void **__p)
{
  if (__p)
  {
    unint64_t v2 = __p;
    do
    {
      int v3 = (void **)*v2;
      operator delete(v2);
      unint64_t v2 = v3;
    }

    while (v3);
  }

_DWORD *wireless_diagnostics::google::protobuf::DescriptorPool::Tables::CheckPoint::CheckPoint( _DWORD *this, const wireless_diagnostics::google::protobuf::DescriptorPool::Tables *a2)
{
  uint64_t v2 = (*((void *)a2 + 17) - *((void *)a2 + 16)) >> 3;
  *this = (*((void *)a2 + 14) - *((void *)a2 + 13)) >> 3;
  this[1] = v2;
  uint64_t v3 = (*((void *)a2 + 23) - *((void *)a2 + 22)) >> 3;
  this[2] = (*((void *)a2 + 20) - *((void *)a2 + 19)) >> 3;
  this[3] = v3;
  uint64_t v4 = (*((void *)a2 + 45) - *((void *)a2 + 44)) >> 3;
  this[4] = (*((void *)a2 + 42) - *((void *)a2 + 41)) >> 3;
  this[5] = v4;
  this[6] = (*((void *)a2 + 48) - *((void *)a2 + 47)) >> 4;
  return this;
}

uint64_t **std::__hash_table<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::hash<char const*>,wireless_diagnostics::google::protobuf::streq,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::streq,wireless_diagnostics::google::protobuf::hash<char const*>,true>,std::allocator<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>>>::find<char const*>( void *a1, const char **a2)
{
  uint64_t v2 = *a2;
  char v3 = **a2;
  if (v3)
  {
    unint64_t v4 = 0LL;
    uint64_t v5 = (unsigned __int8 *)(v2 + 1);
    do
    {
      unint64_t v4 = 5 * v4 + v3;
      int v6 = *v5++;
      char v3 = v6;
    }

    while (v6);
  }

  else
  {
    unint64_t v4 = 0LL;
  }

  int8x8_t v7 = (int8x8_t)a1[1];
  if (!*(void *)&v7) {
    return 0LL;
  }
  uint8x8_t v8 = (uint8x8_t)vcnt_s8(v7);
  v8.i16[0] = vaddlv_u8(v8);
  unint64_t v9 = v8.u32[0];
  if (v8.u32[0] > 1uLL)
  {
    unint64_t v10 = v4;
    if (v4 >= *(void *)&v7) {
      unint64_t v10 = v4 % *(void *)&v7;
    }
  }

  else
  {
    unint64_t v10 = (*(void *)&v7 - 1LL) & v4;
  }

  __int128 v11 = *(uint64_t ****)(*a1 + 8 * v10);
  if (!v11) {
    return 0LL;
  }
  for (uint64_t i = *v11; i; uint64_t i = (uint64_t **)*i)
  {
    unint64_t v13 = (unint64_t)i[1];
    if (v4 == v13)
    {
    }

    else
    {
      if (v9 > 1)
      {
        if (v13 >= *(void *)&v7) {
          v13 %= *(void *)&v7;
        }
      }

      else
      {
        v13 &= *(void *)&v7 - 1LL;
      }

      if (v13 != v10) {
        return 0LL;
      }
    }
  }

  return i;
}

{
  const char *v2;
  char v3;
  unint64_t v4;
  unsigned __int8 *v5;
  int v6;
  int8x8_t v7;
  uint8x8_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t ***v11;
  uint64_t **i;
  unint64_t v13;
  uint64_t v2 = *a2;
  char v3 = **a2;
  if (v3)
  {
    unint64_t v4 = 0LL;
    uint64_t v5 = (unsigned __int8 *)(v2 + 1);
    do
    {
      unint64_t v4 = 5 * v4 + v3;
      int v6 = *v5++;
      char v3 = v6;
    }

    while (v6);
  }

  else
  {
    unint64_t v4 = 0LL;
  }

  int8x8_t v7 = (int8x8_t)a1[1];
  if (!*(void *)&v7) {
    return 0LL;
  }
  uint8x8_t v8 = (uint8x8_t)vcnt_s8(v7);
  v8.i16[0] = vaddlv_u8(v8);
  unint64_t v9 = v8.u32[0];
  if (v8.u32[0] > 1uLL)
  {
    unint64_t v10 = v4;
    if (v4 >= *(void *)&v7) {
      unint64_t v10 = v4 % *(void *)&v7;
    }
  }

  else
  {
    unint64_t v10 = (*(void *)&v7 - 1LL) & v4;
  }

  __int128 v11 = *(uint64_t ****)(*a1 + 8 * v10);
  if (!v11) {
    return 0LL;
  }
  for (uint64_t i = *v11; i; uint64_t i = (uint64_t **)*i)
  {
    unint64_t v13 = (unint64_t)i[1];
    if (v13 == v4)
    {
    }

    else
    {
      if (v9 > 1)
      {
        if (v13 >= *(void *)&v7) {
          v13 %= *(void *)&v7;
        }
      }

      else
      {
        v13 &= *(void *)&v7 - 1LL;
      }

      if (v13 != v10) {
        return 0LL;
      }
    }
  }

  return i;
}

void wireless_diagnostics::google::protobuf::internal::MutexLockMaybe::~MutexLockMaybe( wireless_diagnostics::google::protobuf::internal::Mutex **this)
{
  uint64_t v1 = *this;
  if (v1) {
    wireless_diagnostics::google::protobuf::internal::Mutex::Unlock(v1);
  }
}

uint64_t wireless_diagnostics::google::protobuf::anonymous namespace'::InitGeneratedPool( wireless_diagnostics::google::protobuf::_anonymous_namespace_ *this)
{
  uint64_t v1 = (wireless_diagnostics::google::protobuf::DescriptorDatabase *)operator new(0x68uLL);
  wireless_diagnostics::google::protobuf::EncodedDescriptorDatabase::EncodedDescriptorDatabase(v1);
  uint64_t v2 = (wireless_diagnostics::google::protobuf::DescriptorPool *)operator new(0x30uLL);
  wireless_diagnostics::google::protobuf::DescriptorPool::DescriptorPool(v2, v1, 0LL);
}

void sub_187C54294(_Unwind_Exception *a1)
{
}

void wireless_diagnostics::google::protobuf::anonymous namespace'::DeleteGeneratedPool( wireless_diagnostics::google::protobuf::_anonymous_namespace_ *this)
{
  {
    operator delete(v1);
  }
}

uint64_t *std::__tree<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::__map_value_compare<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::less<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>,true>,std::allocator<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>>>::find<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>( uint64_t a1, unint64_t *a2)
{
  unint64_t v4 = *(uint64_t **)(a1 + 8);
  uint64_t v2 = (uint64_t *)(a1 + 8);
  char v3 = v4;
  if (!v4) {
    return v2;
  }
  unint64_t v5 = *a2;
  int v6 = *((_DWORD *)a2 + 2);
  int8x8_t v7 = v2;
  do
  {
    unint64_t v8 = v3[4];
    if (v8 >= v5)
    {
      if (v5 >= v8)
      {
        if (*((_DWORD *)v3 + 10) < v6) {
          ++v3;
        }
        else {
          int8x8_t v7 = v3;
        }
      }

      else
      {
        int8x8_t v7 = v3;
      }
    }

    else
    {
      ++v3;
    }

    char v3 = (uint64_t *)*v3;
  }

  while (v3);
  if (v7 == v2) {
    return v2;
  }
  unint64_t v9 = v7[4];
  if (v5 < v9 || v9 >= v5 && v6 < *((_DWORD *)v7 + 10)) {
    return v2;
  }
  return v7;
}

uint64_t *wireless_diagnostics::google::protobuf::FindPtrOrNull<wireless_diagnostics::google::protobuf::hash_map<std::pair<void const*,char const*>,wireless_diagnostics::google::protobuf::FieldDescriptor const*,wireless_diagnostics::google::protobuf::anonymous namespace'::PointerStringPairHash,wireless_diagnostics::google::protobuf::anonymous namespace'::PointerStringPairEqual>>( void *a1, uint64_t *a2)
{
  uint64_t v2 = (const char *)a2[1];
  char v3 = *v2;
  if (*v2)
  {
    uint64_t v4 = 0LL;
    unint64_t v5 = (unsigned __int8 *)(v2 + 1);
    do
    {
      uint64_t v4 = 5 * v4 + v3;
      int v6 = *v5++;
      char v3 = v6;
    }

    while (v6);
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  int8x8_t v7 = (int8x8_t)a1[1];
  if (v7)
  {
    unint64_t v8 = (uint64_t *)*a2;
    unint64_t v9 = v4 - *a2 + (*a2 << 16);
    uint8x8_t v10 = (uint8x8_t)vcnt_s8(v7);
    v10.i16[0] = vaddlv_u8(v10);
    unint64_t v11 = v10.u32[0];
    if (v10.u32[0] > 1uLL)
    {
      uint64_t v12 = v4 - *a2 + (*a2 << 16);
      if (v9 >= *(void *)&v7) {
        uint64_t v12 = v9 % *(void *)&v7;
      }
    }

    else
    {
      uint64_t v12 = (*(void *)&v7 - 1LL) & v9;
    }

    unint64_t v13 = *(uint64_t ****)(*a1 + 8 * v12);
    if (v13)
    {
      for (uint64_t i = *v13; i; uint64_t i = (uint64_t **)*i)
      {
        unint64_t v15 = (unint64_t)i[1];
        if (v9 == v15)
        {
        }

        else
        {
          if (v11 > 1)
          {
            if (v15 >= *(void *)&v7) {
              v15 %= *(void *)&v7;
            }
          }

          else
          {
            v15 &= *(void *)&v7 - 1LL;
          }

          if (v15 != v12) {
            return 0LL;
          }
        }
      }
    }
  }

  return 0LL;
}

wireless_diagnostics::google::protobuf::DescriptorProto *wireless_diagnostics::google::protobuf::internal::GenericTypeHandler<wireless_diagnostics::google::protobuf::DescriptorProto>::New()
{
  v0 = (wireless_diagnostics::google::protobuf::DescriptorProto *)operator new(0xA0uLL);
  wireless_diagnostics::google::protobuf::DescriptorProto::DescriptorProto(v0);
  return v0;
}

void sub_187C544E4(_Unwind_Exception *a1)
{
}

wireless_diagnostics::google::protobuf::EnumDescriptorProto *wireless_diagnostics::google::protobuf::internal::GenericTypeHandler<wireless_diagnostics::google::protobuf::EnumDescriptorProto>::New()
{
  v0 = (wireless_diagnostics::google::protobuf::EnumDescriptorProto *)operator new(0x40uLL);
  wireless_diagnostics::google::protobuf::EnumDescriptorProto::EnumDescriptorProto(v0);
  return v0;
}

void sub_187C54524(_Unwind_Exception *a1)
{
}

wireless_diagnostics::google::protobuf::ServiceDescriptorProto *wireless_diagnostics::google::protobuf::internal::GenericTypeHandler<wireless_diagnostics::google::protobuf::ServiceDescriptorProto>::New()
{
  v0 = (wireless_diagnostics::google::protobuf::ServiceDescriptorProto *)operator new(0x40uLL);
  wireless_diagnostics::google::protobuf::ServiceDescriptorProto::ServiceDescriptorProto(v0);
  return v0;
}

void sub_187C54564(_Unwind_Exception *a1)
{
}

wireless_diagnostics::google::protobuf::FieldDescriptorProto *wireless_diagnostics::google::protobuf::internal::GenericTypeHandler<wireless_diagnostics::google::protobuf::FieldDescriptorProto>::New()
{
  v0 = (wireless_diagnostics::google::protobuf::FieldDescriptorProto *)operator new(0x50uLL);
  wireless_diagnostics::google::protobuf::FieldDescriptorProto::FieldDescriptorProto(v0);
  return v0;
}

void sub_187C545A4(_Unwind_Exception *a1)
{
}

wireless_diagnostics::google::protobuf::DescriptorProto_ExtensionRange *wireless_diagnostics::google::protobuf::internal::GenericTypeHandler<wireless_diagnostics::google::protobuf::DescriptorProto_ExtensionRange>::New()
{
  v0 = (wireless_diagnostics::google::protobuf::DescriptorProto_ExtensionRange *)operator new(0x20uLL);
  wireless_diagnostics::google::protobuf::DescriptorProto_ExtensionRange::DescriptorProto_ExtensionRange(v0);
  return v0;
}

void sub_187C545E4(_Unwind_Exception *a1)
{
}

wireless_diagnostics::google::protobuf::EnumValueDescriptorProto *wireless_diagnostics::google::protobuf::internal::GenericTypeHandler<wireless_diagnostics::google::protobuf::EnumValueDescriptorProto>::New()
{
  v0 = (wireless_diagnostics::google::protobuf::EnumValueDescriptorProto *)operator new(0x30uLL);
  wireless_diagnostics::google::protobuf::EnumValueDescriptorProto::EnumValueDescriptorProto(v0);
  return v0;
}

void sub_187C54624(_Unwind_Exception *a1)
{
}

wireless_diagnostics::google::protobuf::MethodDescriptorProto *wireless_diagnostics::google::protobuf::internal::GenericTypeHandler<wireless_diagnostics::google::protobuf::MethodDescriptorProto>::New()
{
  v0 = (wireless_diagnostics::google::protobuf::MethodDescriptorProto *)operator new(0x38uLL);
  wireless_diagnostics::google::protobuf::MethodDescriptorProto::MethodDescriptorProto(v0);
  return v0;
}

void sub_187C54664(_Unwind_Exception *a1)
{
}

BOOL wireless_diagnostics::google::protobuf::anonymous namespace'::RetrieveOptions( int a1, const wireless_diagnostics::google::protobuf::Message *a2, uint64_t a3)
{
  v54[2] = *MEMORY[0x1895F89C0];
  std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)a3);
  uint64_t v6 = (*(uint64_t (**)(const wireless_diagnostics::google::protobuf::Message *))(*(void *)a2 + 144LL))(a2);
  __int128 v49 = 0LL;
  int v50 = 0LL;
  uint64_t v51 = 0LL;
  uint64_t v44 = v6;
  int8x8_t v7 = a2;
  (*(void (**)(uint64_t, const wireless_diagnostics::google::protobuf::Message *, void **))(*(void *)v6 + 96LL))( v6,  a2,  &v49);
  unint64_t v8 = v50;
  if (v50 != v49)
  {
    unint64_t v9 = 0LL;
    int v46 = a1 + 1;
    std::string::size_type __n = 2 * a1;
    unint64_t v8 = v49;
    while (1)
    {
      int v10 = *(_DWORD *)(v8[v9] + 48LL);
      if (v10 != 3) {
        break;
      }
      int v11 = (*(uint64_t (**)(uint64_t, const wireless_diagnostics::google::protobuf::Message *))(*(void *)v44 + 48LL))( v44,  v7);
      if (v11 >= 1) {
        goto LABEL_7;
      }
LABEL_66:
      ++v9;
      unint64_t v8 = v49;
      if (v9 >= v50 - v49) {
        goto LABEL_67;
      }
    }

    int v11 = 1;
LABEL_7:
    for (unsigned int i = 0; i != v11; ++i)
    {
      memset(&v48, 0, sizeof(v48));
      unint64_t v13 = (const wireless_diagnostics::google::protobuf::FieldDescriptor *)v49[v9];
      if ((*((_DWORD *)v13 + 11) & 0xFFFFFFFE) == 0xA)
      {
        memset(&__p, 0, 24);
        wireless_diagnostics::google::protobuf::TextFormat::Printer::Printer(&v47);
        LODWORD(v47.__r_.__value_.__l.__data_) = v46;
        if (v10 == 3) {
          uint64_t v14 = i;
        }
        else {
          uint64_t v14 = 0xFFFFFFFFLL;
        }
        wireless_diagnostics::google::protobuf::TextFormat::Printer::PrintFieldValueToString( (int *)&v47,  v7,  (const wireless_diagnostics::google::protobuf::FieldDescriptor *)v49[v9],  v14,  (uint64_t)&__p);
        std::string::append(&v48, "{\n");
        if (SHIBYTE(__p.__end_) >= 0) {
          std::__split_buffer<std::string>::pointer p_p = (std::__split_buffer<std::string>::pointer)&__p;
        }
        else {
          std::__split_buffer<std::string>::pointer p_p = __p.__first_;
        }
        if (SHIBYTE(__p.__end_) >= 0) {
          std::string::size_type end_high = HIBYTE(__p.__end_);
        }
        else {
          std::string::size_type end_high = (std::string::size_type)__p.__begin_;
        }
        std::string::append(&v48, (const std::string::value_type *)p_p, end_high);
        std::string::append(&v48, __n, 32);
        std::string::append(&v48, "}");
        wireless_diagnostics::google::protobuf::TextFormat::Printer::~Printer((wireless_diagnostics::google::protobuf::TextFormat::Printer *)&v47);
        if (SHIBYTE(__p.__end_) < 0) {
          operator delete(__p.__first_);
        }
      }

      else
      {
        if (v10 == 3) {
          uint64_t v17 = i;
        }
        else {
          uint64_t v17 = 0xFFFFFFFFLL;
        }
        wireless_diagnostics::google::protobuf::TextFormat::PrintFieldValueToString(v7, v13, v17, (uint64_t)&v48);
      }

      memset(&v47, 0, sizeof(v47));
      uint64_t v18 = v49[v9];
      if (*(_BYTE *)(v18 + 52))
      {
        std::operator+<char>();
        uint64_t v19 = std::string::append((std::string *)&__p, ")");
        std::string::size_type v20 = v19->__r_.__value_.__r.__words[0];
        v53.__r_.__value_.__r.__words[0] = v19->__r_.__value_.__l.__size_;
        *(std::string::size_type *)((char *)v53.__r_.__value_.__r.__words + 7) = *(std::string::size_type *)((char *)&v19->__r_.__value_.__r.__words[1] + 7);
        unsigned __int8 size = v19->__r_.__value_.__s.__size_;
        v19->__r_.__value_.__l.__size_ = 0LL;
        v19->__r_.__value_.__l.__cap_ = 0LL;
        v19->__r_.__value_.__r.__words[0] = 0LL;
        v47.__r_.__value_.__r.__words[0] = v20;
        v47.__r_.__value_.__l.__size_ = v53.__r_.__value_.__r.__words[0];
        *(std::string::size_type *)((char *)&v47.__r_.__value_.__r.__words[1] + 7) = *(std::string::size_type *)((char *)v53.__r_.__value_.__r.__words + 7);
        v47.__r_.__value_.__s.__size_ = size;
        if (SHIBYTE(__p.__end_) < 0) {
          operator delete(__p.__first_);
        }
      }

      else
      {
        std::string::operator=(&v47, *(const std::string **)v18);
      }

      if ((v47.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        size_t v22 = v47.__r_.__value_.__s.__size_;
      }
      else {
        size_t v22 = v47.__r_.__value_.__l.__size_;
      }
      std::string::basic_string[abi:ne180100]((uint64_t)&v53, v22 + 3);
      if ((v53.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        int v23 = &v53;
      }
      else {
        int v23 = (std::string *)v53.__r_.__value_.__r.__words[0];
      }
      if (v22)
      {
        if ((v47.__r_.__value_.__s.__size_ & 0x80u) == 0) {
          unint64_t v24 = &v47;
        }
        else {
          unint64_t v24 = (std::string *)v47.__r_.__value_.__r.__words[0];
        }
        memmove(v23, v24, v22);
      }

      *(_DWORD *)((char *)&v23->__r_.__value_.__l.__data_ + v22) = 2112800;
      if ((v48.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        std::string::size_type v25 = &v48;
      }
      else {
        std::string::size_type v25 = (std::string *)v48.__r_.__value_.__r.__words[0];
      }
      if ((v48.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        std::string::size_type v26 = v48.__r_.__value_.__s.__size_;
      }
      else {
        std::string::size_type v26 = v48.__r_.__value_.__l.__size_;
      }
      __int128 v27 = std::string::append(&v53, (const std::string::value_type *)v25, v26);
      std::string::size_type v28 = v27->__r_.__value_.__r.__words[0];
      v54[0] = v27->__r_.__value_.__l.__size_;
      *(void *)((char *)v54 + 7) = *(std::string::size_type *)((char *)&v27->__r_.__value_.__r.__words[1] + 7);
      unsigned __int8 v29 = v27->__r_.__value_.__s.__size_;
      v27->__r_.__value_.__l.__size_ = 0LL;
      v27->__r_.__value_.__l.__cap_ = 0LL;
      v27->__r_.__value_.__r.__words[0] = 0LL;
      unint64_t v30 = *(void *)(a3 + 8);
      unint64_t v31 = *(void *)(a3 + 16);
      if (v30 >= v31)
      {
        unint64_t v34 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v30 - *(void *)a3) >> 3);
        unint64_t v35 = v34 + 1;
        if (v34 + 1 > 0xAAAAAAAAAAAAAAALL) {
          std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v36 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v31 - *(void *)a3) >> 3);
        if (2 * v36 > v35) {
          unint64_t v35 = 2 * v36;
        }
        if (v36 >= 0x555555555555555LL) {
          unint64_t v37 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v37 = v35;
        }
        __p.__end_cap_.__value_ = (std::allocator<std::string> *)(a3 + 16);
        if (v37) {
          uint64_t v38 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(a3 + 16, v37);
        }
        else {
          uint64_t v38 = 0LL;
        }
        uint64_t v39 = v38 + v34;
        __p.__first_ = v38;
        __p.__begin_ = v39;
        __p.__end_cap_.__value_ = &v38[v37];
        std::string::size_type v40 = v54[0];
        v39->__r_.__value_.__r.__words[0] = v28;
        v39->__r_.__value_.__l.__size_ = v40;
        *(std::string::size_type *)((char *)&v39->__r_.__value_.__r.__words[1] + 7) = *(void *)((char *)v54 + 7);
        v39->__r_.__value_.__s.__size_ = v29;
        __p.__end_ = v39 + 1;
        std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a3, &__p);
        unint64_t v33 = *(void *)(a3 + 8);
        std::__split_buffer<std::string>::~__split_buffer(&__p);
      }

      else
      {
        uint64_t v32 = v54[0];
        *(void *)unint64_t v30 = v28;
        *(void *)(v30 + 8) = v32;
        *(void *)(v30 + 15) = *(void *)((char *)v54 + 7);
        *(_BYTE *)(v30 + 23) = v29;
        unint64_t v33 = v30 + 24;
        *(void *)(a3 + 8) = v30 + 24;
      }

      *(void *)(a3 + 8) = v33;
    }

    goto LABEL_66;
  }

void sub_187C54B20( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20, uint64_t a21, int a22, __int16 a23, char a24, char a25, void *__p, uint64_t a27, uint64_t a28, std::__split_buffer<std::string> *a29)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<std::string>::__swap_out_circular_buffer( std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  __v->__begin_ = v4;
  begin = this->__begin_;
  this->__begin_ = v4;
  __v->__begin_ = begin;
  end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&__int128 v15 = a6;
  *((void *)&v15 + 1) = a7;
  __int128 v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 != a5)
  {
    uint64_t v9 = a7;
    do
    {
      __int128 v10 = *(_OWORD *)(a3 - 24);
      *(void *)(v9 - 8) = *(void *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24LL;
      *(void *)(a3 - 16) = 0LL;
      *(void *)(a3 - 8) = 0LL;
      *(void *)(a3 - 24) = 0LL;
      v7 -= 24LL;
      a3 -= 24LL;
    }

    while (a3 != a5);
    *((void *)&v15 + 1) = v9;
  }

  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100]( uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100]( uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8LL);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8LL);
  while (v1 != v2)
  {
    v1 += 24LL;
  }

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  if (this->__first_) {
    operator delete(this->__first_);
  }
}

void std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      unint64_t v5 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        unint64_t v5 = *(void ***)(a1 + 16);
      }

      uint64_t v2 = v5;
    }

    while (v5 != a2);
  }

uint64_t wireless_diagnostics::google::protobuf::DescriptorBuilder::FindSymbol(uint64_t a1, std::string *a2)
{
  unint64_t SymbolNotEnforcingDepsHelper = wireless_diagnostics::google::protobuf::DescriptorBuilder::FindSymbolNotEnforcingDepsHelper( (wireless_diagnostics::google::protobuf::internal::Mutex ***)a1,  *(wireless_diagnostics::google::protobuf::internal::Mutex ***)a1,  a2);
  unint64_t v6 = SymbolNotEnforcingDepsHelper;
  if ((_DWORD)SymbolNotEnforcingDepsHelper && *(_BYTE *)(*(void *)a1 + 40LL))
  {
    uint64_t v7 = v5;
    switch((int)SymbolNotEnforcingDepsHelper)
    {
      case 1:
      case 3:
      case 5:
        unint64_t v8 = v5 + 2;
        goto LABEL_10;
      case 2:
        unint64_t v8 = v5 + 4;
        goto LABEL_10;
      case 4:
        uint64_t v9 = v5[3];
        goto LABEL_9;
      case 6:
        uint64_t v9 = v5[2];
LABEL_9:
        unint64_t v8 = (void *)(v9 + 16);
LABEL_10:
        uint64_t v7 = (void *)*v8;
        break;
      case 7:
        break;
      default:
        uint64_t v7 = 0LL;
        break;
    }

    uint64_t v10 = *(void *)(a1 + 80);
    if (v7 != (void *)v10)
    {
      uint64_t v12 = (void *)(a1 + 104);
      for (unsigned int i = *(void **)(a1 + 104); i; unsigned int i = (void *)*i)
      {
        unint64_t v13 = i[4];
        if ((unint64_t)v7 >= v13)
        {
          ++i;
        }
      }

      if ((_DWORD)SymbolNotEnforcingDepsHelper != 7) {
        goto LABEL_28;
      }
      BOOL v14 = wireless_diagnostics::google::protobuf::DescriptorBuilder::IsInPackage( SymbolNotEnforcingDepsHelper,  v10,  (const void **)&a2->__r_.__value_.__l.__data_);
      if (v14) {
        return v6;
      }
      __int128 v15 = *(void **)(a1 + 96);
      if (v15 == v12)
      {
LABEL_28:
        *(void *)(a1 + 120) = v7;
        std::string::operator=((std::string *)(a1 + 128), a2);
      }

      while (1)
      {
        uint64_t v16 = v15[4];
        if (v16)
        {
          LOBYTE(v14) = wireless_diagnostics::google::protobuf::DescriptorBuilder::IsInPackage( v14,  v16,  (const void **)&a2->__r_.__value_.__l.__data_);
          if (v14) {
            break;
          }
        }

        uint64_t v17 = (void *)v15[1];
        if (v17)
        {
          do
          {
            uint64_t v18 = v17;
            uint64_t v17 = (void *)*v17;
          }

          while (v17);
        }

        else
        {
          do
          {
            uint64_t v18 = (void *)v15[2];
            BOOL v19 = *v18 == (void)v15;
            __int128 v15 = v18;
          }

          while (!v19);
        }

        __int128 v15 = v18;
        if (v18 == v12) {
          goto LABEL_28;
        }
      }
    }
  }

  return v6;
}

unint64_t wireless_diagnostics::google::protobuf::DescriptorBuilder::FindSymbolNotEnforcingDepsHelper( wireless_diagnostics::google::protobuf::internal::Mutex ***a1, wireless_diagnostics::google::protobuf::internal::Mutex **a2, std::string *a3)
{
  if (*a1 == a2)
  {
    unint64_t v37 = 0LL;
  }

  else
  {
    unint64_t v6 = *a2;
    unint64_t v37 = v6;
    if (v6) {
      wireless_diagnostics::google::protobuf::internal::Mutex::Lock(v6);
    }
  }

  uint64_t v7 = (int8x8_t *)a2[4];
  if ((a3->__r_.__value_.__s.__size_ & 0x80u) == 0) {
    unint64_t v8 = (const char *)a3;
  }
  else {
    unint64_t v8 = (const char *)a3->__r_.__value_.__r.__words[0];
  }
  char v9 = *v8;
  if (*v8)
  {
    unint64_t v10 = 0LL;
    int v11 = (unsigned __int8 *)(v8 + 1);
    do
    {
      unint64_t v10 = 5 * v10 + v9;
      int v12 = *v11++;
      char v9 = v12;
    }

    while (v12);
  }

  else
  {
    unint64_t v10 = 0LL;
  }

  int8x8_t v13 = v7[26];
  if (!*(void *)&v13)
  {
LABEL_29:
    uint64_t v17 = 0LL;
    goto LABEL_30;
  }

  uint8x8_t v14 = (uint8x8_t)vcnt_s8(v13);
  v14.i16[0] = vaddlv_u8(v14);
  unint64_t v15 = v14.u32[0];
  if (v14.u32[0] > 1uLL)
  {
    unint64_t v16 = v10;
    if (v10 >= *(void *)&v13) {
      unint64_t v16 = v10 % *(void *)&v13;
    }
  }

  else
  {
    unint64_t v16 = (*(void *)&v13 - 1LL) & v10;
  }

  uint64_t v17 = *(uint64_t **)(*(void *)&v7[25] + 8 * v16);
  if (v17)
  {
    uint64_t v18 = *v17;
    if (*v17)
    {
      while (1)
      {
        unint64_t v19 = *(void *)(v18 + 8);
        if (v10 == v19)
        {
          if (!strcmp(*(const char **)(v18 + 16), v8))
          {
            uint64_t v17 = (uint64_t *)(v18 + 24);
            goto LABEL_30;
          }
        }

        else
        {
          if (v15 > 1)
          {
            if (v19 >= *(void *)&v13) {
              v19 %= *(void *)&v13;
            }
          }

          else
          {
            v19 &= *(void *)&v13 - 1LL;
          }

          if (v19 != v16) {
            goto LABEL_29;
          }
        }

        uint64_t v18 = *(void *)v18;
        if (!v18) {
          goto LABEL_29;
        }
      }
    }

    goto LABEL_29;
  }

LABEL_30:
  if (!v17) {
  uint64_t v20 = *v17;
  }
  unint64_t v21 = HIDWORD(*v17);
  if (!*v17)
  {
    int v23 = a2[3];
    if (!v23
      || (SymbolNotEnforcingDepsHelper = wireless_diagnostics::google::protobuf::DescriptorBuilder::FindSymbolNotEnforcingDepsHelper( a1,  v23,  a3),  LODWORD(v20) = SymbolNotEnforcingDepsHelper,  unint64_t v21 = HIDWORD(SymbolNotEnforcingDepsHelper),  !(_DWORD)SymbolNotEnforcingDepsHelper))
    {
      if (!wireless_diagnostics::google::protobuf::DescriptorPool::TryFindSymbolInFallbackDatabase( (wireless_diagnostics::google::protobuf::DescriptorPool *)a2,  a3))
      {
        LODWORD(v20) = 0;
        goto LABEL_33;
      }

      std::string::size_type v25 = (int8x8_t *)a2[4];
      if ((a3->__r_.__value_.__s.__size_ & 0x80u) != 0) {
        a3 = (std::string *)a3->__r_.__value_.__r.__words[0];
      }
      std::string::value_type v26 = a3->__r_.__value_.__s.__data_[0];
      if (a3->__r_.__value_.__s.__data_[0])
      {
        unint64_t v27 = 0LL;
        std::string::size_type v28 = &a3->__r_.__value_.__s.__data_[1];
        do
        {
          unint64_t v27 = 5 * v27 + v26;
          int v29 = *v28++;
          std::string::value_type v26 = v29;
        }

        while (v29);
      }

      else
      {
        unint64_t v27 = 0LL;
      }

      int8x8_t v30 = v25[26];
      if (v30)
      {
        uint8x8_t v31 = (uint8x8_t)vcnt_s8(v30);
        v31.i16[0] = vaddlv_u8(v31);
        unint64_t v32 = v31.u32[0];
        if (v31.u32[0] > 1uLL)
        {
          unint64_t v33 = v27;
          if (v27 >= *(void *)&v30) {
            unint64_t v33 = v27 % *(void *)&v30;
          }
        }

        else
        {
          unint64_t v33 = (*(void *)&v30 - 1LL) & v27;
        }

        unint64_t v34 = *(uint64_t **)(*(void *)&v25[25] + 8 * v33);
        if (!v34) {
          goto LABEL_62;
        }
        for (uint64_t i = *v34; i; uint64_t i = *(void *)i)
        {
          unint64_t v36 = *(void *)(i + 8);
          if (v27 == v36)
          {
            if (!strcmp(*(const char **)(i + 16), (const char *)a3))
            {
              unint64_t v34 = (uint64_t *)(i + 24);
              goto LABEL_62;
            }
          }

          else
          {
            if (v32 > 1)
            {
              if (v36 >= *(void *)&v30) {
                v36 %= *(void *)&v30;
              }
            }

            else
            {
              v36 &= *(void *)&v30 - 1LL;
            }

            if (v36 != v33) {
              break;
            }
          }
        }
      }

      unint64_t v34 = 0LL;
LABEL_62:
      if (!v34) {
      uint64_t v20 = *v34;
      }
      unint64_t v21 = HIDWORD(*v34);
    }
  }

LABEL_33:
  wireless_diagnostics::google::protobuf::internal::MutexLockMaybe::~MutexLockMaybe(&v37);
  return v20 | ((unint64_t)v21 << 32);
}

void sub_187C5528C(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

std::string *wireless_diagnostics::google::protobuf::anonymous namespace'::AggregateErrorCollector::AddError( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v5 = (std::string *)(a1 + 8);
  if ((*(char *)(a1 + 31) & 0x80000000) == 0)
  {
    if (!*(_BYTE *)(a1 + 31)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  if (*(void *)(a1 + 16)) {
LABEL_3:
  }
    std::string::append((std::string *)(a1 + 8), "; ");
LABEL_4:
  int v6 = *(char *)(a4 + 23);
  if (v6 >= 0) {
    uint64_t v7 = (const std::string::value_type *)a4;
  }
  else {
    uint64_t v7 = *(const std::string::value_type **)a4;
  }
  if (v6 >= 0) {
    std::string::size_type v8 = *(unsigned __int8 *)(a4 + 23);
  }
  else {
    std::string::size_type v8 = *(void *)(a4 + 8);
  }
  return std::string::append(v5, v7, v8);
}

void wireless_diagnostics::google::protobuf::DescriptorBuilder::OptionInterpreter::AggregateOptionFinder::~AggregateOptionFinder( wireless_diagnostics::google::protobuf::DescriptorBuilder::OptionInterpreter::AggregateOptionFinder *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorBuilder::OptionInterpreter::AggregateOptionFinder::FindExtension( uint64_t a1, uint64_t a2, std::string *a3)
{
  int v6 = ***(wireless_diagnostics::google::protobuf::internal::Mutex ****)(a1 + 8);
  if (v6) {
    wireless_diagnostics::google::protobuf::internal::Mutex::AssertHeld(v6);
  }
  uint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 152LL))(a2);
  int v8 = wireless_diagnostics::google::protobuf::DescriptorBuilder::LookupSymbolNoPlaceholder( *(void *)(a1 + 8),  a3,  *(void *)(v7 + 8),  0);
  if (v8 == 1)
  {
    if (!*(_BYTE *)(*(void *)(v7 + 32) + 64LL)) {
      return 0LL;
    }
    uint64_t v11 = *(unsigned int *)(v9 + 104);
    for (uint64_t result = *(void *)(v9 + 112);
          *(void *)(result + 56) != v7
       || *(_DWORD *)(result + 44) != 11
       || *(_DWORD *)(result + 48) != 1
       || *(void *)(result + 72) != v9;
          result += 120LL)
    {
      if (!--v11) {
        return 0LL;
      }
    }
  }

  else
  {
    if (v8 != 2) {
      return 0LL;
    }
    uint64_t result = v9;
    if (!*(_BYTE *)(v9 + 52)) {
      return 0LL;
    }
  }

  return result;
}

void std::__tree<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::__map_value_compare<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::less<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>,true>,std::allocator<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>>>::destroy( uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::__map_value_compare<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::less<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>,true>,std::allocator<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>>>::destroy( a1,  *a2);
    std::__tree<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::__map_value_compare<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::less<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>,true>,std::allocator<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>>>::destroy( a1,  a2[1]);
    operator delete(a2);
  }

void *std::__allocate_at_least[abi:ne180100]<std::allocator<wireless_diagnostics::google::protobuf::DescriptorPool::Tables::CheckPoint>>( uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x924924924924925LL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(28 * a2);
}

uint64_t *std::__hash_table<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::hash<char const*>,wireless_diagnostics::google::protobuf::streq,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::streq,wireless_diagnostics::google::protobuf::hash<char const*>,true>,std::allocator<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>>>::__erase_unique<char const*>( void *a1, const char **a2)
{
  uint64_t result = (uint64_t *)std::__hash_table<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::hash<char const*>,wireless_diagnostics::google::protobuf::streq,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::streq,wireless_diagnostics::google::protobuf::hash<char const*>,true>,std::allocator<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>>>::find<char const*>( a1,  a2);
  if (result)
  {
    std::__hash_table<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::hash<char const*>,wireless_diagnostics::google::protobuf::streq,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::streq,wireless_diagnostics::google::protobuf::hash<char const*>,true>,std::allocator<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>>>::erase( a1,  result);
    return (uint64_t *)1;
  }

  return result;
}

uint64_t std::__hash_table<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::hash<char const*>,wireless_diagnostics::google::protobuf::streq,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::streq,wireless_diagnostics::google::protobuf::hash<char const*>,true>,std::allocator<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>>>::erase( void *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  std::__hash_table<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::hash<char const*>,wireless_diagnostics::google::protobuf::streq,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::streq,wireless_diagnostics::google::protobuf::hash<char const*>,true>,std::allocator<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>>>::remove( a1,  a2,  (uint64_t)&__p);
  char v3 = __p;
  std::__split_buffer<std::string> __p = 0LL;
  if (v3) {
    operator delete(v3);
  }
  return v2;
}

void *std::__hash_table<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::hash<char const*>,wireless_diagnostics::google::protobuf::streq,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::streq,wireless_diagnostics::google::protobuf::hash<char const*>,true>,std::allocator<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>>>::remove@<X0>( void *result@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
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

  int v6 = *(void **)(*result + 8 * v4);
  do
  {
    uint64_t v7 = v6;
    int v6 = (void *)*v6;
  }

  while (v6 != a2);
  if (v7 == result + 2) {
    goto LABEL_18;
  }
  unint64_t v8 = v7[1];
  if (v5.u32[0] > 1uLL)
  {
    if (v8 >= *(void *)&v3) {
      v8 %= *(void *)&v3;
    }
  }

  else
  {
    v8 &= *(void *)&v3 - 1LL;
  }

  if (v8 != v4)
  {
LABEL_18:
    if (!*a2) {
      goto LABEL_19;
    }
    unint64_t v9 = *(void *)(*a2 + 8LL);
    if (v5.u32[0] > 1uLL)
    {
      if (v9 >= *(void *)&v3) {
        v9 %= *(void *)&v3;
      }
    }

    else
    {
      v9 &= *(void *)&v3 - 1LL;
    }

    if (v9 != v4) {
LABEL_19:
    }
      *(void *)(*result + 8 * v4) = 0LL;
  }

  uint64_t v10 = *a2;
  if (*a2)
  {
    unint64_t v11 = *(void *)(v10 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v11 >= *(void *)&v3) {
        v11 %= *(void *)&v3;
      }
    }

    else
    {
      v11 &= *(void *)&v3 - 1LL;
    }

    if (v11 != v4)
    {
      *(void *)(*result + 8 * v11) = v7;
      uint64_t v10 = *a2;
    }
  }

  *uint64_t v7 = v10;
  *a2 = 0LL;
  --result[3];
  *(void *)a3 = a2;
  *(void *)(a3 + 8) = result + 2;
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

uint64_t std::__tree<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::__map_value_compare<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::less<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>,true>,std::allocator<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>>>::__erase_unique<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>( uint64_t **a1, unint64_t *a2)
{
  int8x8_t v3 = std::__tree<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::__map_value_compare<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::less<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>,true>,std::allocator<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>>>::find<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>( (uint64_t)a1,  a2);
  unint64_t v4 = v3;
  std::__tree<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::__map_value_compare<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::less<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>,true>,std::allocator<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>>>::__remove_node_pointer( a1,  v3);
  operator delete(v4);
  return 1LL;
}

uint64_t *std::__tree<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::__map_value_compare<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::less<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>,true>,std::allocator<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>>>::__remove_node_pointer( uint64_t **a1, uint64_t *a2)
{
  uint64_t v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      int8x8_t v3 = v2;
      uint64_t v2 = (uint64_t *)*v2;
    }

    while (v2);
  }

  else
  {
    unint64_t v4 = a2;
    do
    {
      int8x8_t v3 = (uint64_t *)v4[2];
      BOOL v5 = *v3 == (void)v4;
      unint64_t v4 = v3;
    }

    while (!v5);
  }

  if (*a1 == a2) {
    *a1 = v3;
  }
  int v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

uint64_t *std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  int8x8_t v3 = a2;
  if (*a2)
  {
    unint64_t v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      int8x8_t v3 = a2;
      goto LABEL_7;
    }

    do
    {
      int8x8_t v3 = v4;
      unint64_t v4 = (uint64_t *)*v4;
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
  int v6 = (uint64_t **)v3[2];
  uint64_t v7 = *v6;
  if (*v6 == v3)
  {
    uint64_t *v6 = (uint64_t *)v2;
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
    void v3[2] = v9;
    *(void *)(v9 + 8LL * (*(void *)a2[2] != (void)a2)) = v3;
    uint64_t v11 = *a2;
    uint64_t v10 = a2[1];
    *(void *)(v11 + 16) = v3;
    *int8x8_t v3 = v11;
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
      int8x8_t v13 = *(uint64_t **)(v12 + 8);
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

    unint64_t v15 = (void *)*v7;
    if (*v7 && !*((_BYTE *)v15 + 24))
    {
      unint64_t v16 = (uint64_t *)v7[1];
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
        void v15[2] = v7[2];
        *(void *)(v7[2] + 8LL * (*(void *)v7[2] != (void)v7)) = v15;
        v15[1] = v7;
        std::string v7[2] = (uint64_t)v15;
        unint64_t v16 = v7;
      }

      else
      {
        unint64_t v15 = v7;
      }

      uint64_t v23 = v15[2];
      *((_BYTE *)v15 + 24) = *(_BYTE *)(v23 + 24);
      *(_BYTE *)(v23 + 24) = 1;
      *((_BYTE *)v16 + 24) = 1;
      unint64_t v24 = *(uint64_t **)(v23 + 8);
      uint64_t v25 = *v24;
      *(void *)(v23 + 8) = *v24;
      if (v25) {
        *(void *)(v25 + 16) = v23;
      }
      v24[2] = *(void *)(v23 + 16);
      *(void *)(*(void *)(v23 + 16) + 8LL * (**(void **)(v23 + 16) != v23)) = v24;
      *unint64_t v24 = v23;
      goto LABEL_72;
    }

    unint64_t v16 = (uint64_t *)v7[1];
    if (v16 && !*((_BYTE *)v16 + 24)) {
      goto LABEL_55;
    }
    *((_BYTE *)v7 + 24) = 0;
    uint64_t v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      uint64_t v17 = result;
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
    std::string v7[2] = *(void *)(v12 + 16);
    *(void *)(*(void *)(v12 + 16) + 8LL * (**(void **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(void *)(v12 + 16) = v7;
    uint64_t v7 = *(uint64_t **)v12;
  }

  unint64_t v19 = (void *)*v7;
  if (*v7 && !*((_BYTE *)v19 + 24)) {
    goto LABEL_68;
  }
  uint64_t v20 = (uint64_t *)v7[1];
  if (!v20 || *((_BYTE *)v20 + 24))
  {
    *((_BYTE *)v7 + 24) = 0;
    uint64_t v17 = (uint64_t *)v7[2];
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
    uint64_t v20 = v7;
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
    v20[2] = v7[2];
    *(void *)(v7[2] + 8LL * (*(void *)v7[2] != (void)v7)) = v20;
    *uint64_t v20 = (uint64_t)v7;
    std::string v7[2] = (uint64_t)v20;
    unint64_t v19 = v7;
  }

  uint64_t v23 = v20[2];
  *((_BYTE *)v20 + 24) = *(_BYTE *)(v23 + 24);
  *(_BYTE *)(v23 + 24) = 1;
  *((_BYTE *)v19 + 24) = 1;
  unint64_t v24 = *(uint64_t **)v23;
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

void std::vector<char const*>::__append(void **a1, unint64_t a2)
{
  int v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  int v5 = v6;
  uint64_t v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 3)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 8 * a2);
      v7 += 8 * a2;
    }

    a1[1] = v7;
  }

  else
  {
    uint64_t v8 = v7 - (_BYTE *)*a1;
    unint64_t v9 = a2 + (v8 >> 3);
    if (v9 >> 61) {
      std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 3;
    uint64_t v11 = v5 - (_BYTE *)*a1;
    if (v11 >> 2 > v9) {
      unint64_t v9 = v11 >> 2;
    }
    else {
      unint64_t v12 = v9;
    }
    if (v12) {
      int8x8_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>( v4,  v12);
    }
    else {
      int8x8_t v13 = 0LL;
    }
    uint64_t v14 = &v13[8 * v10];
    unint64_t v15 = &v13[8 * v12];
    bzero(v14, 8 * a2);
    unint64_t v16 = &v14[8 * a2];
    uint64_t v18 = (char *)*a1;
    uint64_t v17 = (char *)a1[1];
    if (v17 != *a1)
    {
      do
      {
        uint64_t v19 = *((void *)v17 - 1);
        v17 -= 8;
        *((void *)v14 - 1) = v19;
        v14 -= 8;
      }

      while (v17 != v18);
      uint64_t v17 = (char *)*a1;
    }

    *a1 = v14;
    a1[1] = v16;
    a1[2] = v15;
    if (v17) {
      operator delete(v17);
    }
  }

void std::vector<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>::__append( void **a1, unint64_t a2)
{
  int v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  int v5 = v6;
  uint64_t v7 = *(_DWORD **)(v4 - 8);
  if (a2 <= (v6 - (_BYTE *)v7) >> 4)
  {
    if (a2)
    {
      uint64_t v14 = &v7[4 * a2];
      do
      {
        *(void *)uint64_t v7 = 0LL;
        std::string v7[2] = 0;
        v7 += 4;
      }

      while (v7 != v14);
      uint64_t v7 = v14;
    }

    a1[1] = v7;
  }

  else
  {
    uint64_t v8 = (char *)v7 - (_BYTE *)*a1;
    unint64_t v9 = a2 + (v8 >> 4);
    if (v9 >> 60) {
      std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 4;
    uint64_t v11 = v5 - (_BYTE *)*a1;
    if (v11 >> 3 > v9) {
      unint64_t v9 = v11 >> 3;
    }
    else {
      unint64_t v12 = v9;
    }
    if (v12) {
      int8x8_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>>( v4,  v12);
    }
    else {
      int8x8_t v13 = 0LL;
    }
    unint64_t v15 = &v13[16 * v10];
    unint64_t v16 = &v15[16 * a2];
    uint64_t v17 = v15;
    do
    {
      *(void *)uint64_t v17 = 0LL;
      *((_DWORD *)v17 + 2) = 0;
      v17 += 16;
    }

    while (v17 != v16);
    uint64_t v18 = &v13[16 * v12];
    uint64_t v20 = (char *)*a1;
    uint64_t v19 = (char *)a1[1];
    if (v19 != *a1)
    {
      do
      {
        *((_OWORD *)v15 - 1) = *((_OWORD *)v19 - 1);
        v15 -= 16;
        v19 -= 16;
      }

      while (v19 != v20);
      uint64_t v19 = (char *)*a1;
    }

    *a1 = v15;
    a1[1] = v16;
    a1[2] = v18;
    if (v19) {
      operator delete(v19);
    }
  }

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>>( uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

void *std::__hash_table<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::hash<char const*>,wireless_diagnostics::google::protobuf::streq,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::streq,wireless_diagnostics::google::protobuf::hash<char const*>,true>,std::allocator<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>>>::__emplace_unique_key_args<char const*,std::pair<char const* const,wireless_diagnostics::google::protobuf::FileDescriptor const*>>( uint64_t a1, const char **a2, _OWORD *a3)
{
  int v6 = *a2;
  char v7 = **a2;
  if (v7)
  {
    unint64_t v8 = 0LL;
    unint64_t v9 = (unsigned __int8 *)(v6 + 1);
    do
    {
      unint64_t v8 = 5 * v8 + v7;
      int v10 = *v9++;
      char v7 = v10;
    }

    while (v10);
  }

  else
  {
    unint64_t v8 = 0LL;
  }

  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    unint64_t v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v3 = v8;
      if (v8 >= v11) {
        unint64_t v3 = v8 % v11;
      }
    }

    else
    {
      unint64_t v3 = (v11 - 1) & v8;
    }

    uint64_t v14 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v14)
    {
      for (uint64_t i = *v14; i; uint64_t i = *(void **)i)
      {
        unint64_t v16 = *((void *)i + 1);
        if (v16 == v8)
        {
        }

        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11) {
              v16 %= v11;
            }
          }

          else
          {
            v16 &= v11 - 1;
          }

          if (v16 != v3) {
            break;
          }
        }
      }
    }
  }

  uint64_t i = operator new(0x20uLL);
  *(void *)uint64_t i = 0LL;
  *((void *)i + 1) = v8;
  *((_OWORD *)i + 1) = *a3;
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v18 = *(float *)(a1 + 32);
  if (!v11 || (float)(v18 * (float)v11) < v17)
  {
    BOOL v19 = 1LL;
    if (v11 >= 3) {
      BOOL v19 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v11);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    std::__hash_table<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::hash<char const*>,wireless_diagnostics::google::protobuf::streq,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::streq,wireless_diagnostics::google::protobuf::hash<char const*>,true>,std::allocator<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>>>::__rehash<true>( a1,  v22);
    unint64_t v11 = *(void *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v8 >= v11) {
        unint64_t v3 = v8 % v11;
      }
      else {
        unint64_t v3 = v8;
      }
    }

    else
    {
      unint64_t v3 = (v11 - 1) & v8;
    }
  }

  uint64_t v23 = *(void *)a1;
  unint64_t v24 = *(void **)(*(void *)a1 + 8 * v3);
  if (v24)
  {
    *(void *)uint64_t i = *v24;
LABEL_43:
    *unint64_t v24 = i;
    goto LABEL_44;
  }

  *(void *)uint64_t i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v23 + 8 * v3) = a1 + 16;
  if (*(void *)i)
  {
    unint64_t v25 = *(void *)(*(void *)i + 8LL);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v25 >= v11) {
        v25 %= v11;
      }
    }

    else
    {
      v25 &= v11 - 1;
    }

    unint64_t v24 = (void *)(*(void *)a1 + 8 * v25);
    goto LABEL_43;
  }

LABEL_44:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_187C56060(_Unwind_Exception *a1)
{
}

void std::__hash_table<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::hash<char const*>,wireless_diagnostics::google::protobuf::streq,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::streq,wireless_diagnostics::google::protobuf::hash<char const*>,true>,std::allocator<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>>>::__rehash<true>( uint64_t a1, size_t __n)
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
      std::__hash_table<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::hash<char const*>,wireless_diagnostics::google::protobuf::streq,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::streq,wireless_diagnostics::google::protobuf::hash<char const*>,true>,std::allocator<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>>>::__do_rehash<true>( a1,  prime);
  }

void std::__hash_table<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::hash<char const*>,wireless_diagnostics::google::protobuf::streq,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::streq,wireless_diagnostics::google::protobuf::hash<char const*>,true>,std::allocator<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>>>::__do_rehash<true>( uint64_t a1, unint64_t a2)
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
            *unint64_t v11 = **(void **)(*(void *)a1 + 8 * v12);
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
    int v10 = *(void **)a1;
    *(void *)a1 = 0LL;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0LL;
  }

_OWORD *std::__tree<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::__map_value_compare<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::less<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>,true>,std::allocator<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>>>::__emplace_unique_key_args<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,std::pair<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int> const,wireless_diagnostics::google::protobuf::FieldDescriptor const*>>( uint64_t **a1, unint64_t *a2, uint64_t a3)
{
  unint64_t v5 = std::__tree<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::__map_value_compare<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::less<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>,true>,std::allocator<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>>>::__find_equal<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>( (uint64_t)a1,  &v9,  a2);
  uint64_t v6 = (_OWORD *)*v5;
  if (!*v5)
  {
    uint64_t v7 = (uint64_t **)v5;
    uint64_t v6 = operator new(0x38uLL);
    v6[2] = *(_OWORD *)a3;
    *((void *)v6 + 6) = *(void *)(a3 + 16);
    std::__tree<std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>,std::__map_value_compare<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>,std::less<wireless_diagnostics::google::protobuf::FieldDescriptor const*>,true>,std::allocator<std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>>>::__insert_node_at( a1,  v9,  v7,  (uint64_t *)v6);
  }

  return v6;
}

uint64_t *std::__tree<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::__map_value_compare<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>,std::less<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>,true>,std::allocator<std::__value_type<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>,wireless_diagnostics::google::protobuf::FieldDescriptor const*>>>::__find_equal<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>( uint64_t a1, void *a2, unint64_t *a3)
{
  unint64_t v5 = *(uint64_t **)(a1 + 8);
  uint64_t result = (uint64_t *)(a1 + 8);
  int8x8_t v4 = v5;
  if (v5)
  {
    unint64_t v6 = *a3;
    int v7 = *((_DWORD *)a3 + 2);
    while (1)
    {
      while (1)
      {
        unint64_t v8 = v4;
        unint64_t v9 = v4[4];
        if (v6 >= v9) {
          break;
        }
LABEL_4:
        int8x8_t v4 = (uint64_t *)*v8;
        uint64_t result = v8;
        if (!*v8) {
          goto LABEL_12;
        }
      }

      if (v9 >= v6)
      {
        int v10 = *((_DWORD *)v8 + 10);
        if (v7 < v10) {
          goto LABEL_4;
        }
        if (v10 >= v7) {
          goto LABEL_12;
        }
      }

      uint64_t result = v8 + 1;
      int8x8_t v4 = (uint64_t *)v8[1];
      if (!v4) {
        goto LABEL_12;
      }
    }
  }

  unint64_t v8 = result;
LABEL_12:
  *a2 = v8;
  return result;
}

wireless_diagnostics::google::protobuf::DescriptorPool::Tables **wireless_diagnostics::google::protobuf::internal::scoped_ptr<wireless_diagnostics::google::protobuf::DescriptorPool::Tables>::~scoped_ptr( wireless_diagnostics::google::protobuf::DescriptorPool::Tables **a1)
{
  uint64_t v2 = *a1;
  if (v2)
  {
    wireless_diagnostics::google::protobuf::DescriptorPool::Tables::~Tables(v2);
    operator delete(v3);
  }

  return a1;
}

void *std::__hash_table<wireless_diagnostics::google::protobuf::Descriptor const*,wireless_diagnostics::google::protobuf::hash<wireless_diagnostics::google::protobuf::Descriptor const*>,std::equal_to<wireless_diagnostics::google::protobuf::Descriptor const*>,std::allocator<wireless_diagnostics::google::protobuf::Descriptor const*>>::find<wireless_diagnostics::google::protobuf::Descriptor const*>( void *a1, unint64_t *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0LL;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL) {
    uint64_t v5 = *(void *)&v2 <= v3 ? v3 % *(void *)&v2 : *a2;
  }
  else {
    uint64_t v5 = (*(void *)&v2 - 1LL) & v3;
  }
  unint64_t v6 = *(void **)(*a1 + 8 * v5);
  if (!v6) {
    return 0LL;
  }
  uint64_t result = (void *)*v6;
  if (*v6)
  {
    do
    {
      unint64_t v8 = result[1];
      if (v8 == v3)
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

void *std::__hash_table<wireless_diagnostics::google::protobuf::Descriptor const*,wireless_diagnostics::google::protobuf::hash<wireless_diagnostics::google::protobuf::Descriptor const*>,std::equal_to<wireless_diagnostics::google::protobuf::Descriptor const*>,std::allocator<wireless_diagnostics::google::protobuf::Descriptor const*>>::__emplace_unique_key_args<wireless_diagnostics::google::protobuf::Descriptor const*,wireless_diagnostics::google::protobuf::Descriptor const* const&>( uint64_t a1, unint64_t *a2, void *a3)
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
      unint64_t v3 = (v7 - 1) & v6;
    }

    unint64_t v9 = *(void ***)(*(void *)a1 + 8 * v3);
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
    std::__hash_table<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::hash<char const*>,wireless_diagnostics::google::protobuf::streq,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::streq,wireless_diagnostics::google::protobuf::hash<char const*>,true>,std::allocator<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>>>::__rehash<true>( a1,  v17);
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
      unint64_t v3 = (v7 - 1) & v6;
    }
  }

  uint64_t v18 = *(void *)a1;
  BOOL v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    *uint64_t i = *v19;
LABEL_38:
    void *v19 = i;
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

    BOOL v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }

void sub_187C56684(_Unwind_Exception *a1)
{
}

unsigned __int8 *std::__hash_table<std::string,wireless_diagnostics::google::protobuf::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>( void *a1, _BYTE *a2)
{
  unint64_t v3 = *(_BYTE **)a2;
  char v4 = *v3;
  if (*v3)
  {
    unint64_t v5 = 0LL;
    unint64_t v6 = v3 + 1;
    do
    {
      unint64_t v5 = 5 * v5 + v4;
      int v7 = *v6++;
      char v4 = v7;
    }

    while (v7);
  }

  else
  {
    unint64_t v5 = 0LL;
  }

  int8x8_t v8 = (int8x8_t)a1[1];
  if (!*(void *)&v8) {
    return 0LL;
  }
  uint8x8_t v9 = (uint8x8_t)vcnt_s8(v8);
  v9.i16[0] = vaddlv_u8(v9);
  unint64_t v10 = v9.u32[0];
  if (v9.u32[0] > 1uLL)
  {
    unint64_t v11 = v5;
    if (v5 >= *(void *)&v8) {
      unint64_t v11 = v5 % *(void *)&v8;
    }
  }

  else
  {
    unint64_t v11 = (*(void *)&v8 - 1LL) & v5;
  }

  float v12 = *(unsigned __int8 ***)(*a1 + 8 * v11);
  if (!v12) {
    return 0LL;
  }
  float v13 = *v12;
  if (*v12)
  {
    uint64_t v14 = (uint64_t)(a1 + 4);
    do
    {
      unint64_t v15 = *((void *)v13 + 1);
      if (v5 == v15)
      {
        if ((std::equal_to<std::string>::operator()[abi:ne180100](v14, v13 + 16, a2) & 1) != 0) {
          return v13;
        }
      }

      else
      {
        if (v10 > 1)
        {
          if (v15 >= *(void *)&v8) {
            v15 %= *(void *)&v8;
          }
        }

        else
        {
          v15 &= *(void *)&v8 - 1LL;
        }

        if (v15 != v11) {
          return 0LL;
        }
      }

      float v13 = *(unsigned __int8 **)v13;
    }

    while (v13);
  }

  return v13;
}

uint64_t std::equal_to<std::string>::operator()[abi:ne180100]( uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unint64_t v3 = a3;
  uint64_t v4 = a2[23];
  if ((v4 & 0x80u) == 0LL) {
    uint64_t v5 = a2[23];
  }
  else {
    uint64_t v5 = *((void *)a2 + 1);
  }
  uint64_t v6 = a3[23];
  int v7 = (char)v6;
  if ((v6 & 0x80u) != 0LL) {
    uint64_t v6 = *((void *)a3 + 1);
  }
  if (v5 != v6) {
    return 0LL;
  }
  if (v7 < 0) {
    unint64_t v3 = *(unsigned __int8 **)a3;
  }
  if ((v4 & 0x80) != 0) {
    return memcmp(*(const void **)a2, v3, *((void *)a2 + 1)) == 0;
  }
  if (!a2[23]) {
    return 1LL;
  }
  uint64_t v8 = v4 - 1;
  do
  {
    int v10 = *a2++;
    int v9 = v10;
    int v12 = *v3++;
    int v11 = v12;
    BOOL v14 = v8-- != 0;
    uint64_t result = v9 == v11;
  }

  while (v9 == v11 && v14);
  return result;
}

unsigned __int8 *std::__hash_table<std::string,wireless_diagnostics::google::protobuf::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string const&>( uint64_t a1, _BYTE *a2, uint64_t a3)
{
  int v7 = *(_BYTE **)a2;
  char v8 = *v7;
  if (*v7)
  {
    unint64_t v9 = 0LL;
    int v10 = v7 + 1;
    do
    {
      unint64_t v9 = 5 * v9 + v8;
      int v11 = *v10++;
      char v8 = v11;
    }

    while (v11);
  }

  else
  {
    unint64_t v9 = 0LL;
  }

  unint64_t v12 = *(void *)(a1 + 8);
  if (v12)
  {
    uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    unint64_t v14 = v13.u32[0];
    if (v13.u32[0] > 1uLL)
    {
      unint64_t v3 = v9;
      if (v9 >= v12) {
        unint64_t v3 = v9 % v12;
      }
    }

    else
    {
      unint64_t v3 = (v12 - 1) & v9;
    }

    unint64_t v15 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v3);
    if (v15)
    {
      for (uint64_t i = *v15; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v17 = *((void *)i + 1);
        if (v17 == v9)
        {
          if ((std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2) & 1) != 0) {
            return i;
          }
        }

        else
        {
          if (v14 > 1)
          {
            if (v17 >= v12) {
              v17 %= v12;
            }
          }

          else
          {
            v17 &= v12 - 1;
          }

          if (v17 != v3) {
            break;
          }
        }
      }
    }
  }

  std::__hash_table<std::string,wireless_diagnostics::google::protobuf::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__construct_node_hash<std::string const&>( a1,  v9,  a3,  (uint64_t)v27);
  float v18 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v19 = *(float *)(a1 + 32);
  if (!v12 || (float)(v19 * (float)v12) < v18)
  {
    BOOL v20 = 1LL;
    if (v12 >= 3) {
      BOOL v20 = (v12 & (v12 - 1)) != 0;
    }
    unint64_t v21 = v20 | (2 * v12);
    unint64_t v22 = vcvtps_u32_f32(v18 / v19);
    if (v21 <= v22) {
      size_t v23 = v22;
    }
    else {
      size_t v23 = v21;
    }
    std::__hash_table<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::hash<char const*>,wireless_diagnostics::google::protobuf::streq,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>,wireless_diagnostics::google::protobuf::streq,wireless_diagnostics::google::protobuf::hash<char const*>,true>,std::allocator<std::__hash_value_type<char const*,wireless_diagnostics::google::protobuf::FileDescriptor const*>>>::__rehash<true>( a1,  v23);
    unint64_t v12 = *(void *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v9 >= v12) {
        unint64_t v3 = v9 % v12;
      }
      else {
        unint64_t v3 = v9;
      }
    }

    else
    {
      unint64_t v3 = (v12 - 1) & v9;
    }
  }

  unint64_t v24 = *(void **)(*(void *)a1 + 8 * v3);
  if (v24)
  {
    *(void *)v27[0] = *v24;
    *unint64_t v24 = v27[0];
  }

  else
  {
    *(void *)v27[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v27[0];
    *(void *)(*(void *)a1 + 8 * v3) = a1 + 16;
    if (*(void *)v27[0])
    {
      unint64_t v25 = *(void *)(*(void *)v27[0] + 8LL);
      if ((v12 & (v12 - 1)) != 0)
      {
        if (v25 >= v12) {
          v25 %= v12;
        }
      }

      else
      {
        v25 &= v12 - 1;
      }

      *(void *)(*(void *)a1 + 8 * v25) = v27[0];
    }
  }

  uint64_t i = (unsigned __int8 *)v27[0];
  ++*(void *)(a1 + 24);
  return i;
}

void sub_187C56ADC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::string,void *>>>::operator()[abi:ne180100]( (uint64_t)&a11,  __p);
  }
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::string,wireless_diagnostics::google::protobuf::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__construct_node_hash<std::string const&>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  char v8 = operator new(0x28uLL);
  *(void *)(a4 + 8) = v7;
  *(void *)a4 = v8;
  *(_BYTE *)(a4 + 16) = 0;
  *char v8 = 0LL;
  v8[1] = a2;
  unint64_t v9 = (std::string *)(v8 + 2);
  if (*(char *)(a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }

  else
  {
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = *(_OWORD *)a3;
    v9->__r_.__value_.__l.__cap_ = *(void *)(a3 + 16);
  }

  *(_BYTE *)(a4 + 16) = 1;
}

void sub_187C56B84(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0LL;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::string,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::string,void *>>>::operator()[abi:ne180100]( uint64_t a1, void **__p)
{
  if (*(_BYTE *)(a1 + 8))
  {
  }

  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

uint64_t std::string::basic_string[abi:ne180100](uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x7FFFFFFFFFFFFFF8LL) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (a2 > 0x16)
  {
    uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((a2 | 7) != 0x17) {
      uint64_t v4 = a2 | 7;
    }
    uint64_t v5 = v4 + 1;
    uint64_t v6 = operator new(v4 + 1);
    *(void *)(a1 + 8) = a2;
    *(void *)(a1 + 16) = v5 | 0x8000000000000000LL;
    *(void *)a1 = v6;
  }

  else
  {
    *(void *)(a1 + 8) = 0LL;
    *(void *)(a1 + 16) = 0LL;
    *(void *)a1 = 0LL;
    *(_BYTE *)(a1 + 23) = a2;
  }

  return a1;
}

void *std::string::basic_string[abi:ne180100](void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8LL) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000LL;
    void *__b = v6;
  }

  else
  {
    *((_BYTE *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }

  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

uint64_t *std::__tree<int>::__emplace_hint_unique_key_args<int,int const&>( uint64_t **a1, uint64_t *a2, int *a3, _DWORD *a4)
{
  uint64_t v6 = std::__tree<int>::__find_equal<int>(a1, a2, &v11, &v10, a3);
  size_t v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    size_t v8 = (uint64_t **)v6;
    size_t v7 = (uint64_t *)operator new(0x20uLL);
    *((_DWORD *)v7 + 7) = *a4;
    std::__tree<std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>,std::__map_value_compare<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>,std::less<wireless_diagnostics::google::protobuf::FieldDescriptor const*>,true>,std::allocator<std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>>>::__insert_node_at( a1,  (uint64_t)v11,  v8,  v7);
  }

  return v7;
}

uint64_t *std::__tree<int>::__find_equal<int>(void *a1, uint64_t *a2, uint64_t **a3, uint64_t *a4, int *a5)
{
  uint64_t v5 = a1 + 1;
  if (a1 + 1 == a2 || (v6 = *a5, int v7 = *((_DWORD *)a2 + 7), *a5 < v7))
  {
    size_t v8 = (uint64_t *)*a2;
    if ((uint64_t *)*a1 == a2)
    {
      uint64_t v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }

      else
      {
        *a3 = a2;
        return a2;
      }
    }

    if (v8)
    {
      unint64_t v9 = (uint64_t *)*a2;
      do
      {
        uint64_t v10 = v9;
        unint64_t v9 = (uint64_t *)v9[1];
      }

      while (v9);
    }

    else
    {
      uint8x8_t v13 = a2;
      do
      {
        uint64_t v10 = (uint64_t *)v13[2];
        BOOL v14 = *v10 == (void)v13;
        uint8x8_t v13 = v10;
      }

      while (v14);
    }

    int v15 = *a5;
    if (*((_DWORD *)v10 + 7) < *a5) {
      goto LABEL_17;
    }
    uint64_t v16 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          unint64_t v17 = (uint64_t *)v16;
          int v18 = *(_DWORD *)(v16 + 28);
          if (v15 >= v18) {
            break;
          }
          uint64_t v16 = *v17;
          uint64_t v5 = v17;
          if (!*v17) {
            goto LABEL_29;
          }
        }

        if (v18 >= v15) {
          break;
        }
        uint64_t v5 = v17 + 1;
        uint64_t v16 = v17[1];
      }

      while (v16);
    }

    else
    {
      unint64_t v17 = a1 + 1;
    }

LABEL_29:
    *a3 = v17;
    return v5;
  }

  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = (uint64_t)a2;
    return a4;
  }

  uint64_t v11 = a2[1];
  if (v11)
  {
    unint64_t v12 = (uint64_t *)a2[1];
    do
    {
      a4 = v12;
      unint64_t v12 = (uint64_t *)*v12;
    }

    while (v12);
  }

  else
  {
    float v19 = a2;
    do
    {
      a4 = (uint64_t *)v19[2];
      BOOL v14 = *a4 == (void)v19;
      float v19 = a4;
    }

    while (!v14);
  }

  if (a4 != v5 && v6 >= *((_DWORD *)a4 + 7))
  {
    uint64_t v20 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          unint64_t v21 = (uint64_t *)v20;
          int v22 = *(_DWORD *)(v20 + 28);
          if (v6 >= v22) {
            break;
          }
          uint64_t v20 = *v21;
          uint64_t v5 = v21;
          if (!*v21) {
            goto LABEL_48;
          }
        }

        if (v22 >= v6) {
          break;
        }
        uint64_t v5 = v21 + 1;
        uint64_t v20 = v21[1];
      }

      while (v20);
    }

    else
    {
      unint64_t v21 = a1 + 1;
    }

LABEL_48:
    *a3 = v21;
    return v5;
  }

  if (v11)
  {
    *a3 = a4;
  }

  else
  {
    *a3 = a2;
    return a2 + 1;
  }

  return a4;
}

uint64_t *std::__tree<wireless_diagnostics::google::protobuf::Descriptor const*>::__emplace_unique_key_args<wireless_diagnostics::google::protobuf::Descriptor const*,wireless_diagnostics::google::protobuf::Descriptor const*>( uint64_t **a1, unint64_t *a2, uint64_t *a3)
{
  int v6 = a1 + 1;
  uint64_t v5 = a1[1];
  if (v5)
  {
    unint64_t v7 = *a2;
    while (1)
    {
      while (1)
      {
        size_t v8 = (uint64_t **)v5;
        unint64_t v9 = v5[4];
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
    size_t v8 = a1 + 1;
LABEL_10:
    uint64_t v10 = (uint64_t *)operator new(0x28uLL);
    v10[4] = *a3;
    std::__tree<std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>,std::__map_value_compare<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>,std::less<wireless_diagnostics::google::protobuf::FieldDescriptor const*>,true>,std::allocator<std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>>>::__insert_node_at( a1,  (uint64_t)v8,  v6,  v10);
    return v10;
  }

  return (uint64_t *)v8;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a2);
}

void std::allocator_traits<std::allocator<wireless_diagnostics::google::protobuf::anonymous namespace'::OptionsToInterpret>>::destroy[abi:ne180100]<wireless_diagnostics::google::protobuf::anonymous namespace'::OptionsToInterpret,void>( uint64_t a1)
{
}

void wireless_diagnostics::google::protobuf::anonymous namespace'::OptionsToInterpret::~OptionsToInterpret( void **this)
{
}

wireless_diagnostics::google::protobuf::FileOptions *wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateMessage<wireless_diagnostics::google::protobuf::FileOptions>( void *a1)
{
  int8x8_t v2 = (wireless_diagnostics::google::protobuf::FileOptions *)operator new(0x70uLL);
  wireless_diagnostics::google::protobuf::FileOptions::FileOptions(v2);
  unint64_t v3 = a1[18];
  uint64_t v4 = (wireless_diagnostics::google::protobuf::FileOptions **)a1[17];
  if ((unint64_t)v4 >= v3)
  {
    uint64_t v6 = a1[16];
    uint64_t v7 = ((uint64_t)v4 - v6) >> 3;
    uint64_t v8 = v3 - v6;
    uint64_t v9 = v8 >> 2;
    else {
      unint64_t v10 = v9;
    }
    if (v10) {
      uint64_t v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>( (uint64_t)(a1 + 18),  v10);
    }
    else {
      uint64_t v11 = 0LL;
    }
    unint64_t v12 = (wireless_diagnostics::google::protobuf::FileOptions **)&v11[8 * v7];
    uint8x8_t v13 = &v11[8 * v10];
    *unint64_t v12 = v2;
    uint64_t v5 = v12 + 1;
    int v15 = (char *)a1[16];
    BOOL v14 = (char *)a1[17];
    if (v14 != v15)
    {
      do
      {
        uint64_t v16 = (wireless_diagnostics::google::protobuf::FileOptions *)*((void *)v14 - 1);
        v14 -= 8;
        *--unint64_t v12 = v16;
      }

      while (v14 != v15);
      BOOL v14 = (char *)a1[16];
    }

    a1[16] = v12;
    a1[17] = v5;
    a1[18] = v13;
    if (v14) {
      operator delete(v14);
    }
  }

  else
  {
    *uint64_t v4 = v2;
    uint64_t v5 = v4 + 1;
  }

  a1[17] = v5;
  return v2;
}

void sub_187C571A0(_Unwind_Exception *a1)
{
}

void std::vector<wireless_diagnostics::google::protobuf::anonymous namespace'::OptionsToInterpret>::push_back[abi:ne180100]( void **a1, __int128 *a2)
{
  uint64_t v4 = (char *)a1[1];
  uint64_t v5 = (char *)a1[2];
  if (v4 >= v5)
  {
    uint64_t v9 = (v4 - (_BYTE *)*a1) >> 6;
    unint64_t v10 = v9 + 1;
    uint64_t v11 = v5 - (_BYTE *)*a1;
    if (v11 >> 5 > v10) {
      unint64_t v10 = v11 >> 5;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      if (v12 >> 58) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      uint8x8_t v13 = (char *)operator new(v12 << 6);
    }

    else
    {
      uint8x8_t v13 = 0LL;
    }

    BOOL v14 = &v13[64 * v9];
    *(_OWORD *)BOOL v14 = *a2;
    *((void *)v14 + 2) = *((void *)a2 + 2);
    __int128 v15 = *(__int128 *)((char *)a2 + 24);
    *((void *)a2 + 2) = 0LL;
    *((void *)a2 + 3) = 0LL;
    *(void *)a2 = 0LL;
    *((void *)a2 + 1) = 0LL;
    *(_OWORD *)(v14 + 24) = v15;
    *((void *)v14 + 5) = *((void *)a2 + 5);
    *((void *)a2 + 4) = 0LL;
    *((void *)a2 + 5) = 0LL;
    *((_OWORD *)v14 + 3) = a2[3];
    uint64_t v16 = (char *)*a1;
    unint64_t v17 = (char *)a1[1];
    if (v17 == *a1)
    {
      uint64_t v8 = v14 + 64;
      *a1 = v14;
      a1[1] = v14 + 64;
      a1[2] = &v13[64 * v12];
    }

    else
    {
      int v18 = &v13[64 * v9];
      do
      {
        __int128 v19 = *((_OWORD *)v17 - 4);
        *((void *)v18 - 6) = *((void *)v17 - 6);
        *((_OWORD *)v18 - 4) = v19;
        *((void *)v17 - 7) = 0LL;
        *((void *)v17 - 6) = 0LL;
        *((void *)v17 - 8) = 0LL;
        __int128 v20 = *(_OWORD *)(v17 - 40);
        *((void *)v18 - 3) = *((void *)v17 - 3);
        *(_OWORD *)(v18 - 40) = v20;
        *((void *)v17 - 4) = 0LL;
        *((void *)v17 - 3) = 0LL;
        *((void *)v17 - 5) = 0LL;
        *((_OWORD *)v18 - 1) = *((_OWORD *)v17 - 1);
        v18 -= 64;
        v17 -= 64;
      }

      while (v17 != v16);
      unint64_t v17 = (char *)*a1;
      uint64_t v21 = (uint64_t)a1[1];
      uint64_t v8 = v14 + 64;
      *a1 = v18;
      a1[1] = v14 + 64;
      a1[2] = &v13[64 * v12];
      while ((char *)v21 != v17)
      {
        v21 -= 64LL;
      }
    }

    if (v17) {
      operator delete(v17);
    }
  }

  else
  {
    __int128 v6 = *a2;
    *((void *)v4 + 2) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v4 = v6;
    *((void *)a2 + 1) = 0LL;
    *((void *)a2 + 2) = 0LL;
    *(void *)a2 = 0LL;
    __int128 v7 = *(__int128 *)((char *)a2 + 24);
    *((void *)v4 + 5) = *((void *)a2 + 5);
    *(_OWORD *)(v4 + 24) = v7;
    *((void *)a2 + 4) = 0LL;
    *((void *)a2 + 5) = 0LL;
    *((void *)a2 + 3) = 0LL;
    *((_OWORD *)v4 + 3) = a2[3];
    uint64_t v8 = v4 + 64;
  }

  a1[1] = v8;
}

std::string *wireless_diagnostics::google::protobuf::anonymous namespace'::OptionsToInterpret::OptionsToInterpret( std::string *this, __int128 *a2, __int128 *a3, std::string::size_type a4, std::string::size_type a5)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }

  else
  {
    __int128 v9 = *a2;
    this->__r_.__value_.__l.__cap_ = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v9;
  }

  unint64_t v10 = this + 1;
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v10, *(const std::string::value_type **)a3, *((void *)a3 + 1));
  }

  else
  {
    __int128 v11 = *a3;
    this[1].__r_.__value_.__l.__cap_ = *((void *)a3 + 2);
    *(_OWORD *)&v10->__r_.__value_.__l.__data_ = v11;
  }

  this[2].__r_.__value_.__r.__words[0] = a4;
  this[2].__r_.__value_.__l.__size_ = a5;
  return this;
}

void sub_187C573F8(_Unwind_Exception *exception_object)
{
}

void std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>( uint64_t a1, __int128 *a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external( *(std::string **)(a1 + 8),  *(const std::string::value_type **)a2,  *((void *)a2 + 1));
  }

  else
  {
    __int128 v4 = *a2;
    *(void *)(v3 + 16) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v3 = v4;
  }

  *(void *)(a1 + 8) = v3 + 24;
}

void sub_187C57468(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::string>::__push_back_slow_path<std::string const&>(uint64_t *a1, __int128 *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x555555555555555LL) {
    unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)(a1 + 2);
  if (v9) {
    unint64_t v10 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v7, v9);
  }
  else {
    unint64_t v10 = 0LL;
  }
  std::__split_buffer<std::string>::pointer end = v10 + v4;
  __v.__first_ = v10;
  __v.__begin_ = end;
  __v.__end_ = end;
  __v.__end_cap_.__value_ = &v10[v9];
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(end, *(const std::string::value_type **)a2, *((void *)a2 + 1));
    std::__split_buffer<std::string>::pointer end = __v.__end_;
  }

  else
  {
    __int128 v12 = *a2;
    end->__r_.__value_.__l.__cap_ = *((void *)a2 + 2);
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v12;
  }

  __v.__end_ = end + 1;
  std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a1, &__v);
  uint64_t v13 = a1[1];
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  return v13;
}

void sub_187C5757C( _Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void std::__tree<std::string>::destroy(uint64_t a1, char *a2)
{
  if (a2)
  {
    std::__tree<std::string>::destroy(a1, *(void *)a2);
    std::__tree<std::string>::destroy(a1, *((void *)a2 + 1));
    if (a2[55] < 0) {
      operator delete(*((void **)a2 + 4));
    }
    operator delete(a2);
  }

uint64_t *std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string const&>( uint64_t **a1, const void **a2, uint64_t a3)
{
  unint64_t v5 = (uint64_t **)std::__tree<std::string>::__find_equal<std::string>((uint64_t)a1, &v8, a2);
  uint64_t result = *v5;
  if (!*v5)
  {
    std::__tree<std::string>::__construct_node<std::string const&>((uint64_t)a1, a3, (uint64_t)&v7);
    std::__tree<std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>,std::__map_value_compare<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>,std::less<wireless_diagnostics::google::protobuf::FieldDescriptor const*>,true>,std::allocator<std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>>>::__insert_node_at( a1,  v8,  v5,  v7);
    return v7;
  }

  return result;
}

void *std::__tree<std::string>::__find_equal<std::string>(uint64_t a1, void *a2, const void **a3)
{
  unint64_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        uint64_t v8 = (void *)v4;
        unint64_t v9 = (const void **)(v4 + 32);
        uint64_t v4 = *v8;
        unint64_t v5 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }

      if (!std::less<std::string>::operator()[abi:ne180100](v7, v9, a3)) {
        break;
      }
      unint64_t v5 = v8 + 1;
      uint64_t v4 = v8[1];
    }

    while (v4);
  }

  else
  {
    uint64_t v8 = (void *)(a1 + 8);
  }

void std::__tree<std::string>::__construct_node<std::string const&>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  __int128 v6 = (char *)operator new(0x38uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(_BYTE *)(a3 + 16) = 0;
  uint64_t v7 = (std::string *)(v6 + 32);
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }

  else
  {
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    v7->__r_.__value_.__l.__cap_ = *(void *)(a2 + 16);
  }

  *(_BYTE *)(a3 + 16) = 1;
}

void sub_187C57778(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0LL;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::string,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

BOOL std::less<std::string>::operator()[abi:ne180100](uint64_t a1, const void **a2, const void **a3)
{
  int v3 = *((char *)a3 + 23);
  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    size_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v5 = (size_t)a2[1];
  }
  if (v4 >= 0) {
    __int128 v6 = a2;
  }
  else {
    __int128 v6 = *a2;
  }
  if (v3 >= 0) {
    size_t v7 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v7 = (size_t)a3[1];
  }
  if (v3 >= 0) {
    uint64_t v8 = a3;
  }
  else {
    uint64_t v8 = *a3;
  }
  if (v7 >= v5) {
    size_t v9 = v5;
  }
  else {
    size_t v9 = v7;
  }
  int v10 = memcmp(v6, v8, v9);
  if (v10) {
    return v10 < 0;
  }
  else {
    return v5 < v7;
  }
}

void std::__tree_node_destructor<std::allocator<std::__tree_node<std::string,void *>>>::operator()[abi:ne180100]( uint64_t a1, void **__p)
{
  if (*(_BYTE *)(a1 + 8))
  {
  }

  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

void wireless_diagnostics::google::protobuf::DescriptorBuilder::AllocateOptionsImpl<wireless_diagnostics::google::protobuf::Descriptor>( uint64_t a1, __int128 *a2, __int128 *a3, wireless_diagnostics::google::protobuf::MessageLite *a4, uint64_t a5)
{
  int v10 = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateMessage<wireless_diagnostics::google::protobuf::MessageOptions>(*(void **)(a1 + 8));
  wireless_diagnostics::google::protobuf::MessageLite::SerializeAsString(a4);
  wireless_diagnostics::google::protobuf::MessageLite::ParseFromString();
  *(void *)(a5 + 32) = v10;
  if (*((int *)v10 + 12) >= 1)
  {
    if (v13 < 0) {
      operator delete(v12);
    }
  }

void sub_187C5791C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
}

wireless_diagnostics::google::protobuf::MessageOptions *wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateMessage<wireless_diagnostics::google::protobuf::MessageOptions>( void *a1)
{
  uint64_t v2 = (wireless_diagnostics::google::protobuf::MessageOptions *)operator new(0x50uLL);
  wireless_diagnostics::google::protobuf::MessageOptions::MessageOptions(v2);
  unint64_t v3 = a1[18];
  int v4 = (wireless_diagnostics::google::protobuf::MessageOptions **)a1[17];
  if ((unint64_t)v4 >= v3)
  {
    uint64_t v6 = a1[16];
    uint64_t v7 = ((uint64_t)v4 - v6) >> 3;
    uint64_t v8 = v3 - v6;
    uint64_t v9 = v8 >> 2;
    else {
      unint64_t v10 = v9;
    }
    if (v10) {
      __int128 v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>( (uint64_t)(a1 + 18),  v10);
    }
    else {
      __int128 v11 = 0LL;
    }
    __int128 v12 = (wireless_diagnostics::google::protobuf::MessageOptions **)&v11[8 * v7];
    char v13 = &v11[8 * v10];
    *__int128 v12 = v2;
    size_t v5 = v12 + 1;
    __int128 v15 = (char *)a1[16];
    BOOL v14 = (char *)a1[17];
    if (v14 != v15)
    {
      do
      {
        uint64_t v16 = (wireless_diagnostics::google::protobuf::MessageOptions *)*((void *)v14 - 1);
        v14 -= 8;
        *--__int128 v12 = v16;
      }

      while (v14 != v15);
      BOOL v14 = (char *)a1[16];
    }

    a1[16] = v12;
    a1[17] = v5;
    a1[18] = v13;
    if (v14) {
      operator delete(v14);
    }
  }

  else
  {
    *int v4 = v2;
    size_t v5 = v4 + 1;
  }

  a1[17] = v5;
  return v2;
}

void sub_187C57A34(_Unwind_Exception *a1)
{
}

void wireless_diagnostics::google::protobuf::DescriptorBuilder::AllocateOptionsImpl<wireless_diagnostics::google::protobuf::FieldDescriptor>( uint64_t a1, __int128 *a2, __int128 *a3, wireless_diagnostics::google::protobuf::MessageLite *a4, uint64_t a5)
{
  unint64_t v10 = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateMessage<wireless_diagnostics::google::protobuf::FieldOptions>(*(void **)(a1 + 8));
  wireless_diagnostics::google::protobuf::MessageLite::SerializeAsString(a4);
  wireless_diagnostics::google::protobuf::MessageLite::ParseFromString();
  *(void *)(a5 + 96) = v10;
  if (*((int *)v10 + 16) >= 1)
  {
    if (v13 < 0) {
      operator delete(v12);
    }
  }

void sub_187C57B1C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
}

wireless_diagnostics::google::protobuf::FieldOptions *wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateMessage<wireless_diagnostics::google::protobuf::FieldOptions>( void *a1)
{
  uint64_t v2 = (wireless_diagnostics::google::protobuf::FieldOptions *)operator new(0x58uLL);
  wireless_diagnostics::google::protobuf::FieldOptions::FieldOptions(v2);
  unint64_t v3 = a1[18];
  int v4 = (wireless_diagnostics::google::protobuf::FieldOptions **)a1[17];
  if ((unint64_t)v4 >= v3)
  {
    uint64_t v6 = a1[16];
    uint64_t v7 = ((uint64_t)v4 - v6) >> 3;
    uint64_t v8 = v3 - v6;
    uint64_t v9 = v8 >> 2;
    else {
      unint64_t v10 = v9;
    }
    if (v10) {
      __int128 v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>( (uint64_t)(a1 + 18),  v10);
    }
    else {
      __int128 v11 = 0LL;
    }
    __int128 v12 = (wireless_diagnostics::google::protobuf::FieldOptions **)&v11[8 * v7];
    char v13 = &v11[8 * v10];
    *__int128 v12 = v2;
    size_t v5 = v12 + 1;
    __int128 v15 = (char *)a1[16];
    BOOL v14 = (char *)a1[17];
    if (v14 != v15)
    {
      do
      {
        uint64_t v16 = (wireless_diagnostics::google::protobuf::FieldOptions *)*((void *)v14 - 1);
        v14 -= 8;
        *--__int128 v12 = v16;
      }

      while (v14 != v15);
      BOOL v14 = (char *)a1[16];
    }

    a1[16] = v12;
    a1[17] = v5;
    a1[18] = v13;
    if (v14) {
      operator delete(v14);
    }
  }

  else
  {
    *int v4 = v2;
    size_t v5 = v4 + 1;
  }

  a1[17] = v5;
  return v2;
}

void sub_187C57C34(_Unwind_Exception *a1)
{
}

void wireless_diagnostics::google::protobuf::DescriptorBuilder::AllocateOptionsImpl<wireless_diagnostics::google::protobuf::EnumDescriptor>( uint64_t a1, __int128 *a2, __int128 *a3, wireless_diagnostics::google::protobuf::MessageLite *a4, uint64_t a5)
{
  unint64_t v10 = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateMessage<wireless_diagnostics::google::protobuf::EnumOptions>(*(void **)(a1 + 8));
  wireless_diagnostics::google::protobuf::MessageLite::SerializeAsString(a4);
  wireless_diagnostics::google::protobuf::MessageLite::ParseFromString();
  *(void *)(a5 + 32) = v10;
  if (*((int *)v10 + 12) >= 1)
  {
    if (v13 < 0) {
      operator delete(v12);
    }
  }

void sub_187C57D1C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
}

wireless_diagnostics::google::protobuf::EnumOptions *wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateMessage<wireless_diagnostics::google::protobuf::EnumOptions>( void *a1)
{
  uint64_t v2 = (wireless_diagnostics::google::protobuf::EnumOptions *)operator new(0x50uLL);
  wireless_diagnostics::google::protobuf::EnumOptions::EnumOptions(v2);
  unint64_t v3 = a1[18];
  int v4 = (wireless_diagnostics::google::protobuf::EnumOptions **)a1[17];
  if ((unint64_t)v4 >= v3)
  {
    uint64_t v6 = a1[16];
    uint64_t v7 = ((uint64_t)v4 - v6) >> 3;
    uint64_t v8 = v3 - v6;
    uint64_t v9 = v8 >> 2;
    else {
      unint64_t v10 = v9;
    }
    if (v10) {
      __int128 v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>( (uint64_t)(a1 + 18),  v10);
    }
    else {
      __int128 v11 = 0LL;
    }
    __int128 v12 = (wireless_diagnostics::google::protobuf::EnumOptions **)&v11[8 * v7];
    char v13 = &v11[8 * v10];
    *__int128 v12 = v2;
    size_t v5 = v12 + 1;
    __int128 v15 = (char *)a1[16];
    BOOL v14 = (char *)a1[17];
    if (v14 != v15)
    {
      do
      {
        uint64_t v16 = (wireless_diagnostics::google::protobuf::EnumOptions *)*((void *)v14 - 1);
        v14 -= 8;
        *--__int128 v12 = v16;
      }

      while (v14 != v15);
      BOOL v14 = (char *)a1[16];
    }

    a1[16] = v12;
    a1[17] = v5;
    a1[18] = v13;
    if (v14) {
      operator delete(v14);
    }
  }

  else
  {
    *int v4 = v2;
    size_t v5 = v4 + 1;
  }

  a1[17] = v5;
  return v2;
}

void sub_187C57E34(_Unwind_Exception *a1)
{
}

void wireless_diagnostics::google::protobuf::DescriptorBuilder::AllocateOptionsImpl<wireless_diagnostics::google::protobuf::EnumValueDescriptor>( uint64_t a1, __int128 *a2, __int128 *a3, wireless_diagnostics::google::protobuf::MessageLite *a4, uint64_t a5)
{
  unint64_t v10 = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateMessage<wireless_diagnostics::google::protobuf::EnumValueOptions>(*(void **)(a1 + 8));
  wireless_diagnostics::google::protobuf::MessageLite::SerializeAsString(a4);
  wireless_diagnostics::google::protobuf::MessageLite::ParseFromString();
  *(void *)(a5 + 32) = v10;
  if (*((int *)v10 + 12) >= 1)
  {
    if (v13 < 0) {
      operator delete(v12);
    }
  }

void sub_187C57F1C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
}

wireless_diagnostics::google::protobuf::EnumValueOptions *wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateMessage<wireless_diagnostics::google::protobuf::EnumValueOptions>( void *a1)
{
  uint64_t v2 = (wireless_diagnostics::google::protobuf::EnumValueOptions *)operator new(0x48uLL);
  wireless_diagnostics::google::protobuf::EnumValueOptions::EnumValueOptions(v2);
  unint64_t v3 = a1[18];
  int v4 = (wireless_diagnostics::google::protobuf::EnumValueOptions **)a1[17];
  if ((unint64_t)v4 >= v3)
  {
    uint64_t v6 = a1[16];
    uint64_t v7 = ((uint64_t)v4 - v6) >> 3;
    uint64_t v8 = v3 - v6;
    uint64_t v9 = v8 >> 2;
    else {
      unint64_t v10 = v9;
    }
    if (v10) {
      __int128 v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>( (uint64_t)(a1 + 18),  v10);
    }
    else {
      __int128 v11 = 0LL;
    }
    __int128 v12 = (wireless_diagnostics::google::protobuf::EnumValueOptions **)&v11[8 * v7];
    char v13 = &v11[8 * v10];
    *__int128 v12 = v2;
    size_t v5 = v12 + 1;
    __int128 v15 = (char *)a1[16];
    BOOL v14 = (char *)a1[17];
    if (v14 != v15)
    {
      do
      {
        uint64_t v16 = (wireless_diagnostics::google::protobuf::EnumValueOptions *)*((void *)v14 - 1);
        v14 -= 8;
        *--__int128 v12 = v16;
      }

      while (v14 != v15);
      BOOL v14 = (char *)a1[16];
    }

    a1[16] = v12;
    a1[17] = v5;
    a1[18] = v13;
    if (v14) {
      operator delete(v14);
    }
  }

  else
  {
    *int v4 = v2;
    size_t v5 = v4 + 1;
  }

  a1[17] = v5;
  return v2;
}

void sub_187C58034(_Unwind_Exception *a1)
{
}

void wireless_diagnostics::google::protobuf::DescriptorBuilder::AllocateOptionsImpl<wireless_diagnostics::google::protobuf::ServiceDescriptor>( uint64_t a1, __int128 *a2, __int128 *a3, wireless_diagnostics::google::protobuf::MessageLite *a4, uint64_t a5)
{
  unint64_t v10 = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateMessage<wireless_diagnostics::google::protobuf::ServiceOptions>(*(void **)(a1 + 8));
  wireless_diagnostics::google::protobuf::MessageLite::SerializeAsString(a4);
  wireless_diagnostics::google::protobuf::MessageLite::ParseFromString();
  *(void *)(a5 + 24) = v10;
  if (*((int *)v10 + 12) >= 1)
  {
    if (v13 < 0) {
      operator delete(v12);
    }
  }

void sub_187C5811C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
}

wireless_diagnostics::google::protobuf::ServiceOptions *wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateMessage<wireless_diagnostics::google::protobuf::ServiceOptions>( void *a1)
{
  uint64_t v2 = (wireless_diagnostics::google::protobuf::ServiceOptions *)operator new(0x48uLL);
  wireless_diagnostics::google::protobuf::ServiceOptions::ServiceOptions(v2);
  unint64_t v3 = a1[18];
  int v4 = (wireless_diagnostics::google::protobuf::ServiceOptions **)a1[17];
  if ((unint64_t)v4 >= v3)
  {
    uint64_t v6 = a1[16];
    uint64_t v7 = ((uint64_t)v4 - v6) >> 3;
    uint64_t v8 = v3 - v6;
    uint64_t v9 = v8 >> 2;
    else {
      unint64_t v10 = v9;
    }
    if (v10) {
      __int128 v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>( (uint64_t)(a1 + 18),  v10);
    }
    else {
      __int128 v11 = 0LL;
    }
    __int128 v12 = (wireless_diagnostics::google::protobuf::ServiceOptions **)&v11[8 * v7];
    char v13 = &v11[8 * v10];
    *__int128 v12 = v2;
    size_t v5 = v12 + 1;
    __int128 v15 = (char *)a1[16];
    BOOL v14 = (char *)a1[17];
    if (v14 != v15)
    {
      do
      {
        uint64_t v16 = (wireless_diagnostics::google::protobuf::ServiceOptions *)*((void *)v14 - 1);
        v14 -= 8;
        *--__int128 v12 = v16;
      }

      while (v14 != v15);
      BOOL v14 = (char *)a1[16];
    }

    a1[16] = v12;
    a1[17] = v5;
    a1[18] = v13;
    if (v14) {
      operator delete(v14);
    }
  }

  else
  {
    *int v4 = v2;
    size_t v5 = v4 + 1;
  }

  a1[17] = v5;
  return v2;
}

void sub_187C58234(_Unwind_Exception *a1)
{
}

void wireless_diagnostics::google::protobuf::DescriptorBuilder::AllocateOptionsImpl<wireless_diagnostics::google::protobuf::MethodDescriptor>( uint64_t a1, __int128 *a2, __int128 *a3, wireless_diagnostics::google::protobuf::MessageLite *a4, uint64_t a5)
{
  unint64_t v10 = wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateMessage<wireless_diagnostics::google::protobuf::MethodOptions>(*(void **)(a1 + 8));
  wireless_diagnostics::google::protobuf::MessageLite::SerializeAsString(a4);
  wireless_diagnostics::google::protobuf::MessageLite::ParseFromString();
  *(void *)(a5 + 40) = v10;
  if (*((int *)v10 + 12) >= 1)
  {
    if (v13 < 0) {
      operator delete(v12);
    }
  }

void sub_187C5831C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
}

wireless_diagnostics::google::protobuf::MethodOptions *wireless_diagnostics::google::protobuf::DescriptorPool::Tables::AllocateMessage<wireless_diagnostics::google::protobuf::MethodOptions>( void *a1)
{
  uint64_t v2 = (wireless_diagnostics::google::protobuf::MethodOptions *)operator new(0x48uLL);
  wireless_diagnostics::google::protobuf::MethodOptions::MethodOptions(v2);
  unint64_t v3 = a1[18];
  int v4 = (wireless_diagnostics::google::protobuf::MethodOptions **)a1[17];
  if ((unint64_t)v4 >= v3)
  {
    uint64_t v6 = a1[16];
    uint64_t v7 = ((uint64_t)v4 - v6) >> 3;
    uint64_t v8 = v3 - v6;
    uint64_t v9 = v8 >> 2;
    else {
      unint64_t v10 = v9;
    }
    if (v10) {
      __int128 v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>( (uint64_t)(a1 + 18),  v10);
    }
    else {
      __int128 v11 = 0LL;
    }
    __int128 v12 = (wireless_diagnostics::google::protobuf::MethodOptions **)&v11[8 * v7];
    char v13 = &v11[8 * v10];
    *__int128 v12 = v2;
    size_t v5 = v12 + 1;
    __int128 v15 = (char *)a1[16];
    BOOL v14 = (char *)a1[17];
    if (v14 != v15)
    {
      do
      {
        uint64_t v16 = (wireless_diagnostics::google::protobuf::MethodOptions *)*((void *)v14 - 1);
        v14 -= 8;
        *--__int128 v12 = v16;
      }

      while (v14 != v15);
      BOOL v14 = (char *)a1[16];
    }

    a1[16] = v12;
    a1[17] = v5;
    a1[18] = v13;
    if (v14) {
      operator delete(v14);
    }
  }

  else
  {
    *int v4 = v2;
    size_t v5 = v4 + 1;
  }

  a1[17] = v5;
  return v2;
}

void sub_187C58434(_Unwind_Exception *a1)
{
}

void std::__tree<std::__value_type<int,std::string>,std::__map_value_compare<int,std::__value_type<int,std::string>,std::less<int>,true>,std::allocator<std::__value_type<int,std::string>>>::destroy( uint64_t a1, char *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<int,std::string>,std::__map_value_compare<int,std::__value_type<int,std::string>,std::less<int>,true>,std::allocator<std::__value_type<int,std::string>>>::destroy( a1,  *(void *)a2);
    std::__tree<std::__value_type<int,std::string>,std::__map_value_compare<int,std::__value_type<int,std::string>,std::less<int>,true>,std::allocator<std::__value_type<int,std::string>>>::destroy( a1,  *((void *)a2 + 1));
    if (a2[63] < 0) {
      operator delete(*((void **)a2 + 5));
    }
    operator delete(a2);
  }

uint64_t **std::__tree<std::__value_type<int,std::string>,std::__map_value_compare<int,std::__value_type<int,std::string>,std::less<int>,true>,std::allocator<std::__value_type<int,std::string>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int &&>,std::tuple<>>( uint64_t **a1, int *a2, uint64_t a3, _DWORD **a4)
{
  uint64_t v7 = a1 + 1;
  uint64_t v6 = a1[1];
  if (v6)
  {
    int v8 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = (uint64_t **)v6;
        int v10 = *((_DWORD *)v6 + 8);
        if (v8 >= v10) {
          break;
        }
        uint64_t v6 = *v9;
        uint64_t v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }

      if (v10 >= v8) {
        break;
      }
      uint64_t v6 = v9[1];
      if (!v6)
      {
        uint64_t v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }

  else
  {
    uint64_t v9 = a1 + 1;
LABEL_10:
    __int128 v11 = operator new(0x40uLL);
    v11[8] = **a4;
    *((void *)v11 + 6) = 0LL;
    *((void *)v11 + 7) = 0LL;
    *((void *)v11 + 5) = 0LL;
    std::__tree<std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>,std::__map_value_compare<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>,std::less<wireless_diagnostics::google::protobuf::FieldDescriptor const*>,true>,std::allocator<std::__value_type<wireless_diagnostics::google::protobuf::FieldDescriptor const*,std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>>>>::__insert_node_at( a1,  (uint64_t)v9,  v7,  (uint64_t *)v11);
    return (uint64_t **)v11;
  }

  return v9;
}

wireless_diagnostics::google::protobuf::UnknownFieldSet **wireless_diagnostics::google::protobuf::internal::scoped_ptr<wireless_diagnostics::google::protobuf::UnknownFieldSet>::~scoped_ptr( wireless_diagnostics::google::protobuf::UnknownFieldSet **a1)
{
  uint64_t v2 = *a1;
  if (v2)
  {
    wireless_diagnostics::google::protobuf::UnknownFieldSet::~UnknownFieldSet(v2);
    operator delete(v3);
  }

  return a1;
}

uint64_t _GLOBAL__sub_I_descriptor_cc()
{
  qword_18C4D01B0 = 0LL;
  unk_18C4D01B8 = 0LL;
  qword_18C4D01C8 = 0LL;
  wireless_diagnostics::google::protobuf::FileDescriptorTables::kEmpty = 0u;
  *(_OWORD *)algn_18C4D0250 = 0u;
  dword_18C4D0260 = 1065353216;
  unk_18C4D0268 = 0u;
  unk_18C4D0278 = 0u;
  dword_18C4D0288 = 1065353216;
  xmmword_18C4D0290 = 0u;
  unk_18C4D02A0 = 0u;
  dword_18C4D02B0 = 1065353216;
  unk_18C4D02B8 = 0u;
  dword_18C4D02D8 = 1065353216;
  dword_18C4D0300 = 1065353216;
  unk_18C4D02C8 = 0u;
  xmmword_18C4D02E0 = 0u;
  unk_18C4D02F0 = 0u;
  return __cxa_atexit( (void (*)(void *))wireless_diagnostics::google::protobuf::FileDescriptorTables::~FileDescriptorTables,  &wireless_diagnostics::google::protobuf::FileDescriptorTables::kEmpty,  &dword_187C33000);
}

void *wireless_diagnostics::google::protobuf::UnknownFieldSet::UnknownFieldSet(void *this)
{
  *this = 0LL;
  return this;
}

{
  *this = 0LL;
  return this;
}

void wireless_diagnostics::google::protobuf::UnknownFieldSet::~UnknownFieldSet( wireless_diagnostics::google::protobuf::UnknownFieldSet *this)
{
  if (*(void *)this)
  {
    wireless_diagnostics::google::protobuf::UnknownFieldSet::ClearFallback(this);
    uint64_t v2 = *(void ***)this;
    if (*(void *)this)
    {
      unint64_t v3 = *v2;
      if (*v2)
      {
        v2[1] = v3;
        operator delete(v3);
      }

      operator delete(v2);
    }
  }

void wireless_diagnostics::google::protobuf::UnknownFieldSet::ClearFallback(uint64_t **this)
{
  uint64_t v1 = *this;
  uint64_t v2 = (*this)[1];
  if (v2 != **this)
  {
    uint64_t v4 = 0LL;
    unint64_t v5 = 0LL;
    uint64_t v2 = **this;
    do
    {
      wireless_diagnostics::google::protobuf::UnknownField::Delete((wireless_diagnostics::google::protobuf::UnknownField *)(v2 + v4));
      ++v5;
      uint64_t v1 = *this;
      uint64_t v2 = **this;
      v4 += 16LL;
    }

    while (v5 < ((*this)[1] - v2) >> 4);
  }

  v1[1] = v2;
}

void wireless_diagnostics::google::protobuf::UnknownField::Delete( wireless_diagnostics::google::protobuf::UnknownField *this)
{
  int v1 = *(_DWORD *)this >> 29;
  if (v1 == 4)
  {
    uint64_t v2 = *((void *)this + 1);
    if (!v2) {
      return;
    }
    wireless_diagnostics::google::protobuf::UnknownFieldSet::~UnknownFieldSet(*((wireless_diagnostics::google::protobuf::UnknownFieldSet **)this
                                                                              + 1));
    goto LABEL_8;
  }

  if (v1 == 3)
  {
    uint64_t v2 = *((void *)this + 1);
    if (v2)
    {
LABEL_8:
      operator delete((void *)v2);
    }
  }

void wireless_diagnostics::google::protobuf::UnknownFieldSet::ClearAndFreeMemory(uint64_t **this)
{
  if (*this)
  {
    wireless_diagnostics::google::protobuf::UnknownFieldSet::ClearFallback(this);
    uint64_t v2 = *this;
    if (*this)
    {
      unint64_t v3 = (void *)*v2;
      if (*v2)
      {
        v2[1] = (uint64_t)v3;
        operator delete(v3);
      }

      operator delete(v2);
    }

    *this = 0LL;
  }

void wireless_diagnostics::google::protobuf::UnknownFieldSet::MergeFrom( void ***this, const wireless_diagnostics::google::protobuf::UnknownFieldSet *a2)
{
  uint64_t v4 = 0LL;
  for (uint64_t i = 0LL; ; ++i)
  {
    uint64_t v6 = *(void **)a2;
    if (*(void *)a2) {
      uint64_t v7 = (v6[1] - *v6) >> 4;
    }
    else {
      LODWORD(v7) = 0;
    }
    wireless_diagnostics::google::protobuf::UnknownFieldSet::AddField( this,  (const wireless_diagnostics::google::protobuf::UnknownField *)(*v6 + v4));
    v4 += 16LL;
  }

void wireless_diagnostics::google::protobuf::UnknownFieldSet::AddField( void ***this, const wireless_diagnostics::google::protobuf::UnknownField *a2)
{
  uint64_t v4 = *this;
  if (!*this)
  {
    uint64_t v4 = (void **)operator new(0x18uLL);
    v4[1] = 0LL;
    v4[2] = 0LL;
    *uint64_t v4 = 0LL;
    *this = v4;
  }

  unint64_t v5 = (unint64_t)v4[2];
  uint64_t v6 = v4[1];
  if ((unint64_t)v6 >= v5)
  {
    uint64_t v8 = ((char *)v6 - (_BYTE *)*v4) >> 4;
    unint64_t v9 = v8 + 1;
    uint64_t v10 = v5 - (void)*v4;
    if (v10 >> 3 > v9) {
      unint64_t v9 = v10 >> 3;
    }
    else {
      unint64_t v11 = v9;
    }
    if (v11) {
      __int128 v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>>( (uint64_t)(v4 + 2),  v11);
    }
    else {
      __int128 v12 = 0LL;
    }
    char v13 = &v12[16 * v8];
    BOOL v14 = &v12[16 * v11];
    *(_OWORD *)char v13 = *(_OWORD *)a2;
    uint64_t v7 = v13 + 16;
    uint64_t v16 = (char *)*v4;
    __int128 v15 = (char *)v4[1];
    if (v15 != *v4)
    {
      do
      {
        *((_OWORD *)v13 - 1) = *((_OWORD *)v15 - 1);
        v13 -= 16;
        v15 -= 16;
      }

      while (v15 != v16);
      __int128 v15 = (char *)*v4;
    }

    *uint64_t v4 = v13;
    v4[1] = v7;
    v4[2] = v14;
    if (v15) {
      operator delete(v15);
    }
  }

  else
  {
    _OWORD *v6 = *(_OWORD *)a2;
    uint64_t v7 = v6 + 1;
  }

  v4[1] = v7;
  wireless_diagnostics::google::protobuf::UnknownField::DeepCopy((const wireless_diagnostics::google::protobuf::UnknownFieldSet **)(*this)[1] - 2);
}

uint64_t wireless_diagnostics::google::protobuf::UnknownFieldSet::SpaceUsedExcludingSelf(uint64_t **this)
{
  if (!*this) {
    return 0LL;
  }
  uint64_t v1 = **this;
  uint64_t v2 = (*this)[1];
  uint64_t v3 = (((_DWORD)v2 - (_DWORD)v1) & 0xFFFFFFF0) + 24;
  if (v2 != v1)
  {
    uint64_t v5 = 0LL;
    unint64_t v6 = 0LL;
    do
    {
      int v7 = *(_DWORD *)(v1 + v5) >> 29;
      if (v7 == 4)
      {
        uint64_t v3 = v3
      }

      else if (v7 == 3)
      {
        uint64_t v3 = v3
      }

      ++v6;
      uint64_t v1 = **this;
      v5 += 16LL;
    }

    while (v6 < ((*this)[1] - v1) >> 4);
  }

  return v3;
}

uint64_t wireless_diagnostics::google::protobuf::UnknownFieldSet::SpaceUsed(uint64_t **this)
{
  return wireless_diagnostics::google::protobuf::UnknownFieldSet::SpaceUsedExcludingSelf(this) + 8;
}

void wireless_diagnostics::google::protobuf::UnknownFieldSet::AddVarint(void ***this, int a2, uint64_t a3)
{
  uint64_t v5 = *this;
  if (!*this)
  {
    uint64_t v5 = (void **)operator new(0x18uLL);
    v5[1] = 0LL;
    uint64_t v5[2] = 0LL;
    *uint64_t v5 = 0LL;
    *this = v5;
  }

  int v7 = a2 & 0x1FFFFFFF;
  uint64_t v8 = (char *)v5[2];
  unint64_t v9 = (char *)v5[1];
  if (v9 >= v8)
  {
    uint64_t v11 = (v9 - (_BYTE *)*v5) >> 4;
    unint64_t v12 = v11 + 1;
    uint64_t v13 = v8 - (_BYTE *)*v5;
    if (v13 >> 3 > v12) {
      unint64_t v12 = v13 >> 3;
    }
    else {
      unint64_t v14 = v12;
    }
    if (v14) {
      __int128 v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>>( (uint64_t)(v5 + 2),  v14);
    }
    else {
      __int128 v15 = 0LL;
    }
    uint64_t v16 = &v15[16 * v11];
    unint64_t v17 = &v15[16 * v14];
    *(_DWORD *)uint64_t v16 = v7;
    *((void *)v16 + 1) = a3;
    uint64_t v10 = v16 + 16;
    __int128 v19 = (char *)*v5;
    int v18 = (char *)v5[1];
    if (v18 != *v5)
    {
      do
      {
        *((_OWORD *)v16 - 1) = *((_OWORD *)v18 - 1);
        v16 -= 16;
        v18 -= 16;
      }

      while (v18 != v19);
      int v18 = (char *)*v5;
    }

    *uint64_t v5 = v16;
    v5[1] = v10;
    uint64_t v5[2] = v17;
    if (v18) {
      operator delete(v18);
    }
  }

  else
  {
    *(_DWORD *)unint64_t v9 = v7;
    *((void *)v9 + 1) = a3;
    uint64_t v10 = v9 + 16;
  }

  v5[1] = v10;
}

void wireless_diagnostics::google::protobuf::UnknownFieldSet::AddFixed32(void ***this, int a2, int a3)
{
  uint64_t v5 = *this;
  if (!*this)
  {
    uint64_t v5 = (void **)operator new(0x18uLL);
    v5[1] = 0LL;
    uint64_t v5[2] = 0LL;
    *uint64_t v5 = 0LL;
    *this = v5;
  }

  int v7 = a2 & 0x1FFFFFFF | 0x20000000;
  unint64_t v8 = (unint64_t)v5[2];
  unint64_t v9 = (int *)v5[1];
  if ((unint64_t)v9 >= v8)
  {
    uint64_t v11 = ((char *)v9 - (_BYTE *)*v5) >> 4;
    unint64_t v12 = v11 + 1;
    uint64_t v13 = v8 - (void)*v5;
    if (v13 >> 3 > v12) {
      unint64_t v12 = v13 >> 3;
    }
    else {
      unint64_t v14 = v12;
    }
    if (v14) {
      __int128 v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>>( (uint64_t)(v5 + 2),  v14);
    }
    else {
      __int128 v15 = 0LL;
    }
    uint64_t v16 = (int *)&v15[16 * v11];
    unint64_t v17 = &v15[16 * v14];
    *uint64_t v16 = v7;
    v16[2] = a3;
    uint64_t v10 = v16 + 4;
    __int128 v19 = (char *)*v5;
    int v18 = (char *)v5[1];
    if (v18 != *v5)
    {
      do
      {
        *((_OWORD *)v16 - 1) = *((_OWORD *)v18 - 1);
        v16 -= 4;
        v18 -= 16;
      }

      while (v18 != v19);
      int v18 = (char *)*v5;
    }

    *uint64_t v5 = v16;
    v5[1] = v10;
    uint64_t v5[2] = v17;
    if (v18) {
      operator delete(v18);
    }
  }

  else
  {
    *unint64_t v9 = v7;
    uint64_t v9[2] = a3;
    uint64_t v10 = v9 + 4;
  }

  v5[1] = v10;
}

void wireless_diagnostics::google::protobuf::UnknownFieldSet::AddFixed64(void ***this, int a2, uint64_t a3)
{
  uint64_t v5 = *this;
  if (!*this)
  {
    uint64_t v5 = (void **)operator new(0x18uLL);
    v5[1] = 0LL;
    uint64_t v5[2] = 0LL;
    *uint64_t v5 = 0LL;
    *this = v5;
  }

  int v7 = a2 & 0x1FFFFFFF | 0x40000000;
  unint64_t v8 = (char *)v5[2];
  unint64_t v9 = (char *)v5[1];
  if (v9 >= v8)
  {
    uint64_t v11 = (v9 - (_BYTE *)*v5) >> 4;
    unint64_t v12 = v11 + 1;
    uint64_t v13 = v8 - (_BYTE *)*v5;
    if (v13 >> 3 > v12) {
      unint64_t v12 = v13 >> 3;
    }
    else {
      unint64_t v14 = v12;
    }
    if (v14) {
      __int128 v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>>( (uint64_t)(v5 + 2),  v14);
    }
    else {
      __int128 v15 = 0LL;
    }
    uint64_t v16 = &v15[16 * v11];
    unint64_t v17 = &v15[16 * v14];
    *(_DWORD *)uint64_t v16 = v7;
    *((void *)v16 + 1) = a3;
    uint64_t v10 = v16 + 16;
    __int128 v19 = (char *)*v5;
    int v18 = (char *)v5[1];
    if (v18 != *v5)
    {
      do
      {
        *((_OWORD *)v16 - 1) = *((_OWORD *)v18 - 1);
        v16 -= 16;
        v18 -= 16;
      }

      while (v18 != v19);
      int v18 = (char *)*v5;
    }

    *uint64_t v5 = v16;
    v5[1] = v10;
    uint64_t v5[2] = v17;
    if (v18) {
      operator delete(v18);
    }
  }

  else
  {
    *(_DWORD *)unint64_t v9 = v7;
    *((void *)v9 + 1) = a3;
    uint64_t v10 = v9 + 16;
  }

  v5[1] = v10;
}

void *wireless_diagnostics::google::protobuf::UnknownFieldSet::AddLengthDelimited(void ***this, int a2)
{
  uint64_t v3 = *this;
  if (!*this)
  {
    uint64_t v3 = (void **)operator new(0x18uLL);
    v3[1] = 0LL;
    void v3[2] = 0LL;
    *uint64_t v3 = 0LL;
    *this = v3;
  }

  int v5 = a2 & 0x1FFFFFFF | 0x60000000;
  unint64_t v6 = operator new(0x18uLL);
  v6[1] = 0LL;
  v6[2] = 0LL;
  void *v6 = 0LL;
  int v7 = (char *)v3[2];
  unint64_t v8 = (char *)v3[1];
  if (v8 >= v7)
  {
    uint64_t v10 = (v8 - (_BYTE *)*v3) >> 4;
    unint64_t v11 = v10 + 1;
    uint64_t v12 = v7 - (_BYTE *)*v3;
    if (v12 >> 3 > v11) {
      unint64_t v11 = v12 >> 3;
    }
    else {
      unint64_t v13 = v11;
    }
    if (v13) {
      unint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>>( (uint64_t)(v3 + 2),  v13);
    }
    else {
      unint64_t v14 = 0LL;
    }
    __int128 v15 = &v14[16 * v10];
    uint64_t v16 = &v14[16 * v13];
    *(_DWORD *)__int128 v15 = v5;
    *((void *)v15 + 1) = v6;
    unint64_t v9 = v15 + 16;
    int v18 = (char *)*v3;
    unint64_t v17 = (char *)v3[1];
    if (v17 != *v3)
    {
      do
      {
        *((_OWORD *)v15 - 1) = *((_OWORD *)v17 - 1);
        v15 -= 16;
        v17 -= 16;
      }

      while (v17 != v18);
      unint64_t v17 = (char *)*v3;
    }

    *uint64_t v3 = v15;
    v3[1] = v9;
    void v3[2] = v16;
    if (v17) {
      operator delete(v17);
    }
  }

  else
  {
    *(_DWORD *)unint64_t v8 = v5;
    *((void *)v8 + 1) = v6;
    unint64_t v9 = v8 + 16;
  }

  v3[1] = v9;
  return v6;
}

void *wireless_diagnostics::google::protobuf::UnknownFieldSet::AddGroup(void ***this, int a2)
{
  uint64_t v3 = *this;
  if (!*this)
  {
    uint64_t v3 = (void **)operator new(0x18uLL);
    v3[1] = 0LL;
    void v3[2] = 0LL;
    *uint64_t v3 = 0LL;
    *this = v3;
  }

  unsigned int v5 = a2 & 0x1FFFFFFF | 0x80000000;
  unint64_t v6 = operator new(8uLL);
  void *v6 = 0LL;
  int v7 = (char *)v3[2];
  unint64_t v8 = (char *)v3[1];
  if (v8 >= v7)
  {
    uint64_t v10 = (v8 - (_BYTE *)*v3) >> 4;
    unint64_t v11 = v10 + 1;
    uint64_t v12 = v7 - (_BYTE *)*v3;
    if (v12 >> 3 > v11) {
      unint64_t v11 = v12 >> 3;
    }
    else {
      unint64_t v13 = v11;
    }
    if (v13) {
      unint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>>( (uint64_t)(v3 + 2),  v13);
    }
    else {
      unint64_t v14 = 0LL;
    }
    __int128 v15 = &v14[16 * v10];
    uint64_t v16 = &v14[16 * v13];
    *(_DWORD *)__int128 v15 = v5;
    *((void *)v15 + 1) = v6;
    unint64_t v9 = v15 + 16;
    int v18 = (char *)*v3;
    unint64_t v17 = (char *)v3[1];
    if (v17 != *v3)
    {
      do
      {
        *((_OWORD *)v15 - 1) = *((_OWORD *)v17 - 1);
        v15 -= 16;
        v17 -= 16;
      }

      while (v17 != v18);
      unint64_t v17 = (char *)*v3;
    }

    *uint64_t v3 = v15;
    v3[1] = v9;
    void v3[2] = v16;
    if (v17) {
      operator delete(v17);
    }
  }

  else
  {
    *(_DWORD *)unint64_t v8 = v5;
    *((void *)v8 + 1) = v6;
    unint64_t v9 = v8 + 16;
  }

  v3[1] = v9;
  return v6;
}

void wireless_diagnostics::google::protobuf::UnknownField::DeepCopy( const wireless_diagnostics::google::protobuf::UnknownFieldSet **this)
{
  int v2 = *(_DWORD *)this >> 29;
  if (v2 == 4)
  {
    uint64_t v4 = (wireless_diagnostics::google::protobuf::UnknownFieldSet *)operator new(8uLL);
    *(void *)uint64_t v4 = 0LL;
    wireless_diagnostics::google::protobuf::UnknownFieldSet::MergeFrom(v4, this[1]);
  }

  else
  {
    if (v2 != 3) {
      return;
    }
    uint64_t v3 = (std::string *)operator new(0x18uLL);
    uint64_t v4 = (wireless_diagnostics::google::protobuf::UnknownFieldSet *)v3;
    unsigned int v5 = this[1];
    if (*((char *)v5 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v3, *(const std::string::value_type **)v5, *((void *)v5 + 1));
    }

    else
    {
      __int128 v6 = *(_OWORD *)v5;
      v3->__r_.__value_.__l.__cap_ = *((void *)v5 + 2);
      *(_OWORD *)&v3->__r_.__value_.__l.__data_ = v6;
    }
  }

  this[1] = v4;
}

void sub_187C59040(_Unwind_Exception *a1)
{
}

void wireless_diagnostics::google::protobuf::UnknownFieldSet::DeleteSubrange(uint64_t **this, int a2, int a3)
{
  if (a3 >= 1)
  {
    uint64_t v6 = 16LL * a2;
    uint64_t v7 = a3;
    do
    {
      wireless_diagnostics::google::protobuf::UnknownField::Delete((wireless_diagnostics::google::protobuf::UnknownField *)(**this + v6));
      v6 += 16LL;
      --v7;
    }

    while (v7);
  }

  unint64_t v8 = a3 + a2;
  unint64_t v9 = *this;
  uint64_t v11 = **this;
  uint64_t v10 = (*this)[1];
  if (v8 < (v10 - v11) >> 4)
  {
    uint64_t v12 = 16 * v8;
    do
    {
      *(_OWORD *)(v11 + v12 - 16LL * a3) = *(_OWORD *)(v11 + v12);
      ++v8;
      unint64_t v9 = *this;
      uint64_t v11 = **this;
      uint64_t v10 = (*this)[1];
      v12 += 16LL;
    }

    while (v8 < (v10 - v11) >> 4);
  }

  if (a3 >= 1) {
    v9[1] = v10 - 16LL * (a3 - 1) - 16;
  }
}

void wireless_diagnostics::google::protobuf::UnknownFieldSet::DeleteByNumber(uint64_t **this, int a2)
{
  uint64_t v3 = *this;
  if (v3)
  {
    uint64_t v4 = *v3;
    if (v3[1] == *v3)
    {
      int v8 = 0;
    }

    else
    {
      uint64_t v6 = 0LL;
      unint64_t v7 = 0LL;
      int v8 = 0;
      do
      {
        unint64_t v9 = (wireless_diagnostics::google::protobuf::UnknownField *)(v4 + v6);
        if ((*(_DWORD *)(v4 + v6) & 0x1FFFFFFF) == a2)
        {
          wireless_diagnostics::google::protobuf::UnknownField::Delete(v9);
        }

        else
        {
          if (v7 != v8) {
            *(_OWORD *)(v4 + 16LL * v8) = *(_OWORD *)v9;
          }
          ++v8;
        }

        ++v7;
        uint64_t v3 = *this;
        uint64_t v4 = **this;
        v6 += 16LL;
      }

      while (v7 < ((*this)[1] - v4) >> 4);
    }

    std::vector<wireless_diagnostics::google::protobuf::UnknownField>::resize((uint64_t)v3, v8);
  }

void std::vector<wireless_diagnostics::google::protobuf::UnknownField>::resize( uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 4;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 16 * a2;
    }
  }

  else
  {
    std::vector<wireless_diagnostics::google::protobuf::UnknownField>::__append((void **)a1, a2 - v2);
  }

uint64_t wireless_diagnostics::google::protobuf::UnknownFieldSet::MergeFromCodedStream( void ***this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, wireless_diagnostics::google::protobuf::UnknownFieldSet *a3, wireless_diagnostics::google::protobuf::UnknownFieldSet *a4)
{
  int v8 = 0LL;
  if (wireless_diagnostics::google::protobuf::internal::WireFormat::SkipMessage(a2, &v8, a3, a4)
    && *((_BYTE *)a2 + 36))
  {
    wireless_diagnostics::google::protobuf::UnknownFieldSet::MergeFrom( this,  (const wireless_diagnostics::google::protobuf::UnknownFieldSet *)&v8);
    uint64_t v6 = 1LL;
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  wireless_diagnostics::google::protobuf::UnknownFieldSet::~UnknownFieldSet((wireless_diagnostics::google::protobuf::UnknownFieldSet *)&v8);
  return v6;
}

void sub_187C5926C(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t wireless_diagnostics::google::protobuf::UnknownFieldSet::ParseFromCodedStream( uint64_t **this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, wireless_diagnostics::google::protobuf::UnknownFieldSet *a3, wireless_diagnostics::google::protobuf::UnknownFieldSet *a4)
{
  if (*this) {
    wireless_diagnostics::google::protobuf::UnknownFieldSet::ClearFallback(this);
  }
  return wireless_diagnostics::google::protobuf::UnknownFieldSet::MergeFromCodedStream((void ***)this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::UnknownFieldSet::ParseFromZeroCopyStream( uint64_t **a1, uint64_t a2)
{
  v9[0] = a2;
  memset(&v9[1], 0, 30);
  __int128 v10 = xmmword_187C8A2B0;
  int v3 = *MEMORY[0x189616B88];
  int v11 = 0;
  int v12 = v3;
  uint64_t v13 = 0LL;
  uint64_t v14 = 0LL;
  wireless_diagnostics::google::protobuf::io::CodedInputStream::Refresh((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v9);
  unsigned int v6 = wireless_diagnostics::google::protobuf::UnknownFieldSet::ParseFromCodedStream( a1,  (wireless_diagnostics::google::protobuf::io::CodedInputStream *)v9,  v4,  v5);
  if (BYTE4(v9[4])) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0LL;
  }
  MEMORY[0x1895B33B8](v9);
  return v7;
}

uint64_t wireless_diagnostics::google::protobuf::UnknownFieldSet::ParseFromArray( uint64_t **this, const void *a2)
{
  uint64_t v3 = wireless_diagnostics::google::protobuf::UnknownFieldSet::ParseFromZeroCopyStream(this, (uint64_t)v5);
  MEMORY[0x1895B3334](v5);
  return v3;
}

uint64_t wireless_diagnostics::google::protobuf::UnknownField::SerializeLengthDelimitedNoTag( wireless_diagnostics::google::protobuf::UnknownField *this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2)
{
  uint64_t v3 = (char *)*((void *)this + 1);
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32(a2);
  if (v3[23] >= 0) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = *(char **)v3;
  }
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteRaw(a2, v4);
}

uint64_t wireless_diagnostics::google::protobuf::UnknownField::SerializeLengthDelimitedNoTagToArray( wireless_diagnostics::google::protobuf::UnknownField *this, unsigned __int8 *a2, uint64_t a3, unsigned __int8 *a4)
{
  uint64_t v4 = *((void *)this + 1);
  else {
    unsigned int v5 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*(unsigned __int8 *)(v4 + 23);
  }
  if (v5 > 0x7F)
  {
    unsigned int v6 = (unsigned __int8 *)wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32FallbackToArray( v5,  (uint64_t)a2,  a2);
  }

  else
  {
    *a2 = v5;
    unsigned int v6 = a2 + 1;
  }

  int v7 = *(char *)(v4 + 23);
  if (v7 >= 0) {
    int v8 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v4;
  }
  else {
    int v8 = *(wireless_diagnostics::google::protobuf::io::CodedOutputStream **)v4;
  }
  if (v7 >= 0) {
    unint64_t v9 = (const void *)*(unsigned __int8 *)(v4 + 23);
  }
  else {
    unint64_t v9 = (const void *)*(unsigned int *)(v4 + 8);
  }
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteRawToArray(v8, v9, (uint64_t)v6, a4);
}

void std::vector<wireless_diagnostics::google::protobuf::UnknownField>::__append( void **a1, unint64_t a2)
{
  unsigned int v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unsigned int v5 = v6;
  int v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 4)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 16 * a2);
      v7 += 16 * a2;
    }

    a1[1] = v7;
  }

  else
  {
    uint64_t v8 = v7 - (_BYTE *)*a1;
    unint64_t v9 = a2 + (v8 >> 4);
    if (v9 >> 60) {
      std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 4;
    uint64_t v11 = v5 - (_BYTE *)*a1;
    if (v11 >> 3 > v9) {
      unint64_t v9 = v11 >> 3;
    }
    else {
      unint64_t v12 = v9;
    }
    if (v12) {
      uint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<wireless_diagnostics::google::protobuf::Descriptor const*,int>>>( v4,  v12);
    }
    else {
      uint64_t v13 = 0LL;
    }
    uint64_t v14 = &v13[16 * v10];
    __int128 v15 = &v13[16 * v12];
    bzero(v14, 16 * a2);
    uint64_t v16 = &v14[16 * a2];
    int v18 = (char *)*a1;
    unint64_t v17 = (char *)a1[1];
    if (v17 != *a1)
    {
      do
      {
        *((_OWORD *)v14 - 1) = *((_OWORD *)v17 - 1);
        v14 -= 16;
        v17 -= 16;
      }

      while (v17 != v18);
      unint64_t v17 = (char *)*a1;
    }

    *a1 = v14;
    a1[1] = v16;
    a1[2] = v15;
    if (v17) {
      operator delete(v17);
    }
  }

char *wireless_diagnostics::google::protobuf::StripString(char *__s, char *__charset, char a3)
{
  unsigned int v6 = __s;
  if (__s[23] < 0) {
    unsigned int v6 = *(char **)__s;
  }
  for (uint64_t i = v6; ; uint64_t i = result + 1)
  {
    uint64_t result = strpbrk(i, __charset);
    if (!result) {
      break;
    }
    unint64_t v9 = __s;
    if (__s[23] < 0) {
      unint64_t v9 = *(char **)__s;
    }
    v9[result - v6] = a3;
  }

  return result;
}

std::string *wireless_diagnostics::google::protobuf::StringReplace( std::string *__str, uint64_t a2, uint64_t a3, char a4, std::string *this)
{
  unsigned int v5 = this;
  uint64_t v7 = *(unsigned __int8 *)(a2 + 23);
  uint64_t v8 = *(void *)(a2 + 8);
  if ((v7 & 0x80u) == 0LL) {
    uint64_t v9 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    uint64_t v9 = *(void *)(a2 + 8);
  }
  if (v9)
  {
    std::string::size_type v11 = 0LL;
    while (1)
    {
      std::string::size_type size = __str->__r_.__value_.__s.__size_;
      signed __int8 v13 = size;
      std::string::size_type v14 = __str->__r_.__value_.__l.__size_;
      __int128 v15 = (size & 0x80u) == 0LL ? __str : (std::string *)__str->__r_.__value_.__r.__words[0];
      std::string::size_type v16 = (size & 0x80u) == 0LL ? __str->__r_.__value_.__s.__size_ : __str->__r_.__value_.__l.__size_;
      unint64_t v17 = (v7 & 0x80u) == 0LL ? (char *)a2 : *(char **)a2;
      int64_t v18 = (v7 & 0x80u) == 0LL ? v7 : v8;
      if (v16 < v11) {
        break;
      }
      std::string::size_type v19 = v11;
      if (v18)
      {
        __int128 v20 = (char *)v15 + v11;
        uint64_t v21 = (char *)v15 + v16;
        int64_t v22 = v16 - v11;
        std::string::size_type v37 = __str->__r_.__value_.__l.__size_;
        int v23 = *v17;
        while (1)
        {
          int64_t v24 = v22 - v18;
          if (v24 == -1 || (unint64_t v25 = (char *)memchr(v20, v23, v24 + 1)) == 0LL)
          {
LABEL_41:
            unsigned int v5 = this;
            std::string::size_type v14 = v37;
            signed __int8 v13 = size;
            goto LABEL_42;
          }

          uint64_t v26 = v25;
          if (!memcmp(v25, v17, v18)) {
            break;
          }
          __int128 v20 = v26 + 1;
          int64_t v22 = v21 - (v26 + 1);
          if (v22 < v18) {
            goto LABEL_41;
          }
        }

        unsigned int v5 = this;
        std::string::size_type v14 = v37;
        signed __int8 v13 = size;
        if (v26 == v21) {
          break;
        }
        std::string::size_type v19 = v26 - (char *)v15;
      }

      if (v19 == -1LL) {
        break;
      }
      std::string::append(v5, __str, v11, v19 - v11);
      int v27 = *(char *)(a3 + 23);
      if (v27 >= 0) {
        std::string::size_type v28 = (const std::string::value_type *)a3;
      }
      else {
        std::string::size_type v28 = *(const std::string::value_type **)a3;
      }
      if (v27 >= 0) {
        std::string::size_type v29 = *(unsigned __int8 *)(a3 + 23);
      }
      else {
        std::string::size_type v29 = *(void *)(a3 + 8);
      }
      std::string::append(v5, v28, v29);
      uint64_t v7 = *(unsigned __int8 *)(a2 + 23);
      uint64_t v8 = *(void *)(a2 + 8);
      if ((v7 & 0x80u) == 0LL) {
        uint64_t v30 = *(unsigned __int8 *)(a2 + 23);
      }
      else {
        uint64_t v30 = *(void *)(a2 + 8);
      }
      std::string::size_type v11 = v30 + v19;
      if ((a4 & 1) == 0)
      {
        std::string::size_type size = __str->__r_.__value_.__s.__size_;
        std::string::size_type v14 = __str->__r_.__value_.__l.__size_;
        signed __int8 v13 = __str->__r_.__value_.__s.__size_;
        break;
      }
    }

std::string *wireless_diagnostics::google::protobuf::StringReplace@<X0>( std::string *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, std::string *a5@<X8>)
{
  a5->__r_.__value_.__r.__words[0] = 0LL;
  a5->__r_.__value_.__l.__size_ = 0LL;
  a5->__r_.__value_.__l.__cap_ = 0LL;
  return wireless_diagnostics::google::protobuf::StringReplace(a1, a2, a3, a4, a5);
}

void sub_187C59810(_Unwind_Exception *exception_object)
{
}

void wireless_diagnostics::google::protobuf::SplitStringUsing( const std::string *a1, char *__s, std::vector<std::string> *a3)
{
  int v5 = *__s;
  if (*__s && !__s[1])
  {
    std::string::size_type size = a1->__r_.__value_.__s.__size_;
    if ((size & 0x80u) == 0LL) {
      uint64_t v30 = (std::string *)a1;
    }
    else {
      uint64_t v30 = (std::string *)a1->__r_.__value_.__r.__words[0];
    }
    if ((size & 0x80u) != 0LL) {
      std::string::size_type size = a1->__r_.__value_.__l.__size_;
    }
    if (size)
    {
      std::string::size_type v31 = (unsigned __int8 *)v30 + size;
      unint64_t v32 = (unsigned __int8 *)v30 + size;
      do
      {
        if (v30->__r_.__value_.__s.__data_[0] == v5)
        {
          int v33 = (unsigned __int8 *)&v30->__r_.__value_.__s.__data_[1];
        }

        else
        {
          unint64_t v34 = (unsigned __int8 *)&v30->__r_.__value_.__s.__data_[1];
          while (v34 != v31)
          {
            int v35 = *v34++;
            if (v35 == v5)
            {
              int v33 = v34 - 1;
              goto LABEL_60;
            }
          }

          int v33 = v32;
LABEL_60:
          std::string::basic_string[abi:ne180100](&__dst, v30, v33 - (unsigned __int8 *)v30);
          std::string::size_type v37 = a3;
          std::back_insert_iterator<std::vector<std::string>>::operator=[abi:ne180100](&v37, (__int128 *)&__dst);
        }

        uint64_t v30 = (std::string *)v33;
      }

      while (v33 != v31);
    }
  }

  else
  {
    std::string::size_type v6 = a1->__r_.__value_.__s.__size_;
    std::string::size_type v7 = a1->__r_.__value_.__r.__words[0];
    std::string::size_type v8 = a1->__r_.__value_.__l.__size_;
    if ((v6 & 0x80u) == 0LL) {
      std::string::size_type v9 = (std::string::size_type)a1;
    }
    else {
      std::string::size_type v9 = a1->__r_.__value_.__r.__words[0];
    }
    if ((v6 & 0x80u) == 0LL) {
      std::string::size_type v10 = a1->__r_.__value_.__s.__size_;
    }
    else {
      std::string::size_type v10 = a1->__r_.__value_.__l.__size_;
    }
    size_t v11 = strlen(__s);
    if (v10)
    {
      unint64_t v12 = (char *)v9;
      size_t v13 = v11;
      if (v11)
      {
        while (memchr(__s, *v12, v13))
        {
          ++v12;
          if (!--v10) {
            return;
          }
        }
      }

      std::string::size_type v14 = (std::string::size_type)&v12[-v9];
      while (2)
      {
        if (v14 != -1LL)
        {
          if ((v6 & 0x80u) != 0LL)
          {
            std::string::size_type v15 = v8;
          }

          else
          {
            std::string::size_type v7 = (std::string::size_type)a1;
            std::string::size_type v15 = v6;
          }

          size_t v16 = strlen(__s);
          if (v15 <= v14 || v16 == 0)
          {
LABEL_64:
            std::string::basic_string(&__dst, a1, v14, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v37);
            std::string::size_type v37 = a3;
            std::back_insert_iterator<std::vector<std::string>>::operator=[abi:ne180100](&v37, (__int128 *)&__dst);
          }

          else
          {
            int64_t v18 = (unsigned __int8 *)(v7 + v14);
            std::string::size_type v19 = (unsigned __int8 *)(v7 + v15);
            uint64_t v20 = -(uint64_t)v14;
LABEL_24:
            uint64_t v21 = 0LL;
            while (*v18 != __s[v21])
            {
              if (v16 == ++v21)
              {
                ++v18;
                --v20;
                if (v18 != v19) {
                  goto LABEL_24;
                }
                goto LABEL_64;
              }
            }

            if (v18 == v19) {
              goto LABEL_64;
            }
            int64_t v22 = &v18[-v7];
            std::string::basic_string(&__dst, a1, v14, (std::string::size_type)&v22[-v14], (std::allocator<char> *)&v37);
            std::string::size_type v37 = a3;
            std::back_insert_iterator<std::vector<std::string>>::operator=[abi:ne180100](&v37, (__int128 *)&__dst);
            std::string::size_type v6 = a1->__r_.__value_.__s.__size_;
            std::string::size_type v7 = a1->__r_.__value_.__r.__words[0];
            std::string::size_type v8 = a1->__r_.__value_.__l.__size_;
            if ((v6 & 0x80u) == 0LL) {
              std::string::size_type v23 = (std::string::size_type)a1;
            }
            else {
              std::string::size_type v23 = a1->__r_.__value_.__r.__words[0];
            }
            if ((v6 & 0x80u) == 0LL) {
              std::string::size_type v24 = a1->__r_.__value_.__s.__size_;
            }
            else {
              std::string::size_type v24 = a1->__r_.__value_.__l.__size_;
            }
            size_t v25 = strlen(__s);
            if (v24 > (unint64_t)v22)
            {
              size_t v26 = v25;
              int v27 = &v22[v23];
              if (v25)
              {
                std::string::size_type v28 = v24 + v20;
                while (memchr(__s, (char)*v27, v26))
                {
                  ++v27;
                  if (!--v28) {
                    return;
                  }
                }
              }

              std::string::size_type v14 = (std::string::size_type)&v27[-v23];
              continue;
            }
          }
        }

        break;
      }
    }
  }

void sub_187C59AD8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void wireless_diagnostics::google::protobuf::SplitStringAllowEmpty( const std::string *a1, char *__s, std::vector<std::string> *a3)
{
  int size = (char)a1->__r_.__value_.__s.__size_;
  if (size >= 0) {
    std::string::size_type v7 = a1->__r_.__value_.__s.__size_;
  }
  else {
    std::string::size_type v7 = a1->__r_.__value_.__l.__size_;
  }
  size_t v8 = strlen(__s);
  std::string::size_type v9 = 0LL;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    if (size >= 0) {
      size_t v11 = a1;
    }
    else {
      size_t v11 = (const std::string *)a1->__r_.__value_.__r.__words[0];
    }
LABEL_11:
    unint64_t v12 = (unsigned __int8 *)v11 + v9;
    size_t v13 = (unsigned __int8 *)v11 + v7;
    while (2)
    {
      uint64_t v14 = 0LL;
      do
      {
        if (*v12 == __s[v14])
        {
          if (v12 == v13) {
            goto LABEL_32;
          }
          std::string::size_type v15 = (unsigned __int8 *)(v12 - (unsigned __int8 *)v11);
          std::string::basic_string(&v19, a1, v9, (std::string::size_type)&v15[-v9], (std::allocator<char> *)&v18);
          int64_t v18 = a3;
          std::back_insert_iterator<std::vector<std::string>>::operator=[abi:ne180100](&v18, (__int128 *)&v19);
          std::string::size_type v9 = (std::string::size_type)(v15 + 1);
          int v16 = (char)a1->__r_.__value_.__s.__size_;
          size_t v11 = v16 >= 0 ? a1 : (const std::string *)a1->__r_.__value_.__r.__words[0];
          std::string::size_type v7 = v16 >= 0 ? a1->__r_.__value_.__s.__size_ : a1->__r_.__value_.__l.__size_;
          size_t v8 = strlen(__s);
          if (v7 <= v9 || v8 == 0) {
            goto LABEL_32;
          }
          goto LABEL_11;
        }

        ++v14;
      }

      while (v8 != v14);
      if (++v12 != v13) {
        continue;
      }
      break;
    }
  }

void sub_187C59C5C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void wireless_diagnostics::google::protobuf::JoinStrings(uint64_t *a1, char *__s, std::string *a3)
{
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  if (!a3)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v17);
  }

  if ((char)a3->__r_.__value_.__s.__size_ < 0)
  {
    *a3->__r_.__value_.__l.__data_ = 0;
    a3->__r_.__value_.__l.__size_ = 0LL;
  }

  else
  {
    a3->__r_.__value_.__s.__data_[0] = 0;
    a3->__r_.__value_.__s.__size_ = 0;
  }

  int v7 = strlen(__s);
  if (v6 == v5)
  {
    std::string::reserve(a3, 0LL);
  }

  else
  {
    int v8 = v7;
    uint64_t v9 = 0LL;
    int v10 = 0;
    uint64_t v11 = v5;
    do
    {
      if (v9) {
        int v12 = v7;
      }
      else {
        int v12 = 0;
      }
      else {
        LODWORD(v13) = *(unsigned __int8 *)(v11 + 23);
      }
      v10 += v12 + v13;
      v11 += 24LL;
      v9 += 24LL;
    }

    while (v11 != v6);
    std::string::reserve(a3, v10);
    uint64_t v14 = 0LL;
    do
    {
      if (v14) {
        std::string::append(a3, __s, v8);
      }
      std::string::size_type v15 = (const std::string::value_type *)(v5 + v14);
      if (*(char *)(v5 + v14 + 23) < 0)
      {
        std::string::size_type v15 = *(const std::string::value_type **)(v5 + v14);
        std::string::size_type v16 = *(void *)(v5 + v14 + 8);
      }

      else
      {
        std::string::size_type v16 = *(unsigned __int8 *)(v5 + v14 + 23);
      }

      std::string::append(a3, v15, v16);
      v14 += 24LL;
    }

    while (v5 + v14 != v6);
  }

void sub_187C59DDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

uint64_t wireless_diagnostics::google::protobuf::UnescapeCEscapeSequences( unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (a1 == a2)
  {
    for (uint64_t i = a1; *i && *i != 92; ++i)
      ;
    a1 = i;
  }

  else
  {
    uint64_t i = a2;
  }

  while (1)
  {
    int v3 = *a1;
    if (v3 != 92)
    {
      if (!*a1) {
        goto LABEL_57;
      }
      goto LABEL_55;
    }

    uint64_t v4 = a1 + 1;
    int v3 = (char)a1[1];
    if (v3 <= 62) {
      break;
    }
    if (v3 > 97)
    {
      switch(a1[1])
      {
        case 'n':
          LOBYTE(v3) = 10;
          goto LABEL_54;
        case 'o':
        case 'p':
        case 'q':
        case 's':
        case 'u':
        case 'w':
          goto LABEL_56;
        case 'r':
          LOBYTE(v3) = 13;
          goto LABEL_54;
        case 't':
          LOBYTE(v3) = 9;
          goto LABEL_54;
        case 'v':
          LOBYTE(v3) = 11;
          goto LABEL_54;
        case 'x':
          goto LABEL_28;
        default:
          if (v3 == 102)
          {
            LOBYTE(v3) = 12;
          }

          else
          {
            if (v3 != 98) {
              goto LABEL_56;
            }
            LOBYTE(v3) = 8;
          }

          break;
      }

      goto LABEL_54;
    }

    if (v3 > 91)
    {
      if (v3 != 92)
      {
        if (v3 != 97) {
          goto LABEL_56;
        }
        LOBYTE(v3) = 7;
      }

LABEL_56:
    a1 = v4 + 1;
  }

  if (v3 > 47)
  {
    LOBYTE(v3) = v3 - 48;
    unsigned __int8 v6 = a1[2];
    uint64_t v5 = a1 + 2;
    char v7 = v6 + 8 * v3 - 48;
    if ((v6 & 0xF8) == 0x30)
    {
      uint64_t v4 = v5;
      LOBYTE(v3) = v7;
    }

    unsigned __int8 v8 = v4[1];
    int v9 = v8 & 0xF8;
    char v10 = v8 + 8 * v3 - 48;
    if (v9 == 48) {
      a1 = v4 + 1;
    }
    else {
      a1 = v4;
    }
    if (v9 == 48) {
      LOBYTE(v3) = v10;
    }
    goto LABEL_55;
  }

  if (v3 == 34 || v3 == 39) {
    goto LABEL_54;
  }
  if (a1[1]) {
    goto LABEL_56;
  }
LABEL_57:
  *uint64_t i = 0;
  return ((_DWORD)i - (_DWORD)a2);
}

uint64_t wireless_diagnostics::google::protobuf::UnescapeCEscapeString(uint64_t a1, uint64_t a2)
{
  int v3 = (unsigned __int8 *)a1;
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v4 = (unsigned __int8 *)operator new[](*(void *)(a1 + 8) + 1LL);
    int v3 = *(unsigned __int8 **)v3;
  }

  else
  {
    uint64_t v4 = (unsigned __int8 *)operator new[](*(unsigned __int8 *)(a1 + 23) + 1LL);
  }

  uint64_t v5 = wireless_diagnostics::google::protobuf::UnescapeCEscapeSequences(v3, v4);
  if (!a2)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v7);
  }

  MEMORY[0x1895B3A90](a2, v4, (int)v5);
  operator delete[](v4);
  return v5;
}

void sub_187C5A0E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void wireless_diagnostics::google::protobuf::UnescapeCEscapeString(uint64_t a1@<X0>, void *a2@<X8>)
{
  unint64_t v2 = (unsigned __int8 *)a1;
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v4 = (unsigned __int8 *)operator new[](*(void *)(a1 + 8) + 1LL);
    unint64_t v2 = *(unsigned __int8 **)v2;
  }

  else
  {
    uint64_t v4 = (unsigned __int8 *)operator new[](*(unsigned __int8 *)(a1 + 23) + 1LL);
  }

  int v5 = wireless_diagnostics::google::protobuf::UnescapeCEscapeSequences(v2, v4);
  std::string::basic_string[abi:ne180100](a2, v4, v5);
  operator delete[](v4);
}

void sub_187C5A184(_Unwind_Exception *a1)
{
}

uint64_t wireless_diagnostics::google::protobuf::CEscapeInternal( wireless_diagnostics::google::protobuf *this, const char *a2, uint64_t a3, char *a4, int a5, char a6)
{
  int v6 = (int)a4;
  if ((int)a2 >= 1)
  {
    char v9 = a5;
    char v10 = (unsigned __int8 *)this;
    char v11 = 0;
    LODWORD(v12) = 0;
    if (a5) {
      unsigned __int8 v13 = "\\x%02x";
    }
    else {
      unsigned __int8 v13 = "\\%03o";
    }
    unsigned __int8 v14 = (unsigned __int8 *)this + (int)a2;
    while (1)
    {
      int v15 = (char)*v10;
      if (v15 > 33)
      {
        switch(v15)
        {
          case '""':
            char v11 = 0;
            *(_WORD *)(a3 + (int)v12) = 8796;
            goto LABEL_20;
          case '\'':
            char v11 = 0;
            *(_WORD *)(a3 + (int)v12) = 10076;
            goto LABEL_20;
          case '\\':
            char v11 = 0;
            *(_WORD *)(a3 + (int)v12) = 23644;
            goto LABEL_20;
        }
      }

      else
      {
        switch(v15)
        {
          case 9:
            char v11 = 0;
            *(_WORD *)(a3 + (int)v12) = 29788;
            goto LABEL_20;
          case 10:
            char v11 = 0;
            *(_WORD *)(a3 + (int)v12) = 28252;
            goto LABEL_20;
          case 13:
            char v11 = 0;
            *(_WORD *)(a3 + (int)v12) = 29276;
LABEL_20:
            uint64_t v12 = (v12 + 2);
            goto LABEL_21;
        }
      }

      if (v15 < 0 && (a6 & 1) != 0
        || (v15 - 32) <= 0x5E
        && ((v11 & 1) == 0
         || (v15 - 48) >= 0xA
         && (*v10 - 65 > 0x25 || ((1LL << (v15 - 65)) & 0x3F0000003FLL) == 0)))
      {
        char v11 = 0;
        *(_BYTE *)(a3 + (int)v12) = v15;
        uint64_t v12 = (v12 + 1);
      }

      else
      {
        sprintf((char *)(a3 + (int)v12), v13, *v10);
        uint64_t v12 = (v12 + 4);
        char v11 = v9;
      }

LABEL_21:
      if (++v10 >= v14) {
        goto LABEL_34;
      }
    }
  }

  uint64_t v12 = 0LL;
LABEL_34:
  *(_BYTE *)(a3 + (int)v12) = 0;
  return v12;
}

uint64_t wireless_diagnostics::google::protobuf::CEscapeString( wireless_diagnostics::google::protobuf *this, const char *a2, uint64_t a3, char *a4)
{
  return wireless_diagnostics::google::protobuf::CEscapeInternal(this, a2, a3, a4, 0, 0);
}

void wireless_diagnostics::google::protobuf::CEscape(uint64_t a1@<X0>, void *a2@<X8>)
{
  int v4 = *(char *)(a1 + 23);
  if (v4 >= 0) {
    int v5 = (const char *)*(unsigned __int8 *)(a1 + 23);
  }
  else {
    int v5 = (const char *)*(unsigned int *)(a1 + 8);
  }
  int v6 = operator new[]((4 * (int)v5) | 1);
  if (v4 >= 0) {
    char v7 = (wireless_diagnostics::google::protobuf *)a1;
  }
  else {
    char v7 = *(wireless_diagnostics::google::protobuf **)a1;
  }
  int v8 = wireless_diagnostics::google::protobuf::CEscapeInternal( v7,  v5,  (uint64_t)v6,  (char *)((4 * (_DWORD)v5) | 1u),  0,  0);
  std::string::basic_string[abi:ne180100](a2, v6, v8);
  operator delete[](v6);
}

void sub_187C5A418(_Unwind_Exception *a1)
{
}

void wireless_diagnostics::google::protobuf::strings::Utf8SafeCEscape(uint64_t a1@<X0>, void *a2@<X8>)
{
  int v4 = *(char *)(a1 + 23);
  if (v4 >= 0) {
    int v5 = (const char *)*(unsigned __int8 *)(a1 + 23);
  }
  else {
    int v5 = (const char *)*(unsigned int *)(a1 + 8);
  }
  int v6 = operator new[]((4 * (int)v5) | 1);
  if (v4 >= 0) {
    char v7 = (wireless_diagnostics::google::protobuf *)a1;
  }
  else {
    char v7 = *(wireless_diagnostics::google::protobuf **)a1;
  }
  int v8 = wireless_diagnostics::google::protobuf::CEscapeInternal( v7,  v5,  (uint64_t)v6,  (char *)((4 * (_DWORD)v5) | 1u),  0,  1);
  std::string::basic_string[abi:ne180100](a2, v6, v8);
  operator delete[](v6);
}

void sub_187C5A4BC(_Unwind_Exception *a1)
{
}

void wireless_diagnostics::google::protobuf::strings::CHexEscape(uint64_t a1@<X0>, void *a2@<X8>)
{
  int v4 = *(char *)(a1 + 23);
  if (v4 >= 0) {
    int v5 = (const char *)*(unsigned __int8 *)(a1 + 23);
  }
  else {
    int v5 = (const char *)*(unsigned int *)(a1 + 8);
  }
  int v6 = operator new[]((4 * (int)v5) | 1);
  if (v4 >= 0) {
    char v7 = (wireless_diagnostics::google::protobuf *)a1;
  }
  else {
    char v7 = *(wireless_diagnostics::google::protobuf **)a1;
  }
  int v8 = wireless_diagnostics::google::protobuf::CEscapeInternal( v7,  v5,  (uint64_t)v6,  (char *)((4 * (_DWORD)v5) | 1u),  1,  0);
  std::string::basic_string[abi:ne180100](a2, v6, v8);
  operator delete[](v6);
}

void sub_187C5A560(_Unwind_Exception *a1)
{
}

uint64_t wireless_diagnostics::google::protobuf::strto32_adaptor( wireless_diagnostics::google::protobuf *this, char **a2, char **a3)
{
  int v3 = (int)a3;
  int v6 = *__error();
  *__error() = 0;
  uint64_t v7 = strtol((const char *)this, a2, v3);
  if (*__error() == 34 && v7 == 0x8000000000000000LL) {
    return 0x80000000LL;
  }
  if (*__error() == 34 && v7 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0x7FFFFFFFLL;
  }
  int v10 = *__error();
  char v11 = __error();
  if (!v10 && v7 <= (uint64_t)0xFFFFFFFF7FFFFFFFLL)
  {
    *char v11 = 34;
    return 0x80000000LL;
  }

  int v12 = *v11;
  unsigned __int8 v13 = __error();
  if (!v12 && v7 >= 0x80000000LL)
  {
    int *v13 = 34;
    return 0x7FFFFFFFLL;
  }

  if (!*v13) {
    *__error() = v6;
  }
  return v7;
}

unint64_t wireless_diagnostics::google::protobuf::strtou32_adaptor( wireless_diagnostics::google::protobuf *this, char **a2, char **a3)
{
  int v3 = (int)a3;
  int v6 = *__error();
  *__error() = 0;
  unint64_t v7 = strtoul((const char *)this, a2, v3);
  if (*__error() == 34 && v7 == -1LL) {
    return 0xFFFFFFFFLL;
  }
  int v9 = *__error();
  int v10 = __error();
  if (!v9 && HIDWORD(v7))
  {
    *int v10 = 34;
    return 0xFFFFFFFFLL;
  }

  if (!*v10) {
    *__error() = v6;
  }
  return v7;
}

_BYTE *wireless_diagnostics::google::protobuf::FastInt64ToBuffer(unint64_t this, _BYTE *a2, char *a3)
{
  unint64_t v3 = this;
  a2[21] = 0;
  if ((this & 0x8000000000000000LL) != 0)
  {
    if (this < 0xFFFFFFFFFFFFFFF7LL)
    {
      unint64_t v7 = -10LL - this;
      uint64_t result = a2 + 19;
      a2[20] = (v7 % 0xA) | 0x30;
      unint64_t v8 = v7 / 0xA + 1;
      do
      {
        *result-- = (v8 % 0xA) | 0x30;
        BOOL v9 = v8 > 9;
        v8 /= 0xAuLL;
      }

      while (v9);
    }

    else
    {
      char v6 = 48 - this;
      uint64_t result = a2 + 19;
      a2[20] = v6;
    }

    _BYTE *result = 45;
  }

  else
  {
    uint64_t result = a2 + 21;
    do
    {
      *--uint64_t result = (v3 % 0xA) | 0x30;
      BOOL v5 = v3 >= 0xA;
      v3 /= 0xAuLL;
    }

    while (v5);
  }

  return result;
}

_BYTE *wireless_diagnostics::google::protobuf::FastInt32ToBuffer( wireless_diagnostics::google::protobuf *this, _BYTE *a2, char *a3)
{
  unsigned int v3 = this;
  a2[11] = 0;
  if ((this & 0x80000000) != 0)
  {
    if (this < 0xFFFFFFF7)
    {
      unsigned int v7 = -10 - (_DWORD)this;
      unsigned int v8 = (-10 - (int)this) / 0xAu;
      uint64_t result = a2 + 9;
      a2[10] = (v7 % 0xA) | 0x30;
      unsigned int v9 = v8 + 1;
      do
      {
        *result-- = (v9 % 0xA) | 0x30;
        BOOL v10 = v9 > 9;
        v9 /= 0xAu;
      }

      while (v10);
    }

    else
    {
      char v6 = 48 - (_BYTE)this;
      uint64_t result = a2 + 9;
      a2[10] = v6;
    }

    _BYTE *result = 45;
  }

  else
  {
    uint64_t result = a2 + 11;
    do
    {
      *--uint64_t result = (v3 % 0xA) | 0x30;
      BOOL v5 = v3 >= 0xA;
      v3 /= 0xAu;
    }

    while (v5);
  }

  return result;
}

uint64_t wireless_diagnostics::google::protobuf::FastHexToBuffer( wireless_diagnostics::google::protobuf *this, uint64_t a2, char *a3)
{
  int v4 = (int)this;
  if ((this & 0x80000000) != 0)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v8);
  }

  *(_BYTE *)(a2 + 21) = 0;
  uint64_t v5 = a2 + 21;
  do
  {
    *(_BYTE *)--uint64_t v5 = a0123456789abcd[v4 & 0xF];
    BOOL v6 = v4 <= 15;
    int v4 = v4 >> 4;
  }

  while (!v6);
  return v5;
}

void sub_187C5A914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

uint64_t wireless_diagnostics::google::protobuf::InternalFastHexToBuffer( unint64_t this, uint64_t a2, char *a3)
{
  *(_BYTE *)(a2 + (int)a3) = 0;
  if ((int)a3 >= 1)
  {
    unint64_t v3 = a3 + 1LL;
    do
    {
      *(_BYTE *)(a2 + (v3 - 2)) = a0123456789abcd[this & 0xF];
      this >>= 4;
      --v3;
    }

    while (v3 > 1);
  }

  return a2;
}

uint64_t wireless_diagnostics::google::protobuf::FastHex64ToBuffer( unint64_t this, uint64_t a2, char *a3)
{
  *(_BYTE *)(a2 + 16) = 0;
  uint64_t v3 = 15LL;
  do
  {
    *(_BYTE *)(a2 + v3) = a0123456789abcd[this & 0xF];
    this >>= 4;
    unint64_t v4 = v3-- + 1;
  }

  while (v4 > 1);
  return a2;
}

uint64_t wireless_diagnostics::google::protobuf::FastHex32ToBuffer( wireless_diagnostics::google::protobuf *this, uint64_t a2, char *a3)
{
  unint64_t v3 = this;
  *(_BYTE *)(a2 + 8) = 0;
  uint64_t v4 = 7LL;
  do
  {
    *(_BYTE *)(a2 + v4) = a0123456789abcd[v3 & 0xF];
    v3 >>= 4;
    unint64_t v5 = v4-- + 1;
  }

  while (v5 > 1);
  return a2;
}

_BYTE *wireless_diagnostics::google::protobuf::FastUInt32ToBufferLeft( wireless_diagnostics::google::protobuf *this, _BYTE *a2, char *a3)
{
  if (this >= 0x3B9ACA00)
  {
    unint64_t v3 = this / 0x5F5E100uLL;
    *(_WORD *)a2 = *(_WORD *)&wireless_diagnostics::google::protobuf::two_ASCII_digits[2 * v3];
    a2 += 2;
    goto LABEL_3;
  }

  if (this > 0x63)
  {
    if (this >> 4 <= 0x270)
    {
      if (this <= 0x3E7)
      {
        LODWORD(v6) = (unsigned __int16)this / 0x64u;
        *a2++ = v6 + 48;
        goto LABEL_9;
      }

LABEL_6:
      unint64_t v5 = this / 0x2710uLL;
      *(_WORD *)a2 = *(_WORD *)&wireless_diagnostics::google::protobuf::two_ASCII_digits[2 * v5];
      a2 += 2;
LABEL_7:
      LODWORD(wireless_diagnostics::google::protobuf::DescriptorPool::Tables::CheckPoint::CheckPoint(v18, this) = (_DWORD)this - 10000 * v5;
      goto LABEL_8;
    }

    if (this < 0x5F5E100)
    {
      if (this <= 0x98967F)
      {
        LODWORD(v4) = this / 0xF4240;
        *a2++ = this / 0xF4240 + 48;
        goto LABEL_5;
      }

LABEL_4:
      unint64_t v4 = this / 0xF4240uLL;
      *(_WORD *)a2 = *(_WORD *)&wireless_diagnostics::google::protobuf::two_ASCII_digits[2 * v4];
      a2 += 2;
LABEL_5:
      LODWORD(wireless_diagnostics::google::protobuf::DescriptorPool::Tables::CheckPoint::CheckPoint(v18, this) = (_DWORD)this - 1000000 * v4;
      goto LABEL_6;
    }

    LODWORD(v3) = this / 0x5F5E100;
    *a2++ = this / 0x5F5E100 + 48;
LABEL_3:
    LODWORD(wireless_diagnostics::google::protobuf::DescriptorPool::Tables::CheckPoint::CheckPoint(v18, this) = (_DWORD)this - 100000000 * v3;
    goto LABEL_4;
  }

  if (this <= 9)
  {
    *a2 = (_BYTE)this + 48;
    unsigned int v7 = a2 + 1;
    goto LABEL_11;
  }

_BYTE *wireless_diagnostics::google::protobuf::FastInt32ToBufferLeft( wireless_diagnostics::google::protobuf *this, _BYTE *a2, char *a3)
{
  if ((this & 0x80000000) != 0)
  {
    *a2++ = 45;
    this = (wireless_diagnostics::google::protobuf *)-(int)this;
  }

  return wireless_diagnostics::google::protobuf::FastUInt32ToBufferLeft(this, a2, a3);
}

_BYTE *wireless_diagnostics::google::protobuf::FastUInt64ToBufferLeft( wireless_diagnostics::google::protobuf *this, _BYTE *a2, char *a3)
{
  int v3 = (int)this;
  unint64_t v5 = (unint64_t)this / 0x3B9ACA00;
  unint64_t v6 = (_WORD *)wireless_diagnostics::google::protobuf::FastUInt64ToBufferLeft( (wireless_diagnostics::google::protobuf *)((unint64_t)this / 0x3B9ACA00),  (unint64_t)a2,  a3);
  unsigned int v7 = v3 - 1000000000 * v5;
  _WORD *v6 = *(_WORD *)&wireless_diagnostics::google::protobuf::two_ASCII_digits[2 * (v7 / 0x989680uLL)];
  v7 %= 0x989680u;
  v6[1] = *(_WORD *)&wireless_diagnostics::google::protobuf::two_ASCII_digits[2 * (v7 / 0x186A0uLL)];
  v7 %= 0x186A0u;
  v6[2] = *(_WORD *)&wireless_diagnostics::google::protobuf::two_ASCII_digits[2 * (v7 / 0x3E8uLL)];
  v7 %= 0x3E8u;
  v6[3] = *(_WORD *)&wireless_diagnostics::google::protobuf::two_ASCII_digits[2 * (v7 / 0xAuLL)];
  v6[4] = (v7 % 0xA + 48);
  return (char *)v6 + 9;
}

_BYTE *wireless_diagnostics::google::protobuf::FastInt64ToBufferLeft(uint64_t this, _BYTE *a2, char *a3)
{
  if (this < 0)
  {
    *a2++ = 45;
    this = -this;
  }

  return wireless_diagnostics::google::protobuf::FastUInt64ToBufferLeft( (wireless_diagnostics::google::protobuf *)this,  a2,  a3);
}

void *wireless_diagnostics::google::protobuf::SimpleItoa@<X0>( wireless_diagnostics::google::protobuf *this@<X0>, char *a2@<X2>, void *a3@<X8>)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  unint64_t v4 = wireless_diagnostics::google::protobuf::FastInt32ToBuffer(this, v6, a2);
  return std::string::basic_string[abi:ne180100]<0>(a3, v4);
}

{
  char *v4;
  char v6[32];
  uint64_t v7;
  uint64_t v7 = *MEMORY[0x1895F89C0];
  unint64_t v4 = wireless_diagnostics::google::protobuf::FastUInt32ToBufferLeft(this, v6, a2);
  return std::string::__init_with_size[abi:ne180100]<char *,char *>(a3, v6, v4, v4 - v6);
}

{
  char *v4;
  _BYTE v6[32];
  uint64_t v7;
  uint64_t v7 = *MEMORY[0x1895F89C0];
  unint64_t v4 = wireless_diagnostics::google::protobuf::FastInt64ToBuffer((unint64_t)this, v6, a2);
  return std::string::basic_string[abi:ne180100]<0>(a3, v4);
}

{
  char *v4;
  char v6[32];
  uint64_t v7;
  uint64_t v7 = *MEMORY[0x1895F89C0];
  unint64_t v4 = wireless_diagnostics::google::protobuf::FastUInt64ToBufferLeft(this, v6, a2);
  return std::string::__init_with_size[abi:ne180100]<char *,char *>(a3, v6, v4, v4 - v6);
}

{
  char *v4;
  _BYTE v6[32];
  uint64_t v7;
  uint64_t v7 = *MEMORY[0x1895F89C0];
  unint64_t v4 = wireless_diagnostics::google::protobuf::FastInt64ToBuffer((unint64_t)this, v6, a2);
  return std::string::basic_string[abi:ne180100]<0>(a3, v4);
}

{
  char *v4;
  char v6[32];
  uint64_t v7;
  uint64_t v7 = *MEMORY[0x1895F89C0];
  unint64_t v4 = wireless_diagnostics::google::protobuf::FastUInt64ToBufferLeft(this, v6, a2);
  return std::string::__init_with_size[abi:ne180100]<char *,char *>(a3, v6, v4, v4 - v6);
}

void *wireless_diagnostics::google::protobuf::SimpleDtoa@<X0>( double a1@<D0>, char *a2@<X1>, void *a3@<X8>)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  wireless_diagnostics::google::protobuf::DoubleToBuffer((wireless_diagnostics::google::protobuf *)__s, a1, a2);
  return std::string::basic_string[abi:ne180100]<0>(a3, __s);
}

wireless_diagnostics::google::protobuf *wireless_diagnostics::google::protobuf::DoubleToBuffer( wireless_diagnostics::google::protobuf *this, double a2, char *a3)
{
  if (a2 == INFINITY)
  {
    int v5 = 6712937;
LABEL_5:
    *(_DWORD *)this = v5;
    return this;
  }

  if (a2 == -INFINITY)
  {
    *((_BYTE *)this + 4) = 0;
    int v5 = 1718511917;
    goto LABEL_5;
  }

  snprintf((char *)this, 0x20uLL, "%.*g", 15, a2);
  wireless_diagnostics::google::protobuf::DelocalizeRadix(this, v7);
  return this;
}

void *wireless_diagnostics::google::protobuf::SimpleFtoa@<X0>( float a1@<S0>, char *a2@<X1>, void *a3@<X8>)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  wireless_diagnostics::google::protobuf::FloatToBuffer((wireless_diagnostics::google::protobuf *)v6, a1, a2);
  return std::string::basic_string[abi:ne180100]<0>(a3, v6);
}

wireless_diagnostics::google::protobuf *wireless_diagnostics::google::protobuf::FloatToBuffer( wireless_diagnostics::google::protobuf *this, float a2, char *a3)
{
  if (a2 == INFINITY)
  {
    int v5 = 6712937;
LABEL_5:
    *(_DWORD *)this = v5;
    return this;
  }

  if (a2 == -INFINITY)
  {
    *((_BYTE *)this + 4) = 0;
    int v5 = 1718511917;
    goto LABEL_5;
  }

  snprintf((char *)this, 0x18uLL, "%.*g", 6, a2);
  wireless_diagnostics::google::protobuf::DelocalizeRadix(this, v8);
  return this;
}

char *wireless_diagnostics::google::protobuf::DelocalizeRadix( wireless_diagnostics::google::protobuf *this, char *a2)
{
  uint64_t result = strchr((const char *)this, 46);
  if (!result)
  {
    for (uint64_t i = (char *)this + 2; ; ++i)
    {
      int v5 = *((unsigned __int8 *)i - 2);
      if ((v5 - 48) >= 0xA
        && ((v5 - 43) > 0x3A || ((1LL << (v5 - 43)) & 0x400000004000005LL) == 0))
      {
        break;
      }
    }

    if (*(i - 2))
    {
      unsigned int v8 = (unsigned __int8 *)(i - 1);
      int v7 = *((unsigned __int8 *)i - 1);
      *((_BYTE *)i - 2) = 46;
      if ((v7 - 48) >= 0xA
        && ((v7 - 43) > 0x3A || ((1LL << (v7 - 43)) & 0x400000004000005LL) == 0))
      {
        if (v7)
        {
          do
          {
            unsigned int v9 = i;
            int v10 = *(unsigned __int8 *)i;
            ++i;
            BOOL v11 = (v10 - 43) > 0x3A || ((1LL << (v10 - 43)) & 0x400000004000005LL) == 0;
          }

          while (v11 && v10 != 0);
          size_t v13 = strlen(v9) + 1;
          return (char *)memmove(v8, v9, v13);
        }
      }
    }
  }

  return result;
}

BOOL wireless_diagnostics::google::protobuf::safe_strtof( wireless_diagnostics::google::protobuf *this, float *a2, float *a3)
{
  *__error() = 0;
  *a2 = strtof((const char *)this, &v6);
  return *(_BYTE *)this && !*v6 && *__error() == 0;
}

std::string *wireless_diagnostics::google::protobuf::LocalizeRadix@<X0>( wireless_diagnostics::google::protobuf *this@<X0>, char *a2@<X1>, std::string *a3@<X8>)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  int v7 = sprintf(&v11, "%.1f", 1.5);
  if (v11 != 49)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v10);
  }

  if (v12[v7 - 2] != 53)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v10);
  }

  if (v7 >= 7)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v10);
  }

  a3->__r_.__value_.__r.__words[0] = 0LL;
  a3->__r_.__value_.__l.__size_ = 0LL;
  a3->__r_.__value_.__l.__cap_ = 0LL;
  size_t v8 = strlen((const char *)this);
  std::string::reserve(a3, v8 + v7 - 3);
  std::string::append[abi:ne180100]<char const*,0>(a3, (char *)this, a2);
  std::string::append(a3, v12, v7 - 2);
  return std::string::append(a3, a2 + 1);
}

void sub_187C5B4D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

std::string *std::string::append[abi:ne180100]<char const*,0>(std::string *this, char *a2, char *a3)
{
  unint64_t v4 = a2;
  LODWORD(v6) = (char)this->__r_.__value_.__s.__size_;
  unint64_t v7 = a3 - a2;
  if ((v6 & 0x80000000) != 0)
  {
    if (a3 == a2) {
      return this;
    }
    std::string::size_type size = this->__r_.__value_.__l.__size_;
    std::string::size_type cap = this->__r_.__value_.__l.__cap_;
    std::string::size_type v9 = (cap & 0x7FFFFFFFFFFFFFFFLL) - 1;
    int v10 = (std::string *)this->__r_.__value_.__r.__words[0];
    std::string::size_type v6 = HIBYTE(cap);
  }

  else
  {
    if (a3 == a2) {
      return this;
    }
    std::string::size_type size = this->__r_.__value_.__s.__size_;
    std::string::size_type v9 = 22LL;
    int v10 = this;
  }

  if (v10 > (std::string *)v4 || (char *)&v10->__r_.__value_.__l.__data_ + size + 1 <= v4)
  {
    if (v9 - size < v7)
    {
      std::string::__grow_by(this, v9, size - v9 + v7, size, size, 0LL, 0LL);
      this->__r_.__value_.__l.__size_ = size;
      LOBYTE(v6) = this->__r_.__value_.__s.__size_;
    }

    unsigned __int8 v14 = this;
    if ((v6 & 0x80) != 0) {
      unsigned __int8 v14 = (std::string *)this->__r_.__value_.__r.__words[0];
    }
    for (uint64_t i = (char *)v14 + size; v4 != a3; ++i)
    {
      char v16 = *v4++;
      *uint64_t i = v16;
    }

    *uint64_t i = 0;
    std::string::size_type v17 = v7 + size;
    else {
      this->__r_.__value_.__s.__size_ = v17 & 0x7F;
    }
  }

  else
  {
    std::string::__init_with_size[abi:ne180100]<char *,char *>(__p, v4, a3, v7);
    if ((v20 & 0x80u) == 0) {
      int v12 = __p;
    }
    else {
      int v12 = (void **)__p[0];
    }
    if ((v20 & 0x80u) == 0) {
      std::string::size_type v13 = v20;
    }
    else {
      std::string::size_type v13 = (std::string::size_type)__p[1];
    }
    std::string::append(this, (const std::string::value_type *)v12, v13);
  }

  return this;
}

void sub_187C5B678( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

double wireless_diagnostics::google::protobuf::NoLocaleStrtod( wireless_diagnostics::google::protobuf *this, char *a2, char **a3)
{
  double v5 = strtod((const char *)this, &v14);
  std::string::size_type v6 = v14;
  if (a2) {
    *(void *)a2 = v14;
  }
  if (*v6 == 46)
  {
    std::__split_buffer<std::string>::pointer p_p = &__p;
    wireless_diagnostics::google::protobuf::LocalizeRadix(this, v6, &__p);
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      std::__split_buffer<std::string>::pointer p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    double v5 = strtod((const char *)p_p, &v12);
    unsigned __int8 size = __p.__r_.__value_.__s.__size_;
    if (a2 && v12 - (char *)p_p > v14 - (char *)this)
    {
      int v9 = strlen((const char *)this);
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        int v10 = __p.__r_.__value_.__s.__size_;
      }
      else {
        int v10 = __p.__r_.__value_.__r.__words[1];
      }
      *(void *)a2 = (char *)this + v12 - ((char *)p_p + v10 - v9);
    }

    if ((size & 0x80) != 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }

  return v5;
}

void sub_187C5B78C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::basic_string[abi:ne180100](void *__dst, void *__src, size_t __len)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8LL) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    std::string::size_type v6 = operator new(v7 + 1);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000LL;
    void *__dst = v6;
  }

  else
  {
    *((_BYTE *)__dst + 23) = __len;
    std::string::size_type v6 = __dst;
    if (!__len) {
      goto LABEL_9;
    }
  }

  memmove(v6, __src, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __dst;
}

std::vector<std::string> **std::back_insert_iterator<std::vector<std::string>>::operator=[abi:ne180100]( std::vector<std::string> **a1, __int128 *a2)
{
  unint64_t v4 = *a1;
  std::vector<std::string>::pointer end = (*a1)->__end_;
  std::string::size_type v6 = *a1;
  value = v6->__end_cap_.__value_;
  p_end_std::string::size_type cap = (std::allocator<std::string> *)&v6->__end_cap_;
  size_t v8 = value;
  if (end >= value)
  {
    unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)v4->__begin_) >> 3);
    unint64_t v13 = v12 + 1;
    if (v12 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<wireless_diagnostics::google::protobuf::TextFormat::ParseLocation>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * (((char *)v8 - (char *)v4->__begin_) >> 3);
    if (2 * v14 > v13) {
      unint64_t v13 = 2 * v14;
    }
    if (v14 >= 0x555555555555555LL) {
      unint64_t v15 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v15 = v13;
    }
    __v.__end_cap_.__value_ = p_end_cap;
    if (v15) {
      char v16 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)p_end_cap, v15);
    }
    else {
      char v16 = 0LL;
    }
    std::string::size_type v17 = v16 + v12;
    __v.__first_ = v16;
    __v.__begin_ = v17;
    __v.__end_cap_.__value_ = &v16[v15];
    __int128 v18 = *a2;
    v17->__r_.__value_.__l.__cap_ = *((void *)a2 + 2);
    *(_OWORD *)&v17->__r_.__value_.__l.__data_ = v18;
    *((void *)a2 + 1) = 0LL;
    *((void *)a2 + 2) = 0LL;
    *(void *)a2 = 0LL;
    __v.__end_ = v17 + 1;
    std::vector<std::string>::__swap_out_circular_buffer(v4, &__v);
    char v11 = v4->__end_;
    std::__split_buffer<std::string>::~__split_buffer(&__v);
  }

  else
  {
    __int128 v10 = *a2;
    end->__r_.__value_.__l.__cap_ = *((void *)a2 + 2);
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v10;
    *((void *)a2 + 1) = 0LL;
    *((void *)a2 + 2) = 0LL;
    *(void *)a2 = 0LL;
    char v11 = end + 1;
    v4->__end_ = end + 1;
  }

  v4->__end_ = v11;
  return a1;
}

void sub_187C5B980( _Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void *std::string::__init_with_size[abi:ne180100]<char *,char *>( void *result, char *a2, char *a3, unint64_t a4)
{
  unint64_t v4 = result;
  if (a4 >= 0x7FFFFFFFFFFFFFF8LL) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (a4 > 0x16)
  {
    uint64_t v8 = (a4 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((a4 | 7) != 0x17) {
      uint64_t v8 = a4 | 7;
    }
    uint64_t v9 = v8 + 1;
    uint64_t result = operator new(v8 + 1);
    v4[1] = a4;
    v4[2] = v9 | 0x8000000000000000LL;
    *unint64_t v4 = result;
    unint64_t v4 = result;
  }

  else
  {
    *((_BYTE *)result + 23) = a4;
  }

  while (a2 != a3)
  {
    char v10 = *a2++;
    *(_BYTE *)unint64_t v4 = v10;
    unint64_t v4 = (void *)((char *)v4 + 1);
  }

  *(_BYTE *)unint64_t v4 = 0;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::io::Tokenizer::Tokenizer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 8) = 0LL;
  *(void *)(a1 + 56) = 0LL;
  *(void *)(a1 + 16) = 0LL;
  *(void *)(a1 + 24) = 0LL;
  *(void *)(a1 + MEMORY[0x1895B3334](v2 - 64) = 0LL;
  *(void *)(a1 + 72) = 0LL;
  *(void *)(a1 + 96) = a2;
  *(void *)(a1 + 104) = a3;
  *(void *)(a1 + 140) = 0LL;
  *(void *)(a1 + 152) = 0LL;
  *(void *)(a1 + 120) = 0LL;
  *(void *)(a1 + 128) = 0LL;
  *(_BYTE *)(a1 + 136) = 0;
  *(_DWORD *)(a1 + 160) = -1;
  *(_BYTE *)(a1 + 1MEMORY[0x1895B3334](v2 - 64) = 0;
  *(_DWORD *)(a1 + 168) = 0;
  *(void *)(a1 + 32) = 0LL;
  *(_DWORD *)(a1 + 40) = 0;
  *(_DWORD *)a1 = 0;
  wireless_diagnostics::google::protobuf::io::Tokenizer::Refresh(a1);
  return a1;
}

void sub_187C5BABC(_Unwind_Exception *exception_object)
{
}

uint64_t wireless_diagnostics::google::protobuf::io::Tokenizer::Refresh(uint64_t this)
{
  uint64_t v1 = this;
  if (*(_BYTE *)(this + 136))
  {
    *(_BYTE *)(this + 112) = 0;
  }

  else
  {
    unint64_t v2 = *(std::string **)(this + 152);
    if (v2)
    {
      uint64_t v3 = *(int *)(v1 + 160);
      int v4 = *(_DWORD *)(v1 + 128);
      if (v4 > (int)v3)
      {
        std::string::append(v2, (const std::string::value_type *)(*(void *)(v1 + 120) + v3), v4 - (int)v3);
        *(_DWORD *)(v1 + 160) = 0;
      }
    }

    size_t v7 = 0LL;
    *(void *)(v1 + 120) = 0LL;
    *(_DWORD *)(v1 + 132) = 0;
    while (1)
    {
      this = (*(uint64_t (**)(void, char **, uint64_t))(**(void **)(v1 + 96) + 16LL))( *(void *)(v1 + 96),  &v7,  v1 + 128);
      if ((this & 1) == 0) {
        break;
      }
      if (*(_DWORD *)(v1 + 128))
      {
        double v5 = v7;
        *(void *)(v1 + 120) = v7;
        char v6 = *v5;
        goto LABEL_11;
      }
    }

    char v6 = 0;
    *(_DWORD *)(v1 + 128) = 0;
    *(_BYTE *)(v1 + 136) = 1;
LABEL_11:
    *(_BYTE *)(v1 + 112) = v6;
  }

  return this;
}

void wireless_diagnostics::google::protobuf::io::Tokenizer::~Tokenizer( wireless_diagnostics::google::protobuf::io::Tokenizer *this)
{
  int v2 = *((_DWORD *)this + 32);
  int v3 = *((_DWORD *)this + 33);
  if (v2 > v3) {
    (*(void (**)(void, void))(**((void **)this + 12) + 24LL))( *((void *)this + 12),  (v2 - v3));
  }
}

uint64_t wireless_diagnostics::google::protobuf::io::Tokenizer::NextChar(uint64_t this)
{
  int v1 = *(unsigned __int8 *)(this + 112);
  if (v1 == 9)
  {
    int v2 = *(_DWORD *)(this + 144);
    if (v2 <= 0) {
      int v3 = -(-v2 & 7);
    }
    else {
      int v3 = *(_DWORD *)(this + 144) & 7;
    }
    int v4 = v2 - v3 + 8;
  }

  else
  {
    if (v1 == 10)
    {
      *(void *)(this + 140) = (*(_DWORD *)(this + 140) + 1);
      goto LABEL_10;
    }

    int v4 = *(_DWORD *)(this + 144) + 1;
  }

  *(_DWORD *)(this + 144) = v4;
LABEL_10:
  int v5 = *(_DWORD *)(this + 128);
  uint64_t v6 = *(int *)(this + 132) + 1LL;
  *(_DWORD *)(this + 132) = v6;
  *(_BYTE *)(this + 112) = *(_BYTE *)(*(void *)(this + 120) + v6);
  return this;
}

void wireless_diagnostics::google::protobuf::io::Tokenizer::ConsumeString( wireless_diagnostics::google::protobuf::io::Tokenizer *this, unsigned __int8 a2)
{
  while (1)
  {
    while (1)
    {
      int v4 = *((char *)this + 112);
      if (v4 != 92) {
        break;
      }
      wireless_diagnostics::google::protobuf::io::Tokenizer::NextChar((uint64_t)this);
      int v7 = *((unsigned __int8 *)this + 112);
      BOOL v8 = (v7 - 97) > 0x15 || ((1 << (v7 - 97)) & 0x2A2023) == 0;
      if (!v8
        || (v7 - 34) <= 0x3A && ((1LL << (v7 - 34)) & 0x400000020000021LL) != 0
        || (v7 & 0xF8) == 0x30)
      {
        goto LABEL_15;
      }

      if (*((unsigned __int8 *)this + 112) > 0x74u)
      {
        if (v7 == 117)
        {
          wireless_diagnostics::google::protobuf::io::Tokenizer::NextChar((uint64_t)this);
          if ((*((_BYTE *)this + 112) - 48) >= 0xAu
            && ((unsigned int v15 = *((unsigned __int8 *)this + 112) - 65, v15 > 0x25) || ((1LL << v15) & 0x3F0000003FLL) == 0)
            || (wireless_diagnostics::google::protobuf::io::Tokenizer::NextChar((uint64_t)this),
                (*((_BYTE *)this + 112) - 48) >= 0xAu)
            && ((unsigned int v16 = *((unsigned __int8 *)this + 112) - 65, v16 > 0x25) || ((1LL << v16) & 0x3F0000003FLL) == 0)
            || (wireless_diagnostics::google::protobuf::io::Tokenizer::NextChar((uint64_t)this),
                (*((_BYTE *)this + 112) - 48) >= 0xAu)
            && ((unsigned int v17 = *((unsigned __int8 *)this + 112) - 65, v17 > 0x25) || ((1LL << v17) & 0x3F0000003FLL) == 0)
            || (wireless_diagnostics::google::protobuf::io::Tokenizer::NextChar((uint64_t)this),
                (*((_BYTE *)this + 112) - 48) >= 0xAu)
            && ((unsigned int v18 = *((unsigned __int8 *)this + 112) - 65, v18 > 0x25) || ((1LL << v18) & 0x3F0000003FLL) == 0))
          {
            std::string::basic_string[abi:ne180100]<0>(__p, "Expected four hex digits for \\u escape sequence.");
            (*(void (**)(void, void, void, void **))(**((void **)this + 13) + 16LL))( *((void *)this + 13),  *((unsigned int *)this + 35),  *((unsigned int *)this + 36),  __p);
            goto LABEL_46;
          }

          goto LABEL_15;
        }

        if (v7 != 120) {
          goto LABEL_20;
        }
        goto LABEL_23;
      }

      if (v7 == 85)
      {
        wireless_diagnostics::google::protobuf::io::Tokenizer::NextChar((uint64_t)this);
        if (*((_BYTE *)this + 112) != 48) {
          goto LABEL_45;
        }
        wireless_diagnostics::google::protobuf::io::Tokenizer::NextChar((uint64_t)this);
        if (*((_BYTE *)this + 112) != 48) {
          goto LABEL_45;
        }
        wireless_diagnostics::google::protobuf::io::Tokenizer::NextChar((uint64_t)this);
        if ((*((_BYTE *)this + 112) & 0xFE) != 0x30) {
          goto LABEL_45;
        }
        wireless_diagnostics::google::protobuf::io::Tokenizer::NextChar((uint64_t)this);
        if ((*((_BYTE *)this + 112) - 48) >= 0xAu)
        {
          unsigned int v10 = *((unsigned __int8 *)this + 112) - 65;
          if (v10 > 0x25 || ((1LL << v10) & 0x3F0000003FLL) == 0) {
            goto LABEL_45;
          }
        }

        wireless_diagnostics::google::protobuf::io::Tokenizer::NextChar((uint64_t)this);
        if ((*((_BYTE *)this + 112) - 48) >= 0xAu)
        {
          unsigned int v11 = *((unsigned __int8 *)this + 112) - 65;
          if (v11 > 0x25 || ((1LL << v11) & 0x3F0000003FLL) == 0) {
            goto LABEL_45;
          }
        }

        if ((wireless_diagnostics::google::protobuf::io::Tokenizer::NextChar((uint64_t)this),
              (*((_BYTE *)this + 112) - 48) >= 0xAu)
          && ((unsigned int v12 = *((unsigned __int8 *)this + 112) - 65, v12 > 0x25) || ((1LL << v12) & 0x3F0000003FLL) == 0)
          || (wireless_diagnostics::google::protobuf::io::Tokenizer::NextChar((uint64_t)this),
              (*((_BYTE *)this + 112) - 48) >= 0xAu)
          && ((unsigned int v13 = *((unsigned __int8 *)this + 112) - 65, v13 > 0x25) || ((1LL << v13) & 0x3F0000003FLL) == 0)
          || (wireless_diagnostics::google::protobuf::io::Tokenizer::NextChar((uint64_t)this),
              (*((_BYTE *)this + 112) - 48) >= 0xAu)
          && ((unsigned int v14 = *((unsigned __int8 *)this + 112) - 65, v14 > 0x25) || ((1LL << v14) & 0x3F0000003FLL) == 0))
        {
LABEL_45:
          std::string::basic_string[abi:ne180100]<0>( __p,  "Expected eight hex digits up to 10ffff for \\U escape sequence");
          (*(void (**)(void, void, void, void **))(**((void **)this + 13) + 16LL))( *((void *)this + 13),  *((unsigned int *)this + 35),  *((unsigned int *)this + 36),  __p);
          goto LABEL_46;
        }

        goto LABEL_15;
      }

      if (v7 == 88)
      {
LABEL_23:
        wireless_diagnostics::google::protobuf::io::Tokenizer::NextChar((uint64_t)this);
        if ((*((_BYTE *)this + 112) - 48) >= 0xAu)
        {
          unsigned int v9 = *((unsigned __int8 *)this + 112) - 65;
          if (v9 > 0x25 || ((1LL << v9) & 0x3F0000003FLL) == 0)
          {
            std::string::basic_string[abi:ne180100]<0>(__p, "Expected hex digits for escape sequence.");
            (*(void (**)(void, void, void, void **))(**((void **)this + 13) + 16LL))( *((void *)this + 13),  *((unsigned int *)this + 35),  *((unsigned int *)this + 36),  __p);
            goto LABEL_46;
          }
        }

void sub_187C5C10C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t wireless_diagnostics::google::protobuf::io::Tokenizer::ConsumeNumber( wireless_diagnostics::google::protobuf::io::Tokenizer *this, int a2, int a3)
{
  if (a2)
  {
    int v4 = *((unsigned __int8 *)this + 112);
    if ((v4 | 0x20) == 0x78)
    {
      wireless_diagnostics::google::protobuf::io::Tokenizer::NextChar((uint64_t)this);
      if ((*((_BYTE *)this + 112) - 48) > 9u
        && ((v5 = *((unsigned __int8 *)this + 112) - 65, BOOL v18 = v5 > 0x25, v6 = (1LL << v5) & 0x3F0000003FLL, !v18)
          ? (BOOL v7 = v6 == 0)
          : (BOOL v7 = 1),
            v7))
      {
        std::string::basic_string[abi:ne180100]<0>(__p, "0x must be followed by hex digits.");
        (*(void (**)(void, void, void, void **))(**((void **)this + 13) + 16LL))( *((void *)this + 13),  *((unsigned int *)this + 35),  *((unsigned int *)this + 36),  __p);
        if (v21 < 0) {
          operator delete(__p[0]);
        }
      }

      else
      {
        do
        {
          do
            wireless_diagnostics::google::protobuf::io::Tokenizer::NextChar((uint64_t)this);
          while ((*((_BYTE *)this + 112) - 48) < 0xAu);
          unsigned int v8 = *((unsigned __int8 *)this + 112) - 65;
          BOOL v18 = v8 > 0x25;
          uint64_t v9 = (1LL << v8) & 0x3F0000003FLL;
        }

        while (!v18 && v9 != 0);
      }

LABEL_14:
      int v11 = 0;
      goto LABEL_49;
    }

    if ((v4 - 48) <= 9)
    {
      if ((v4 & 0xF8) != 0x30) {
        goto LABEL_21;
      }
      do
      {
        wireless_diagnostics::google::protobuf::io::Tokenizer::NextChar((uint64_t)this);
        int v12 = *((unsigned __int8 *)this + 112);
      }

      while ((v12 & 0xF8) == 0x30);
      if ((v12 - 48) <= 9)
      {
LABEL_21:
        std::string::basic_string[abi:ne180100]<0>(__p, "Numbers starting with leading zero must be in octal.");
        (*(void (**)(void, void, void, void **))(**((void **)this + 13) + 16LL))( *((void *)this + 13),  *((unsigned int *)this + 35),  *((unsigned int *)this + 36),  __p);
        if (v21 < 0) {
          operator delete(__p[0]);
        }
        if (*((unsigned __int8 *)this + 112) - 48 <= 9)
        {
          do
          {
            wireless_diagnostics::google::protobuf::io::Tokenizer::NextChar((uint64_t)this);
            int v11 = 0;
          }

          while (*((unsigned __int8 *)this + 112) - 48 < 0xA);
          goto LABEL_49;
        }
      }

      goto LABEL_14;
    }
  }

  int v13 = *((unsigned __int8 *)this + 112);
  unsigned int v14 = v13 - 48;
  if (a3)
  {
    if (v14 <= 9)
    {
      do
      {
        wireless_diagnostics::google::protobuf::io::Tokenizer::NextChar((uint64_t)this);
        int v13 = *((unsigned __int8 *)this + 112);
      }

      while ((v13 - 48) < 0xA);
    }
  }

  else
  {
    if (v14 <= 9)
    {
      do
      {
        wireless_diagnostics::google::protobuf::io::Tokenizer::NextChar((uint64_t)this);
        int v13 = *((unsigned __int8 *)this + 112);
      }

      while ((v13 - 48) < 0xA);
    }

    if (v13 != 46)
    {
      int v11 = 0;
      goto LABEL_35;
    }

    wireless_diagnostics::google::protobuf::io::Tokenizer::NextChar((uint64_t)this);
    int v13 = *((unsigned __int8 *)this + 112);
    if ((v13 - 48) <= 9)
    {
      do
      {
        wireless_diagnostics::google::protobuf::io::Tokenizer::NextChar((uint64_t)this);
        int v13 = *((unsigned __int8 *)this + 112);
      }

      while ((v13 - 48) < 0xA);
    }
  }

  int v11 = 1;
LABEL_35:
  if ((v13 | 0x20) == 0x65)
  {
    wireless_diagnostics::google::protobuf::io::Tokenizer::NextChar((uint64_t)this);
    int v15 = *((unsigned __int8 *)this + 112);
    if (v15 == 45 || v15 == 43) {
      wireless_diagnostics::google::protobuf::io::Tokenizer::NextChar((uint64_t)this);
    }
    if (*((unsigned __int8 *)this + 112) - 48 > 9)
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "e must be followed by exponent.");
      (*(void (**)(void, void, void, void **))(**((void **)this + 13) + 16LL))( *((void *)this + 13),  *((unsigned int *)this + 35),  *((unsigned int *)this + 36),  __p);
      if (v21 < 0) {
        operator delete(__p[0]);
      }
    }

    else
    {
      do
        wireless_diagnostics::google::protobuf::io::Tokenizer::NextChar((uint64_t)this);
      while (*((unsigned __int8 *)this + 112) - 48 < 0xA);
    }

    int v11 = 1;
  }

  if (*((_BYTE *)this + 164))
  {
    int v16 = *((unsigned __int8 *)this + 112);
    if (v16 == 70 || v16 == 102)
    {
      wireless_diagnostics::google::protobuf::io::Tokenizer::NextChar((uint64_t)this);
      int v11 = 1;
    }
  }

LABEL_49:
  int v17 = *((unsigned __int8 *)this + 112);
  BOOL v18 = v17 != 95 && (v17 & 0xFFFFFFDF) - 65 > 0x19;
  if (v18)
  {
    if (v17 != 46) {
      goto LABEL_61;
    }
    if (v11) {
      std::string::basic_string[abi:ne180100]<0>(__p, "Already saw decimal point or exponent; can't have another one.");
    }
    else {
      std::string::basic_string[abi:ne180100]<0>(__p, "Hex and octal numbers must be integers.");
    }
    (*(void (**)(void, void, void, void **))(**((void **)this + 13) + 16LL))( *((void *)this + 13),  *((unsigned int *)this + 35),  *((unsigned int *)this + 36),  __p);
  }

  else
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "Need space between number and identifier.");
    (*(void (**)(void, void, void, void **))(**((void **)this + 13) + 16LL))( *((void *)this + 13),  *((unsigned int *)this + 35),  *((unsigned int *)this + 36),  __p);
  }

  if (v21 < 0) {
    operator delete(__p[0]);
  }
LABEL_61:
  if (v11) {
    return 4LL;
  }
  else {
    return 3LL;
  }
}

void sub_187C5C4E0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t wireless_diagnostics::google::protobuf::io::Tokenizer::ConsumeLineComment(uint64_t this, uint64_t a2)
{
  uint64_t v3 = this;
  if (a2)
  {
    *(void *)(this + 152) = a2;
    *(_DWORD *)(this + 160) = *(_DWORD *)(this + 132);
  }

  while (*(_BYTE *)(v3 + 112))
  {
    if (*(_BYTE *)(v3 + 112) == 10)
    {
      this = wireless_diagnostics::google::protobuf::io::Tokenizer::NextChar(v3);
      break;
    }

    this = wireless_diagnostics::google::protobuf::io::Tokenizer::NextChar(v3);
  }

  if (a2)
  {
    int v4 = *(_DWORD *)(v3 + 132);
    uint64_t v5 = *(int *)(v3 + 160);
    if (v4 != (_DWORD)v5) {
      this = (uint64_t)std::string::append( *(std::string **)(v3 + 152),  (const std::string::value_type *)(*(void *)(v3 + 120) + v5),  v4 - (int)v5);
    }
    *(void *)(v3 + 152) = 0LL;
    *(_DWORD *)(v3 + 160) = -1;
  }

  return this;
}

void wireless_diagnostics::google::protobuf::io::Tokenizer::ConsumeBlockComment( wireless_diagnostics::google::protobuf::io::Tokenizer *this, std::string *a2)
{
  uint64_t v4 = *((unsigned int *)this + 35);
  uint64_t v5 = (*((_DWORD *)this + 36) - 2);
  if (a2)
  {
    *((void *)this + 19) = a2;
    *((_DWORD *)this + 40) = *((_DWORD *)this + 33);
  }

  while (1)
  {
    while (1)
    {
      unsigned int v6 = *((unsigned __int8 *)this + 112);
      if (v6 > 0x29) {
        break;
      }
      if (*((_BYTE *)this + 112))
      {
        if (v6 != 10) {
          goto LABEL_22;
        }
        wireless_diagnostics::google::protobuf::io::Tokenizer::NextChar((uint64_t)this);
        if (a2)
        {
          int v7 = *((_DWORD *)this + 33);
          uint64_t v8 = *((int *)this + 40);
          if (v7 != (_DWORD)v8) {
            std::string::append( *((std::string **)this + 19),  (const std::string::value_type *)(*((void *)this + 15) + v8),  v7 - (int)v8);
          }
          *((void *)this + 19) = 0LL;
          *((_DWORD *)this + 40) = -1;
        }

        while (1)
        {
          uint64_t v9 = *((unsigned __int8 *)this + 112);
          if (((1LL << v9) & 0x100003A00LL) == 0)
          {
            if (v9 == 42)
            {
              wireless_diagnostics::google::protobuf::io::Tokenizer::NextChar((uint64_t)this);
              if (*((_BYTE *)this + 112) == 47)
              {
                wireless_diagnostics::google::protobuf::io::Tokenizer::NextChar((uint64_t)this);
                return;
              }
            }

            break;
          }

          wireless_diagnostics::google::protobuf::io::Tokenizer::NextChar((uint64_t)this);
        }

        if (a2)
        {
          *((void *)this + 19) = a2;
          *((_DWORD *)this + 40) = *((_DWORD *)this + 33);
        }
      }

      else
      {
LABEL_24:
        if (!v6)
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "End-of-file inside block comment.");
          (*(void (**)(void, void, void, void **))(**((void **)this + 13) + 16LL))( *((void *)this + 13),  *((unsigned int *)this + 35),  *((unsigned int *)this + 36),  __p);
          if (v17 < 0) {
            operator delete(__p[0]);
          }
          uint64_t v10 = *((void *)this + 13);
          std::string::basic_string[abi:ne180100]<0>(__p, "  Comment started here.");
          (*(void (**)(uint64_t, uint64_t, uint64_t, void **))(*(void *)v10 + 16LL))(v10, v4, v5, __p);
          if (v17 < 0) {
            operator delete(__p[0]);
          }
          if (a2)
          {
            int v11 = *((_DWORD *)this + 33);
            uint64_t v12 = *((int *)this + 40);
            if (v11 != (_DWORD)v12) {
              std::string::append( *((std::string **)this + 19),  (const std::string::value_type *)(*((void *)this + 15) + v12),  v11 - (int)v12);
            }
            *((void *)this + 19) = 0LL;
            *((_DWORD *)this + 40) = -1;
          }

          return;
        }
      }
    }

    if (v6 == 42) {
      break;
    }
    if (v6 == 47)
    {
      wireless_diagnostics::google::protobuf::io::Tokenizer::NextChar((uint64_t)this);
      unsigned int v6 = *((unsigned __int8 *)this + 112);
      if (v6 != 42) {
        goto LABEL_24;
      }