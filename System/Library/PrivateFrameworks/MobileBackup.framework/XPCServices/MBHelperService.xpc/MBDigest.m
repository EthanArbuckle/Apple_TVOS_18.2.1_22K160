@interface MBDigest
+ (id)sha1;
+ (id)sha1ForData:(id)a3;
+ (id)sha1ForFileAtPath:(id)a3 error:(id *)a4;
+ (id)sha1ForString:(id)a3;
+ (id)sha1HmacForString:(id)a3 key:(id)a4;
+ (id)sha256;
+ (id)sha256ForData:(id)a3;
+ (id)sha256ForFileAtPath:(id)a3 error:(id *)a4;
+ (int64_t)simpleChecksumForString:(id)a3;
- (BOOL)updateWithFile:(id)a3 error:(id *)a4;
- (id)digestForData:(id)a3;
- (id)digestForFileAtPath:(id)a3 error:(id *)a4;
- (id)digestForString:(id)a3;
- (id)final;
- (void)finalWithBytes:(void *)a3 length:(unint64_t)a4;
- (void)updateWithBytes:(const void *)a3 length:(unint64_t)a4;
- (void)updateWithData:(id)a3;
- (void)updateWithDate:(id)a3;
- (void)updateWithInt32:(int)a3;
- (void)updateWithInt64:(int64_t)a3;
- (void)updateWithString:(id)a3;
@end

@implementation MBDigest

+ (id)sha1
{
  return objc_alloc_init(&OBJC_CLASS___MBDigestSHA1);
}

+ (id)sha256
{
  return objc_alloc_init(&OBJC_CLASS___MBDigestSHA256);
}

+ (id)sha256ForData:(id)a3
{
  return objc_msgSend(+[MBDigest sha256](MBDigest, "sha256"), "digestForData:", a3);
}

+ (id)sha256ForFileAtPath:(id)a3 error:(id *)a4
{
  return objc_msgSend(+[MBDigest sha256](MBDigest, "sha256"), "digestForFileAtPath:error:", a3, a4);
}

+ (id)sha1ForData:(id)a3
{
  return objc_msgSend(+[MBDigest sha1](MBDigest, "sha1"), "digestForData:", a3);
}

+ (id)sha1ForFileAtPath:(id)a3 error:(id *)a4
{
  return objc_msgSend(+[MBDigest sha1](MBDigest, "sha1"), "digestForFileAtPath:error:", a3, a4);
}

+ (id)sha1ForString:(id)a3
{
  return objc_msgSend(+[MBDigest sha1](MBDigest, "sha1"), "digestForString:", a3);
}

+ (id)sha1HmacForString:(id)a3 key:(id)a4
{
  return +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v5, 20LL);
}

+ (int64_t)simpleChecksumForString:(id)a3
{
  return MBSimpleChecksumForString(a3);
}

- (id)digestForData:(id)a3
{
  return -[MBDigest final](self, "final");
}

- (id)digestForFileAtPath:(id)a3 error:(id *)a4
{
  if (-[MBDigest updateWithFile:error:](self, "updateWithFile:error:", a3, a4)) {
    return -[MBDigest final](self, "final");
  }
  else {
    return 0LL;
  }
}

- (id)digestForString:(id)a3
{
  return -[MBDigest final](self, "final");
}

- (void)updateWithInt32:(int)a3
{
  int v3 = a3;
  -[MBDigest updateWithBytes:length:](self, "updateWithBytes:length:", &v3, 4LL);
}

- (void)updateWithInt64:(int64_t)a3
{
  int64_t v3 = a3;
  -[MBDigest updateWithBytes:length:](self, "updateWithBytes:length:", &v3, 8LL);
}

- (void)updateWithBytes:(const void *)a3 length:(unint64_t)a4
{
}

- (void)updateWithData:(id)a3
{
  if (a3)
  {
    if ([a3 length]) {
      -[MBDigest updateWithBytes:length:]( self,  "updateWithBytes:length:",  [a3 bytes],  objc_msgSend(a3, "length"));
    }
  }

- (void)updateWithDate:(id)a3
{
}

- (BOOL)updateWithFile:(id)a3 error:(id *)a4
{
  if (!a3) {
    sub_100011CB0();
  }
  int v7 = getpagesize();
  if (!v7) {
    sub_100011CD8();
  }
  int v8 = v7;
  int v9 = open((const char *)[a3 fileSystemRepresentation], 256);
  if (v9 != -1)
  {
    int v10 = v9;
    memset(&v26, 0, sizeof(v26));
    if (fstat(v9, &v26))
    {
      v11 = +[MBError posixErrorWithPath:format:]( &OBJC_CLASS___MBError,  "posixErrorWithPath:format:",  a3,  @"Failed to fstat src file");
    }

    else if ((v26.st_mode & 0xF000) == 0x8000)
    {
      unint64_t v14 = v8;
      off_t st_size = v26.st_size;
      unint64_t v16 = v26.st_size % (unint64_t)v8;
      if (v16) {
        unint64_t v17 = v8 - v16;
      }
      else {
        unint64_t v17 = 0LL;
      }
      unint64_t v18 = v17 + v26.st_size;
      else {
        unint64_t v19 = v18;
      }
      if (v19 <= v8) {
        size_t v20 = v8;
      }
      else {
        size_t v20 = v19;
      }
      if (v26.st_size < 1)
      {
LABEL_27:
        v12 = 0LL;
        BOOL v13 = 1;
        goto LABEL_31;
      }

      off_t v21 = 0LL;
      while (1)
      {
        v22 = mmap(0LL, v20, 1, 2, v10, v21);
        v23 = v22;
        if (v19 > v14) {
          madvise(v22, v20, 2);
        }
        if (st_size - v21 >= v20) {
          size_t v24 = v20;
        }
        else {
          size_t v24 = st_size - v21;
        }
        -[MBDigest updateWithBytes:length:](self, "updateWithBytes:length:", v23, v24);
        munmap(v23, v20);
        v21 += v24;
        if (v21 >= st_size) {
          goto LABEL_27;
        }
      }

      v11 = +[MBError posixErrorWithFormat:]( &OBJC_CLASS___MBError,  "posixErrorWithFormat:",  @"Failed to mmap the file at offset:%lld, mapSize:%ld",  v21,  v20);
    }

    else
    {
      v11 = +[MBError errorWithCode:path:format:]( &OBJC_CLASS___MBError,  "errorWithCode:path:format:",  1LL,  a3,  @"Not a regular file");
    }

    v12 = v11;
    BOOL v13 = 0;
LABEL_31:
    close(v10);
    if (!a4) {
      return v13;
    }
    goto LABEL_32;
  }

  v12 = +[MBError posixErrorWithPath:format:]( &OBJC_CLASS___MBError,  "posixErrorWithPath:format:",  a3,  @"Failed to open src file");
  BOOL v13 = 0;
  if (!a4) {
    return v13;
  }
LABEL_32:
  if (!v13) {
    *a4 = v12;
  }
  return v13;
}

- (void)updateWithString:(id)a3
{
  if (a3)
  {
    if ([a3 length])
    {
      v5 = malloc((size_t)[a3 maximumLengthOfBytesUsingEncoding:4]);
      -[MBDigest updateWithBytes:length:](self, "updateWithBytes:length:", v5, 0LL);
      free(v5);
    }
  }

- (void)finalWithBytes:(void *)a3 length:(unint64_t)a4
{
}

- (id)final
{
  return 0LL;
}

@end