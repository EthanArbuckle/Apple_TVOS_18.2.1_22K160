@interface _NSBPlistMappedData
- (BOOL)_getBPlistMarker:(char *)a3 offset:(unint64_t *)a4 trailer:(id *)a5;
- (_NSBPlistMappedData)initWithBinaryPlistData:(void *)a3 size:(unint64_t)a4 trailer:(id *)a5 offset:(unint64_t)a6 marker:(unsigned __int8)a7;
- (_NSBPlistMappedData)initWithFileURL:(id)a3 error:(id *)a4;
- (const)bytes;
- (int64_t)mappingIndex;
- (unint64_t)_bplistObjectsRangeEnd;
- (unint64_t)length;
- (void)dealloc;
- (void)setMappingIndex:(int64_t)a3;
@end

@implementation _NSBPlistMappedData

- (_NSBPlistMappedData)initWithBinaryPlistData:(void *)a3 size:(unint64_t)a4 trailer:(id *)a5 offset:(unint64_t)a6 marker:(unsigned __int8)a7
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS____NSBPlistMappedData;
  result = -[_NSBPlistMappedData init](&v14, sel_init);
  if (result)
  {
    result->ptr = a3;
    result->size = a4;
    result->mappingIndex = 0x7FFFFFFFFFFFFFFFLL;
    __int128 v13 = *(_OWORD *)&a5->var5;
    *(_OWORD *)result->bplistTrailer._unused = *(_OWORD *)a5->var0;
    *(_OWORD *)&result->bplistTrailer._topObject = v13;
    result->bplistOffset = a6;
    result->bplistMarker = a7;
  }

  return result;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  ptr = self->ptr;
  if (ptr)
  {
    size_t size = self->size;
    if (size) {
      munmap(ptr, size);
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____NSBPlistMappedData;
  -[_NSBPlistMappedData dealloc](&v5, sel_dealloc);
}

- (_NSBPlistMappedData)initWithFileURL:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x1895F89C0];
  size_t v11 = 0LL;
  v12 = 0LL;
  char v10 = 0;
  LOBYTE(v7) = 0;
  if ((objc_msgSend( MEMORY[0x189603F48],  "_readBytesFromPath:maxLength:bytes:length:didMap:options:reportProgress:error:",  objc_msgSend(a3, "path"),  0x7FFFFFFFFFFFFFFFLL,  &v12,  &v11,  &v10,  8,  v7,  a4) & 1) == 0)
  {
LABEL_7:

    return 0LL;
  }

  if ((__CFBinaryPlistGetTopLevelInfo() & 1) == 0)
  {
    munmap(v12, v11);
    if (a4)
    {
      objc_super v14 = @"NSDebugDescription";
      v15[0] = @"File is not binary plist";
      *a4 = +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  256,  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:&v14 count:1]);
    }

    goto LABEL_7;
  }

  if (!v10) {
    __assert_rtn("-[_NSBPlistMappedData initWithFileURL:error:]", "NSBPlistMappedClasses.m", 88, "mapped");
  }
  *(_OWORD *)__int128 v13 = *(_OWORD *)&v13[5];
  *(_OWORD *)&v13[2] = *(_OWORD *)&v13[7];
  return -[_NSBPlistMappedData initWithBinaryPlistData:size:trailer:offset:marker:]( self,  "initWithBinaryPlistData:size:trailer:offset:marker:",  v12,  v11,  v13,  v9,  v8);
}

- (void)setMappingIndex:(int64_t)a3
{
  self->mappingIndex = a3;
}

- (int64_t)mappingIndex
{
  return self->mappingIndex;
}

- (const)bytes
{
  return self->ptr;
}

- (unint64_t)length
{
  return self->size;
}

- (unint64_t)_bplistObjectsRangeEnd
{
  return self->bplistTrailer._offsetTableOffset - 1;
}

- (BOOL)_getBPlistMarker:(char *)a3 offset:(unint64_t *)a4 trailer:(id *)a5
{
  if (a3) {
    *a3 = self->bplistMarker;
  }
  if (a4) {
    *a4 = self->bplistOffset;
  }
  if (a5)
  {
    __int128 v5 = *(_OWORD *)&self->bplistTrailer._topObject;
    *(_OWORD *)a5->var0 = *(_OWORD *)self->bplistTrailer._unused;
    *(_OWORD *)&a5->var5 = v5;
  }

  return 1;
}

@end