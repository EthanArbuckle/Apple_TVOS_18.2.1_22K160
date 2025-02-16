@interface PBDataReader
- (BOOL)hasError;
- (BOOL)hasMoreData;
- (BOOL)isAtEnd;
- (BOOL)mark:(id *)a3;
- (BOOL)readBOOL;
- (BOOL)seekToOffset:(unint64_t)a3;
- (BOOL)skipValueWithTag:(unsigned __int16)a3 andType:(unsigned __int8)a4;
- (BOOL)skipValueWithTag:(unsigned int)a3 type:(unsigned __int8)a4;
- (PBDataReader)initWithData:(id)a3;
- (char)readInt8;
- (double)readDouble;
- (float)readFloat;
- (id)data;
- (id)readBigEndianShortThenString;
- (id)readBytes:(unsigned int)a3;
- (id)readProtoBuffer;
- (int)readInt32;
- (int)readSfixed32;
- (int)readSint32;
- (int64_t)readInt64;
- (int64_t)readSfixed64;
- (int64_t)readSint64;
- (int64_t)readVarInt;
- (unint64_t)length;
- (unint64_t)offset;
- (unint64_t)position;
- (unint64_t)readFixed64;
- (unint64_t)readUint64;
- (unsigned)readFixed32;
- (unsigned)readUint32;
- (void)readTag:(unsigned __int16 *)a3 andType:(char *)a4;
- (void)readTag:(unsigned int *)a3 type:(char *)a4;
- (void)recall:(id *)a3;
- (void)setLength:(unint64_t)a3;
- (void)setPosition:(unint64_t)a3;
- (void)updateData:(id)a3;
@end

@implementation PBDataReader

- (PBDataReader)initWithData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PBDataReader;
  v6 = -[PBDataReader init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_data, a3);
    v7->_pos = 0LL;
    v7->_error = 0;
    v7->_length = -[NSData length](v7->_data, "length");
    v7->_bytes = (const char *)-[NSData bytes](v7->_data, "bytes");
  }

  return v7;
}

- (id)data
{
  return self->_data;
}

- (BOOL)isAtEnd
{
  return self->_pos >= self->_length;
}

- (BOOL)hasError
{
  return self->_error;
}

- (BOOL)hasMoreData
{
  return !-[PBDataReader isAtEnd](self, "isAtEnd");
}

- (unint64_t)offset
{
  return self->_pos;
}

- (void)updateData:(id)a3
{
  data = (NSData *)a3;
  v6 = data;
  if (self->_data != data)
  {
    objc_storeStrong((id *)&self->_data, a3);
    data = self->_data;
  }

  self->_bytes = (const char *)-[NSData bytes](data, "bytes");
  self->_length = -[NSData length](self->_data, "length");
}

- (BOOL)seekToOffset:(unint64_t)a3
{
  unint64_t length = self->_length;
  if (length >= a3)
  {
    self->_error = 0;
    self->_pos = a3;
  }

  return length >= a3;
}

- (void)readTag:(unsigned int *)a3 type:(char *)a4
{
  char v4 = 0;
  unsigned int v5 = 0;
  unint64_t v6 = 0LL;
  unint64_t pos = self->_pos;
  while (1)
  {
    unint64_t v8 = pos + 1;
    if (pos == -1LL || v8 > self->_length)
    {
      unint64_t v6 = 0LL;
      self->_error = 1;
      goto LABEL_11;
    }

    char v9 = self->_bytes[pos];
    self->_unint64_t pos = v8;
    v6 |= (unint64_t)(v9 & 0x7F) << v4;
    if ((v9 & 0x80) == 0) {
      break;
    }
    v4 += 7;
    unint64_t pos = v8;
    if (v5++ >= 9)
    {
      unint64_t v6 = 0LL;
      goto LABEL_11;
    }
  }

  if (self->_error) {
    unint64_t v6 = 0LL;
  }
LABEL_11:
  *a4 = v6 & 7;
  *a3 = v6 >> 3;
}

- (BOOL)skipValueWithTag:(unsigned int)a3 type:(unsigned __int8)a4
{
  return _PBReaderSkipValueWithTag(self, a3, a4, 0LL);
}

