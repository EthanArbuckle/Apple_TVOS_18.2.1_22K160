@interface _NSDataFileBackedFuture
+ (BOOL)supportsSecureCoding;
+ (Class)classForKeyedUnarchiver;
- (BOOL)_isCloudKitSupportOriginated;
- (BOOL)isEqual:(id)a3;
- (Class)classForCoder;
- (NSURL)fileURL;
- (NSUUID)UUID;
- (_NSDataFileBackedFuture)initWithCoder:(id)a3;
- (_NSDataFileBackedFuture)initWithStoreMetadata:(id)a3 directory:(id)a4;
- (_NSDataFileBackedFuture)initWithStoreMetadata:(id)a3 directory:(id)a4 originalFileURL:(id)a5;
- (const)bytes;
- (id)_storeMetadata;
- (id)description;
- (unint64_t)_bytesLengthForStore;
- (unint64_t)fileSize;
- (unint64_t)hash;
- (unint64_t)length;
- (void)_bytesPtrForStore;
- (void)_copyToInterimLocation;
- (void)_moveToPermanentLocation;
- (void)_underlyingData;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)initWithDirectoryURL:(void *)a3 UUID:(void *)a4 originalURL:;
- (void)initWithURL:(void *)a3 UUID:(unint64_t)a4 size:;
@end

@implementation _NSDataFileBackedFuture

- (_NSDataFileBackedFuture)initWithStoreMetadata:(id)a3 directory:(id)a4 originalFileURL:(id)a5
{
  uint64_t v9 = [a3 bytes];
  if (!strncmp((const char *)v9, "\x03###", 4uLL) && (!a5 || [a5 isFileURL]))
  {
    unint64_t v11 = *(void *)(v9 + 4);
    v12 = (_NSDataFileBackedFuture *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:v9 + 12];
    v10 = (_NSDataFileBackedFuture *)-[_NSDataFileBackedFuture initWithURL:UUID:size:]( self,  (void *)objc_msgSend( a4,  "URLByAppendingPathComponent:",  -[_NSDataFileBackedFuture UUIDString](v12, "UUIDString")),  v12,  v11);
    if (v10)
    {
      v10->_bytes = (NSData *)a3;
      v10->_originalFileURL = (NSURL *)a5;
    }

    self = v12;
  }

  else
  {
    v10 = 0LL;
  }

  return v10;
}

- (void)initWithURL:(void *)a3 UUID:(unint64_t)a4 size:
{
  v4 = a1;
  if (a1)
  {
    if (!a2 || ([a2 isFileURL]) && a4 < 0x7FFFFFFFFFFFFFFFLL)
    {
      v9.receiver = v4;
      v9.super_class = (Class)&OBJC_CLASS____NSDataFileBackedFuture;
      v4 = objc_msgSendSuper2(&v9, sel_init);
      if (v4)
      {
        v4[1] = a2;
        v4[4] = a3;
        v4[3] = a4;
      }
    }

    else
    {

      return 0LL;
    }
  }

  return v4;
}

- (_NSDataFileBackedFuture)initWithStoreMetadata:(id)a3 directory:(id)a4
{
  return -[_NSDataFileBackedFuture initWithStoreMetadata:directory:originalFileURL:]( self,  "initWithStoreMetadata:directory:originalFileURL:",  a3,  a4,  0LL);
}

- (void)initWithDirectoryURL:(void *)a3 UUID:(void *)a4 originalURL:
{
  v4 = a1;
  if (!a1) {
    return v4;
  }
  if (a4 && ([a4 isFileURL] & 1) == 0) {
    goto LABEL_10;
  }
  v16.receiver = v4;
  v16.super_class = (Class)&OBJC_CLASS____NSDataFileBackedFuture;
  v4 = objc_msgSendSuper2(&v16, sel_init);
  if (!v4) {
    return v4;
  }
  uint64_t v15 = 0LL;
  v8 = (void *)objc_msgSend( (id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"),  "attributesOfItemAtPath:error:",  objc_msgSend(a4, "path"),  &v15);
  if (v8)
  {
    objc_super v9 = v8;
    if ([v8 valueForKey:@"NSFileSize"])
    {
      v4[3] = objc_msgSend((id)objc_msgSend(v9, "valueForKey:", @"NSFileSize"), "unsignedIntegerValue");
      id v10 = a3;
      v4[4] = v10;
      v4[1] = (id)objc_msgSend( a2,  "URLByAppendingPathComponent:isDirectory:",  objc_msgSend(v10, "UUIDString"),  0);
      v4[2] = a4;
      unint64_t v11 = (void *)v4[1];
      if (!v11 || ([v11 isFileURL]) && v4[3] < 0x7FFFFFFFFFFFFFFFuLL) {
        return v4;
      }
LABEL_10:

      return 0LL;
    }
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"No file exists at URL '%@'", a2), 0 reason userInfo]);
  return -[_NSDataFileBackedFuture description](v13, v14);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"_NSDataFileBackedFuture : <%@, %llu, %@ (%@)>", self->_uuid, self->_fileSize, self->_fileURL, self->_originalFileURL];
}

