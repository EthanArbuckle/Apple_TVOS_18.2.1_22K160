@interface NSKeyValueMethodGetter
- (NSKeyValueMethodGetter)initWithContainerClassID:(id)a3 key:(id)a4 method:(objc_method *)a5;
@end

@implementation NSKeyValueMethodGetter

- (NSKeyValueMethodGetter)initWithContainerClassID:(id)a3 key:(id)a4 method:(objc_method *)a5
{
  v5 = a5;
  v17[3] = *MEMORY[0x1895F89C0];
  if (method_getNumberOfArguments(a5) != 2) {
    goto LABEL_28;
  }
  SEL Name = method_getName(v5);
  v10 = method_copyReturnType(v5);
  v11 = v10;
  int v12 = *v10;
  if (v12 > 82)
  {
    switch(*v10)
    {
      case 'c':
        Implementation = _NSGetCharValueWithMethod;
        goto LABEL_38;
      case 'd':
        Implementation = _NSGetDoubleValueWithMethod;
        goto LABEL_38;
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
      case 't':
      case 'u':
        goto LABEL_27;
      case 'f':
        Implementation = _NSGetFloatValueWithMethod;
        goto LABEL_38;
      case 'i':
        Implementation = _NSGetIntValueWithMethod;
        goto LABEL_38;
      case 'l':
        Implementation = _NSGetLongValueWithMethod;
        goto LABEL_38;
      case 'q':
        Implementation = _NSGetLongLongValueWithMethod;
        goto LABEL_38;
      case 's':
        Implementation = _NSGetShortValueWithMethod;
        goto LABEL_38;
      case 'v':
        Implementation = _NSGetVoidValueWithMethod;
        goto LABEL_38;
      default:
        if (v12 == 83)
        {
          Implementation = _NSGetUnsignedShortValueWithMethod;
        }

        else
        {
          if (v12 != 123) {
            goto LABEL_27;
          }
          if (!strcmp(v10, "{CGPoint=dd}") || !strcmp(v11, "{_NSPoint=ff}"))
          {
            Implementation = _NSGetPointValueWithMethod;
          }

          else if (!strcmp(v11, "{_NSRange=QQ}"))
          {
            Implementation = _NSGetRangeValueWithMethod;
          }

          else if (!strcmp(v11, "{CGRect={CGPoint=dd}{CGSize=dd}}") {
                 || !strcmp(v11, "{_NSRect={_NSPoint=ff}{_NSSize=ff}}"))
          }
          {
            Implementation = _NSGetRectValueWithMethod;
          }

          else
          {
            Implementation = _NSGetSizeValueWithMethod;
            if (strcmp(v11, "{CGSize=dd}"))
            {
              if (strcmp(v11, "{_NSSize=ff}")) {
                Implementation = _NSGetValueWithMethod;
              }
            }
          }
        }

        break;
    }

    goto LABEL_38;
  }

  if (v12 > 75)
  {
    if (v12 == 76)
    {
      Implementation = _NSGetUnsignedLongValueWithMethod;
      goto LABEL_38;
    }

    if (v12 == 81)
    {
      Implementation = _NSGetUnsignedLongLongValueWithMethod;
LABEL_38:
      free(v11);
      uint64_t v14 = 1LL;
      goto LABEL_39;
    }

@end