@interface TmapFieldTLV
+ (BOOL)supportsSecureCoding;
- (BOOL)createFieldType:(id)a3;
- (BOOL)expandEncodedString:(id)a3 inCoreAnalytics:(id)a4;
- (BOOL)expandFieldData:(id)a3 inCoreAnalytics:(id)a4;
- (BOOL)expandFieldData:(id)a3 withOffset:(unint64_t)a4 inCoreAnalytics:(id)a5;
- (BOOL)expandFloat:(id)a3 inCoreAnalytics:(id)a4;
- (BOOL)expandInteger:(id)a3 inCoreAnalytics:(id)a4;
- (BOOL)expandString:(id)a3 inCoreAnalytics:(id)a4;
- (BOOL)expandUnsignedInteger:(id)a3 inCoreAnalytics:(id)a4;
- (BOOL)getNextOffset:(unint64_t *)a3 fromStart:(unint64_t)a4;
- (TmapFieldTLV)init;
- (TmapFieldTLV)initWithCoder:(id)a3;
- (TmapFieldTLV)initWithDictionary:(id)a3 endian:(id)a4;
- (id)bigEndianSwap:(id)a3;
- (id)endianSwap:(id)a3;
- (id)littleEndianSwap:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TmapFieldTLV

- (TmapFieldTLV)init
{
  return 0LL;
}

- (TmapFieldTLV)initWithDictionary:(id)a3 endian:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___TmapFieldTLV;
  v8 = -[TmapFieldTLV init](&v19, sel_init);
  if (!v8) {
    goto LABEL_8;
  }
  os_log_t v9 = os_log_create("com.apple.accessoryupdater.uarp", "tmap");
  log = v8->_log;
  v8->_log = v9;

  [v6 objectForKeyedSubscript:@"FieldName"];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 copy];
  fieldName = v8->_fieldName;
  v8->_fieldName = (NSString *)v12;

  if (!v8->_fieldName)
  {
    if (os_log_type_enabled(v8->_log, OS_LOG_TYPE_ERROR)) {
      -[TmapFieldTLV initWithDictionary:endian:].cold.1();
    }
    goto LABEL_19;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(v8->_log, OS_LOG_TYPE_ERROR)) {
      -[TmapFieldTLV initWithDictionary:endian:].cold.4();
    }
    goto LABEL_19;
  }

  [v6 objectForKeyedSubscript:@"FieldLength"];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    if (os_log_type_enabled(v8->_log, OS_LOG_TYPE_ERROR)) {
      -[TmapFieldTLV initWithDictionary:endian:].cold.2();
    }
    goto LABEL_18;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(v8->_log, OS_LOG_TYPE_ERROR)) {
      -[TmapFieldTLV initWithDictionary:endian:].cold.3();
    }
    goto LABEL_18;
  }

  v8->_fieldLength = [v14 unsignedIntValue];
  [v6 objectForKeyedSubscript:@"FieldType"];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)[v15 copy];

  if (!-[TmapFieldTLV createFieldType:](v8, "createFieldType:", v16))
  {

LABEL_18:
LABEL_19:
    v17 = 0LL;
    goto LABEL_20;
  }

  v8->_endian = [v7 isEqualToString:@"LittleEndian"];

LABEL_8:
  v17 = v8;
LABEL_20:

  return v17;
}

- (BOOL)createFieldType:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"Integer"])
  {
    self->_fieldType = 0;
LABEL_12:
    BOOL v5 = 1;
    goto LABEL_13;
  }

  if ([v4 isEqualToString:@"UnsignedInteger"])
  {
    BOOL v5 = 1;
    self->_fieldType = 1;
    goto LABEL_13;
  }

  if ([v4 isEqualToString:@"UTF8String"])
  {
    int v6 = 2;
LABEL_11:
    self->_fieldType = v6;
    goto LABEL_12;
  }

  if ([v4 isEqualToString:@"Base64EncodedString"])
  {
    int v6 = 3;
    goto LABEL_11;
  }

  if ([v4 isEqualToString:@"Float"])
  {
    int v6 = 4;
    goto LABEL_11;
  }

  if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
    -[TmapFieldTLV createFieldType:].cold.1();
  }
  BOOL v5 = 0;
LABEL_13:

  return v5;
}