- (NSURL)fileURL
{
  v3 = (void *)[MEMORY[0x1896078A8] defaultManager];
  fileURL = self->_fileURL;
  if (fileURL
    && -[NSURL isFileURL](fileURL, "isFileURL")
    && objc_msgSend(v3, "fileExistsAtPath:", -[NSURL path](self->_fileURL, "path")))
  {
    return self->_fileURL;
  }

  else
  {
    return 0LL;
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    uint64_t v5 = [a3 delegate];
    if (v5
      && (v6 = (void *)v5, (objc_opt_respondsToSelector() & 1) != 0)
      && ([v6 _allowCoreDataFutures] & 1) != 0
      || (objc_msgSend((id)objc_msgSend(a3, "allowedClasses"), "containsObject:", objc_opt_class()) & 1) != 0)
    {
      [a3 encodeObject:self->_uuid forKey:@"NSUUID"];
      [a3 encodeInt64:self->_fileSize forKey:@"NSFileSize"];
      [a3 encodeObject:self->_fileURL forKey:@"NSFileURL"];
      [a3 encodeObject:self->_originalFileURL forKey:@"NSOriginalFileURL"];
      return;
    }

    v7 = (void *)MEMORY[0x189607870];
    uint64_t v8 = *MEMORY[0x189607460];
    objc_super v9 = &unk_189F04008;
  }

  else
  {
    v7 = (void *)MEMORY[0x189607870];
    uint64_t v8 = *MEMORY[0x189607460];
    objc_super v9 = &unk_189F03FE0;
  }

  objc_msgSend(a3, "failWithError:", objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 4866, v9));
}

- (_NSDataFileBackedFuture)initWithCoder:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS____NSDataFileBackedFuture;
  v4 = -[_NSDataFileBackedFuture init](&v13, sel_init);
  if (v4)
  {
    if (![a3 allowsKeyedCoding])
    {
      unint64_t v11 = &unk_189F04030;
      goto LABEL_19;
    }

    uint64_t v5 = [a3 delegate];
    if (!v5
      || (v6 = (void *)v5, (objc_opt_respondsToSelector() & 1) == 0)
      || ([v6 _allowCoreDataFutures] & 1) == 0)
    {
      if (!objc_msgSend((id)objc_msgSend(a3, "allowedClasses"), "containsObject:", objc_opt_class()))
      {
        unint64_t v11 = &unk_189F04058;
        goto LABEL_19;
      }
    }

    v4->_uuid = (NSUUID *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSUUID"];
    v4->_fileSize = [a3 decodeInt64ForKey:@"NSFileSize"];
    v7 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSFileURL"];
    if (v7)
    {
      uint64_t v8 = v7;
      if (![v7 isFileURL])
      {
        unint64_t v11 = &unk_189F04080;
        goto LABEL_19;
      }

      v4->_fileURL = (NSURL *)v8;
    }

    objc_super v9 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSOriginalFileURL"];
    if (v9)
    {
      id v10 = v9;
      if (![v9 isFileURL])
      {
        unint64_t v11 = &unk_189F040A8;
        goto LABEL_19;
      }

      v4->_originalFileURL = (NSURL *)v10;
    }

    if (v4->_fileSize >= 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v11 = &unk_189F040D0;
LABEL_19:
      objc_msgSend( a3,  "failWithError:",  objc_msgSend(MEMORY[0x189607870], "errorWithDomain:code:userInfo:", *MEMORY[0x189607460], 4864, v11));

      return 0LL;
    }
  }

  return v4;
}

