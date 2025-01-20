@interface TransparencyGPBCodedOutputStream
+ (id)streamWithData:(id)a3;
+ (id)streamWithOutputStream:(id)a3;
- (TransparencyGPBCodedOutputStream)initWithData:(id)a3;
- (TransparencyGPBCodedOutputStream)initWithOutputStream:(id)a3;
- (TransparencyGPBCodedOutputStream)initWithOutputStream:(id)a3 data:(id)a4;
- (void)dealloc;
- (void)flush;
- (void)writeBool:(int)a3 value:(BOOL)a4;
- (void)writeBoolArray:(int)a3 values:(id)a4 tag:(unsigned int)a5;
- (void)writeBoolNoTag:(BOOL)a3;
- (void)writeBytes:(int)a3 value:(id)a4;
- (void)writeBytesArray:(int)a3 values:(id)a4;
- (void)writeBytesNoTag:(id)a3;
- (void)writeDouble:(int)a3 value:(double)a4;
- (void)writeDoubleArray:(int)a3 values:(id)a4 tag:(unsigned int)a5;
- (void)writeDoubleNoTag:(double)a3;
- (void)writeEnum:(int)a3 value:(int)a4;
- (void)writeEnumArray:(int)a3 values:(id)a4 tag:(unsigned int)a5;
- (void)writeEnumNoTag:(int)a3;
- (void)writeFixed32:(int)a3 value:(unsigned int)a4;
- (void)writeFixed32Array:(int)a3 values:(id)a4 tag:(unsigned int)a5;
- (void)writeFixed32NoTag:(unsigned int)a3;
- (void)writeFixed64:(int)a3 value:(unint64_t)a4;
- (void)writeFixed64Array:(int)a3 values:(id)a4 tag:(unsigned int)a5;
- (void)writeFixed64NoTag:(unint64_t)a3;
- (void)writeFloat:(int)a3 value:(float)a4;
- (void)writeFloatArray:(int)a3 values:(id)a4 tag:(unsigned int)a5;
- (void)writeFloatNoTag:(float)a3;
- (void)writeGroup:(int)a3 value:(id)a4;
- (void)writeGroupArray:(int)a3 values:(id)a4;
- (void)writeGroupNoTag:(int)a3 value:(id)a4;
- (void)writeInt32:(int)a3 value:(int)a4;
- (void)writeInt32Array:(int)a3 values:(id)a4 tag:(unsigned int)a5;
- (void)writeInt32NoTag:(int)a3;
- (void)writeInt64:(int)a3 value:(int64_t)a4;
- (void)writeInt64Array:(int)a3 values:(id)a4 tag:(unsigned int)a5;
- (void)writeInt64NoTag:(int64_t)a3;
- (void)writeMessage:(int)a3 value:(id)a4;
- (void)writeMessageArray:(int)a3 values:(id)a4;
- (void)writeMessageNoTag:(id)a3;
- (void)writeMessageSetExtension:(int)a3 value:(id)a4;
- (void)writeRawByte:(unsigned __int8)a3;
- (void)writeRawData:(id)a3;
- (void)writeRawLittleEndian32:(int)a3;
- (void)writeRawLittleEndian64:(int64_t)a3;
- (void)writeRawMessageSetExtension:(int)a3 value:(id)a4;
- (void)writeRawPtr:(const void *)a3 offset:(unint64_t)a4 length:(unint64_t)a5;
- (void)writeRawVarint32:(int)a3;
- (void)writeRawVarint64:(int64_t)a3;
- (void)writeRawVarintSizeTAs32:(unint64_t)a3;
- (void)writeSFixed32:(int)a3 value:(int)a4;
- (void)writeSFixed32Array:(int)a3 values:(id)a4 tag:(unsigned int)a5;
- (void)writeSFixed32NoTag:(int)a3;
- (void)writeSFixed64:(int)a3 value:(int64_t)a4;
- (void)writeSFixed64Array:(int)a3 values:(id)a4 tag:(unsigned int)a5;
- (void)writeSFixed64NoTag:(int64_t)a3;
- (void)writeSInt32:(int)a3 value:(int)a4;
- (void)writeSInt32Array:(int)a3 values:(id)a4 tag:(unsigned int)a5;
- (void)writeSInt32NoTag:(int)a3;
- (void)writeSInt64:(int)a3 value:(int64_t)a4;
- (void)writeSInt64Array:(int)a3 values:(id)a4 tag:(unsigned int)a5;
- (void)writeSInt64NoTag:(int64_t)a3;
- (void)writeString:(int)a3 value:(id)a4;
- (void)writeStringArray:(int)a3 values:(id)a4;
- (void)writeStringNoTag:(id)a3;
- (void)writeTag:(unsigned int)a3 format:(int)a4;
- (void)writeUInt32:(int)a3 value:(unsigned int)a4;
- (void)writeUInt32Array:(int)a3 values:(id)a4 tag:(unsigned int)a5;
- (void)writeUInt32NoTag:(unsigned int)a3;
- (void)writeUInt64:(int)a3 value:(unint64_t)a4;
- (void)writeUInt64Array:(int)a3 values:(id)a4 tag:(unsigned int)a5;
- (void)writeUInt64NoTag:(unint64_t)a3;
- (void)writeUnknownGroup:(int)a3 value:(id)a4;
- (void)writeUnknownGroupArray:(int)a3 values:(id)a4;
- (void)writeUnknownGroupNoTag:(int)a3 value:(id)a4;
@end