- (TmapFieldTLV)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TmapFieldTLV;
  BOOL v5 = -[TmapFieldTLV init](&v11, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FieldName"];
    fieldName = v5->_fieldName;
    v5->_fieldName = (NSString *)v6;

    v5->_fieldLength = [v4 decodeIntegerForKey:@"FieldLength"];
    v5->_fieldType = [v4 decodeIntegerForKey:@"FieldType"];
    v5->_endian = [v4 decodeIntegerForKey:@"Endian"];
    os_log_t v8 = os_log_create("com.apple.accessoryupdater.uarp", "tmap");
    log = v5->_log;
    v5->_log = v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  fieldName = self->_fieldName;
  id v5 = a3;
  [v5 encodeObject:fieldName forKey:@"FieldName"];
  [v5 encodeInteger:self->_fieldLength forKey:@"FieldLength"];
  [v5 encodeInteger:self->_fieldType forKey:@"FieldType"];
  [v5 encodeInteger:self->_endian forKey:@"Endian"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)expandFieldData:(id)a3 withOffset:(unint64_t)a4 inCoreAnalytics:(id)a5
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a5;
  unint64_t fieldLength = self->_fieldLength;
  if (__CFADD__(a4, fieldLength))
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      -[TmapFieldTLV expandFieldData:withOffset:inCoreAnalytics:].cold.1();
    }
    goto LABEL_15;
  }

  if (fieldLength + a4 > [v8 length])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = log;
      uint64_t v13 = [v8 length];
      unint64_t v14 = self->_fieldLength + a4;
      int v18 = 134218240;
      uint64_t v19 = v13;
      __int16 v20 = 2048;
      unint64_t v21 = v14;
      _os_log_error_impl( &dword_187DC0000,  v12,  OS_LOG_TYPE_ERROR,  "Length of MTIC Data(%lu) and Expected TMAP Data(%lu) do not match ",  (uint8_t *)&v18,  0x16u);
    }

- (BOOL)expandFieldData:(id)a3 inCoreAnalytics:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int fieldType = self->_fieldType;
  if (fieldType == 3)
  {
    BOOL v9 = -[TmapFieldTLV expandEncodedString:inCoreAnalytics:](self, "expandEncodedString:inCoreAnalytics:", v6, v7);
    goto LABEL_5;
  }

  if (fieldType == 2)
  {
    BOOL v9 = -[TmapFieldTLV expandString:inCoreAnalytics:](self, "expandString:inCoreAnalytics:", v6, v7);
LABEL_5:
    BOOL v10 = v9;
    goto LABEL_18;
  }

  -[TmapFieldTLV endianSwap:](self, "endianSwap:", v6);
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = v11;
  if (!v11)
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      -[TmapFieldTLV expandFieldData:inCoreAnalytics:].cold.1();
    }
    BOOL v10 = 0;
    goto LABEL_17;
  }

  int v13 = self->_fieldType;
  switch(v13)
  {
    case 4:
      BOOL v14 = -[TmapFieldTLV expandFloat:inCoreAnalytics:](self, "expandFloat:inCoreAnalytics:", v11, v7);
      goto LABEL_16;
    case 1:
      BOOL v14 = -[TmapFieldTLV expandUnsignedInteger:inCoreAnalytics:]( self,  "expandUnsignedInteger:inCoreAnalytics:",  v11,  v7);
      goto LABEL_16;
    case 0:
      BOOL v14 = -[TmapFieldTLV expandInteger:inCoreAnalytics:](self, "expandInteger:inCoreAnalytics:", v11, v7);
LABEL_16:
      BOOL v10 = v14;
LABEL_17:

      goto LABEL_18;
  }

  if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
    -[TmapFieldTLV expandFieldData:inCoreAnalytics:].cold.2();
  }
  BOOL v10 = 0;
LABEL_18:

  return v10;
}

- (BOOL)getNextOffset:(unint64_t *)a3 fromStart:(unint64_t)a4
{
  unint64_t fieldLength = self->_fieldLength;
  BOOL v5 = __CFADD__(a4, fieldLength);
  if (!__CFADD__(a4, fieldLength)) {
    *a3 = fieldLength + a4;
  }
  return !v5;
}