- (void)readTag:(unsigned __int16 *)a3 andType:(char *)a4
{
  char v4 = 0;
  unsigned int v5 = 0;
  unint64_t v6 = 0LL;
  unint64_t pos = self->_pos;
  while (1)
  {
    unint64_t v8 = pos + 1;
    if (pos == -1LL || v8 > self->_length)
    {
      unint64_t v6 = 0LL;
      self->_error = 1;
      goto LABEL_11;
    }

    char v9 = self->_bytes[pos];
    self->_unint64_t pos = v8;
    v6 |= (unint64_t)(v9 & 0x7F) << v4;
    if ((v9 & 0x80) == 0) {
      break;
    }
    v4 += 7;
    unint64_t pos = v8;
    if (v5++ >= 9)
    {
      unint64_t v6 = 0LL;
      goto LABEL_11;
    }
  }

  if (self->_error) {
    unint64_t v6 = 0LL;
  }
LABEL_11:
  *a4 = v6 & 7;
  *a3 = v6 >> 3;
}

- (BOOL)skipValueWithTag:(unsigned __int16)a3 andType:(unsigned __int8)a4
{
  return _PBReaderSkipValueWithTag(self, a3, a4, 0LL);
}

- (id)readProtoBuffer
{
  unsigned int v3 = -[PBDataReader readBigEndianFixed32](self, "readBigEndianFixed32");
  unint64_t pos = self->_pos;
  unint64_t length = self->_length;
  if (pos + v3 <= length && (uint64_t v6 = v3, length - pos >= v3))
  {
    v7 = -[NSData subdataWithRange:](self->_data, "subdataWithRange:");
    self->_pos += v6;
  }

  else
  {
    v7 = 0LL;
    self->_error = 1;
  }

  return v7;
}

- (char)readInt8
{
  unint64_t pos = self->_pos;
  unint64_t v3 = pos + 1;
  if (pos == -1LL || v3 > self->_length)
  {
    char v4 = 0;
    self->_error = 1;
  }

  else
  {
    char v4 = self->_bytes[pos];
    self->_unint64_t pos = v3;
  }

  return v4;
}

- (int64_t)readVarInt
{
  char v2 = 0;
  unsigned int v3 = 0;
  int64_t v4 = 0LL;
  unint64_t pos = self->_pos;
  while (1)
  {
    unint64_t v6 = pos + 1;
    if (pos == -1LL || v6 > self->_length)
    {
      int64_t v4 = 0LL;
      self->_error = 1;
      return v4;
    }

    char v7 = self->_bytes[pos];
    self->_unint64_t pos = v6;
    v4 |= (unint64_t)(v7 & 0x7F) << v2;
    if ((v7 & 0x80) == 0) {
      break;
    }
    v2 += 7;
    unint64_t pos = v6;
    if (v3++ >= 9) {
      return 0LL;
    }
  }

  if (self->_error) {
    return 0LL;
  }
  return v4;
}

- (double)readDouble
{
  unint64_t pos = self->_pos;
  if (pos <= 0xFFFFFFFFFFFFFFF7LL && pos + 8 <= self->_length)
  {
    double result = *(double *)&self->_bytes[pos];
    self->_unint64_t pos = pos + 8;
  }

  else
  {
    self->_error = 1;
    return 0.0;
  }

  return result;
}

- (float)readFloat
{
  unint64_t pos = self->_pos;
  if (pos <= 0xFFFFFFFFFFFFFFFBLL && pos + 4 <= self->_length)
  {
    float result = *(float *)&self->_bytes[pos];
    self->_unint64_t pos = pos + 4;
  }

  else
  {
    self->_error = 1;
    return 0.0;
  }

  return result;
}

- (int)readInt32
{
  char v2 = 0;
  unsigned int v3 = 0;
  uint64_t v4 = 0LL;
  unint64_t pos = self->_pos;
  while (1)
  {
    unint64_t v6 = pos + 1;
    if (pos == -1LL || v6 > self->_length)
    {
      LODWORD(v4) = 0;
      self->_error = 1;
      return v4;
    }

    char v7 = self->_bytes[pos];
    self->_unint64_t pos = v6;
    v4 |= (unint64_t)(v7 & 0x7F) << v2;
    if ((v7 & 0x80) == 0) {
      break;
    }
    v2 += 7;
    unint64_t pos = v6;
    if (v3++ >= 9)
    {
      LODWORD(v4) = 0;
      return v4;
    }
  }

  if (self->_error) {
    LODWORD(v4) = 0;
  }
  return v4;
}