@implementation TransparencyGPBCodedOutputStream

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TransparencyGPBCodedOutputStream;
  -[TransparencyGPBCodedOutputStream dealloc](&v3, "dealloc");
}

- (TransparencyGPBCodedOutputStream)initWithOutputStream:(id)a3
{
  return -[TransparencyGPBCodedOutputStream initWithOutputStream:data:]( self,  "initWithOutputStream:data:",  a3,  +[NSMutableData dataWithLength:](&OBJC_CLASS___NSMutableData, "dataWithLength:", vm_page_size));
}

- (TransparencyGPBCodedOutputStream)initWithData:(id)a3
{
  return -[TransparencyGPBCodedOutputStream initWithOutputStream:data:](self, "initWithOutputStream:data:", 0LL, a3);
}

- (TransparencyGPBCodedOutputStream)initWithOutputStream:(id)a3 data:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TransparencyGPBCodedOutputStream;
  v6 = -[TransparencyGPBCodedOutputStream init](&v9, "init");
  if (v6)
  {
    v6->buffer_ = (NSMutableData *)a4;
    v6->state_.bytes = (char *)[a4 mutableBytes];
    v6->state_.size = (unint64_t)[a4 length];
    v7 = (NSOutputStream *)a3;
    v6->state_.output = v7;
    -[NSOutputStream open](v7, "open");
  }

  return v6;
}

