@interface NSKeyValueIvarGetter
- (NSKeyValueIvarGetter)initWithContainerClassID:(id)a3 key:(id)a4 containerIsa:(Class)a5 ivar:(objc_ivar *)a6;
@end

@implementation NSKeyValueIvarGetter

- (NSKeyValueIvarGetter)initWithContainerClassID:(id)a3 key:(id)a4 containerIsa:(Class)a5 ivar:(objc_ivar *)a6
{
  v19[3] = *MEMORY[0x1895F89C0];
  TypeEncoding = ivar_getTypeEncoding(a6);
  int v11 = *TypeEncoding;
  if (v11 > 82)
  {
    switch(*TypeEncoding)
    {
      case 'c':
        v12 = (uint64_t (*)(int, int, Ivar))_NSGetCharValueInIvar;
        break;
      case 'd':
        v12 = (uint64_t (*)(int, int, Ivar))_NSGetDoubleValueInIvar;
        break;
      case 'e':
      case 'g':
      case 'h':
      case 'j':
      case 'k':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
      case 'r':
        goto LABEL_26;
      case 'f':
        v12 = (uint64_t (*)(int, int, Ivar))_NSGetFloatValueInIvar;
        break;
      case 'i':
        v12 = (uint64_t (*)(int, int, Ivar))_NSGetIntValueInIvar;
        break;
      case 'l':
        v12 = (uint64_t (*)(int, int, Ivar))_NSGetLongValueInIvar;
        break;
      case 'q':
        v12 = (uint64_t (*)(int, int, Ivar))_NSGetLongLongValueInIvar;
        break;
      case 's':
        v12 = (uint64_t (*)(int, int, Ivar))_NSGetShortValueInIvar;
        break;
      default:
        if (v11 != 83)
        {
          if (v11 != 123) {
            goto LABEL_26;
          }
          v13 = TypeEncoding;
          v14 = strchr(TypeEncoding, 61);
          if (v14)
          {
            size_t v15 = v14 - v13;
            if (!strncmp(v13, "{CGPoint=dd}", v14 - v13) || !strncmp(v13, "{_NSPoint=ff}", v15))
            {
              v12 = (uint64_t (*)(int, int, Ivar))_NSGetPointValueInIvar;
              break;
            }

            if (!strncmp(v13, "{_NSRange=QQ}", v15))
            {
              v12 = (uint64_t (*)(int, int, Ivar))_NSGetRangeValueInIvar;
              break;
            }

            if (!strncmp(v13, "{CGRect={CGPoint=dd}{CGSize=dd}}", v15)
              || !strncmp(v13, "{_NSRect={_NSPoint=ff}{_NSSize=ff}}", v15))
            {
              v12 = (uint64_t (*)(int, int, Ivar))_NSGetRectValueInIvar;
              break;
            }

            if (!strncmp(v13, "{CGSize=dd}", v15) || !strncmp(v13, "{_NSSize=ff}", v15))
            {
              v12 = (uint64_t (*)(int, int, Ivar))_NSGetSizeValueInIvar;
              break;
            }
          }

          v12 = (uint64_t (*)(int, int, Ivar))_NSGetValueInIvar;
          break;
        }

        v12 = (uint64_t (*)(int, int, Ivar))_NSGetUnsignedShortValueInIvar;
        break;
    }
  }

  else if (v11 > 75)
  {
    if (v11 == 76)
    {
      v12 = (uint64_t (*)(int, int, Ivar))_NSGetUnsignedLongValueInIvar;
    }

    else
    {
      if (v11 != 81)
      {
LABEL_26:

        return 0LL;
      }

      v12 = (uint64_t (*)(int, int, Ivar))_NSGetUnsignedLongLongValueInIvar;
    }
  }

  else
  {
    v12 = (uint64_t (*)(int, int, Ivar))_NSGetBoolValueInIvar;
    switch(*TypeEncoding)
    {
      case '@':
        break;
      case 'A':
      case 'D':
      case 'E':
      case 'F':
      case 'G':
      case 'H':
        goto LABEL_26;
      case 'B':
        goto LABEL_36;
      case 'C':
        v12 = (uint64_t (*)(int, int, Ivar))_NSGetUnsignedCharValueInIvar;
        goto LABEL_36;
      case 'I':
        v12 = (uint64_t (*)(int, int, Ivar))_NSGetUnsignedIntValueInIvar;
        goto LABEL_36;
      default:
        if (v11 != 35) {
          goto LABEL_26;
        }
        break;
    }

    unsigned int IvarMemoryManagement = _class_getIvarMemoryManagement();
    if (IvarMemoryManagement >= 4) {
      v12 = (uint64_t (*)(int, int, Ivar))_NSGetObjectGetIvarValueInIvar;
    }
    else {
      v12 = off_189C9E158[IvarMemoryManagement];
    }
  }

@end