- (id)endianSwap:(id)a3
{
  if (self->_endian == 1) {
    -[TmapFieldTLV littleEndianSwap:](self, "littleEndianSwap:", a3);
  }
  else {
    -[TmapFieldTLV bigEndianSwap:](self, "bigEndianSwap:", a3);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)bigEndianSwap:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  switch(self->_fieldLength)
  {
    case 1uLL:
      uint64_t v6 = [objc_alloc(MEMORY[0x189603F48]) initWithData:v4];
      goto LABEL_10;
    case 2uLL:
      [v4 getBytes:&v12 length:2];
      LOWORD(v11) = bswap32((unsigned __int16)v12) >> 16;
      id v7 = objc_alloc(MEMORY[0x189603F48]);
      uint64_t v8 = 2LL;
      goto LABEL_9;
    case 4uLL:
      [v4 getBytes:&v12 length:4];
      LODWORD(v11) = bswap32(v12);
      id v7 = objc_alloc(MEMORY[0x189603F48]);
      uint64_t v8 = 4LL;
      goto LABEL_9;
    case 8uLL:
      [v4 getBytes:&v12 length:8];
      unint64_t v11 = bswap64(v12);
      id v7 = objc_alloc(MEMORY[0x189603F48]);
      uint64_t v8 = 8LL;
LABEL_9:
      uint64_t v6 = objc_msgSend(v7, "initWithBytes:length:", &v11, v8, v11);
LABEL_10:
      BOOL v9 = (void *)v6;
      break;
    default:
      if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
        -[TmapFieldTLV bigEndianSwap:].cold.1();
      }
      BOOL v9 = 0LL;
      break;
  }

  return v9;
}

- (id)littleEndianSwap:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  switch(self->_fieldLength)
  {
    case 1uLL:
      uint64_t v6 = [objc_alloc(MEMORY[0x189603F48]) initWithData:v4];
      goto LABEL_10;
    case 2uLL:
      [v4 getBytes:&v10 length:2];
      LOWORD(v9) = v10;
      goto LABEL_9;
    case 4uLL:
      [v4 getBytes:&v10 length:4];
      LODWORD(v9) = v10;
      goto LABEL_9;
    case 8uLL:
      [v4 getBytes:&v10 length:8];
      uint64_t v9 = v10;
LABEL_9:
      uint64_t v6 = [objc_alloc(MEMORY[0x189603F48]) initWithBytes:&v9 length:self->_fieldLength];
LABEL_10:
      id v7 = (void *)v6;
      break;
    default:
      if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
        -[TmapFieldTLV bigEndianSwap:].cold.1();
      }
      id v7 = 0LL;
      break;
  }

  return v7;
}

- (BOOL)expandInteger:(id)a3 inCoreAnalytics:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_unint64_t fieldLength = &self->_fieldLength;
  switch(self->_fieldLength)
  {
    case 1uLL:
      BOOL v9 = 1;
      [v6 getBytes:&v24 length:1];
      [MEMORY[0x189607968] numberWithChar:v24];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setObject:v10 forKeyedSubscript:self->_fieldName];

      break;
    case 2uLL:
      [v6 getBytes:&v23 length:2];
      uint64_t v11 = [MEMORY[0x189607968] numberWithShort:v23];
      goto LABEL_9;
    case 4uLL:
      [v6 getBytes:&v22 length:4];
      uint64_t v11 = [MEMORY[0x189607968] numberWithInt:v22];
      goto LABEL_9;
    case 8uLL:
      [v6 getBytes:&v21 length:8];
      uint64_t v11 = [MEMORY[0x189607968] numberWithLongLong:v21];
LABEL_9:
      uint64_t v19 = (void *)v11;
      [v7 setObject:v11 forKeyedSubscript:self->_fieldName];

      BOOL v9 = 1;
      break;
    default:
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
        -[TmapFieldTLV expandInteger:inCoreAnalytics:].cold.1((uint64_t)p_fieldLength, log, v13, v14, v15, v16, v17, v18);
      }
      BOOL v9 = 0;
      break;
  }

  return v9;
}

- (BOOL)expandUnsignedInteger:(id)a3 inCoreAnalytics:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_unint64_t fieldLength = &self->_fieldLength;
  switch(self->_fieldLength)
  {
    case 1uLL:
      BOOL v9 = 1;
      [v6 getBytes:&v24 length:1];
      [MEMORY[0x189607968] numberWithUnsignedChar:v24];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setObject:v10 forKeyedSubscript:self->_fieldName];

      break;
    case 2uLL:
      [v6 getBytes:&v23 length:2];
      uint64_t v11 = [MEMORY[0x189607968] numberWithUnsignedShort:v23];
      goto LABEL_9;
    case 4uLL:
      [v6 getBytes:&v22 length:4];
      uint64_t v11 = [MEMORY[0x189607968] numberWithUnsignedInt:v22];
      goto LABEL_9;
    case 8uLL:
      [v6 getBytes:&v21 length:8];
      uint64_t v11 = [MEMORY[0x189607968] numberWithUnsignedLongLong:v21];