+ (id)streamWithOutputStream:(id)a3
{
  return  objc_msgSend( objc_alloc((Class)a1),  "initWithOutputStream:data:",  a3,  +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", vm_page_size));
}

+ (id)streamWithData:(id)a3
{
  return [objc_alloc((Class)a1) initWithData:a3];
}

- (void)writeDoubleNoTag:(double)a3
{
}

- (void)writeDouble:(int)a3 value:(double)a4
{
  p_state = (uint64_t *)&self->state_;
  unsigned int v6 = sub_10013B0C8(a3, 1);
  sub_10010D188(p_state, v6);
  sub_10010CA90(p_state, *(uint64_t *)&a4);
}

- (void)writeFloatNoTag:(float)a3
{
}

- (void)writeFloat:(int)a3 value:(float)a4
{
  p_state = (uint64_t *)&self->state_;
  unsigned int v6 = sub_10013B0C8(a3, 5);
  sub_10010D188(p_state, v6);
  sub_10010CC60(p_state, SLODWORD(a4));
}

- (void)writeUInt64NoTag:(unint64_t)a3
{
}

- (void)writeUInt64:(int)a3 value:(unint64_t)a4
{
  p_state = (uint64_t *)&self->state_;
  unsigned int v6 = sub_10013B0C8(a3, 0);
  sub_10010D188(p_state, v6);
  sub_10010CD80(p_state, a4);
}

- (void)writeInt64NoTag:(int64_t)a3
{
}

- (void)writeInt64:(int)a3 value:(int64_t)a4
{
  p_state = (uint64_t *)&self->state_;
  unsigned int v6 = sub_10013B0C8(a3, 0);
  sub_10010D188(p_state, v6);
  sub_10010CD80(p_state, a4);
}

- (void)writeInt32NoTag:(int)a3
{
}

- (void)writeInt32:(int)a3 value:(int)a4
{
  p_state = (uint64_t *)&self->state_;
  unsigned int v6 = sub_10013B0C8(a3, 0);
  sub_10010D188(p_state, v6);
  sub_10010CEB4(p_state, a4);
}

- (void)writeFixed64NoTag:(unint64_t)a3
{
}

- (void)writeFixed64:(int)a3 value:(unint64_t)a4
{
  p_state = (uint64_t *)&self->state_;
  unsigned int v6 = sub_10013B0C8(a3, 1);
  sub_10010D188(p_state, v6);
  sub_10010CA90(p_state, a4);
}

- (void)writeFixed32NoTag:(unsigned int)a3
{
}

- (void)writeFixed32:(int)a3 value:(unsigned int)a4
{
  p_state = (uint64_t *)&self->state_;
  unsigned int v6 = sub_10013B0C8(a3, 5);
  sub_10010D188(p_state, v6);
  sub_10010CC60(p_state, a4);
}

- (void)writeBoolNoTag:(BOOL)a3
{
  unint64_t position = self->state_.position;
  if (position == self->state_.size)
  {
    sub_10010F4CC(&self->state_.bytes);
    unint64_t position = self->state_.position;
  }

  bytes = self->state_.bytes;
  self->state_.unint64_t position = position + 1;
  bytes[position] = a3;
}

- (void)writeBool:(int)a3 value:(BOOL)a4
{
  p_state = (uint64_t *)&self->state_;
  unsigned int v7 = sub_10013B0C8(a3, 0);
  sub_10010D188(p_state, v7);
  unint64_t position = self->state_.position;
  if (position == self->state_.size)
  {
    sub_10010F4CC(p_state);
    unint64_t position = self->state_.position;
  }

  bytes = self->state_.bytes;
  self->state_.unint64_t position = position + 1;
  bytes[position] = a4;
}

- (void)writeStringNoTag:(id)a3
{
  size_t v5 = (size_t)[a3 lengthOfBytesUsingEncoding:4];
  sub_10010D188((uint64_t *)&self->state_, v5);
  if (v5)
  {
    CStringPtr = CFStringGetCStringPtr((CFStringRef)a3, 0x8000100u);
    unint64_t position = self->state_.position;
    size_t v8 = self->state_.size - position;
    if (v8 >= v5)
    {
      size_t v10 = 0LL;
      objc_super v9 = &self->state_.bytes[position];
      if (CStringPtr)
      {
        memcpy(v9, CStringPtr, v5);
      }

      else
      {
        if (!objc_msgSend( a3,  "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:",  v9,  v8,  &v10,  4,  0,  0,  objc_msgSend(a3, "length"),  0)) {
          return;
        }
        size_t v5 = v10;
      }

      self->state_.position += v5;
    }

    else if (CStringPtr)
    {
      -[TransparencyGPBCodedOutputStream writeRawPtr:offset:length:](self, "writeRawPtr:offset:length:", CStringPtr);
    }

    else
    {
      -[TransparencyGPBCodedOutputStream writeRawData:]( self,  "writeRawData:",  [a3 dataUsingEncoding:4]);
    }
  }

- (void)writeString:(int)a3 value:(id)a4
{
  p_state = (uint64_t *)&self->state_;
  unsigned int v7 = sub_10013B0C8(a3, 2);
  sub_10010D188(p_state, v7);
  -[TransparencyGPBCodedOutputStream writeStringNoTag:](self, "writeStringNoTag:", a4);
}

- (void)writeGroupNoTag:(int)a3 value:(id)a4
{
  unsigned int v6 = sub_10013B0C8(a3, 4);
  sub_10010D188((uint64_t *)&self->state_, v6);
}

- (void)writeGroup:(int)a3 value:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  p_state = (uint64_t *)&self->state_;
  unsigned int v8 = sub_10013B0C8(a3, 3);
  sub_10010D188(p_state, v8);
  -[TransparencyGPBCodedOutputStream writeGroupNoTag:value:](self, "writeGroupNoTag:value:", v5, a4);
}

- (void)writeUnknownGroupNoTag:(int)a3 value:(id)a4
{
  unsigned int v6 = sub_10013B0C8(a3, 4);
  sub_10010D188((uint64_t *)&self->state_, v6);
}

- (void)writeUnknownGroup:(int)a3 value:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  p_state = (uint64_t *)&self->state_;
  unsigned int v8 = sub_10013B0C8(a3, 3);
  sub_10010D188(p_state, v8);
  -[TransparencyGPBCodedOutputStream writeUnknownGroupNoTag:value:](self, "writeUnknownGroupNoTag:value:", v5, a4);
}

