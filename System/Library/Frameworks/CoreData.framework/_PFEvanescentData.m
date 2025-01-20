@interface _PFEvanescentData
+ (Class)classForKeyedUnarchiver;
- (BOOL)isEqual:(id)a3;
- (Class)classForCoder;
- (_PFEvanescentData)initWithPath:(id)a3;
- (_PFEvanescentData)initWithURL:(id)a3;
- (const)bytes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)subdataWithRange:(_NSRange)a3;
- (id)url;
- (uint64_t)_destroyMapping;
- (unint64_t)hash;
- (unint64_t)length;
- (void)_openMapping;
- (void)dealloc;
- (void)enumerateByteRangesUsingBlock:(id)a3;
- (void)getBytes:(void *)a3;
- (void)getBytes:(void *)a3 length:(unint64_t)a4;
- (void)getBytes:(void *)a3 range:(_NSRange)a4;
@end

@implementation _PFEvanescentData

- (_PFEvanescentData)initWithURL:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS____PFEvanescentData;
  v4 = -[_PFEvanescentData init](&v17, sel_init);
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1896077E8]);
    v4->_openfd = -1;
    memset(&v16, 0, sizeof(v16));
    int v6 = stat((const char *)objc_msgSend((id)objc_msgSend(a3, "path"), "fileSystemRepresentation"), &v16);
    __error();
    if (v6)
    {
      v7 = (objc_class *)objc_opt_class();
      Name = class_getName(v7);
      _NSCoreDataLog( 1LL,  (uint64_t)@"Unable to initialize %s.  stat() failed on '%s' with errno %d",  v9,  v10,  v11,  v12,  v13,  v14,  (uint64_t)Name);

      v4 = 0LL;
    }

    else
    {
      v4->_length = v16.st_size;
      v4->_fileURL = (NSURL *)a3;
    }

    [v5 drain];
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____PFEvanescentData;
  -[_PFEvanescentData dealloc](&v3, sel_dealloc);
}

- (uint64_t)_destroyMapping
{
  if (result)
  {
    uint64_t v1 = result;
    v2 = *(void **)(result + 32);
    if (v2)
    {
      munmap(v2, *(void *)(v1 + 8));
      *(void *)(v1 + 32) = 0LL;
    }

    result = *(unsigned int *)(v1 + 24);
    if ((result & 0x80000000) == 0)
    {
      result = close(result);
      *(_DWORD *)(v1 + 24) = -1;
    }
  }

  return result;
}

- (_PFEvanescentData)initWithPath:(id)a3
{
  return -[_PFEvanescentData initWithURL:]( self,  "initWithURL:",  [MEMORY[0x189604030] fileURLWithPath:a3 isDirectory:0]);
}

- (id)description
{
  objc_super v3 = (void *)NSString;
  v4 = (objc_class *)objc_opt_class();
  Name = class_getName(v4);
  return (id)[v3 stringWithFormat:@"NSData [%s] with address %p backed by file at '%@'", Name, self, -[_PFEvanescentData url]((id *)&self->super.super.isa)];
}

- (id)url
{
  if (result) {
    return (id *)result[2];
  }
  return result;
}

- (unint64_t)length
{
  return self->_length;
}

- (void)_openMapping
{
  if (a1)
  {
    if (*(void *)(a1 + 32)) {
      goto LABEL_8;
    }
    int v2 = *(_DWORD *)(a1 + 24);
    if (v2 < 0)
    {
      id v5 = objc_alloc_init(MEMORY[0x1896077E8]);
      int v6 = open((const char *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "path"), "fileSystemRepresentation"), 0);
      if (v6 < 0)
      {
        uint64_t v20 = *__error();
        [v5 drain];
        v21 = (void *)MEMORY[0x189607870];
        uint64_t v11 = (void *)*MEMORY[0x189607688];
        v22 = (void *)MEMORY[0x189603F68];
        uint64_t v23 = [*(id *)(a1 + 16) path];
        uint64_t v24 = objc_msgSend( v21,  "errorWithDomain:code:userInfo:",  v11,  v20,  objc_msgSend(v22, "dictionaryWithObjectsAndKeys:", v23, *MEMORY[0x1896074F8], 0));
        uint64_t v25 = *MEMORY[0x189603A58];
        stat v16 = (void *)[MEMORY[0x189603F68] dictionaryWithObject:v24 forKey:@"NSCoreDataPrimaryError"];
        objc_super v17 = @"Could not open file.";
        uint64_t v18 = v25;
        uint64_t v19 = v20;
        goto LABEL_14;
      }

      *(_DWORD *)(a1 + 24) = v6;
      [v5 drain];
      if (*(void *)(a1 + 32))
      {
LABEL_8:
        v7 = (unsigned int *)(a1 + 40);
        do
          unsigned int v8 = __ldxr(v7);
        while (__stxr(v8 + 1, v7));
        return;
      }

      int v2 = *(_DWORD *)(a1 + 24);
    }

    objc_super v3 = mmap(0LL, *(void *)(a1 + 8), 1, 1, v2, 0LL);
    v4 = __error();
    if (v3)
    {
      *(void *)(a1 + 32) = v3;
      goto LABEL_8;
    }

    uint64_t v9 = *v4;
    uint64_t v10 = (void *)MEMORY[0x189607870];
    uint64_t v11 = (void *)*MEMORY[0x189607688];
    uint64_t v12 = (void *)MEMORY[0x189603F68];
    uint64_t v13 = [*(id *)(a1 + 16) path];
    uint64_t v14 = objc_msgSend( v10,  "errorWithDomain:code:userInfo:",  v11,  v9,  objc_msgSend(v12, "dictionaryWithObjectsAndKeys:", v13, *MEMORY[0x1896074F8], 0));
    uint64_t v15 = *MEMORY[0x189603A58];
    stat v16 = (void *)[MEMORY[0x189603F68] dictionaryWithObject:v14 forKey:@"NSCoreDataPrimaryError"];
    objc_super v17 = @"Could not map file.";
    uint64_t v18 = v15;
    uint64_t v19 = v9;
LABEL_14:
    id v26 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  v18,  v19,  (uint64_t)v17,  v16);
    -[_NSCoreDataException _setDomain:]((uint64_t)v26, v11);
    objc_exception_throw(v26);
    -[_PFEvanescentData invalidate](v27, v28);
  }

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  if (a3)
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class()) {
      return [-[_PFEvanescentData url]((id *)&self->super.super.isa) isEqual:*((id *)a3 + 2)];
    }
  }

  return 0;
}