LABEL_9:
      uint64_t v19 = (void *)v11;
      [v7 setObject:v11 forKeyedSubscript:self->_fieldName];

      BOOL v9 = 1;
      break;
    default:
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
        -[TmapFieldTLV expandUnsignedInteger:inCoreAnalytics:].cold.1( (uint64_t)p_fieldLength,  log,  v13,  v14,  v15,  v16,  v17,  v18);
      }
      BOOL v9 = 0;
      break;
  }

  return v9;
}

- (BOOL)expandFloat:(id)a3 inCoreAnalytics:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t fieldLength = self->_fieldLength;
  if (fieldLength == 8)
  {
    [v6 getBytes:&v14 length:8];
    uint64_t v10 = [MEMORY[0x189607968] numberWithDouble:v14];
    goto LABEL_5;
  }

  if (fieldLength == 4)
  {
    [v6 getBytes:&v15 length:4];
    LODWORD(v9) = v15;
    uint64_t v10 = [MEMORY[0x189607968] numberWithFloat:v9];
LABEL_5:
    uint64_t v11 = (void *)v10;
    [v7 setObject:v10 forKeyedSubscript:self->_fieldName];

    BOOL v12 = 1;
    goto LABEL_9;
  }

  if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
    -[TmapFieldTLV expandFloat:inCoreAnalytics:].cold.1();
  }
  BOOL v12 = 0;
LABEL_9:

  return v12;
}

- (BOOL)expandString:(id)a3 inCoreAnalytics:(id)a4
{
  id v6 = a4;
  id v7 = (objc_class *)NSString;
  id v8 = a3;
  double v9 = (void *)[[v7 alloc] initWithData:v8 encoding:4];

  uint64_t v10 = (void *)NSString;
  id v11 = v9;
  objc_msgSend(v10, "stringWithUTF8String:", objc_msgSend(v11, "UTF8String"));
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    [v6 setObject:v12 forKeyedSubscript:self->_fieldName];
  }

  else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
  {
    -[TmapFieldTLV expandString:inCoreAnalytics:].cold.1();
  }

  return v12 != 0LL;
}

- (BOOL)expandEncodedString:(id)a3 inCoreAnalytics:(id)a4
{
  id v6 = a4;
  [a3 base64EncodedStringWithOptions:0];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    [v6 setObject:v7 forKeyedSubscript:self->_fieldName];
  }

  else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
  {
    -[TmapFieldTLV expandEncodedString:inCoreAnalytics:].cold.1();
  }

  return v7 != 0LL;
}

- (void).cxx_destruct
{
}

- (void)initWithDictionary:endian:.cold.1()
{
}

- (void)initWithDictionary:endian:.cold.2()
{
}

- (void)initWithDictionary:endian:.cold.3()
{
}

- (void)initWithDictionary:endian:.cold.4()
{
}

- (void)createFieldType:.cold.1()
{
}

- (void)expandFieldData:withOffset:inCoreAnalytics:.cold.1()
{
}

- (void)expandFieldData:withOffset:inCoreAnalytics:.cold.2()
{
}

- (void)expandFieldData:withOffset:inCoreAnalytics:.cold.3()
{
}

- (void)expandFieldData:inCoreAnalytics:.cold.1()
{
}

- (void)expandFieldData:inCoreAnalytics:.cold.2()
{
}

- (void)bigEndianSwap:.cold.1()
{
}

- (void)expandInteger:(uint64_t)a3 inCoreAnalytics:(uint64_t)a4 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)expandUnsignedInteger:(uint64_t)a3 inCoreAnalytics:(uint64_t)a4 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    0);
}

- (void)expandFloat:inCoreAnalytics:.cold.1()
{
}

- (void)expandString:inCoreAnalytics:.cold.1()
{
}

- (void)expandEncodedString:inCoreAnalytics:.cold.1()
{
}

@end