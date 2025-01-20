@interface _PFResultData
+ (Class)classForKeyedUnarchiver;
- (BOOL)isEqualToData:(id)a3;
- (BOOL)writeToFile:(id)a3 atomically:(BOOL)a4;
- (BOOL)writeToFile:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)writeToURL:(id)a3 atomically:(BOOL)a4;
- (BOOL)writeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (Class)classForCoder;
- (_NSRange)rangeOfData:(id)a3 options:(unint64_t)a4 range:(_NSRange)a5;
- (_PFResultData)init;
- (_PFResultData)initWithCoder:(id)a3;
- (_PFResultData)retain;
- (const)bytes;
- (id)description;
- (id)mutableCopy;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)subdataWithRange:(_NSRange)a3;
- (uint64_t)privateCopy;
- (unint64_t)length;
- (unint64_t)retainCount;
- (void)getBytes:(void *)a3 length:(unint64_t)a4;
- (void)getBytes:(void *)a3 range:(_NSRange)a4;
- (void)release;
- (void)setParentObject:(id)a3;
@end

@implementation _PFResultData

- (_PFResultData)init
{
  return 0LL;
}

- (_PFResultData)initWithCoder:(id)a3
{
  return 0LL;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

- (_PFResultData)retain
{
  id v3 = self->_parentObject;
  return self;
}

- (void)release
{
}

- (unint64_t)retainCount
{
  return [self->_parentObject retainCount];
}

- (void)setParentObject:(id)a3
{
  self->_parentObject = a3;
}

- (id)description
{
  v2 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:&self[1] length:self->_length];
  id v3 = (void *)[v2 description];

  return v3;
}

- (id)mutableCopy
{
  return -[_PFResultData mutableCopyWithZone:](self, "mutableCopyWithZone:", 0LL);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend( (id)objc_msgSend(MEMORY[0x189603FB8], "allocWithZone:", a3),  "initWithBytes:length:",  &self[1],  self->_length);
}

- (uint64_t)privateCopy
{
  if (result) {
    return [objc_alloc(MEMORY[0x189603F48]) initWithBytesNoCopy:result + 24 length:*(unsigned int *)(result + 12)];
  }
  return result;
}

- (unint64_t)length
{
  return self->_length;
}

- (const)bytes
{
  return &self[1];
}

- (void)getBytes:(void *)a3 length:(unint64_t)a4
{
}

- (void)getBytes:(void *)a3 range:(_NSRange)a4
{
}

- (id)subdataWithRange:(_NSRange)a3
{
  return (id)[MEMORY[0x189603F48] dataWithBytes:(char *)&self[1] + a3.location length:a3.length];
}

- (BOOL)isEqualToData:(id)a3
{
  uint64_t length = self->_length;
  if ([a3 length] != length) {
    return 0;
  }
  BytePtr = CFDataGetBytePtr((CFDataRef)a3);
  return memcmp(&self[1], BytePtr, self->_length) == 0;
}

- (_NSRange)rangeOfData:(id)a3 options:(unint64_t)a4 range:(_NSRange)a5
{
  if (a3)
  {
    NSUInteger length = a5.length;
    NSUInteger location = a5.location;
    v9 = (void *)-[_PFResultData privateCopy]((uint64_t)self);
    uint64_t v10 = objc_msgSend(v9, "rangeOfData:options:range:", a3, a4, location, length);
    NSUInteger v12 = v11;

    NSUInteger v13 = v10;
    NSUInteger v14 = v12;
  }

  else
  {
    objc_exception_throw((id)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603A60],  @"Data may not be nil",  0,  a5.length));
    NSUInteger v13 = -[_PFResultData writeToFile:options:error:](v15, v16, v17, v18, v19);
  }

  result.NSUInteger length = v14;
  result.NSUInteger location = v13;
  return result;
}

- (BOOL)writeToFile:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  v8 = (void *)-[_PFResultData privateCopy]((uint64_t)self);
  LOBYTE(a5) = [v8 writeToFile:a3 options:a4 error:a5];

  return (char)a5;
}

- (BOOL)writeToFile:(id)a3 atomically:(BOOL)a4
{
  return -[_PFResultData writeToFile:options:error:](self, "writeToFile:options:error:", a3, 1LL, 0LL);
}

- (BOOL)writeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  v8 = (void *)-[_PFResultData privateCopy]((uint64_t)self);
  LOBYTE(a5) = [v8 writeToURL:a3 options:a4 error:a5];

  return (char)a5;
}

- (BOOL)writeToURL:(id)a3 atomically:(BOOL)a4
{
  return -[_PFResultData writeToURL:options:error:](self, "writeToURL:options:error:", a3, 1LL, 0LL);
}

@end