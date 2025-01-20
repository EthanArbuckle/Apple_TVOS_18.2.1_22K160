uint64_t _errno_overlay_getErrno()
{
  return *__error();
}

int *_errno_overlay_setErrno(int a1)
{
  result = __error();
  int *result = a1;
  return result;
}

int *(*errno.modify(_DWORD *a1))(int *a1)
{
  *a1 = _errno_overlay_getErrno();
  return errno.modify;
}

int *errno.modify(int *a1)
{
  return _errno_overlay_setErrno(*a1);
}

uint64_t static POSIXErrorCode.EWOULDBLOCK.getter()
{
  return 35LL;
}

uint64_t static POSIXErrorCode.ELAST.getter()
{
  return 106LL;
}

uint64_t POSIXErrorCode.init(rawValue:)(unsigned int a1)
{
  unint64_t v1 = specialized POSIXErrorCode.init(rawValue:)(a1);
  return v1 | ((HIDWORD(v1) & 1) << 32);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance POSIXErrorCode( _DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance POSIXErrorCode()
{
  Swift::UInt32 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance POSIXErrorCode()
{
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance POSIXErrorCode()
{
  Swift::UInt32 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance POSIXErrorCode@<X0>( unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = specialized POSIXErrorCode.init(rawValue:)(*a1);
  *(_DWORD *)a2 = result;
  *(_BYTE *)(a2 + 4) = BYTE4(result) & 1;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance POSIXErrorCode(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t specialized POSIXErrorCode.init(rawValue:)(unsigned int a1)
{
  unsigned __int8 v1 = 0;
  uint64_t v2 = a1;
  switch(a1)
  {
    case 1u:
      goto LABEL_10;
    case 2u:
      uint64_t v2 = 2LL;
      goto LABEL_10;
    case 3u:
      uint64_t v2 = 3LL;
      goto LABEL_10;
    case 4u:
      uint64_t v2 = 4LL;
      goto LABEL_10;
    case 5u:
      uint64_t v2 = 5LL;
      goto LABEL_10;
    case 6u:
      uint64_t v2 = 6LL;
      goto LABEL_10;
    case 7u:
      uint64_t v2 = 7LL;
      goto LABEL_10;
    case 8u:
      uint64_t v2 = 8LL;
      goto LABEL_10;
    case 9u:
      uint64_t v2 = 9LL;
LABEL_10:
      unsigned __int8 v1 = 0;
      break;
    case 0xAu:
      return v2 | ((unint64_t)v1 << 32);
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
    case 0x34u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 52LL;
      break;
    case 0x35u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 53LL;
      break;
    case 0x36u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 54LL;
      break;
    case 0x37u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 55LL;
      break;
    case 0x38u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 56LL;
      break;
    case 0x39u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 57LL;
      break;
    case 0x3Au:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 58LL;
      break;
    case 0x3Bu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 59LL;
      break;
    case 0x3Cu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 60LL;
      break;
    case 0x3Du:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 61LL;
      break;
    case 0x3Eu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 62LL;
      break;
    case 0x3Fu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 63LL;
      break;
    case 0x40u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 64LL;
      break;
    case 0x41u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 65LL;
      break;
    case 0x42u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 66LL;
      break;
    case 0x43u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 67LL;
      break;
    case 0x44u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 68LL;
      break;
    case 0x45u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 69LL;
      break;
    case 0x46u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 70LL;
      break;
    case 0x47u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 71LL;
      break;
    case 0x48u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 72LL;
      break;
    case 0x49u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 73LL;
      break;
    case 0x4Au:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 74LL;
      break;
    case 0x4Bu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 75LL;
      break;
    case 0x4Cu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 76LL;
      break;
    case 0x4Du:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 77LL;
      break;
    case 0x4Eu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 78LL;
      break;
    case 0x4Fu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 79LL;
      break;
    case 0x50u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 80LL;
      break;
    case 0x51u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 81LL;
      break;
    case 0x52u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 82LL;
      break;
    case 0x53u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 83LL;
      break;
    case 0x54u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 84LL;
      break;
    case 0x55u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 85LL;
      break;
    case 0x56u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 86LL;
      break;
    case 0x57u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 87LL;
      break;
    case 0x58u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 88LL;
      break;
    case 0x59u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 89LL;
      break;
    case 0x5Au:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 90LL;
      break;
    case 0x5Bu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 91LL;
      break;
    case 0x5Cu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 92LL;
      break;
    case 0x5Du:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 93LL;
      break;
    case 0x5Eu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 94LL;
      break;
    case 0x5Fu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 95LL;
      break;
    case 0x60u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 96LL;
      break;
    case 0x61u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 97LL;
      break;
    case 0x62u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 98LL;
      break;
    case 0x63u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 99LL;
      break;
    case 0x64u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 100LL;
      break;
    case 0x65u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 101LL;
      break;
    case 0x67u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 103LL;
      break;
    case 0x68u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 104LL;
      break;
    case 0x69u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 105LL;
      break;
    case 0x6Au:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 106LL;
      break;
    default:
      uint64_t v2 = 0LL;
      unsigned __int8 v1 = 1;
      break;
  }

  return v2 | ((unint64_t)v1 << 32);
}

unint64_t lazy protocol witness table accessor for type POSIXErrorCode and conformance POSIXErrorCode()
{
  unint64_t result = lazy protocol witness table cache variable for type POSIXErrorCode and conformance POSIXErrorCode;
  if (!lazy protocol witness table cache variable for type POSIXErrorCode and conformance POSIXErrorCode)
  {
    unint64_t result = MEMORY[0x1895E88F0](&protocol conformance descriptor for POSIXErrorCode, &type metadata for POSIXErrorCode);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type POSIXErrorCode and conformance POSIXErrorCode);
  }

  return result;
}

ValueMetadata *type metadata accessor for POSIXErrorCode()
{
  return &type metadata for POSIXErrorCode;
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

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}