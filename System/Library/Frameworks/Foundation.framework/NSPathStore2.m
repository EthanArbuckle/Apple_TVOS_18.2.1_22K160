@interface NSPathStore2
+ (id)pathStoreWithCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4;
+ (id)pathWithComponents:(id)a3;
- (BOOL)isAbsolutePath;
- (BOOL)isEqualToString:(id)a3;
- (const)_fastCharacterContents;
- (id)_stringByResolvingSymlinksInPathUsingCache:(BOOL)a3;
- (id)_stringByStandardizingPathUsingCache:(BOOL)a3;
- (id)lastPathComponent;
- (id)pathComponents;
- (id)pathExtension;
- (id)stringByAbbreviatingWithTildeInPath;
- (id)stringByAppendingPathComponent:(id)a3;
- (id)stringByAppendingPathExtension:(id)a3;
- (id)stringByDeletingLastPathComponent;
- (id)stringByDeletingPathExtension;
- (id)stringByExpandingTildeInPath;
- (id)stringByResolvingSymlinksInPath;
- (id)stringByStandardizingPath;
- (unint64_t)hash;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
@end

@implementation NSPathStore2

+ (id)pathStoreWithCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4
{
  unint64_t v4 = a4;
  if (a4 > 0x400) {
    return +[NSString stringWithCharacters:length:](&OBJC_CLASS___NSString, "stringWithCharacters:length:", a3, a4);
  }
  v6 = (objc_class *)objc_opt_self();
  v7 = NSAllocateObject(v6, 2 * v4, 0LL);
  v8 = v7;
  if (v4)
  {
    memmove(v7 + 3, a3, 2 * v4);
    if (v4 != 1)
    {
      while (*((_WORD *)v8 + v4 + 5) == 47)
      {
        if (v4-- <= 2)
        {
          LODWORD(v4) = 1;
          break;
        }
      }
    }
  }

  v8[2] = (_DWORD)v4 << 20;
  return v8;
}

- (unint64_t)length
{
  return (unint64_t)self->_lengthAndRefCount >> 20;
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  if (a4.location + a4.length >= ((unint64_t)self->_lengthAndRefCount >> 20) + 1)
  {
    unint64_t v4 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B40], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: index (%lu) beyond bounds (%d)", _NSMethodExceptionProem((objc_class *)self, a2), a4.location + a4.length, (self->_lengthAndRefCount >> 20) + 1), 0 reason userInfo];
    objc_exception_throw(v4);
    -[NSConcreteMapTable objectForKey:](v5, v6, v7);
  }

  else if (a4.length)
  {
    memmove(a3, &self->_characters[a4.location], 2 * a4.length);
  }

- (unint64_t)hash
{
  return CFStringHashCharacters();
}