- (void)writeMessageNoTag:(id)a3
{
}

- (void)writeMessage:(int)a3 value:(id)a4
{
  p_state = (uint64_t *)&self->state_;
  unsigned int v7 = sub_10013B0C8(a3, 2);
  sub_10010D188(p_state, v7);
  -[TransparencyGPBCodedOutputStream writeMessageNoTag:](self, "writeMessageNoTag:", a4);
}

- (void)writeBytesNoTag:(id)a3
{
}

- (void)writeBytes:(int)a3 value:(id)a4
{
  p_state = (uint64_t *)&self->state_;
  unsigned int v7 = sub_10013B0C8(a3, 2);
  sub_10010D188(p_state, v7);
  -[TransparencyGPBCodedOutputStream writeBytesNoTag:](self, "writeBytesNoTag:", a4);
}

- (void)writeUInt32NoTag:(unsigned int)a3
{
}

- (void)writeUInt32:(int)a3 value:(unsigned int)a4
{
}

- (void)writeEnumNoTag:(int)a3
{
}

- (void)writeEnum:(int)a3 value:(int)a4
{
  p_state = (uint64_t *)&self->state_;
  unsigned int v6 = sub_10013B0C8(a3, 0);
  sub_10010D188(p_state, v6);
  sub_10010CEB4(p_state, a4);
}

- (void)writeSFixed32NoTag:(int)a3
{
}

- (void)writeSFixed32:(int)a3 value:(int)a4
{
  p_state = (uint64_t *)&self->state_;
  unsigned int v6 = sub_10013B0C8(a3, 5);
  sub_10010D188(p_state, v6);
  sub_10010CC60(p_state, a4);
}

- (void)writeSFixed64NoTag:(int64_t)a3
{
}

- (void)writeSFixed64:(int)a3 value:(int64_t)a4
{
  p_state = (uint64_t *)&self->state_;
  unsigned int v6 = sub_10013B0C8(a3, 1);
  sub_10010D188(p_state, v6);
  sub_10010CA90(p_state, a4);
}

- (void)writeSInt32NoTag:(int)a3
{
}

- (void)writeSInt32:(int)a3 value:(int)a4
{
  p_state = (uint64_t *)&self->state_;
  unsigned int v6 = sub_10013B0C8(a3, 0);
  sub_10010D188(p_state, v6);
  sub_10010D188(p_state, (2 * a4) ^ (a4 >> 31));
}

- (void)writeSInt64NoTag:(int64_t)a3
{
}

- (void)writeSInt64:(int)a3 value:(int64_t)a4
{
  p_state = (uint64_t *)&self->state_;
  unsigned int v6 = sub_10013B0C8(a3, 0);
  sub_10010D188(p_state, v6);
  sub_10010CD80(p_state, (2 * a4) ^ (a4 >> 63));
}

- (void)writeDoubleArray:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0LL;
      v13 = &v12;
      uint64_t v14 = 0x2020000000LL;
      uint64_t v15 = 0LL;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_10010D80C;
      v11[3] = &unk_1002827D8;
      v11[4] = &v12;
      [a4 enumerateValuesWithBlock:v11];
      sub_10010D188((uint64_t *)&self->state_, a5);
      sub_10010D188((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_10010D82C;
      v10[3] = &unk_100282800;
      v10[4] = self;
      [a4 enumerateValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }

  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10010D834;
    v8[3] = &unk_100282828;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateValuesWithBlock:v8];
  }

- (void)writeFloatArray:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0LL;
      v13 = &v12;
      uint64_t v14 = 0x2020000000LL;
      uint64_t v15 = 0LL;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_10010D9A0;
      v11[3] = &unk_100282850;
      v11[4] = &v12;
      [a4 enumerateValuesWithBlock:v11];
      sub_10010D188((uint64_t *)&self->state_, a5);
      sub_10010D188((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_10010D9C0;
      v10[3] = &unk_100282878;
      v10[4] = self;
      [a4 enumerateValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }

  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10010D9C8;
    v8[3] = &unk_1002828A0;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateValuesWithBlock:v8];
  }

