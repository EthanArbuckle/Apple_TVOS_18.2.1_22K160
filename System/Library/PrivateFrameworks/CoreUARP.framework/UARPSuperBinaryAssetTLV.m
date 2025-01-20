@interface UARPSuperBinaryAssetTLV
+ (id)decomposeTLVs:(id)a3;
+ (id)findTLVWithType:(unint64_t)a3 tlvs:(id)a4;
+ (id)findTLVsWithType:(unint64_t)a3 tlvs:(id)a4;
- (NSArray)valueAsTLVs;
- (NSData)valueAsData;
- (NSNumber)valueAsNumber;
- (NSString)valueAsString;
- (NSURL)valueAsURL;
- (UARPAssetVersion)valueAsVersion;
- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 dataValue:(id)a4;
- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 stringValue:(id)a4;
- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 tagValue:(id)a4;
- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 tlvLength:(unint64_t)a4 tlvValue:(void *)a5;
- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 unsignedInt16:(unsigned __int16)a4;
- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 unsignedInt32:(unsigned int)a4;
- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 unsignedInt64:(unint64_t)a4;
- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 unsignedInt8:(unsigned __int8)a4;
- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 urlValue:(id)a4;
- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 version:(UARPVersion *)a4;
- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 versionInfo:(uarpPayloadVersionInfo *)a4;
- (id)description;
- (id)generateTLV:(id *)a3;
- (unint64_t)type;
@end

@implementation UARPSuperBinaryAssetTLV

- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 unsignedInt8:(unsigned __int8)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UARPSuperBinaryAssetTLV;
  result = -[UARPSuperBinaryAssetTLV init](&v7, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_val8 = a4;
    result->_valueType = 0;
  }

  return result;
}

- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 unsignedInt16:(unsigned __int16)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UARPSuperBinaryAssetTLV;
  result = -[UARPSuperBinaryAssetTLV init](&v7, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_val16 = a4;
    result->_valueType = 1;
  }

  return result;
}

- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 unsignedInt32:(unsigned int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UARPSuperBinaryAssetTLV;
  result = -[UARPSuperBinaryAssetTLV init](&v7, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_val32 = a4;
    result->_valueType = 2;
  }

  return result;
}

- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 unsignedInt64:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UARPSuperBinaryAssetTLV;
  result = -[UARPSuperBinaryAssetTLV init](&v7, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_val64 = a4;
    result->_valueType = 3;
  }

  return result;
}

- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 dataValue:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___UARPSuperBinaryAssetTLV;
  v8 = -[UARPSuperBinaryAssetTLV init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_data, a4);
    v9->_valueType = 4;
  }

  return v9;
}

- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 stringValue:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___UARPSuperBinaryAssetTLV;
  id v7 = -[UARPSuperBinaryAssetTLV init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    uint64_t v9 = [v6 copy];
    string = v8->_string;
    v8->_string = (NSString *)v9;

    v8->_valueType = 5;
  }

  return v8;
}

- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 tagValue:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___UARPSuperBinaryAssetTLV;
  id v7 = -[UARPSuperBinaryAssetTLV init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    uint64_t v9 = [v6 copy];
    string = v8->_string;
    v8->_string = (NSString *)v9;

    v8->_valueType = 7;
  }

  return v8;
}

- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 urlValue:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___UARPSuperBinaryAssetTLV;
  id v7 = -[UARPSuperBinaryAssetTLV init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    uint64_t v9 = [v6 copy];
    url = v8->_url;
    v8->_url = (NSURL *)v9;

    v8->_valueType = 6;
  }

  return v8;
}

- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 version:(UARPVersion *)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UARPSuperBinaryAssetTLV;
  result = -[UARPSuperBinaryAssetTLV init](&v7, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_version = *a4;
    result->_valueType = 8;
  }

  return result;
}

- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 versionInfo:(uarpPayloadVersionInfo *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___UARPSuperBinaryAssetTLV;
  result = -[UARPSuperBinaryAssetTLV init](&v9, sel_init);
  if (result)
  {
    result->_type = a3;
    __int128 v7 = *(_OWORD *)&a4->tag.char1;
    __int128 v8 = *(_OWORD *)&a4->activeVersion.build;
    result->_versionInfo.stagedVersion.build = a4->stagedVersion.build;
    *(_OWORD *)&result->_versionInfo.activeVersion.build = v8;
    *(_OWORD *)&result->_versionInfo.tag.char1 = v7;
    result->_valueType = 9;
  }

  return result;
}

- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 tlvLength:(unint64_t)a4 tlvValue:(void *)a5
{
  if (!a5) {
    goto LABEL_41;
  }
  if ((uint64_t)a3 <= 2293403905LL)
  {
    if ((uint64_t)a3 <= 1155952128)
    {
      if ((uint64_t)a3 <= 272691968)
      {
        switch(a3)
        {
          case 0x488E200uLL:
          case 0x488E203uLL:
            goto LABEL_19;
          case 0x488E201uLL:
          case 0x488E202uLL:
            goto LABEL_44;
          case 0x488E207uLL:
            goto LABEL_38;
          default:
            goto LABEL_50;
        }
      }

      if ((uint64_t)a3 > 538280448)
      {
        if (a3 != 538280449)
        {
          if (a3 != 1155952128)
          {
LABEL_50:
            [MEMORY[0x189603F48] dataWithBytes:a5 length:a4];
            objc_super v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_super v11 = -[UARPSuperBinaryAssetTLV initWithType:dataValue:]( objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetTLV),  "initWithType:dataValue:",  a3,  v12);
LABEL_48:

            goto LABEL_49;
          }

          unsigned int v15 = *(_DWORD *)a5;
          uarpVersionEndianSwap((unsigned int *)a5 + 1, v16);
          uarpVersionEndianSwap((unsigned int *)a5 + 5, v17);
          __int128 v8 = -[UARPSuperBinaryAssetTLV initWithType:versionInfo:]( objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetTLV),  "initWithType:versionInfo:",  1155952128LL,  &v15);
          goto LABEL_37;
        }

- (NSString)valueAsString
{
  if (self->_valueType == 5) {
    return self->_string;
  }
  else {
    return (NSString *)0LL;
  }
}

- (NSURL)valueAsURL
{
  if (self->_valueType == 6) {
    return self->_url;
  }
  else {
    return (NSURL *)0LL;
  }
}

- (NSNumber)valueAsNumber
{
  switch(self->_valueType)
  {
    case 0:
      [MEMORY[0x189607968] numberWithUnsignedChar:self->_val8];
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      [MEMORY[0x189607968] numberWithUnsignedShort:self->_val16];
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      [MEMORY[0x189607968] numberWithUnsignedInt:self->_val32];
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_val64];
      v2 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      result = v2;
      break;
    default:
      result = (NSNumber *)0LL;
      break;
  }

  return result;
}

- (NSData)valueAsData
{
  if (self->_valueType == 4) {
    return self->_data;
  }
  else {
    return (NSData *)0LL;
  }
}

- (UARPAssetVersion)valueAsVersion
{
  if (self->_valueType == 8) {
    v2 = -[UARPAssetVersion initWithMajorVersion:minorVersion:releaseVersion:buildVersion:]( objc_alloc(&OBJC_CLASS___UARPAssetVersion),  "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:",  self->_version.major,  self->_version.minor,  self->_version.release,  self->_version.build);
  }
  else {
    v2 = 0LL;
  }
  return v2;
}

- (NSArray)valueAsTLVs
{
  if (self->_valueType == 4)
  {
    v2 = +[UARPSuperBinaryAssetTLV decomposeTLVs:](&OBJC_CLASS___UARPSuperBinaryAssetTLV, "decomposeTLVs:", self->_data);
    [MEMORY[0x189603F18] arrayWithArray:v2];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v3 = 0LL;
  }

  return (NSArray *)v3;
}

- (id)generateTLV:(id *)a3
{
  int v17 = uarpHtonl(self->_type);
  switch(self->_valueType)
  {
    case 0:
      int v18 = uarpHtonl(1u);
      id v4 = objc_alloc_init(MEMORY[0x189603FB8]);
      [v4 appendBytes:&v17 length:8];
      p_val8 = &self->_val8;
      id v6 = v4;
      NSUInteger v7 = 1LL;
      goto LABEL_15;
    case 1:
      int v18 = uarpHtonl(2u);
      id v4 = objc_alloc_init(MEMORY[0x189603FB8]);
      [v4 appendBytes:&v17 length:8];
      LOWORD(v15[0]) = uarpHtons(self->_val16);
      p_val8 = (unsigned __int8 *)v15;
      id v6 = v4;
      NSUInteger v7 = 2LL;
      goto LABEL_15;
    case 2:
      int v18 = uarpHtonl(4u);
      id v4 = objc_alloc_init(MEMORY[0x189603FB8]);
      [v4 appendBytes:&v17 length:8];
      LODWORD(v15[0]) = uarpHtonl(self->_val32);
      goto LABEL_12;
    case 3:
      int v18 = uarpHtonl(8u);
      id v4 = objc_alloc_init(MEMORY[0x189603FB8]);
      [v4 appendBytes:&v17 length:8];
      v15[0] = uarpHtonll(self->_val64);
      p_val8 = (unsigned __int8 *)v15;
      id v6 = v4;
      NSUInteger v7 = 8LL;
      goto LABEL_15;
    case 4:
      int v18 = uarpHtonl(-[NSData length](self->_data, "length"));
      id v8 = objc_alloc_init(MEMORY[0x189603FB8]);
      [v8 appendBytes:&v17 length:8];
      [v8 appendData:self->_data];
      return v8;
    case 5:
      int v18 = uarpHtonl(-[NSString length](self->_string, "length"));
      id v4 = objc_alloc_init(MEMORY[0x189603FB8]);
      [v4 appendBytes:&v17 length:8];
      uint64_t v10 = -[NSString UTF8String](self->_string, "UTF8String");
      NSUInteger v7 = -[NSString length](self->_string, "length");
      id v6 = v4;
      p_val8 = (unsigned __int8 *)v10;
      goto LABEL_15;
    case 6:
      [MEMORY[0x189603F48] dataWithContentsOfURL:self->_url options:1 error:0];
      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
      int v18 = uarpHtonl([v11 length]);
      id v12 = objc_alloc_init(MEMORY[0x189603FB8]);
      [v12 appendBytes:&v17 length:8];
      id v13 = v11;
      objc_msgSend(v12, "appendBytes:length:", objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"));

      return v12;
    case 7:
      v14 = -[NSString UTF8String](self->_string, "UTF8String");
      if (-[NSString length](self->_string, "length") != 4) {
        goto LABEL_13;
      }
      LODWORD(v15[0]) = uarpPayloadTagPack((unsigned int *)v14);
      int v18 = uarpHtonl(4u);
      id v4 = objc_alloc_init(MEMORY[0x189603FB8]);
      objc_msgSend(v4, "appendBytes:length:", &v17, 8, v15[0]);
LABEL_12:
      p_val8 = (unsigned __int8 *)v15;
      id v6 = v4;
      NSUInteger v7 = 4LL;
LABEL_15:
      objc_msgSend(v6, "appendBytes:length:", p_val8, v7, v15[0]);
      id result = v4;
      break;
    case 8:
      int v18 = uarpHtonl(0x10u);
      id v4 = objc_alloc_init(MEMORY[0x189603FB8]);
      [v4 appendBytes:&v17 length:8];
      uarpVersionEndianSwap(&self->_version.major, v15);
      p_val8 = (unsigned __int8 *)v15;
      id v6 = v4;
      NSUInteger v7 = 16LL;
      goto LABEL_15;
    case 9:
      int v18 = uarpHtonl(0x24u);
      id v4 = objc_alloc_init(MEMORY[0x189603FB8]);
      [v4 appendBytes:&v17 length:8];
      LODWORD(v15[0]) = self->_versionInfo.tag;
      uarpVersionEndianSwap(&self->_versionInfo.activeVersion.major, (_DWORD *)v15 + 1);
      uarpVersionEndianSwap(&self->_versionInfo.stagedVersion.major, v16);
      p_val8 = (unsigned __int8 *)v15;
      id v6 = v4;
      NSUInteger v7 = 36LL;
      goto LABEL_15;
    default:
LABEL_13:
      id result = 0LL;
      break;
  }

  return result;
}

+ (id)decomposeTLVs:(id)a3
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  id v4 = (void *)objc_opt_new();
  if ([v3 length])
  {
    unint64_t v6 = 0LL;
    NSUInteger v7 = (os_log_s *)MEMORY[0x1895F8DA0];
    *(void *)&__int128 v5 = 67109634LL;
    __int128 v18 = v5;
    while (1)
    {
      objc_msgSend(v3, "getBytes:range:", &v20, v6, 8, v18);
      unsigned int v20 = uarpHtonl(v20);
      unsigned int v8 = uarpHtonl(v21);
      unsigned int v21 = v8;
      if (!(v20 | v8)) {
        break;
      }
      unint64_t v9 = v6 + 8;
      uint64_t v10 = v8;
      objc_msgSend(v3, "subdataWithRange:", v9, v8);
      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
      id v12 = objc_alloc(&OBJC_CLASS___UARPSuperBinaryAssetTLV);
      uint64_t v13 = v20;
      uint64_t v14 = v21;
      id v15 = v11;
      v16 = -[UARPSuperBinaryAssetTLV initWithType:tlvLength:tlvValue:]( v12,  "initWithType:tlvLength:tlvValue:",  v13,  v14,  [v15 bytes]);
      if (v16)
      {
        [v4 addObject:v16];
      }

      else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v18;
        unsigned int v23 = v20;
        __int16 v24 = 1024;
        unsigned int v25 = v21;
        __int16 v26 = 2112;
        id v27 = a1;
        _os_log_error_impl( &dword_187DC0000,  v7,  OS_LOG_TYPE_ERROR,  "attempting to add a nil tlv (T=0x%08x, L=%u) to superbinary %@",  buf,  0x18u);
      }

      unint64_t v6 = v9 + v10;

      if (v6 >= [v3 length]) {
        goto LABEL_12;
      }
    }

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      +[UARPSuperBinaryAssetTLV decomposeTLVs:].cold.1();
    }
  }

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x189607940]);
  [v3 appendFormat:@"TLV - "];
  objc_msgSend(v3, "appendFormat:", @"Type = 0x%08x", self->_type);
  objc_msgSend(v3, "appendFormat:", @", ");
  switch(self->_valueType)
  {
    case 0:
      objc_msgSend(v3, "appendFormat:", @"Length = %lu", 1);
      objc_msgSend(v3, "appendFormat:", @", ");
      objc_msgSend(v3, "appendFormat:", @"Value = %hhu", self->_val8, v8, v9, v10);
      return v3;
    case 1:
      objc_msgSend(v3, "appendFormat:", @"Length = %lu", 2);
      objc_msgSend(v3, "appendFormat:", @", ");
      objc_msgSend(v3, "appendFormat:", @"Value = %hu", self->_val16, v8, v9, v10);
      return v3;
    case 2:
      objc_msgSend(v3, "appendFormat:", @"Length = %lu", 4);
      objc_msgSend(v3, "appendFormat:", @", ");
      objc_msgSend(v3, "appendFormat:", @"Value = %u", self->_val32, v8, v9, v10);
      return v3;
    case 3:
      objc_msgSend(v3, "appendFormat:", @"Length = %lu", 8);
      objc_msgSend(v3, "appendFormat:", @", ");
      objc_msgSend(v3, "appendFormat:", @"Value = %llu", self->_val64, v8, v9, v10);
      return v3;
    case 4:
      objc_msgSend(v3, "appendFormat:", @"Length = %lu", -[NSData length](self->_data, "length"));
      objc_msgSend(v3, "appendFormat:", @", ");
      data = self->_data;
      goto LABEL_11;
    case 5:
      objc_msgSend(v3, "appendFormat:", @"Length = %lu", -[NSString length](self->_string, "length"));
      goto LABEL_10;
    case 6:
      [MEMORY[0x189603F48] dataWithContentsOfURL:self->_url options:1 error:0];
      __int128 v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", @"Length = %lu", objc_msgSend(v5, "length"));
      objc_msgSend(v3, "appendFormat:", @", ");
      [v3 appendFormat:@"Value = %@", self->_url];

      return v3;
    case 7:
      objc_msgSend(v3, "appendFormat:", @"Length = 4", v7);
LABEL_10:
      objc_msgSend(v3, "appendFormat:", @", ");
      data = (NSData *)self->_string;
LABEL_11:
      [v3 appendFormat:@"Value = %@", data, v8, v9, v10];
      break;
    case 8:
      objc_msgSend(v3, "appendFormat:", @"Length = %lu", 16);
      objc_msgSend(v3, "appendFormat:", @", ");
      objc_msgSend( v3,  "appendFormat:",  @"Value = %d.%d.%d.%d",  self->_version.major,  self->_version.minor,  self->_version.release,  self->_version.build);
      break;
    case 9:
      objc_msgSend(v3, "appendFormat:", @"Length = %lu", 36);
      objc_msgSend(v3, "appendFormat:", @", ");
      objc_msgSend( v3,  "appendFormat:",  @"Payload Tag = %c%c%c%c, ",  self->_versionInfo.tag.char1,  self->_versionInfo.tag.char2,  self->_versionInfo.tag.char3,  self->_versionInfo.tag.char4);
      objc_msgSend( v3,  "appendFormat:",  @"Active Firmware Version = %d.%d.%d.%d, ",  self->_versionInfo.activeVersion.major,  self->_versionInfo.activeVersion.minor,  self->_versionInfo.activeVersion.release,  self->_versionInfo.activeVersion.build);
      objc_msgSend( v3,  "appendFormat:",  @"Staged Firmware Version = %d.%d.%d.%d,",  self->_versionInfo.stagedVersion.major,  self->_versionInfo.stagedVersion.minor,  self->_versionInfo.stagedVersion.release,  self->_versionInfo.stagedVersion.build);
      break;
    default:
      return v3;
  }

  return v3;
}

+ (id)findTLVWithType:(unint64_t)a3 tlvs:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 firstObject];
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)findTLVsWithType:(unint64_t)a3 tlvs:(id)a4
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "type", (void)v15) == a3) {
          [v6 addObject:v12];
        }
      }

      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v9);
  }

  [MEMORY[0x189603F18] arrayWithArray:v6];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

+ (void)decomposeTLVs:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl( &dword_187DC0000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "TLV type and length both equal to zero",  v0,  2u);
}

@end