- (BOOL)isEqualToString:(id)a3
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  if (self == a3) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  uint64_t v4 = (uint64_t)self;
  if (object_getClass(a3) == (Class)&OBJC_CLASS___NSPathStore2)
  {
    unsigned int v9 = *(_DWORD *)(v4 + 8) >> 20;
    unsigned int v10 = *((_DWORD *)a3 + 2) >> 20;
    if (v9 >= v10) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = v9;
    }
    if ((_DWORD)v11)
    {
      v12 = (unsigned __int16 *)(v4 + 12);
      v13 = (unsigned __int16 *)((char *)a3 + 12);
      while (1)
      {
        unsigned int v15 = *v12++;
        unsigned int v14 = v15;
        unsigned int v16 = *v13++;
        BOOL v17 = v14 >= v16;
        BOOL v18 = v14 == v16;
        uint64_t v19 = v14 > v16 ? 1LL : v4;
        uint64_t v4 = v17 ? v19 : -1LL;
        if (!v18) {
          break;
        }
        if (!--v11) {
          goto LABEL_22;
        }
      }
    }

    else
    {
LABEL_22:
      BOOL v17 = v9 >= v10;
      BOOL v20 = v9 > v10;
      if (v17) {
        uint64_t v4 = v20;
      }
      else {
        uint64_t v4 = -1LL;
      }
    }
  }

  else
  {
    uint64_t v5 = [a3 length];
    unint64_t v6 = v5;
    if (v5 >= 1041) {
      id v7 = (unsigned __int16 *)malloc(2 * v5);
    }
    else {
      id v7 = (unsigned __int16 *)v33;
    }
    objc_msgSend(a3, "getCharacters:range:", v7, 0, v6);
    unint64_t v21 = (unint64_t)*(unsigned int *)(v4 + 8) >> 20;
    if (v21 >= v6) {
      unint64_t v22 = v6;
    }
    else {
      unint64_t v22 = (unint64_t)*(unsigned int *)(v4 + 8) >> 20;
    }
    if (v22)
    {
      v23 = (unsigned __int16 *)(v4 + 12);
      v24 = v7;
      while (1)
      {
        unsigned int v26 = *v23++;
        unsigned int v25 = v26;
        unsigned int v27 = *v24++;
        BOOL v28 = v25 >= v27;
        BOOL v29 = v25 == v27;
        uint64_t v30 = v25 > v27 ? 1LL : v4;
        uint64_t v4 = v28 ? v30 : -1LL;
        if (!v29) {
          break;
        }
        if (!--v22) {
          goto LABEL_40;
        }
      }
    }

    else
    {
LABEL_40:
      BOOL v31 = v6 > v21;
      BOOL v32 = v6 < v21;
      if (v31) {
        uint64_t v4 = -1LL;
      }
      else {
        uint64_t v4 = v32;
      }
    }
  }

  return v4 == 0;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  uint64_t v4 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B40], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: index (%lu) beyond bounds (%d)", _NSMethodExceptionProem((objc_class *)self, a2), a3, self->_lengthAndRefCount >> 20), 0 reason userInfo];
  objc_exception_throw(v4);
  return (unsigned __int16)-[NSPathStore2 _fastCharacterContents](v5, v6);
}

- (const)_fastCharacterContents
{
  return self->_characters;
}

+ (id)pathWithComponents:(id)a3
{
  v48 = (objc_class *)a1;
  v49 = a2;
  uint64_t v56 = *MEMORY[0x1895F89C0];
  if (!a3 || (_NSIsNSArray() & 1) == 0)
  {
    v38 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: components argument is not an array", _NSMethodExceptionProem(v48, v49)), 0 reason userInfo];
    objc_exception_throw(v38);
  }

  if (![a3 count]) {
    return &stru_189CA6A28;
  }
  unint64_t v4 = [a3 count];
  unint64_t v5 = v4;
  if (v4 >> 60)
  {
    CFStringRef v39 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v4);
    v40 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:v39 userInfo:0];
    CFRelease(v39);
    objc_exception_throw(v40);
    v42 = v41;
    free(v47);
    _Unwind_Resume(v42);
  }

  if (v4 <= 1) {
    unint64_t v4 = 1LL;
  }
  MEMORY[0x1895F8858](v4);
  v8 = (char *)&v43 - v7;
  size_t v9 = 8 * v6;
  v46 = &v43;
  id v44 = a3;
  if (v5 >= 0x101)
  {
    v8 = (char *)_CFCreateArrayStorage();
    unsigned int v10 = (char *)malloc(v9);
    uint64_t v51 = 0LL;
    v47 = v8;
  }

  else
  {
    MEMORY[0x1895F8858](v6);
    unsigned int v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    bzero(v10, v9);
    uint64_t v51 = 0LL;
    if (!v5)
    {
      int v17 = 0;
      v47 = 0LL;
      unint64_t v14 = 0LL;
      goto LABEL_17;
    }

    v47 = 0LL;
  }

  uint64_t v13 = 0LL;
  unint64_t v14 = 0LL;
  for (uint64_t i = 0LL; i != v5; ++i)
  {
    unsigned int v16 = (void *)[a3 objectAtIndexedSubscript:i];
    *(void *)&v8[8 * i] = v16;
    uint64_t v11 = [v16 length];
    *(void *)&v10[8 * i] = v11;
    v13 += v11;
  }

  int v17 = 1;