- (void)writeUInt64Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0LL;
      v13 = &v12;
      uint64_t v14 = 0x2020000000LL;
      uint64_t v15 = 0LL;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_10010DB34;
      v11[3] = &unk_1002828C8;
      v11[4] = &v12;
      [a4 enumerateValuesWithBlock:v11];
      sub_10010D188((uint64_t *)&self->state_, a5);
      sub_10010D188((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_10010DB70;
      v10[3] = &unk_1002828F0;
      v10[4] = self;
      [a4 enumerateValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }

  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10010DB7C;
    v8[3] = &unk_100282918;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateValuesWithBlock:v8];
  }

- (void)writeInt64Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0LL;
      v13 = &v12;
      uint64_t v14 = 0x2020000000LL;
      uint64_t v15 = 0LL;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_10010DCEC;
      v11[3] = &unk_100282940;
      v11[4] = &v12;
      [a4 enumerateValuesWithBlock:v11];
      sub_10010D188((uint64_t *)&self->state_, a5);
      sub_10010D188((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_10010DD24;
      v10[3] = &unk_100282968;
      v10[4] = self;
      [a4 enumerateValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }

  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10010DD30;
    v8[3] = &unk_100282990;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateValuesWithBlock:v8];
  }

- (void)writeInt32Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0LL;
      v13 = &v12;
      uint64_t v14 = 0x2020000000LL;
      uint64_t v15 = 0LL;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_10010DEA0;
      v11[3] = &unk_1002829B8;
      v11[4] = &v12;
      [a4 enumerateValuesWithBlock:v11];
      sub_10010D188((uint64_t *)&self->state_, a5);
      sub_10010D188((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_10010DF3C;
      v10[3] = &unk_1002829E0;
      v10[4] = self;
      [a4 enumerateValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }

  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10010DF48;
    v8[3] = &unk_100282A08;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateValuesWithBlock:v8];
  }

- (void)writeUInt32Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0LL;
      v13 = &v12;
      uint64_t v14 = 0x2020000000LL;
      uint64_t v15 = 0LL;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_10010E0B8;
      v11[3] = &unk_100282A30;
      v11[4] = &v12;
      [a4 enumerateValuesWithBlock:v11];
      sub_10010D188((uint64_t *)&self->state_, a5);
      sub_10010D188((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_10010E13C;
      v10[3] = &unk_100282A58;
      v10[4] = self;
      [a4 enumerateValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }

  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10010E148;
    v8[3] = &unk_100282A80;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateValuesWithBlock:v8];
  }

- (void)writeFixed64Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0LL;
      v13 = &v12;
      uint64_t v14 = 0x2020000000LL;
      uint64_t v15 = 0LL;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_10010E2B8;
      v11[3] = &unk_1002828C8;
      v11[4] = &v12;
      [a4 enumerateValuesWithBlock:v11];
      sub_10010D188((uint64_t *)&self->state_, a5);
      sub_10010D188((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_10010E2D0;
      v10[3] = &unk_1002828F0;
      v10[4] = self;
      [a4 enumerateValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }

  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10010E2DC;
    v8[3] = &unk_100282918;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateValuesWithBlock:v8];
  }

- (void)writeFixed32Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0LL;
      v13 = &v12;
      uint64_t v14 = 0x2020000000LL;
      uint64_t v15 = 0LL;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_10010E44C;
      v11[3] = &unk_100282A30;
      v11[4] = &v12;
      [a4 enumerateValuesWithBlock:v11];
      sub_10010D188((uint64_t *)&self->state_, a5);
      sub_10010D188((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_10010E464;
      v10[3] = &unk_100282A58;
      v10[4] = self;
      [a4 enumerateValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }

  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10010E470;
    v8[3] = &unk_100282A80;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateValuesWithBlock:v8];
  }

- (void)writeSInt32Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0LL;
      v13 = &v12;
      uint64_t v14 = 0x2020000000LL;
      uint64_t v15 = 0LL;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_10010E5E0;
      v11[3] = &unk_1002829B8;
      v11[4] = &v12;
      [a4 enumerateValuesWithBlock:v11];
      sub_10010D188((uint64_t *)&self->state_, a5);
      sub_10010D188((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_10010E674;
      v10[3] = &unk_1002829E0;
      v10[4] = self;
      [a4 enumerateValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }

  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10010E680;
    v8[3] = &unk_100282A08;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateValuesWithBlock:v8];
  }

