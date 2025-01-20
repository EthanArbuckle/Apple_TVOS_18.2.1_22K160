@interface SFObjCType
+ (id)typeForEncoding:(const char *)a3;
+ (id)typeForValue:(id)a3;
- (BOOL)isFloatingPointNumber;
- (BOOL)isIntegerNumber;
- (BOOL)isNumber;
- (BOOL)isObject;
- (NSString)className;
- (NSString)encoding;
- (NSString)name;
- (SFObjCType)initWithCode:(int64_t)a3 encoding:(id)a4 name:(id)a5 className:(id)a6 size:(unint64_t)a7 flags:(unint64_t)a8;
- (id)objectWithBytes:(const void *)a3;
- (int64_t)code;
- (unint64_t)flags;
- (unint64_t)size;
- (void)getBytes:(void *)a3 forObject:(id)a4;
@end

@implementation SFObjCType

- (SFObjCType)initWithCode:(int64_t)a3 encoding:(id)a4 name:(id)a5 className:(id)a6 size:(unint64_t)a7 flags:(unint64_t)a8
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___SFObjCType;
  v18 = -[SFObjCType init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_code = a3;
    objc_storeStrong((id *)&v18->_encoding, a4);
    objc_storeStrong((id *)&v19->_name, a5);
    objc_storeStrong((id *)&v19->_className, a6);
    v19->_size = a7;
    v19->_flags = a8;
  }

  return v19;
}

- (BOOL)isNumber
{
  return (self->_flags & 3) != 0;
}

- (BOOL)isIntegerNumber
{
  return self->_flags & 1;
}

- (BOOL)isFloatingPointNumber
{
  return (LOBYTE(self->_flags) >> 1) & 1;
}

- (BOOL)isObject
{
  return self->_code == 15;
}

- (id)objectWithBytes:(const void *)a3
{
  switch(self->_code)
  {
    case 0LL:
      [MEMORY[0x189607968] numberWithChar:*(char *)a3];
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 1LL:
      [MEMORY[0x189607968] numberWithShort:*(__int16 *)a3];
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 2LL:
      [MEMORY[0x189607968] numberWithInt:*(unsigned int *)a3];
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 3LL:
      [MEMORY[0x189607968] numberWithLong:*(void *)a3];
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 4LL:
      [MEMORY[0x189607968] numberWithLongLong:*(void *)a3];
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 5LL:
      [MEMORY[0x189607968] numberWithUnsignedChar:*(unsigned __int8 *)a3];
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 6LL:
      [MEMORY[0x189607968] numberWithUnsignedShort:*(unsigned __int16 *)a3];
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 7LL:
      [MEMORY[0x189607968] numberWithUnsignedInt:*(unsigned int *)a3];
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 8LL:
      [MEMORY[0x189607968] numberWithUnsignedLong:*(void *)a3];
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 9LL:
      [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)a3];
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 0xALL:
      LODWORD(v3) = *(_DWORD *)a3;
      [MEMORY[0x189607968] numberWithFloat:v3];
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 0xBLL:
      [MEMORY[0x189607968] numberWithDouble:*(double *)a3];
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 0xCLL:
      [MEMORY[0x189607968] numberWithBool:*(unsigned __int8 *)a3];
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 0xFLL:
      id v4 = *(id *)a3;
LABEL_17:
      id result = v4;
      break;
    default:
      [MEMORY[0x189603F70] raise:*MEMORY[0x189603A58], @"For class %@, Unsupported boxing type: %@", self->_className, self->_name format];
      id result = 0LL;
      break;
  }

  return result;
}

- (void)getBytes:(void *)a3 forObject:(id)a4
{
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    [v6 getValue:a3];
  }
  else {
    [MEMORY[0x189603F70] raise:*MEMORY[0x189603A58], @"Unsupported unboxing type: %@", self->_name format];
  }
}

- (int64_t)code
{
  return self->_code;
}

- (NSString)encoding
{
  return self->_encoding;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)className
{
  return self->_className;
}