- (int64_t)readInt64
{
  char v2 = 0;
  unsigned int v3 = 0;
  int64_t v4 = 0LL;
  unint64_t pos = self->_pos;
  while (1)
  {
    unint64_t v6 = pos + 1;
    if (pos == -1LL || v6 > self->_length)
    {
      int64_t v4 = 0LL;
      self->_error = 1;
      return v4;
    }

    char v7 = self->_bytes[pos];
    self->_unint64_t pos = v6;
    v4 |= (unint64_t)(v7 & 0x7F) << v2;
    if ((v7 & 0x80) == 0) {
      break;
    }
    v2 += 7;
    unint64_t pos = v6;
    if (v3++ >= 9) {
      return 0LL;
    }
  }

  if (self->_error) {
    return 0LL;
  }
  return v4;
}

- (unsigned)readUint32
{
  char v2 = 0;
  unsigned int v3 = 0;
  uint64_t v4 = 0LL;
  unint64_t pos = self->_pos;
  while (1)
  {
    unint64_t v6 = pos + 1;
    if (pos == -1LL || v6 > self->_length)
    {
      LODWORD(v4) = 0;
      self->_error = 1;
      return v4;
    }

    char v7 = self->_bytes[pos];
    self->_unint64_t pos = v6;
    v4 |= (unint64_t)(v7 & 0x7F) << v2;
    if ((v7 & 0x80) == 0) {
      break;
    }
    v2 += 7;
    unint64_t pos = v6;
    if (v3++ >= 9)
    {
      LODWORD(v4) = 0;
      return v4;
    }
  }

  if (self->_error) {
    LODWORD(v4) = 0;
  }
  return v4;
}

- (unint64_t)readUint64
{
  char v2 = 0;
  unsigned int v3 = 0;
  unint64_t v4 = 0LL;
  unint64_t pos = self->_pos;
  while (1)
  {
    unint64_t v6 = pos + 1;
    if (pos == -1LL || v6 > self->_length)
    {
      unint64_t v4 = 0LL;
      self->_error = 1;
      return v4;
    }

    char v7 = self->_bytes[pos];
    self->_unint64_t pos = v6;
    v4 |= (unint64_t)(v7 & 0x7F) << v2;
    if ((v7 & 0x80) == 0) {
      break;
    }
    v2 += 7;
    unint64_t pos = v6;
    if (v3++ >= 9) {
      return 0LL;
    }
  }

  if (self->_error) {
    return 0LL;
  }
  return v4;
}

- (int)readSint32
{
  char v2 = 0;
  unsigned int v3 = 0;
  uint64_t v4 = 0LL;
  unint64_t pos = self->_pos;
  while (1)
  {
    unint64_t v6 = pos + 1;
    if (pos == -1LL || v6 > self->_length)
    {
      LODWORD(v4) = 0;
      self->_error = 1;
      return -(v4 & 1) ^ ((int)v4 >> 1);
    }

    char v7 = self->_bytes[pos];
    self->_unint64_t pos = v6;
    v4 |= (unint64_t)(v7 & 0x7F) << v2;
    if ((v7 & 0x80) == 0) {
      break;
    }
    v2 += 7;
    unint64_t pos = v6;
    if (v3++ >= 9)
    {
      LODWORD(v4) = 0;
      return -(v4 & 1) ^ ((int)v4 >> 1);
    }
  }

  if (self->_error) {
    LODWORD(v4) = 0;
  }
  return -(v4 & 1) ^ ((int)v4 >> 1);
}

- (int64_t)readSint64
{
  char v2 = 0;
  unsigned int v3 = 0;
  uint64_t v4 = 0LL;
  unint64_t pos = self->_pos;
  while (1)
  {
    unint64_t v6 = pos + 1;
    if (pos == -1LL || v6 > self->_length)
    {
      uint64_t v4 = 0LL;
      self->_error = 1;
      return -(v4 & 1) ^ (v4 >> 1);
    }

    char v7 = self->_bytes[pos];
    self->_unint64_t pos = v6;
    v4 |= (unint64_t)(v7 & 0x7F) << v2;
    if ((v7 & 0x80) == 0) {
      break;
    }
    v2 += 7;
    unint64_t pos = v6;
    if (v3++ >= 9)
    {
      uint64_t v4 = 0LL;
      return -(v4 & 1) ^ (v4 >> 1);
    }
  }

  if (self->_error) {
    uint64_t v4 = 0LL;
  }
  return -(v4 & 1) ^ (v4 >> 1);
}