LABEL_17:
  MEMORY[0x1895F8858](v11);
  BOOL v20 = (unsigned __int16 *)((char *)&v43 - v19);
  unint64_t v50 = v21;
  if (v21 >= 0x101)
  {
    unint64_t v22 = (unsigned __int16 *)malloc(2 * v18);
    BOOL v20 = v22;
  }

  else
  {
    bzero((char *)&v43 - v19, 2 * v18);
  }

  v45 = &v43;
  MEMORY[0x1895F8858](v22);
  unsigned int v25 = (char *)&v43 - v24;
  if (v14 > 0x100)
  {
    unsigned int v25 = (char *)malloc(2 * v23);
    if (!v17) {
      goto LABEL_36;
    }
  }

  else
  {
    bzero((char *)&v43 - v24, 2 * v23);
    if (!v17) {
      goto LABEL_36;
    }
  }

  uint64_t v26 = 0LL;
  do
  {
    objc_msgSend(*(id *)&v8[8 * v26], "getCharacters:range:", v25, 0, *(void *)&v10[8 * v26]);
    if (*(void *)&v10[8 * v26] + v51 >= 1019)
    {
      _NSTransmutePathSlashes(v20, &v51);
      unint64_t v27 = v51;
      if (v51 >= 2)
      {
        for (int j = v20[v51 - 1]; j == 47; int j = v20[v27-- - 2])
        {
          if (v27 <= 2)
          {
            unint64_t v27 = 1LL;
            break;
          }
        }

        uint64_t v51 = v27;
      }
    }

    if ((_NSAppendPathComponent(v20, &v51, v50, v25, *(void *)&v10[8 * v26]) & 1) == 0)
    {
      BOOL v29 = _NSMethodExceptionProem(v48, v49);
      NSLog( (NSString *)@"%@: cannot append path '%@' to path '%@'",  v29,  *(void *)&v8[8 * v26],  +[NSString stringWithCharacters:length:](&OBJC_CLASS___NSString, "stringWithCharacters:length:", v20, v51));
    }

    ++v26;
  }

  while (v26 != v5);
LABEL_36:
  if (v14 >= 0x101) {
    free(v25);
  }
  _NSTransmutePathSlashes(v20, &v51);
  uint64_t v30 = v51;
  if (v51 < 2) {
    goto LABEL_45;
  }
  if (v20[v51 - 1] == 47)
  {
    do
    {
      if ((unint64_t)v30 <= 2)
      {
        uint64_t v32 = 0LL;
        uint64_t v30 = 1LL;
        uint64_t v51 = 1LL;
        goto LABEL_50;
      }

      int v31 = v20[v30-- - 2];
    }

    while (v31 == 47);
    uint64_t v51 = v30;
    if (v30 < 2) {
      goto LABEL_45;
    }
  }

  if (*v20 == 92) {
    uint64_t v32 = 2LL * (v20[1] == 92);
  }
  else {
LABEL_45:
  }
    uint64_t v32 = 0LL;
  if (v32 < v30)
  {
LABEL_50:
    if (!v20[v32])
    {
LABEL_54:
      uint64_t v34 = (os_log_s *)_NSOSLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      {
        id v36 = v44;
        uint64_t v37 = [v44 valueForKey:@"length"];
        *(_DWORD *)buf = 138478083;
        id v53 = v36;
        __int16 v54 = 2112;
        uint64_t v55 = v37;
        _os_log_fault_impl( &dword_182EB1000,  v34,  OS_LOG_TYPE_FAULT,  "Creating path from components (%{private}@, lengths: %@) resulted in an embedded NUL character",  buf,  0x16u);
      }

      id v12 = 0LL;
      goto LABEL_57;
    }

    while (v30 - 1 != v32)
    {
      if (!v20[++v32])
      {
        if (v32 >= v30) {
          break;
        }
        goto LABEL_54;
      }
    }
  }

  id v12 = +[NSPathStore2 pathStoreWithCharacters:length:]( &OBJC_CLASS___NSPathStore2,  "pathStoreWithCharacters:length:",  v20);
LABEL_57:
  if (v50 >= 0x101) {
    free(v20);
  }
  if (v5 >= 0x101) {
    free(v10);
  }
  free(v47);
  return v12;
}