- (unint64_t)size
{
  return self->_size;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void).cxx_destruct
{
}

+ (id)typeForEncoding:(const char *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (typeForEncoding__once != -1) {
    dispatch_once(&typeForEncoding__once, &__block_literal_global_3703);
  }
  int v5 = *a3;
  if (v5 > 90)
  {
    switch(*a3)
    {
      case '^':
        id v6 = objc_alloc(&OBJC_CLASS___SFObjCType);
        v7 = @"pointer";
        uint64_t v8 = 22LL;
        v9 = v4;
        uint64_t v10 = 8LL;
        goto LABEL_46;
      case '_':
      case 'a':
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
        goto LABEL_24;
      case 'b':
        id v6 = objc_alloc(&OBJC_CLASS___SFObjCType);
        v7 = @"bitfield";
        uint64_t v8 = 21LL;
        goto LABEL_45;
      case 'c':
        v11 = (void *)_SFObjCTypesByCode;
        uint64_t v12 = 0LL;
        goto LABEL_48;
      case 'd':
        v11 = (void *)_SFObjCTypesByCode;
        uint64_t v12 = 11LL;
        goto LABEL_48;
      case 'f':
        v11 = (void *)_SFObjCTypesByCode;
        uint64_t v12 = 10LL;
        goto LABEL_48;
      case 'i':
        v11 = (void *)_SFObjCTypesByCode;
        uint64_t v12 = 2LL;
        goto LABEL_48;
      case 'l':
        v11 = (void *)_SFObjCTypesByCode;
        uint64_t v12 = 3LL;
        goto LABEL_48;
      case 'q':
        v11 = (void *)_SFObjCTypesByCode;
        uint64_t v12 = 4LL;
        goto LABEL_48;
      case 's':
        v11 = (void *)_SFObjCTypesByCode;
        uint64_t v12 = 1LL;
        goto LABEL_48;
      case 'v':
        v11 = (void *)_SFObjCTypesByCode;
        uint64_t v12 = 13LL;
        goto LABEL_48;
      default:
        if (v5 == 91)
        {
          id v6 = objc_alloc(&OBJC_CLASS___SFObjCType);
          v7 = @"array";
          uint64_t v8 = 18LL;
        }

        else
        {
          if (v5 != 123) {
            goto LABEL_24;
          }
          id v6 = objc_alloc(&OBJC_CLASS___SFObjCType);
          v7 = @"structure";
          uint64_t v8 = 19LL;
        }

        break;
    }

    goto LABEL_45;
  }

  if (v5 <= 72)
  {
    if (v5 > 57)
    {
      switch(*a3)
      {
        case ':':
          v11 = (void *)_SFObjCTypesByCode;
          uint64_t v12 = 17LL;
          goto LABEL_48;
        case '@':
          if ((unint64_t)[v4 length] >= 4
            && [v4 characterAtIndex:1] == 34
            && objc_msgSend(v4, "characterAtIndex:", objc_msgSend(v4, "length") - 1) == 34)
          {
            objc_msgSend(v4, "substringWithRange:", 2, objc_msgSend(v4, "length") - 3);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            [v13 stringByAppendingString:@"*"];
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            id v15 = -[SFObjCType initWithCode:encoding:name:className:size:flags:]( objc_alloc(&OBJC_CLASS___SFObjCType),  "initWithCode:encoding:name:className:size:flags:",  15LL,  v4,  v14,  v13,  8LL,  0LL);

            goto LABEL_50;
          }

          v11 = (void *)_SFObjCTypesByCode;
          uint64_t v12 = 15LL;
          break;
        case 'B':
          v11 = (void *)_SFObjCTypesByCode;
          uint64_t v12 = 12LL;
          goto LABEL_48;
        case 'C':
          v11 = (void *)_SFObjCTypesByCode;
          uint64_t v12 = 5LL;
          goto LABEL_48;
        default:
          goto LABEL_24;
      }

      goto LABEL_48;
    }

    switch(v5)
    {
      case '#':
        v11 = (void *)_SFObjCTypesByCode;
        uint64_t v12 = 16LL;
        goto LABEL_48;
      case '(':
        id v6 = objc_alloc(&OBJC_CLASS___SFObjCType);
        v7 = @"union";
        uint64_t v8 = 20LL;
LABEL_45:
        v9 = v4;
        uint64_t v10 = 0LL;
LABEL_46:
        uint64_t v16 = -[SFObjCType initWithCode:encoding:name:className:size:flags:]( v6,  "initWithCode:encoding:name:className:size:flags:",  v8,  v9,  v7,  0LL,  v10,  0LL);
        goto LABEL_49;
      case '*':
        v11 = (void *)_SFObjCTypesByCode;
        uint64_t v12 = 14LL;
        goto LABEL_48;
    }

    goto LABEL_24;
  }

  if (v5 > 80)
  {
    if (v5 == 81)
    {
      v11 = (void *)_SFObjCTypesByCode;
      uint64_t v12 = 9LL;
      goto LABEL_48;
    }

    if (v5 == 83)
    {
      v11 = (void *)_SFObjCTypesByCode;
      uint64_t v12 = 6LL;
      goto LABEL_48;
    }

    goto LABEL_24;
  }

  if (v5 == 73)
  {
    v11 = (void *)_SFObjCTypesByCode;
    uint64_t v12 = 7LL;
    goto LABEL_48;
  }

  if (v5 != 76)
  {
LABEL_24:
    id v6 = objc_alloc(&OBJC_CLASS___SFObjCType);
    v7 = @"unknown";
    uint64_t v8 = 23LL;
    goto LABEL_45;
  }

  v11 = (void *)_SFObjCTypesByCode;
  uint64_t v12 = 8LL;
LABEL_48:
  uint64_t v16 = [v11 objectAtIndexedSubscript:v12];
LABEL_49:
  id v15 = (SFObjCType *)v16;
LABEL_50:

  return v15;
}