- (void)writeSInt64Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0LL;
      v13 = &v12;
      uint64_t v14 = 0x2020000000LL;
      uint64_t v15 = 0LL;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_10010E7F0;
      v11[3] = &unk_100282940;
      v11[4] = &v12;
      [a4 enumerateValuesWithBlock:v11];
      sub_10010D188((uint64_t *)&self->state_, a5);
      sub_10010D188((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_10010E838;
      v10[3] = &unk_100282968;
      v10[4] = self;
      [a4 enumerateValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }

  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10010E844;
    v8[3] = &unk_100282990;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateValuesWithBlock:v8];
  }

- (void)writeSFixed64Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0LL;
      v13 = &v12;
      uint64_t v14 = 0x2020000000LL;
      uint64_t v15 = 0LL;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_10010E9B4;
      v11[3] = &unk_100282940;
      v11[4] = &v12;
      [a4 enumerateValuesWithBlock:v11];
      sub_10010D188((uint64_t *)&self->state_, a5);
      sub_10010D188((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_10010E9CC;
      v10[3] = &unk_100282968;
      v10[4] = self;
      [a4 enumerateValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }

  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10010E9D8;
    v8[3] = &unk_100282990;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateValuesWithBlock:v8];
  }

- (void)writeSFixed32Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0LL;
      v13 = &v12;
      uint64_t v14 = 0x2020000000LL;
      uint64_t v15 = 0LL;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_10010EB48;
      v11[3] = &unk_1002829B8;
      v11[4] = &v12;
      [a4 enumerateValuesWithBlock:v11];
      sub_10010D188((uint64_t *)&self->state_, a5);
      sub_10010D188((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_10010EB60;
      v10[3] = &unk_1002829E0;
      v10[4] = self;
      [a4 enumerateValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }

  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10010EB6C;
    v8[3] = &unk_100282A08;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateValuesWithBlock:v8];
  }

- (void)writeBoolArray:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0LL;
      v13 = &v12;
      uint64_t v14 = 0x2020000000LL;
      uint64_t v15 = 0LL;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_10010ECDC;
      v11[3] = &unk_100282AA8;
      v11[4] = &v12;
      [a4 enumerateValuesWithBlock:v11];
      sub_10010D188((uint64_t *)&self->state_, a5);
      sub_10010D188((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_10010ECF4;
      v10[3] = &unk_100282AD0;
      v10[4] = self;
      [a4 enumerateValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }

  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10010ED00;
    v8[3] = &unk_100282AF8;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateValuesWithBlock:v8];
  }

- (void)writeEnumArray:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  if (a5)
  {
    if (objc_msgSend(a4, "count", *(void *)&a3))
    {
      uint64_t v12 = 0LL;
      v13 = &v12;
      uint64_t v14 = 0x2020000000LL;
      uint64_t v15 = 0LL;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_10010EE70;
      v11[3] = &unk_1002829B8;
      v11[4] = &v12;
      [a4 enumerateRawValuesWithBlock:v11];
      sub_10010D188((uint64_t *)&self->state_, a5);
      sub_10010D188((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_10010EEC8;
      v10[3] = &unk_1002829E0;
      v10[4] = self;
      [a4 enumerateRawValuesWithBlock:v10];
      _Block_object_dispose(&v12, 8);
    }
  }

  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10010EED4;
    v8[3] = &unk_100282A08;
    v8[4] = self;
    int v9 = a3;
    [a4 enumerateRawValuesWithBlock:v8];
  }

- (void)writeStringArray:(int)a3 values:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      size_t v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(a4);
        }
        -[TransparencyGPBCodedOutputStream writeString:value:]( self,  "writeString:value:",  v5,  *(void *)(*((void *)&v11 + 1) + 8LL * (void)v10));
        size_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v8);
  }

- (void)writeMessageArray:(int)a3 values:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      size_t v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(a4);
        }
        -[TransparencyGPBCodedOutputStream writeMessage:value:]( self,  "writeMessage:value:",  v5,  *(void *)(*((void *)&v11 + 1) + 8LL * (void)v10));
        size_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v8);
  }

