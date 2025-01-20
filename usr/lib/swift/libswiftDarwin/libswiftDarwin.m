char ***environ.getter()
{
  char ***result;
  result = _NSGetEnviron();
  if (!result)
  {
    __break(1u);
    goto LABEL_5;
  }

  result = (char ***)*result;
  if (!result) {
LABEL_5:
  }
    __break(1u);
  return result;
}

uint64_t open(_:_:)(const char *a1, int a2)
{
  return _fcntl_overlay_open(a1, a2, 0);
}

uint64_t _fcntl_overlay_open(const char *a1, int a2, unsigned int a3)
{
  return open(a1, a2, a3);
}

uint64_t open(_:_:_:)(const char *a1, int a2, unsigned __int16 a3)
{
  return _fcntl_overlay_open(a1, a2, a3);
}

uint64_t openat(_:_:_:)(int a1, const char *a2, int a3)
{
  return _fcntl_overlay_openat(a1, a2, a3, 0);
}

uint64_t _fcntl_overlay_openat(int a1, const char *a2, int a3, unsigned int a4)
{
  return openat(a1, a2, a3, a4);
}

uint64_t openat(_:_:_:_:)(int a1, const char *a2, int a3, unsigned __int16 a4)
{
  return _fcntl_overlay_openat(a1, a2, a3, a4);
}

Swift::Int32 __swiftcall fcntl(_:_:)(Swift::Int32 a1, Swift::Int32 a2)
{
  return _fcntl_overlay_fcntl(a1, a2, 0LL);
}

uint64_t _fcntl_overlay_fcntl(int a1, int a2, uint64_t a3)
{
  return fcntl(a1, a2, a3);
}