- (id)pathComponents
{
  return _NSPathComponents(self->_characters, (unint64_t)self->_lengthAndRefCount >> 20);
}

- (BOOL)isAbsolutePath
{
  if (self->_lengthAndRefCount < 0x100000) {
    return 0;
  }
  int v3 = self->_characters[0];
  return v3 == 126 || v3 == 47;
}

- (id)lastPathComponent
{
  unint64_t v2 = *((unsigned int *)self + 2);
  if (v2 >= 0x200000)
  {
    uint64_t v3 = 0LL;
    unint64_t v4 = v2 >> 20;
    unint64_t v5 = (char *)self + 2 * v4 + 12;
    unint64_t v6 = v4 - 1;
    while (v6 != v3)
    {
      int v7 = *((unsigned __int16 *)v5 - 2);
      v5 -= 2;
      ++v3;
      if (v7 == 47) {
        return +[NSPathStore2 pathStoreWithCharacters:length:]( &OBJC_CLASS___NSPathStore2,  "pathStoreWithCharacters:length:",  v5,  v3);
      }
    }
  }

  return self;
}

- (id)stringByDeletingLastPathComponent
{
  characters = self->_characters;
  unint64_t lengthAndRefCount = self->_lengthAndRefCount;
  unint64_t v4 = lengthAndRefCount >> 20;
  if (self->_lengthAndRefCount >> 20 == 1)
  {
    uint64_t v5 = *characters == 47;
  }

  else
  {
    if (lengthAndRefCount >= 0x100000)
    {
      while (1)
      {
        unint64_t v6 = v4 - 1;
        if (v4 == 1) {
          break;
        }
        int v7 = *((unsigned __int16 *)&self->_lengthAndRefCount + v4--);
        if (v7 == 47)
        {
          if (v6 == 1) {
            uint64_t v5 = 1LL;
          }
          else {
            uint64_t v5 = v6 - 1;
          }
          return +[NSPathStore2 pathStoreWithCharacters:length:]( &OBJC_CLASS___NSPathStore2,  "pathStoreWithCharacters:length:",  characters,  v5);
        }
      }
    }

    uint64_t v5 = 0LL;
  }

  return +[NSPathStore2 pathStoreWithCharacters:length:]( &OBJC_CLASS___NSPathStore2,  "pathStoreWithCharacters:length:",  characters,  v5);
}

- (id)stringByAppendingPathComponent:(id)a3
{
  uint64_t v3 = (objc_class *)self;
  v36[260] = *MEMORY[0x1895F89C0];
  if (!a3) {
    return v3;
  }
  unint64_t v6 = (unint64_t)self->_lengthAndRefCount >> 20;
  Class = (__objc2_class *)object_getClass(a3);
  if (Class == &OBJC_CLASS___NSPathStore2)
  {
    BOOL v25 = 0;
    unint64_t v9 = (unint64_t)*((unsigned int *)a3 + 2) >> 20;
    unsigned int v10 = (char *)a3 + 12;
  }

  else
  {
    uint64_t v8 = [a3 length];
    unint64_t v9 = v8;
    unsigned int v10 = (char *)v36;
    if (v8 >= 1041) {
      unsigned int v10 = (char *)malloc(2 * v8);
    }
    BOOL v25 = v10 != (char *)v36;
    Class = (__objc2_class *)objc_msgSend(a3, "getCharacters:range:", v10, 0, v9);
  }

  uint64_t v26 = v24;
  uint64_t v27 = v6;
  unint64_t v11 = v6 + v9 + 1;
  MEMORY[0x1895F8858](Class);
  unint64_t v14 = &v24[-v13];
  if (v11 > 0x100) {
    unint64_t v14 = malloc(2 * v12);
  }
  else {
    bzero(&v24[-v13], 2 * v12);
  }
  memmove(v14, (char *)&v3[1].isa + 4, 2 * v6);
  if ((_NSAppendPathComponent(v14, &v27, v6 + v9 + 1, v10, v9) & 1) == 0)
  {
    uint64_t v18 = _NSMethodExceptionProem(v3, a2);
    NSLog((NSString *)@"%@: cannot append path '%@' to path '%@'", v18, a3, v3);
    return 0LL;
  }

  _NSTransmutePathSlashes(v14, &v27);
  uint64_t v15 = v27;
  if (v27 < 2) {
    goto LABEL_19;
  }
  if (v14[v27 - 1] == 47)
  {
    do
    {
      if ((unint64_t)v15 <= 2)
      {
        uint64_t v17 = 0LL;
        uint64_t v15 = 1LL;
        uint64_t v27 = 1LL;
        goto LABEL_26;
      }

      int v16 = (unsigned __int16)v14[v15-- - 2];
    }

    while (v16 == 47);
    uint64_t v27 = v15;
    if (v15 < 2) {
      goto LABEL_19;
    }
  }

  if (*v14 == 92) {
    uint64_t v17 = 2LL * (v14[1] == 92);
  }
  else {
LABEL_19:
  }
    uint64_t v17 = 0LL;
  if (v17 >= v15) {
    goto LABEL_21;
  }
LABEL_26:
  if (!v14[v17])
  {
LABEL_30:
    BOOL v20 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      uint64_t v22 = [a3 length];
      uint64_t v23 = -[objc_class length](v3, "length");
      int v28 = 138478595;
      id v29 = a3;
      __int16 v30 = 2048;
      uint64_t v31 = v22;
      __int16 v32 = 2113;
      v33 = v3;
      __int16 v34 = 2048;
      uint64_t v35 = v23;
      _os_log_fault_impl( &dword_182EB1000,  v20,  OS_LOG_TYPE_FAULT,  "Appending path component %{private}@ (length: %lu) to string %{private}@ (length: %lu) resulted in an embedded NUL character",  (uint8_t *)&v28,  0x2Au);
    }

    return 0LL;
  }

  while (v15 - 1 != v17)
  {
    if (!v14[++v17])
    {
      if (v17 >= v15) {
        break;
      }
      goto LABEL_30;
    }
  }