- (void)writeBytesArray:(int)a3 values:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      size_t v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(a4);
        }
        -[TransparencyGPBCodedOutputStream writeBytes:value:]( self,  "writeBytes:value:",  v5,  *(void *)(*((void *)&v11 + 1) + 8LL * (void)v10));
        size_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v8);
  }

- (void)writeGroupArray:(int)a3 values:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      size_t v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(a4);
        }
        -[TransparencyGPBCodedOutputStream writeGroup:value:]( self,  "writeGroup:value:",  v5,  *(void *)(*((void *)&v11 + 1) + 8LL * (void)v10));
        size_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v8);
  }

- (void)writeUnknownGroupArray:(int)a3 values:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      size_t v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(a4);
        }
        -[TransparencyGPBCodedOutputStream writeUnknownGroup:value:]( self,  "writeUnknownGroup:value:",  v5,  *(void *)(*((void *)&v11 + 1) + 8LL * (void)v10));
        size_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v8);
  }

- (void)writeMessageSetExtension:(int)a3 value:(id)a4
{
  p_state = (uint64_t *)&self->state_;
  unsigned int v8 = sub_10013B0C8(1, 3);
  sub_10010D188(p_state, v8);
  sub_10010D4E4(p_state, 2, a3);
  -[TransparencyGPBCodedOutputStream writeMessage:value:](self, "writeMessage:value:", 3LL, a4);
  unsigned int v9 = sub_10013B0C8(1, 4);
  sub_10010D188(p_state, v9);
}

- (void)writeRawMessageSetExtension:(int)a3 value:(id)a4
{
  p_state = (uint64_t *)&self->state_;
  unsigned int v8 = sub_10013B0C8(1, 3);
  sub_10010D188(p_state, v8);
  sub_10010D4E4(p_state, 2, a3);
  -[TransparencyGPBCodedOutputStream writeBytes:value:](self, "writeBytes:value:", 3LL, a4);
  unsigned int v9 = sub_10013B0C8(1, 4);
  sub_10010D188(p_state, v9);
}

- (void)flush
{
  if (self->state_.output) {
    sub_10010F4CC(&self->state_.bytes);
  }
}

- (void)writeRawByte:(unsigned __int8)a3
{
  unint64_t position = self->state_.position;
  if (position == self->state_.size)
  {
    sub_10010F4CC(&self->state_.bytes);
    unint64_t position = self->state_.position;
  }

  bytes = self->state_.bytes;
  self->state_.unint64_t position = position + 1;
  bytes[position] = a3;
}

- (void)writeRawData:(id)a3
{
}

- (void)writeRawPtr:(const void *)a3 offset:(unint64_t)a4 length:(unint64_t)a5
{
  if (a3 && a5)
  {
    unint64_t size = self->state_.size;
    p_state = &self->state_;
    unint64_t position = self->state_.position;
    unint64_t v12 = size - position;
    __int128 v13 = &self->state_.bytes[position];
    __int128 v14 = (char *)a3 + a4;
    uint64_t v15 = (void *)(a5 - (size - position));
    if (a5 <= size - position)
    {
      memcpy(v13, v14, a5);
      self->state_.position += a5;
    }

    else
    {
      memcpy(v13, v14, size - position);
      unint64_t v16 = v12 + a4;
      self->state_.unint64_t position = size;
      sub_10010F4CC(p_state);
      if ((unint64_t)v15 <= self->state_.size)
      {
        memcpy(self->state_.bytes, (char *)a3 + v16, (size_t)v15);
        self->state_.unint64_t position = (unint64_t)v15;
      }

      else if ((void *)-[NSOutputStream write:maxLength:]( self->state_.output,  "write:maxLength:",  (char *)a3 + v16,  v15) != v15)
      {
        +[NSException raise:format:](&OBJC_CLASS___NSException, "raise:format:", @"WriteFailed", &stru_10028E390);
      }
    }
  }

- (void)writeTag:(unsigned int)a3 format:(int)a4
{
  p_state = (uint64_t *)&self->state_;
  unsigned int v5 = sub_10013B0C8(a3, a4);
  sub_10010D188(p_state, v5);
}

- (void)writeRawVarint32:(int)a3
{
}

- (void)writeRawVarintSizeTAs32:(unint64_t)a3
{
}

- (void)writeRawVarint64:(int64_t)a3
{
}

- (void)writeRawLittleEndian32:(int)a3
{
}

- (void)writeRawLittleEndian64:(int64_t)a3
{
}

@end