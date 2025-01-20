@interface _PBProperty
+ (id)getValidPropertiesForType:(void *)a3 withCache:;
- (id)_parseStructDefinition:(uint64_t)a1;
- (id)description;
- (uint64_t)getCountOfRepeatedValuesFromInstance:(uint64_t)a1;
- (void)dealloc;
- (void)setNumberValue:(uint64_t)a3 onInstance:;
@end

@implementation _PBProperty

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____PBProperty;
  -[_PBProperty dealloc](&v3, sel_dealloc);
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x189607940]);
  v4 = v3;
  int subType = self->_subType;
  if (self->_subType)
  {
    if (subType == 123)
    {
      structName = (const __CFString *)self->_structName;
      [v3 appendFormat:@"{%@=", structName];
      objc_msgSend( v4,  "appendString:",  -[NSArray componentsJoinedByString:](self->_structFields, "componentsJoinedByString:", &stru_189D326C0));
      v7 = @"}";
    }

    else if ((char)subType > 82)
    {
      switch((char)subType)
      {
        case 'c':
          v7 = @"char";
          break;
        case 'd':
          v7 = @"double";
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
          goto LABEL_52;
        case 'f':
          v7 = @"float";
          break;
        case 'i':
          v7 = @"int";
          break;
        case 'l':
          v7 = @"long";
          break;
        case 'q':
          v7 = @"long long";
          break;
        case 's':
          v7 = @"short";
          break;
        default:
          if ((char)subType == 83)
          {
            v7 = @"unsigned short";
          }

          else if ((char)subType == 94)
          {
            v7 = @"*";
          }

          else
          {
LABEL_52:
            v7 = @"?";
          }

          break;
      }
    }

    else
    {
      switch((char)subType)
      {
        case '@':
          v7 = @"id";
          break;
        case 'A':
        case 'D':
        case 'E':
        case 'F':
        case 'G':
        case 'H':
          goto LABEL_52;
        case 'B':
          v7 = @"BOOL";
          break;
        case 'C':
          v7 = @"unsigned char";
          break;
        case 'I':
          v7 = @"unsigned int";
          break;
        default:
          if ((char)subType == 76)
          {
            v7 = @"unsigned long";
          }

          else
          {
            v7 = @"unsigned long long";
          }

          break;
      }
    }

    [v4 appendString:v7];
  }

  int type = self->_type;
  if (type == 123)
  {
    v11 = (const __CFString *)self->_structName;
    if (!v11) {
      v11 = @"?";
    }
    [v4 appendFormat:@"{%@=", v11];
    objc_msgSend( v4,  "appendString:",  -[NSArray componentsJoinedByString:](self->_structFields, "componentsJoinedByString:", &stru_189D326C0));
    v12 = @"}";
  }

  else
  {
    if (type == 64)
    {
      Class subObjectType = self->_subObjectType;
      v10 = NSStringFromClass(self->_objectType);
      if (subObjectType) {
        [v4 appendFormat:@"%@<%@*>*", v10, NSStringFromClass(self->_subObjectType)];
      }
      else {
        [v4 appendFormat:@"%@*", v10, v15];
      }
      goto LABEL_26;
    }

    if ((char)type > 82)
    {
      switch((char)type)
      {
        case 'c':
          v12 = @"char";
          break;
        case 'd':
          v12 = @"double";
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
          goto LABEL_53;
        case 'f':
          v12 = @"float";
          break;
        case 'i':
          v12 = @"int";
          break;
        case 'l':
          v12 = @"long";
          break;
        case 'q':
          v12 = @"long long";
          break;
        case 's':
          v12 = @"short";
          break;
        default:
          if ((char)type == 83)
          {
            v12 = @"unsigned short";
          }

          else if ((char)type == 94)
          {
            v12 = @"*";
          }

          else
          {
LABEL_53:
            v12 = @"?";
          }

          break;
      }
    }

    else
    {
      switch((char)type)
      {
        case '@':
          v12 = @"id";
          break;
        case 'A':
        case 'D':
        case 'E':
        case 'F':
        case 'G':
        case 'H':
          goto LABEL_53;
        case 'B':
          v12 = @"BOOL";
          break;
        case 'C':
          v12 = @"unsigned char";
          break;
        case 'I':
          v12 = @"unsigned int";
          break;
        default:
          if ((char)type == 76)
          {
            v12 = @"unsigned long";
          }

          else
          {
            v12 = @"unsigned long long";
          }

          break;
      }
    }
  }

  [v4 appendString:v12];