- (void)dealloc
{
  self->_fileURL = 0LL;
  self->_uuid = 0LL;

  self->_realData = 0LL;
  self->_originalFileURL = 0LL;

  self->_bytes = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSDataFileBackedFuture;
  -[_NSDataFileBackedFuture dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  return -[NSURL hash](self->_fileURL, "hash");
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->_fileSize != *((void *)a3 + 3)) {
    goto LABEL_16;
  }
  uuid = self->_uuid;
  v6 = (NSUUID *)*((void *)a3 + 4);
  if (uuid == v6) {
    goto LABEL_10;
  }
  if (uuid) {
    BOOL v7 = v6 == 0LL;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7) {
    goto LABEL_16;
  }
  int v8 = -[NSUUID isEqual:](uuid, "isEqual:");
  if (v8)
  {
LABEL_10:
    fileURL = self->_fileURL;
    id v10 = (NSURL *)*((void *)a3 + 1);
    if (fileURL != v10)
    {
      if (fileURL) {
        BOOL v11 = v10 == 0LL;
      }
      else {
        BOOL v11 = 1;
      }
      if (!v11)
      {
        LOBYTE(v8) = -[NSURL isEqual:](fileURL, "isEqual:");
        return v8;
      }

- (void)_underlyingData
{
  v19[1] = *MEMORY[0x1895F89C0];
  if (result)
  {
    v1 = result;
    result = (void *)result[5];
    if (!result)
    {
      v2 = (void *)[v1 fileURL];
      if (v2)
      {
        objc_super v3 = v2;
        if ([v2 isFileURL])
        {
          objc_super v13 = 0LL;
          v4 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithContentsOfURL:v3 options:0 error:&v13];
          v1[5] = v4;
          if (v4)
          {
            v1[3] = [v4 length];
            return (void *)v1[5];
          }

          uint64_t v9 = *MEMORY[0x189607798];
          v14[0] = @"URL";
          v14[1] = v9;
          id v10 = v13;
          if (!v13) {
            id v10 = @"<no error>";
          }
          BOOL v11 = (void *)MEMORY[0x189603F70];
          v15[0] = v3;
          v15[1] = v10;
          uint64_t v12 = [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:2];
          objc_exception_throw((id)[v11 exceptionWithName:*MEMORY[0x189603A58] reason:@"Underlying file for this file backed future has not been downloaded." userInfo:v12]);
        }

        else
        {
          BOOL v7 = (void *)MEMORY[0x189603F70];
          objc_super v16 = @"URL";
          v17 = v3;
          uint64_t v8 = [MEMORY[0x189603F68] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
          objc_exception_throw((id)[v7 exceptionWithName:*MEMORY[0x189603A58] reason:@"Underlying url for this file backed future is not a file url." userInfo:v8]);
        }
      }

      else
      {
        uint64_t v5 = (void *)MEMORY[0x189603F70];
        v18 = @"URL";
        v19[0] = @"<null url>";
        uint64_t v6 = [MEMORY[0x189603F68] dictionaryWithObjects:v19 forKeys:&v18 count:1];
        objc_exception_throw((id)[v5 exceptionWithName:*MEMORY[0x189603A58] reason:@"Underlying file for this file backed future has not been downloaded." userInfo:v6]);
      }

      __break(1u);
      JUMPOUT(0x1868AD8CCLL);
    }
  }

  return result;
}

- (id)_storeMetadata
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  id v2 = *(id *)(a1 + 48);
  if (!v2)
  {
    id v2 = objc_alloc_init(MEMORY[0x189603FB8]);
    [v2 appendBytes:"\x03###" length:4];
    [v2 appendBytes:a1 + 24 length:8];
    [*(id *)(a1 + 32) getUUIDBytes:v5];
    [v2 appendBytes:v5 length:16];
    objc_super v3 = (const char *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "lastPathComponent"), "fileSystemRepresentation");
    [v2 appendBytes:v3 length:strlen(v3)];
    *(void *)(a1 + 48) = v2;
  }

  return v2;
}

- (void)_bytesPtrForStore
{
  return (void *)[-[_NSDataFileBackedFuture _storeMetadata]((uint64_t)self) bytes];
}

- (unint64_t)_bytesLengthForStore
{
  return [-[_NSDataFileBackedFuture _storeMetadata]((uint64_t)self) length];
}

- (void)_copyToInterimLocation
{
  v14[1] = *MEMORY[0x1895F89C0];
  objc_super v3 = (void *)[MEMORY[0x1896078A8] defaultManager];
  if (!self) {
    goto LABEL_9;
  }
  for (uint64_t i = objc_msgSend( MEMORY[0x189604030],  "fileURLWithPath:",  -[NSString stringByAppendingString:]( -[NSURL path](self->_fileURL, "path"),  "stringByAppendingString:",  @".interim")); ; uint64_t i = 0)
  {
    id v12 = 0LL;
    if ([v3 copyItemAtURL:self->_originalFileURL toURL:i error:&v12]) {
      break;
    }
    _NSCoreDataLog( 2LL,  (uint64_t)@"%@: First attempt at moving file to interim location failed: %@",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)self);
    if ([v12 code] == 516)
    {
      id v12 = 0LL;
      if ([v3 removeItemAtURL:i error:&v12])
      {
        if ([v3 copyItemAtURL:self->_originalFileURL toURL:i error:&v12]) {
          break;
        }
      }
    }

    objc_super v3 = (void *)MEMORY[0x189603F70];
    uint64_t v11 = *MEMORY[0x189603A58];
    self = (_NSDataFileBackedFuture *)[NSString stringWithFormat:@"Failed to copy file from %@ to %@ (%@)", self->_originalFileURL, i, v12];
    uint64_t v13 = *MEMORY[0x189607798];
    v14[0] = v12;
    objc_exception_throw((id)objc_msgSend( v3,  "exceptionWithName:reason:userInfo:",  v11,  self,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1)));
LABEL_9:
    ;
  }