- (unsigned)readFixed32
{
  unint64_t pos = self->_pos;
  if (pos <= 0xFFFFFFFFFFFFFFFBLL && (unint64_t v3 = pos + 4, pos + 4 <= self->_length))
  {
    unsigned int v4 = *(_DWORD *)&self->_bytes[pos];
    self->_unint64_t pos = v3;
  }

  else
  {
    unsigned int v4 = 0;
    self->_error = 1;
  }

  return v4;
}

- (unint64_t)readFixed64
{
  unint64_t pos = self->_pos;
  if (pos <= 0xFFFFFFFFFFFFFFF7LL && (unint64_t v3 = pos + 8, pos + 8 <= self->_length))
  {
    unint64_t v4 = *(void *)&self->_bytes[pos];
    self->_unint64_t pos = v3;
  }

  else
  {
    unint64_t v4 = 0LL;
    self->_error = 1;
  }

  return v4;
}

- (int)readSfixed32
{
  unint64_t pos = self->_pos;
  if (pos <= 0xFFFFFFFFFFFFFFFBLL && (unint64_t v3 = pos + 4, pos + 4 <= self->_length))
  {
    int v4 = *(_DWORD *)&self->_bytes[pos];
    self->_unint64_t pos = v3;
  }

  else
  {
    int v4 = 0;
    self->_error = 1;
  }

  return v4;
}

- (int64_t)readSfixed64
{
  unint64_t pos = self->_pos;
  if (pos <= 0xFFFFFFFFFFFFFFF7LL && (unint64_t v3 = pos + 8, pos + 8 <= self->_length))
  {
    int64_t v4 = *(void *)&self->_bytes[pos];
    self->_unint64_t pos = v3;
  }

  else
  {
    int64_t v4 = 0LL;
    self->_error = 1;
  }

  return v4;
}

- (BOOL)readBOOL
{
  char v2 = 0;
  unsigned int v3 = 0;
  uint64_t v4 = 0LL;
  unint64_t pos = self->_pos;
  while (1)
  {
    unint64_t v6 = pos + 1;
    if (pos == -1LL || v6 > self->_length)
    {
      BOOL v10 = 0;
      self->_error = 1;
      return v4 && v10;
    }

    char v7 = self->_bytes[pos];
    self->_unint64_t pos = v6;
    v4 |= (unint64_t)(v7 & 0x7F) << v2;
    if ((v7 & 0x80) == 0) {
      break;
    }
    v2 += 7;
    unint64_t pos = v6;
    if (v3++ >= 9) {
      return 0;
    }
  }

  BOOL v10 = !self->_error;
  return v4 && v10;
}

- (BOOL)mark:(id *)a3
{
  return PBReaderPlaceMark(self, &a3->var0);
}

- (void)recall:(id *)a3
{
  self->_unint64_t pos = a3->var0;
  self->_unint64_t length = a3->var1;
}

- (id)readBytes:(unsigned int)a3
{
  if (self->_error)
  {
    unsigned int v3 = 0LL;
  }

  else
  {
    unint64_t pos = self->_pos;
    if (__CFADD__(pos, a3) || pos + a3 > self->_length)
    {
      unsigned int v3 = 0LL;
      self->_error = 1;
    }

    else
    {
      uint64_t v6 = a3;
      -[NSData subdataWithRange:](self->_data, "subdataWithRange:", pos, a3);
      unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue();
      self->_pos += v6;
    }
  }

  return v3;
}

- (id)readBigEndianShortThenString
{
  unsigned int v3 = -[PBDataReader readBigEndianFixed16](self, "readBigEndianFixed16");
  if (self->_error)
  {
    uint64_t v4 = 0LL;
  }

  else
  {
    unint64_t pos = self->_pos;
    BOOL v6 = __CFADD__(pos, v3);
    unint64_t v7 = pos + v3;
    if (v6 || v7 > self->_length)
    {
      uint64_t v4 = 0LL;
      self->_error = 1;
    }

    else
    {
      uint64_t v8 = v3;
      char v9 = -[NSData bytes](self->_data, "bytes") + self->_pos;
      uint64_t v4 = (void *)[objc_alloc(NSString) initWithBytes:v9 length:v8 encoding:4];
      self->_pos += v8;
    }
  }

  return v4;
}

- (unint64_t)length
{
  return self->_length;
}

- (void)setLength:(unint64_t)a3
{
  self->_unint64_t length = a3;
}

- (unint64_t)position
{
  return self->_pos;
}

- (void)setPosition:(unint64_t)a3
{
  self->_unint64_t pos = a3;
}

- (void).cxx_destruct
{
}

@end