LABEL_26:
  [v4 appendFormat:@" %@;", self->_name];
  if (self->_has)
  {
    v13 = @" (optional)";
  }

  else if (self->_count)
  {
    v13 = @" (repeated)";
  }

  else
  {
    v13 = @" (required)";
  }

  [v4 appendFormat:v13];
  return v4;
}

- (id)_parseStructDefinition:(uint64_t)a1
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v4 = (id)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  objc_msgSend(a2, "length"));
  if ([a2 length])
  {
    uint64_t v27 = 0LL;
    unint64_t v5 = 0LL;
    v6 = @"ignoring struct field: %c in %@";
    while (1)
    {
      uint64_t v7 = (char)[a2 characterAtIndex:v5];
      uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%c", v7);
      if (((1 << (v7 - 99)) & 0x1424B) != 0) {
        goto LABEL_11;
      }
      if ((_DWORD)v7 == 123)
      {
        unint64_t v14 = v5 + 1;
        if (v5 + 1 >= [a2 length])
        {
          ++v5;
        }

        else
        {
          ++v5;
          do
          {
            ++v5;
          }

          while (v5 < [a2 length]);
          if (*(void *)(a1 + 104)) {
            BOOL v15 = 1;
          }
          else {
            BOOL v15 = v5 == v14;
          }
          if (!v15) {
            *(void *)(a1 + 104) = (id)objc_msgSend(a2, "substringWithRange:", v14, v5 - v14);
          }
        }

        goto LABEL_12;
      }

      if ((_DWORD)v7 != 125)
      {
LABEL_23:
        if ((_DWORD)v7 != 94)
        {
          if ((_DWORD)v7 != 98) {
            goto LABEL_29;
          }
          v9 = v6;
          uint64_t v10 = a1;
          id v11 = objc_alloc_init(MEMORY[0x189607940]);
          for (unint64_t i = v5 + 1; i < [a2 length]; ++i)
          {
            uint64_t v13 = [a2 characterAtIndex:i];
            unint64_t v5 = i;
            objc_msgSend(v11, "appendFormat:", @"%C", v13);
          }

          int v16 = [v11 intValue];
          v27 += v16;
          a1 = v10;
          v6 = v9;
          if (!v16) {
            goto LABEL_12;
          }
        }

- (uint64_t)getCountOfRepeatedValuesFromInstance:(uint64_t)a1
{
  v2 = *(void **)(a1 + 64);
  if (v2)
  {
    id v4 = (char *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "methodSignature"), "methodReturnType");
    unint64_t v5 = 0LL;
    int v6 = *v4;
    if (v6 <= 80)
    {
      if (v6 > 72)
      {
        if (v6 == 73)
        {
          [v2 invokeWithTarget:a2];
          [v2 getReturnValue:&v9];
          unint64_t v5 = (void *)[MEMORY[0x189607968] numberWithUnsignedInt:LODWORD(v9)];
        }

        else if (v6 == 76)
        {
          [v2 invokeWithTarget:a2];
          [v2 getReturnValue:&v9];
          unint64_t v5 = (void *)[MEMORY[0x189607968] numberWithUnsignedLong:*(void *)&v9];
        }
      }

      else if (v6 == 66)
      {
        [v2 invokeWithTarget:a2];
        [v2 getReturnValue:&v9];
        unint64_t v5 = (void *)[MEMORY[0x189607968] numberWithBool:LOBYTE(v9)];
      }

      else if (v6 == 67)
      {
        [v2 invokeWithTarget:a2];
        [v2 getReturnValue:&v9];
        unint64_t v5 = (void *)[MEMORY[0x189607968] numberWithUnsignedChar:LOBYTE(v9)];
      }
    }

    else
    {
      switch(v6)
      {
        case 'c':
          [v2 invokeWithTarget:a2];
          [v2 getReturnValue:&v9];
          unint64_t v5 = (void *)[MEMORY[0x189607968] numberWithChar:SLOBYTE(v9)];
          break;
        case 'd':
          [v2 invokeWithTarget:a2];
          [v2 getReturnValue:&v9];
          unint64_t v5 = (void *)[MEMORY[0x189607968] numberWithDouble:v9];
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
          return [v5 unsignedIntegerValue];
        case 'f':
          [v2 invokeWithTarget:a2];
          [v2 getReturnValue:&v9];
          LODWORD(v8) = LODWORD(v9);
          unint64_t v5 = (void *)[MEMORY[0x189607968] numberWithFloat:v8];
          break;
        case 'i':
          [v2 invokeWithTarget:a2];
          [v2 getReturnValue:&v9];
          unint64_t v5 = (void *)[MEMORY[0x189607968] numberWithInt:LODWORD(v9)];
          break;
        case 'l':
          [v2 invokeWithTarget:a2];
          [v2 getReturnValue:&v9];
          unint64_t v5 = (void *)[MEMORY[0x189607968] numberWithLong:*(void *)&v9];
          break;
        case 'q':
          [v2 invokeWithTarget:a2];
          [v2 getReturnValue:&v9];
          unint64_t v5 = (void *)[MEMORY[0x189607968] numberWithLongLong:*(void *)&v9];
          break;
        case 's':
          [v2 invokeWithTarget:a2];
          [v2 getReturnValue:&v9];
          unint64_t v5 = (void *)[MEMORY[0x189607968] numberWithShort:SLOWORD(v9)];
          break;
        default:
          if (v6 == 81)
          {
            [v2 invokeWithTarget:a2];
            [v2 getReturnValue:&v9];
            unint64_t v5 = (void *)[MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)&v9];
          }

          else if (v6 == 83)
          {
            [v2 invokeWithTarget:a2];
            [v2 getReturnValue:&v9];
            unint64_t v5 = (void *)[MEMORY[0x189607968] numberWithUnsignedShort:LOWORD(v9)];
          }

          break;
      }
    }
  }

  else
  {
    unint64_t v5 = 0LL;
  }

  return [v5 unsignedIntegerValue];
}

- (void)setNumberValue:(uint64_t)a3 onInstance:
{
  uint64_t v18 = a2;
  if (a1)
  {
    int v5 = *(unsigned __int8 *)(a1 + 32);
    if (v5 == 94) {
      LOBYTE(v5) = *(_BYTE *)(a1 + 33);
    }
    if ((char)v5 > 80)
    {
      switch((char)v5)
      {
        case 'c':
          int v6 = *(void **)(a1 + 80);
          if (v6) {
            goto LABEL_22;
          }
          char v7 = [a2 charValue];
          goto LABEL_40;
        case 'd':
          double v8 = *(void **)(a1 + 80);
          if (v8) {
            goto LABEL_38;
          }
          [a2 doubleValue];
          uint64_t v17 = v14;
          goto LABEL_50;
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
          return;
        case 'f':
          v12 = *(void **)(a1 + 80);
          if (v12) {
            goto LABEL_30;
          }
          [a2 floatValue];
          LODWORD(v17) = v15;
          goto LABEL_44;
        case 'i':
          v12 = *(void **)(a1 + 80);
          if (v12) {
            goto LABEL_30;
          }
          int v13 = [a2 intValue];
          goto LABEL_43;
        case 'l':
          double v8 = *(void **)(a1 + 80);
          if (v8) {
            goto LABEL_38;
          }
          uint64_t v9 = [a2 longValue];
          goto LABEL_49;
        case 'q':
          double v8 = *(void **)(a1 + 80);
          if (v8) {
            goto LABEL_38;
          }
          uint64_t v9 = [a2 longLongValue];
          goto LABEL_49;
        case 's':
          uint64_t v10 = *(void **)(a1 + 80);
          if (v10) {
            goto LABEL_36;
          }
          __int16 v11 = [a2 shortValue];
          goto LABEL_46;
        default:
          if ((char)v5 != 81)
          {
            uint64_t v10 = *(void **)(a1 + 80);
            if (v10)
            {
LABEL_36:
              [v10 setArgument:&v18 atIndex:2];
              [*(id *)(a1 + 80) invokeWithTarget:a3];
              [*(id *)(a1 + 80) getReturnValue:&v17];
            }

            else
            {
              __int16 v11 = [a2 unsignedShortValue];
LABEL_46:
              LOWORD(v17) = v11;
            }

            int v16 = calloc(1uLL, 2uLL);
            *int v16 = v17;
            goto LABEL_51;
          }

          double v8 = *(void **)(a1 + 80);
          if (v8) {
            goto LABEL_38;
          }
          uint64_t v9 = [a2 unsignedLongLongValue];
          break;
      }

      goto LABEL_49;
    }

    if ((char)v5 > 72)
    {
      if ((char)v5 == 73)
      {
        v12 = *(void **)(a1 + 80);
        if (v12)
        {
LABEL_30:
          [v12 setArgument:&v18 atIndex:2];
          [*(id *)(a1 + 80) invokeWithTarget:a3];
          [*(id *)(a1 + 80) getReturnValue:&v17];
        }

        else
        {
          int v13 = [a2 unsignedIntValue];
LABEL_43:
          LODWORD(v17) = v13;
        }

+ (id)getValidPropertiesForType:(void *)a3 withCache:
{
  uint64_t v130 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  int v5 = NSStringFromClass(a2);
  id v6 = (id)[a3 objectForKeyedSubscript:v5];
  if (v6) {
    return v6;
  }
  v107 = v5;
  v108 = a3;
  id v7 = objc_alloc_init(MEMORY[0x189603FA8]);
  unsigned int outCount = 0;
  double v8 = class_copyProtocolList(a2, &outCount);
  if (outCount)
  {
    for (unint64_t i = 0LL; i < outCount; ++i)
    {
      LODWORD(v127.receiver) = 0;
      uint64_t v10 = protocol_copyPropertyList(v8[i], (unsigned int *)&v127);
      if (LODWORD(v127.receiver))
      {
        unint64_t v11 = 0LL;
        do
          objc_msgSend( v7,  "addObject:",  objc_msgSend(NSString, "stringWithUTF8String:", property_getName(v10[v11++])));
        while (v11 < LODWORD(v127.receiver));
      }

      free(v10);
    }
  }

  v106 = v7;
  free(v8);
  unsigned int v124 = 0;
  v12 = class_copyPropertyList(a2, &v124);
  id v13 = objc_alloc(MEMORY[0x189603FA8]);
  obchar j = (id)[v13 initWithCapacity:v124];
  if (v124)
  {
    uint64_t v14 = 0LL;
    unint64_t v15 = 0x18C662000uLL;
    int v16 = &selRef_delegate;
    v109 = v12;
    while (1)
    {
      uint64_t v17 = v12[v14];
      objc_opt_self();
      id v18 = objc_alloc((Class)(v15 + 2528));
      if (!v18) {
        goto LABEL_13;
      }
      uint64_t v19 = (objc_class *)v16[298];
      v127.receiver = v18;
      v127.super_class = v19;
      uint64_t v20 = (id *)objc_msgSendSuper2(&v127, sel_init);
      if (v20) {
        break;
      }
LABEL_112:
      v81 = v20;
      if (v81) {
        [obj addObject:v81];
      }
    }

    Name = property_getName(v17);
    id v22 = (id)[NSString stringWithUTF8String:Name];
    v20[1] = v22;
    if (([v22 hasSuffix:@"Count"] & 1) == 0)
    {
      unsigned int v126 = 0;
      v23 = property_copyAttributeList(v17, &v126);
      if (v126)
      {
        uint64_t v24 = 0LL;
        NSUInteger v25 = v23;
        while (*v25->name != 84)
        {
          ++v24;
          ++v25;
          if (v126 == v24) {
            goto LABEL_18;
          }
        }
      }

      else
      {
LABEL_18:
        uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
      }

      v114 = v23;
      v26 = &v23[v24];
      uint64_t v27 = (void *)[NSString stringWithUTF8String:v26->value];
      v28 = v27;
      __int128 v29 = 0LL;
      int v30 = *v26->value;
      *((_BYTE *)v20 + 32) = *v26->value;
      if (v30 <= 63)
      {
        if ((v30 - 40) >= 3 && v30 != 63)
        {
LABEL_40:
          v111 = v28;
          v113 = Name;
          uint64_t v112 = objc_msgSend( v20[1],  "stringByReplacingCharactersInRange:withString:",  0,  1,  objc_msgSend((id)objc_msgSend(v20[1], "substringToIndex:", 1), "uppercaseString"));
          if ([v20[2] isSubclassOfClass:objc_opt_class()])
          {
            v38 = (void *)[NSString stringWithUTF8String:Name];
            for (char j = 1; ; char j = 0)
            {
              SEL v40 = sel_registerName((const char *)[(id)objc_msgSend( NSString stringWithFormat:@"%@%@", v38, @"Type"), "UTF8String"]);
              if ((objc_opt_respondsToSelector() & 1) != 0) {
                break;
              }
              if ((j & 1) == 0) {
                goto LABEL_49;
              }
              else {
                uint64_t v41 = [v38 stringByAppendingString:@"s"];
              }
              v38 = (void *)v41;
            }

            uint64_t v42 = -[objc_class methodSignatureForSelector:](a2, "methodSignatureForSelector:", v40);
            v43 = (void *)[MEMORY[0x189603F88] invocationWithMethodSignature:v42];
            [v43 setSelector:v40];
            [v43 invokeWithTarget:a2];
            [v43 getReturnValue:v20 + 3];
            id v44 = v20[3];
          }

@end