- (void)_moveToPermanentLocation
{
  v18[1] = *MEMORY[0x1895F89C0];
  objc_super v3 = (void *)[MEMORY[0x1896078A8] defaultManager];
  uint64_t v4 = 8LL;
  if (!self) {
    goto LABEL_11;
  }
  for (uint64_t i = objc_msgSend( MEMORY[0x189604030],  "fileURLWithPath:",  -[NSString stringByAppendingString:]( -[NSURL path](self->_fileURL, "path"),  "stringByAppendingString:",  @".interim")); ; uint64_t i = 0)
  {
    id v14 = 0LL;
    _NSCoreDataLog( 2LL,  (uint64_t)@"%@: First attempt at moving in to place failed with error: %@",  v6,  v7,  v8,  v9,  v10,  v11,  (uint64_t)self);
    if ([v14 code] == 516)
    {
      id v14 = 0LL;
      id v12 = (void *)objc_msgSend( v3,  "attributesOfItemAtPath:error:",  objc_msgSend(*(id *)((char *)&self->super.super.isa + v4), "path"),  &v14);
      if (v12)
      {
        if (objc_msgSend((id)objc_msgSend(v12, "objectForKey:", *MEMORY[0x189607548]), "unsignedLongValue") == self->_fileSize
          || [v3 removeItemAtURL:*(Class *)((char *)&self->super.super.isa + v4) error:&v14]
          && ([v3 moveItemAtURL:i toURL:*(Class *)((char *)&self->super.super.isa + v4) error:&v14] & 1) != 0)
        {
          break;
        }
      }
    }

    objc_super v3 = (void *)MEMORY[0x189603F70];
    uint64_t v13 = v4;
    uint64_t v4 = *MEMORY[0x189603A58];
    self = (_NSDataFileBackedFuture *)[NSString stringWithFormat:@"Failed to copy file from %@ to %@ (%@)", i, *(Class *)((char *)&self->super.super.isa + v13), v14];
    uint64_t v17 = *MEMORY[0x189607798];
    v18[0] = v14;
    objc_exception_throw((id)objc_msgSend( v3,  "exceptionWithName:reason:userInfo:",  v4,  self,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1)));
LABEL_11:
    ;
  }

  uint64_t v15 = *MEMORY[0x189607500];
  uint64_t v16 = [MEMORY[0x189607968] numberWithInteger:292];
  objc_msgSend( v3,  "setAttributes:ofItemAtPath:error:",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1),  objc_msgSend(*(id *)((char *)&self->super.super.isa + v4), "path"),  &v14);

  self->_originalFileURL = 0LL;
}

- (unint64_t)length
{
  return [-[_NSDataFileBackedFuture _underlyingData](self) length];
}

- (const)bytes
{
  return (const void *)[-[_NSDataFileBackedFuture _underlyingData](self) bytes];
}

- (BOOL)_isCloudKitSupportOriginated
{
  return 0;
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (NSUUID)UUID
{
  return self->_uuid;
}

@end