+ (id)typeForValue:(id)a3
{
  return +[SFObjCType typeForEncoding:](SFObjCType, "typeForEncoding:", [a3 objCType]);
}

void __30__SFObjCType_typeForEncoding___block_invoke()
{
  v19[17] = *MEMORY[0x1895F89C0];
  v18 = -[SFObjCType initWithCode:encoding:name:className:size:flags:]( objc_alloc(&OBJC_CLASS___SFObjCType),  "initWithCode:encoding:name:className:size:flags:",  0LL,  @"c",  @"char",  0LL,  1LL,  1LL);
  v19[0] = v18;
  id v17 = -[SFObjCType initWithCode:encoding:name:className:size:flags:]( objc_alloc(&OBJC_CLASS___SFObjCType),  "initWithCode:encoding:name:className:size:flags:",  1LL,  @"s",  @"short",  0LL,  2LL,  1LL);
  v19[1] = v17;
  uint64_t v16 = -[SFObjCType initWithCode:encoding:name:className:size:flags:]( objc_alloc(&OBJC_CLASS___SFObjCType),  "initWithCode:encoding:name:className:size:flags:",  2LL,  @"i",  @"int",  0LL,  4LL,  1LL);
  v19[2] = v16;
  id v15 = -[SFObjCType initWithCode:encoding:name:className:size:flags:]( objc_alloc(&OBJC_CLASS___SFObjCType),  "initWithCode:encoding:name:className:size:flags:",  3LL,  @"l",  @"long",  0LL,  8LL,  1LL);
  v19[3] = v15;
  v14 = -[SFObjCType initWithCode:encoding:name:className:size:flags:]( objc_alloc(&OBJC_CLASS___SFObjCType),  "initWithCode:encoding:name:className:size:flags:",  4LL,  @"q",  @"long long",  0LL,  8LL,  1LL);
  v19[4] = v14;
  v13 = -[SFObjCType initWithCode:encoding:name:className:size:flags:]( objc_alloc(&OBJC_CLASS___SFObjCType),  "initWithCode:encoding:name:className:size:flags:",  5LL,  @"C",  @"unsigned char",  0LL,  1LL,  1LL);
  v19[5] = v13;
  uint64_t v12 = -[SFObjCType initWithCode:encoding:name:className:size:flags:]( objc_alloc(&OBJC_CLASS___SFObjCType),  "initWithCode:encoding:name:className:size:flags:",  6LL,  @"S",  @"unsigned short",  0LL,  2LL,  1LL);
  v19[6] = v12;
  v0 = -[SFObjCType initWithCode:encoding:name:className:size:flags:]( objc_alloc(&OBJC_CLASS___SFObjCType),  "initWithCode:encoding:name:className:size:flags:",  7LL,  @"I",  @"unsigned int",  0LL,  4LL,  1LL);
  v19[7] = v0;
  v1 = -[SFObjCType initWithCode:encoding:name:className:size:flags:]( objc_alloc(&OBJC_CLASS___SFObjCType),  "initWithCode:encoding:name:className:size:flags:",  8LL,  @"L",  @"unsigned long",  0LL,  8LL,  1LL);
  v19[8] = v1;
  v2 = -[SFObjCType initWithCode:encoding:name:className:size:flags:]( objc_alloc(&OBJC_CLASS___SFObjCType),  "initWithCode:encoding:name:className:size:flags:",  9LL,  @"Q",  @"unsigned long long",  0LL,  8LL,  1LL);
  v19[9] = v2;
  double v3 = -[SFObjCType initWithCode:encoding:name:className:size:flags:]( objc_alloc(&OBJC_CLASS___SFObjCType),  "initWithCode:encoding:name:className:size:flags:",  10LL,  @"f",  @"float",  0LL,  4LL,  2LL);
  v19[10] = v3;
  id v4 = -[SFObjCType initWithCode:encoding:name:className:size:flags:]( objc_alloc(&OBJC_CLASS___SFObjCType),  "initWithCode:encoding:name:className:size:flags:",  11LL,  @"d",  @"double",  0LL,  8LL,  2LL);
  v19[11] = v4;
  int v5 = -[SFObjCType initWithCode:encoding:name:className:size:flags:]( objc_alloc(&OBJC_CLASS___SFObjCType),  "initWithCode:encoding:name:className:size:flags:",  12LL,  @"B",  @"BOOL",  0LL,  1LL,  1LL);
  v19[12] = v5;
  id v6 = -[SFObjCType initWithCode:encoding:name:className:size:flags:]( objc_alloc(&OBJC_CLASS___SFObjCType),  "initWithCode:encoding:name:className:size:flags:",  13LL,  @"v",  @"void",  0LL,  1LL,  0LL);
  v19[13] = v6;
  v7 = -[SFObjCType initWithCode:encoding:name:className:size:flags:]( objc_alloc(&OBJC_CLASS___SFObjCType),  "initWithCode:encoding:name:className:size:flags:",  14LL,  @"*",  @"char*",  0LL,  8LL,  0LL);
  v19[14] = v7;
  uint64_t v8 = -[SFObjCType initWithCode:encoding:name:className:size:flags:]( objc_alloc(&OBJC_CLASS___SFObjCType),  "initWithCode:encoding:name:className:size:flags:",  15LL,  @"@",  @"id",  0LL,  8LL,  0LL);
  v19[15] = v8;
  v9 = -[SFObjCType initWithCode:encoding:name:className:size:flags:]( objc_alloc(&OBJC_CLASS___SFObjCType),  "initWithCode:encoding:name:className:size:flags:",  16LL,  @"#",  @"Class",  0LL,  8LL,  0LL);
  v19[16] = v9;
  uint64_t v10 = [MEMORY[0x189603F18] arrayWithObjects:v19 count:17];
  v11 = (void *)_SFObjCTypesByCode;
  _SFObjCTypesByCode = v10;
}

@end