uint64_t MachErrorCode.init(rawValue:)(unsigned int a1)
{
  unint64_t v1 = specialized MachErrorCode.init(rawValue:)(a1);
  return v1 | ((HIDWORD(v1) & 1) << 32);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance MachErrorCode( _DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance MachErrorCode()
{
  Swift::UInt32 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance MachErrorCode()
{
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance MachErrorCode()
{
  Swift::UInt32 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance MachErrorCode@<X0>( unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = specialized MachErrorCode.init(rawValue:)(*a1);
  *(_DWORD *)a2 = result;
  *(_BYTE *)(a2 + 4) = BYTE4(result) & 1;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance MachErrorCode(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t specialized MachErrorCode.init(rawValue:)(unsigned int a1)
{
  unsigned __int8 v1 = 0;
  uint64_t v2 = a1;
  switch(a1)
  {
    case 0u:
      uint64_t v2 = 0LL;
      unsigned __int8 v1 = 0;
      break;
    case 1u:
      return v2 | ((unint64_t)v1 << 32);
    case 2u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 2LL;
      break;
    case 3u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 3LL;
      break;
    case 4u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 4LL;
      break;
    case 5u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 5LL;
      break;
    case 6u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 6LL;
      break;
    case 7u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 7LL;
      break;
    case 8u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 8LL;
      break;
    case 9u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 9LL;
      break;
    case 0xAu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 10LL;
      break;
    case 0xBu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 11LL;
      break;
    case 0xCu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 12LL;
      break;
    case 0xDu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 13LL;
      break;
    case 0xEu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 14LL;
      break;
    case 0xFu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 15LL;
      break;
    case 0x10u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 16LL;
      break;
    case 0x11u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 17LL;
      break;
    case 0x12u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 18LL;
      break;
    case 0x13u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 19LL;
      break;
    case 0x14u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 20LL;
      break;
    case 0x15u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 21LL;
      break;
    case 0x16u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 22LL;
      break;
    case 0x17u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 23LL;
      break;
    case 0x18u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 24LL;
      break;
    case 0x19u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 25LL;
      break;
    case 0x1Au:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 26LL;
      break;
    case 0x1Bu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 27LL;
      break;
    case 0x1Cu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 28LL;
      break;
    case 0x1Du:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 29LL;
      break;
    case 0x1Eu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 30LL;
      break;
    case 0x1Fu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 31LL;
      break;
    case 0x20u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 32LL;
      break;
    case 0x21u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 33LL;
      break;
    case 0x22u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 34LL;
      break;
    case 0x23u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 35LL;
      break;
    case 0x24u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 36LL;
      break;
    case 0x25u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 37LL;
      break;
    case 0x26u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 38LL;
      break;
    case 0x27u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 39LL;
      break;
    case 0x28u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 40LL;
      break;
    case 0x29u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 41LL;
      break;
    case 0x2Au:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 42LL;
      break;
    case 0x2Bu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 43LL;
      break;
    case 0x2Cu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 44LL;
      break;
    case 0x2Du:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 45LL;
      break;
    case 0x2Eu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 46LL;
      break;
    case 0x2Fu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 47LL;
      break;
    case 0x30u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 48LL;
      break;
    case 0x31u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 49LL;
      break;
    case 0x32u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 50LL;
      break;
    case 0x33u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 51LL;
      break;
    default:
      uint64_t v2 = 0LL;
      unsigned __int8 v1 = 1;
      break;
  }

  return v2 | ((unint64_t)v1 << 32);
}

unint64_t lazy protocol witness table accessor for type MachErrorCode and conformance MachErrorCode()
{
  unint64_t result = lazy protocol witness table cache variable for type MachErrorCode and conformance MachErrorCode;
  if (!lazy protocol witness table cache variable for type MachErrorCode and conformance MachErrorCode)
  {
    unint64_t result = MEMORY[0x186E0DC88](&protocol conformance descriptor for MachErrorCode, &type metadata for MachErrorCode);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type MachErrorCode and conformance MachErrorCode);
  }

  return result;
}

ValueMetadata *type metadata accessor for MachErrorCode()
{
  return &type metadata for MachErrorCode;
}

uint64_t noErr.getter()
{
  return 0LL;
}

uint64_t DarwinBoolean._value.setter(uint64_t result)
{
  *unsigned __int8 v1 = result;
  return result;
}

uint64_t (*DarwinBoolean._value.modify())()
{
  return DarwinBoolean._value.modify;
}

uint64_t DarwinBoolean.init(_:)(char a1)
{
  return a1 & 1;
}

BOOL DarwinBoolean.BOOLValue.getter(char a1)
{
  return a1 != 0;
}

uint64_t DarwinBoolean.init(BOOLeanLiteral:)(char a1)
{
  return a1 & 1;
}

_BYTE *protocol witness for ExpressibleByBooleanLiteral.init(BOOLeanLiteral:) in conformance DarwinBoolean@<X0>( _BYTE *result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t DarwinBoolean.customMirror.getter()
{
  return Mirror.init(reflecting:)();
}

uint64_t protocol witness for CustomReflectable.customMirror.getter in conformance DarwinBoolean()
{
  return Mirror.init(reflecting:)();
}

uint64_t DarwinBoolean.description.getter(char a1)
{
  if (a1) {
    return 1702195828LL;
  }
  else {
    return 0x65736C6166LL;
  }
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance DarwinBoolean()
{
  if (*v0) {
    return 1702195828LL;
  }
  else {
    return 0x65736C6166LL;
  }
}

uint64_t static DarwinBoolean.== infix(_:_:)(char a1, char a2)
{
  return (a1 == 0) ^ (a2 != 0);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance DarwinBoolean( _BYTE *a1, _BYTE *a2)
{
  return (*a1 == 0) ^ (*a2 != 0);
}

uint64_t _convertBoolToDarwinBoolean(_:)(char a1)
{
  return a1 & 1;
}

BOOL _convertDarwinBooleanToBool(_:)(char a1)
{
  return a1 != 0;
}

uint64_t associated type witness table accessor for ExpressibleByBooleanLiteral.BooleanLiteralType : _ExpressibleByBuiltinBooleanLiteral in DarwinBoolean()
{
  return MEMORY[0x1896184F0];
}

ValueMetadata *type metadata accessor for DarwinBoolean()
{
  return &type metadata for DarwinBoolean;
}

uint64_t SEM_FAILED.getter()
{
  return -1LL;
}

sem_t *sem_open(_:_:_:_:)(const char *a1, int a2, unsigned __int16 a3, uint64_t a4)
{
  return _semaphore_overlay_sem_open4(a1, a2, a3, a4);
}

sem_t *_semaphore_overlay_sem_open4(const char *a1, int a2, unsigned int a3, uint64_t a4)
{
  return sem_open(a1, a2, a3, a4);
}

uint64_t _sys_ioctl_overlay_ioctl(int a1, unint64_t a2, uint64_t a3)
{
  return ioctl(a1, a2, a3);
}

Swift::Int32 __swiftcall ioctl(_:_:)(Swift::Int32 a1, Swift::UInt a2)
{
  return _sys_ioctl_overlay_ioctl(a1, a2, 0LL);
}

uint64_t TIOCHPCL.getter()
{
  return 536900610LL;
}

uint64_t TIOCGETP.getter()
{
  return 1074164744LL;
}

uint64_t TIOCSETP.getter()
{
  return 2147906569LL;
}

uint64_t TIOCSETN.getter()
{
  return 2147906570LL;
}

uint64_t TIOCSETC.getter()
{
  return 2147906577LL;
}

uint64_t TIOCGETC.getter()
{
  return 1074164754LL;
}

uint64_t TIOCLBIS.getter()
{
  return 2147775615LL;
}

uint64_t TIOCLBIC.getter()
{
  return 2147775614LL;
}

uint64_t TIOCLSET.getter()
{
  return 2147775613LL;
}

uint64_t TIOCLGET.getter()
{
  return 1074033788LL;
}

uint64_t TIOCSLTC.getter()
{
  return 2147906677LL;
}

uint64_t TIOCGLTC.getter()
{
  return 1074164852LL;
}

uint64_t MAP_FAILED.getter()
{
  return -1LL;
}

uint64_t extern_proc.p_starttime.getter()
{
  return *(void *)v0;
}

uint64_t extern_proc.p_starttime.setter(uint64_t result, int a2)
{
  *(void *)uint64_t v2 = result;
  *(_DWORD *)(v2 + 8) = a2;
  return result;
}

uint64_t (*extern_proc.p_starttime.modify(uint64_t a1))(uint64_t result)
{
  *(void *)(a1 + 16) = v1;
  int v2 = *(_DWORD *)(v1 + 8);
  *(void *)a1 = *(void *)v1;
  *(_DWORD *)(a1 + 8) = v2;
  return extern_proc.p_starttime.modify;
}

uint64_t extern_proc.p_starttime.modify(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 16);
  int v2 = *(_DWORD *)(result + 8);
  *(void *)uint64_t v1 = *(void *)result;
  *(_DWORD *)(v1 + 8) = v2;
  return result;
}

uint64_t sub_181A57804@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  int v2 = *(_DWORD *)(result + 8);
  *(void *)a2 = *(void *)result;
  *(_DWORD *)(a2 + 8) = v2;
  return result;
}

uint64_t sub_181A57818(uint64_t result, uint64_t a2)
{
  int v2 = *(_DWORD *)(result + 8);
  *(void *)a2 = *(void *)result;
  *(_DWORD *)(a2 + 8) = v2;
  return result;
}

uint64_t S_IFMT.getter()
{
  return 61440LL;
}

uint64_t S_IFIFO.getter()
{
  return 4096LL;
}

uint64_t S_IFCHR.getter()
{
  return 0x2000LL;
}

uint64_t S_IFDIR.getter()
{
  return 0x4000LL;
}

uint64_t S_IFBLK.getter()
{
  return 24576LL;
}

uint64_t S_IFREG.getter()
{
  return 0x8000LL;
}

uint64_t S_IFLNK.getter()
{
  return 40960LL;
}

uint64_t S_IFSOCK.getter()
{
  return 49152LL;
}

uint64_t S_IFWHT.getter()
{
  return 57344LL;
}

uint64_t S_IRWXU.getter()
{
  return 448LL;
}

uint64_t S_IRUSR.getter()
{
  return 256LL;
}

uint64_t S_IWUSR.getter()
{
  return 128LL;
}

uint64_t S_IXUSR.getter()
{
  return 64LL;
}

uint64_t S_IRWXG.getter()
{
  return 56LL;
}

uint64_t S_IRGRP.getter()
{
  return 32LL;
}

uint64_t S_IWGRP.getter()
{
  return 16LL;
}

uint64_t S_IXGRP.getter()
{
  return 8LL;
}

uint64_t S_IRWXO.getter()
{
  return 7LL;
}

uint64_t S_IROTH.getter()
{
  return 4LL;
}

uint64_t S_IWOTH.getter()
{
  return 2LL;
}

uint64_t S_IXOTH.getter()
{
  return 1LL;
}

uint64_t S_ISUID.getter()
{
  return 2048LL;
}

uint64_t S_ISGID.getter()
{
  return 1024LL;
}

uint64_t S_ISVTX.getter()
{
  return 512LL;
}

uint64_t S_ISTXT.getter()
{
  return 512LL;
}

uint64_t S_IREAD.getter()
{
  return 256LL;
}

uint64_t S_IWRITE.getter()
{
  return 128LL;
}

uint64_t S_IEXEC.getter()
{
  return 64LL;
}

uint64_t TIOCMODG.getter()
{
  return 1074033667LL;
}

uint64_t TIOCMODS.getter()
{
  return 2147775492LL;
}

uint64_t TIOCEXCL.getter()
{
  return 536900621LL;
}

uint64_t TIOCNXCL.getter()
{
  return 536900622LL;
}

uint64_t TIOCFLUSH.getter()
{
  return 2147775504LL;
}

uint64_t TIOCGETA.getter()
{
  return 1078490131LL;
}

uint64_t TIOCSETA.getter()
{
  return 2152231956LL;
}

uint64_t TIOCSETAW.getter()
{
  return 2152231957LL;
}

uint64_t TIOCSETAF.getter()
{
  return 2152231958LL;
}

uint64_t TIOCGETD.getter()
{
  return 1074033690LL;
}

uint64_t TIOCSETD.getter()
{
  return 2147775515LL;
}

uint64_t TIOCIXON.getter()
{
  return 536900737LL;
}

uint64_t TIOCIXOFF.getter()
{
  return 536900736LL;
}

uint64_t TIOCSBRK.getter()
{
  return 536900731LL;
}

uint64_t TIOCCBRK.getter()
{
  return 536900730LL;
}

uint64_t TIOCSDTR.getter()
{
  return 536900729LL;
}

uint64_t TIOCCDTR.getter()
{
  return 536900728LL;
}

uint64_t TIOCGPGRP.getter()
{
  return 1074033783LL;
}

uint64_t TIOCSPGRP.getter()
{
  return 2147775606LL;
}

uint64_t TIOCOUTQ.getter()
{
  return 1074033779LL;
}

uint64_t TIOCSTI.getter()
{
  return 2147578994LL;
}

uint64_t TIOCNOTTY.getter()
{
  return 536900721LL;
}

uint64_t TIOCPKT.getter()
{
  return 2147775600LL;
}

uint64_t TIOCSTOP.getter()
{
  return 536900719LL;
}

uint64_t TIOCSTART.getter()
{
  return 536900718LL;
}

uint64_t TIOCMSET.getter()
{
  return 2147775597LL;
}

uint64_t TIOCMBIS.getter()
{
  return 2147775596LL;
}

uint64_t TIOCMBIC.getter()
{
  return 2147775595LL;
}

uint64_t TIOCMGET.getter()
{
  return 1074033770LL;
}

uint64_t TIOCREMOTE.getter()
{
  return 2147775593LL;
}

uint64_t TIOCGWINSZ.getter()
{
  return 1074295912LL;
}

uint64_t TIOCSWINSZ.getter()
{
  return 2148037735LL;
}

uint64_t TIOCUCNTL.getter()
{
  return 2147775590LL;
}

uint64_t TIOCSTAT.getter()
{
  return 536900709LL;
}

uint64_t TIOCSCONS.getter()
{
  return 536900707LL;
}

uint64_t TIOCCONS.getter()
{
  return 2147775586LL;
}

uint64_t TIOCSCTTY.getter()
{
  return 536900705LL;
}

uint64_t TIOCEXT.getter()
{
  return 2147775584LL;
}

uint64_t TIOCSIG.getter()
{
  return 536900703LL;
}

uint64_t TIOCDRAIN.getter()
{
  return 536900702LL;
}

uint64_t TIOCMSDTRWAIT.getter()
{
  return 2147775579LL;
}

uint64_t TIOCMGDTRWAIT.getter()
{
  return 1074033754LL;
}

uint64_t TIOCTIMESTAMP.getter()
{
  return 1074820185LL;
}

uint64_t TIOCDCDTIMESTAMP.getter()
{
  return 1074820184LL;
}

uint64_t TIOCSDRAINWAIT.getter()
{
  return 2147775575LL;
}

uint64_t TIOCGDRAINWAIT.getter()
{
  return 1074033750LL;
}

uint64_t TIOCDSIMICROCODE.getter()
{
  return 536900693LL;
}

uint64_t TIOCPTYGRANT.getter()
{
  return 536900692LL;
}

uint64_t TIOCPTYGNAME.getter()
{
  return 1082160211LL;
}

uint64_t TIOCPTYUNLK.getter()
{
  return 536900690LL;
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x18961A680]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt32 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x18961A6C0]();
}

uint64_t Mirror.init(reflecting:)()
{
  return MEMORY[0x18961A6F0]();
}

char ***_NSGetEnviron(void)
{
  return (char ***)MEMORY[0x1895F87C8]();
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1895FB210](*(void *)&a1, *(void *)&a2);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x1895FB850](*(void *)&a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return MEMORY[0x1895FC268](*(void *)&a1, a2, *(void *)&a3);
}

sem_t *sem_open(const char *a1, int a2, ...)
{
  return (sem_t *)MEMORY[0x1895FCE28](a1, *(void *)&a2);
}