- (id)pathExtension
{
  unint64_t v3 = (unint64_t)self->_lengthAndRefCount >> 20;
  uint64_t v4 = _NSStartOfPathExtension((uint64_t)self->_characters, v3);
  if (v4 < 1) {
    return &stru_189CA6A28;
  }
  else {
    return -[NSString substringWithRange:](self, "substringWithRange:", v4 + 1, ~v4 + v3);
  }
}

- (id)stringByDeletingPathExtension
{
  characters = self->_characters;
  unint64_t v3 = (unint64_t)self->_lengthAndRefCount >> 20;
  uint64_t v4 = _NSStartOfPathExtension((uint64_t)self->_characters, v3);
  if (v4 <= 0) {
    unint64_t v5 = v3;
  }
  else {
    unint64_t v5 = v4;
  }
  return +[NSPathStore2 pathStoreWithCharacters:length:]( &OBJC_CLASS___NSPathStore2,  "pathStoreWithCharacters:length:",  characters,  v5);
}

- (id)stringByAppendingPathExtension:(id)a3
{
  uint64_t v4 = self;
  v32[1] = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    __int16 v30 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v30);
  }

  uint64_t v6 = [a3 length];
  if (!v6) {
    return -[NSPathStore2 copy](v4, "copy");
  }
  unint64_t v7 = v6;
  v31[1] = v31;
  unint64_t v8 = (unint64_t)v4->_lengthAndRefCount >> 20;
  unint64_t v9 = v6 + v8 + 1;
  MEMORY[0x1895F8858](v6);
  uint64_t v12 = (_WORD *)((char *)v31 - v11);
  if (v10 > 0x100)
  {
    uint64_t v13 = malloc(2 * v10);
    uint64_t v12 = v13;
  }

  else
  {
    bzero((char *)v31 - v11, 2 * v10);
  }

  MEMORY[0x1895F8858](v13);
  uint64_t v17 = (char *)v31 - v16;
  if (v9 > 0x100) {
    uint64_t v17 = (char *)malloc(2 * v15);
  }
  else {
    bzero((char *)v31 - v16, 2 * v15);
  }
  objc_msgSend(a3, "getCharacters:range:", v12, 0, v7);
  characters = v4->_characters;
  memmove(v17, v4->_characters, 2 * v8);
  v32[0] = v8;
  if ((_NSAppendPathExtension((unsigned __int16 *)v17, v32, v9, v12, v7) & 1) != 0)
  {
    _NSTransmutePathSlashes(v17, v32);
    unint64_t v20 = v32[0];
    if (v32[0] >= 2 && *(_WORD *)&v17[2 * v32[0] - 2] == 47)
    {
      while (v20 > 2)
      {
        uint64_t v19 = *(unsigned __int16 *)&v17[2 * v20-- - 4];
        if ((_DWORD)v19 != 47) {
          goto LABEL_19;
        }
      }

      unint64_t v20 = 1LL;
    }

- (id)stringByAbbreviatingWithTildeInPath
{
  unint64_t v2 = self;
  uint64_t v16 = *MEMORY[0x1895F89C0];
  unint64_t v14 = (unint64_t)self->_lengthAndRefCount >> 20;
  characters = self->_characters;
  __memmove_chk();
  _NSAbbreviatePathWithTilde(v15, (uint64_t *)&v14);
  unint64_t v5 = (unint64_t)v2->_lengthAndRefCount >> 20;
  if (v5 >= v14) {
    unint64_t v6 = v14;
  }
  else {
    unint64_t v6 = (unint64_t)v2->_lengthAndRefCount >> 20;
  }
  if (v6)
  {
    unint64_t v7 = v15;
    while (1)
    {
      unsigned int v9 = *characters++;
      unsigned int v8 = v9;
      unsigned int v10 = *v7++;
      BOOL v11 = v8 >= v10;
      BOOL v12 = v8 == v10;
      if (v8 > v10) {
        uint64_t v4 = 1LL;
      }
      if (!v11) {
        uint64_t v4 = -1LL;
      }
      if (!v12) {
        break;
      }
      if (!--v6) {
        goto LABEL_13;
      }
    }
  }

  else
  {
LABEL_13:
    uint64_t v4 = v14 < v5;
    if (v14 > v5) {
      return +[NSPathStore2 pathStoreWithCharacters:length:]( &OBJC_CLASS___NSPathStore2,  "pathStoreWithCharacters:length:",  v15,  v14);
    }
  }

  if (v4) {
    return +[NSPathStore2 pathStoreWithCharacters:length:]( &OBJC_CLASS___NSPathStore2,  "pathStoreWithCharacters:length:",  v15,  v14);
  }
  return v2;
}

- (id)stringByExpandingTildeInPath
{
  unint64_t v2 = self;
  uint64_t v16 = *MEMORY[0x1895F89C0];
  unint64_t v14 = (unint64_t)self->_lengthAndRefCount >> 20;
  characters = self->_characters;
  __memmove_chk();
  _NSExpandTildeInPath((uint64_t)v15, &v14);
  unint64_t v5 = (unint64_t)v2->_lengthAndRefCount >> 20;
  if (v5 >= v14) {
    unint64_t v6 = v14;
  }
  else {
    unint64_t v6 = (unint64_t)v2->_lengthAndRefCount >> 20;
  }
  if (v6)
  {
    unint64_t v7 = (unsigned __int16 *)v15;
    while (1)
    {
      unsigned int v9 = *characters++;
      unsigned int v8 = v9;
      unsigned int v10 = *v7++;
      BOOL v11 = v8 >= v10;
      BOOL v12 = v8 == v10;
      if (v8 > v10) {
        uint64_t v4 = 1LL;
      }
      if (!v11) {
        uint64_t v4 = -1LL;
      }
      if (!v12) {
        break;
      }
      if (!--v6) {
        goto LABEL_13;
      }
    }
  }

  else
  {
LABEL_13:
    uint64_t v4 = v14 < v5;
    if (v14 > v5) {
      return +[NSPathStore2 pathStoreWithCharacters:length:]( &OBJC_CLASS___NSPathStore2,  "pathStoreWithCharacters:length:",  v15,  v14);
    }
  }

  if (v4) {
    return +[NSPathStore2 pathStoreWithCharacters:length:]( &OBJC_CLASS___NSPathStore2,  "pathStoreWithCharacters:length:",  v15,  v14);
  }
  return v2;
}

- (id)_stringByStandardizingPathUsingCache:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = self;
  uint64_t v18 = *MEMORY[0x1895F89C0];
  unint64_t v16 = (unint64_t)self->_lengthAndRefCount >> 20;
  characters = self->_characters;
  __memmove_chk();
  _NSExpandTildeInPath((uint64_t)v17, &v16);
  _NSStandardizePathUsingCache(v17, (uint64_t *)&v16, v3);
  unint64_t v7 = (unint64_t)v4->_lengthAndRefCount >> 20;
  if (v7 >= v16) {
    unint64_t v8 = v16;
  }
  else {
    unint64_t v8 = (unint64_t)v4->_lengthAndRefCount >> 20;
  }
  if (v8)
  {
    unsigned int v9 = v17;
    while (1)
    {
      unsigned int v11 = *characters++;
      unsigned int v10 = v11;
      unsigned int v12 = *v9++;
      BOOL v13 = v10 >= v12;
      BOOL v14 = v10 == v12;
      if (v10 > v12) {
        uint64_t v6 = 1LL;
      }
      if (!v13) {
        uint64_t v6 = -1LL;
      }
      if (!v14) {
        break;
      }
      if (!--v8) {
        goto LABEL_13;
      }
    }
  }

  else
  {
LABEL_13:
    uint64_t v6 = v16 < v7;
    if (v16 > v7) {
      return +[NSPathStore2 pathStoreWithCharacters:length:]( &OBJC_CLASS___NSPathStore2,  "pathStoreWithCharacters:length:",  v17,  v16);
    }
  }

  if (v6) {
    return +[NSPathStore2 pathStoreWithCharacters:length:]( &OBJC_CLASS___NSPathStore2,  "pathStoreWithCharacters:length:",  v17,  v16);
  }
  return v4;
}