- (unint64_t)hash
{
  return [-[_PFEvanescentData url]((id *)&self->super.super.isa) hash];
}

- (void)enumerateByteRangesUsingBlock:(id)a3
{
  if (v5) {
    (*((void (**)(id, uint64_t, void, unint64_t, char *))a3 + 2))( a3,  v5,  0LL,  -[_PFEvanescentData length](self, "length"),  &v10);
  }
  if (self)
  {
    p_mapRefCount = &self->_mapRefCount;
    do
    {
      unsigned int v7 = __ldxr((unsigned int *)p_mapRefCount);
      BOOL v8 = __OFSUB__(v7, 1);
      signed int v9 = v7 - 1;
    }

    while (__stxr(v9, (unsigned int *)p_mapRefCount));
    if ((v9 < 0) ^ v8 | (v9 == 0)) {
      -[_PFEvanescentData _destroyMapping]((uint64_t)self);
    }
  }

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = v4;
  if (v4) {
    uint64_t v5 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603F48]),  "initWithBytes:length:",  v4,  -[_PFEvanescentData length](self, "length"));
  }
  if (self)
  {
    p_mapRefCount = &self->_mapRefCount;
    do
    {
      unsigned int v7 = __ldxr((unsigned int *)p_mapRefCount);
      BOOL v8 = __OFSUB__(v7, 1);
      signed int v9 = v7 - 1;
    }

    while (__stxr(v9, (unsigned int *)p_mapRefCount));
    if ((v9 < 0) ^ v8 | (v9 == 0)) {
      -[_PFEvanescentData _destroyMapping]((uint64_t)self);
    }
  }

  return v5;
}

- (const)bytes
{
  id v2 = -[_PFEvanescentData copyWithZone:](self, "copyWithZone:", 0LL);
  objc_super v3 = (const void *)[v2 bytes];
  id v4 = v2;
  return v3;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

- (void)getBytes:(void *)a3
{
}

- (void)getBytes:(void *)a3 length:(unint64_t)a4
{
}

- (void)getBytes:(void *)a3 range:(_NSRange)a4
{
  if (a4.length)
  {
    size_t length = a4.length;
    NSUInteger location = a4.location;
    -[_PFEvanescentData _openMapping]((uint64_t)self);
    if (v8) {
      memmove(a3, (const void *)(v8 + location), length);
    }
    if (self)
    {
      p_mapRefCount = &self->_mapRefCount;
      do
      {
        unsigned int v10 = __ldxr((unsigned int *)p_mapRefCount);
        BOOL v11 = __OFSUB__(v10, 1);
        signed int v12 = v10 - 1;
      }

      while (__stxr(v12, (unsigned int *)p_mapRefCount));
      if ((v12 < 0) ^ v11 | (v12 == 0)) {
        -[_PFEvanescentData _destroyMapping]((uint64_t)self);
      }
    }
  }

- (id)subdataWithRange:(_NSRange)a3
{
  if (!a3.length) {
    return (id)objc_msgSend(MEMORY[0x189603F48], "data", a3.location);
  }
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  int v6 = malloc(a3.length);
  -[_PFEvanescentData getBytes:range:](self, "getBytes:range:", v6, location, length);
  return (id)[objc_alloc(MEMORY[0x189603F48]) initWithBytesNoCopy:v6 length:length freeWhenDone:1];
}

@end