- (id)stringByStandardizingPath
{
  return -[NSPathStore2 _stringByStandardizingPathUsingCache:](self, "_stringByStandardizingPathUsingCache:", 0LL);
}

- (id)_stringByResolvingSymlinksInPathUsingCache:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = self;
  uint64_t v18 = *MEMORY[0x1895F89C0];
  unint64_t v16 = (unint64_t)self->_lengthAndRefCount >> 20;
  characters = self->_characters;
  __memmove_chk();
  _NSExpandTildeInPath((uint64_t)v17, &v16);
  _NSResolveSymlinksInPathUsingCache(v17, (uint64_t *)&v16, v3);
  _NSStandardizePathUsingCache(v17, (uint64_t *)&v16, v3);
  unint64_t v7 = (unint64_t)v4->_lengthAndRefCount >> 20;
  if (v7 >= v16) {
    unint64_t v8 = v16;
  }
  else {
    unint64_t v8 = (unint64_t)v4->_lengthAndRefCount >> 20;
  }
  if (v8)
  {
    unsigned int v9 = v17;
    while (1)
    {
      unsigned int v11 = *characters++;
      unsigned int v10 = v11;
      unsigned int v12 = *v9++;
      BOOL v13 = v10 >= v12;
      BOOL v14 = v10 == v12;
      if (v10 > v12) {
        uint64_t v6 = 1LL;
      }
      if (!v13) {
        uint64_t v6 = -1LL;
      }
      if (!v14) {
        break;
      }
      if (!--v8) {
        goto LABEL_13;
      }
    }
  }

  else
  {
LABEL_13:
    uint64_t v6 = v16 < v7;
    if (v16 > v7) {
      return +[NSPathStore2 pathStoreWithCharacters:length:]( &OBJC_CLASS___NSPathStore2,  "pathStoreWithCharacters:length:",  v17,  v16);
    }
  }

  if (v6) {
    return +[NSPathStore2 pathStoreWithCharacters:length:]( &OBJC_CLASS___NSPathStore2,  "pathStoreWithCharacters:length:",  v17,  v16);
  }
  return v4;
}

- (id)stringByResolvingSymlinksInPath
{
  return -[NSPathStore2 _stringByResolvingSymlinksInPathUsingCache:]( self,  "_stringByResolvingSymlinksInPathUsingCache:",  0LL);
}

@end