@interface VMUFieldInfo
- (BOOL)isArrayEntries;
- (BOOL)isArraySize;
- (BOOL)isByref;
- (BOOL)isCapture;
- (BOOL)isEqual:(id)a3;
- (BOOL)isKeyField;
- (BOOL)isKeysPointer;
- (BOOL)isStorageBitmapPointer;
- (BOOL)isStorageImplPointer;
- (BOOL)isValueField;
- (BOOL)isValuesPointer;
- (BOOL)typeNameMayDescribeReferencedAllocation;
- (NSArray)possibleEnumPayloadFieldArray;
- (NSArray)subFieldArray;
- (NSString)ivarName;
- (NSString)typeName;
- (NSString)typedDescription;
- (VMUClassInfo)destinationLayout;
- (VMUFieldInfo)initWithName:(id)a3 type:(id)a4 kind:(unsigned int)a5 scan:(unsigned int)a6 offset:(unsigned int)a7 size:(unsigned int)a8 stride:(unsigned int)a9 subFieldArray:(id)a10 swiftTyperef:(void *)a11;
- (VMUFieldInfo)initWithName:(id)a3 type:(id)a4 scan:(unsigned int)a5 offset:(unsigned int)a6 size:(unsigned int)a7;
- (VMUFieldInfo)initWithObjcIvar:(objc_ivar *)a3 size:(unsigned int)a4 offset:(unsigned int)a5 ivarName:(const char *)a6 isARC:(BOOL)a7 is64Bit:(BOOL)a8;
- (VMUFieldInfo)initWithSerializer:(id)a3 classMap:(id)a4 version:(unsigned int)a5 error:(id *)a6;
- (VMUFieldInfo)initWithSerializer:(id)a3 classMap:(id)a4 version:(unsigned int)a5 returnedDestinationLayoutClassInfoIndex:(unsigned int *)a6 error:(id *)a7;
- (id)_fullIvarNameAtOffset:(unsigned int)a3 leafOffset:(unsigned int *)a4 depth:(unsigned int)a5;
- (id)description;
- (id)descriptionOfFieldValueInObjectMemory:(void *)a3 scanner:(id)a4;
- (id)fullIvarNameAtOffset:(unsigned int)a3;
- (id)getLeafFieldAtOffset:(unsigned int)a3 leafOffset:(unsigned int *)a4;
- (id)initStorageEntryFieldWithName:(id)a3 type:(id)a4 kind:(unsigned int)a5 scan:(unsigned int)a6 offset:(unsigned int)a7 size:(unsigned int)a8 stride:(unsigned int)a9 subFieldArray:(id)a10;
- (id)initStorageInfoFieldWithName:(id)a3 type:(id)a4 kind:(unsigned int)a5 scan:(unsigned int)a6 offset:(unsigned int)a7 size:(unsigned int)a8 stride:(unsigned int)a9 subFieldArray:(id)a10;
- (id)initSwiftEnumPayloadFieldWithName:(id)a3 type:(id)a4 kind:(unsigned int)a5 scan:(unsigned int)a6 offset:(unsigned int)a7 size:(unsigned int)a8 stride:(unsigned int)a9 possibleEnumSubFieldArray:(id)a10 swiftTyperef:(void *)a11;
- (id)mutableCopy;
- (unint64_t)hash;
- (unsigned)bitfieldWidth;
- (unsigned)flags;
- (unsigned)kind;
- (unsigned)offset;
- (unsigned)scanType;
- (unsigned)scannableSize;
- (unsigned)size;
- (unsigned)stride;
- (void)_setFlags:(unsigned int)a3;
- (void)_setIvarName:(id)a3;
- (void)_setKind:(unsigned int)a3;
- (void)_setOffset:(unsigned int)a3;
- (void)_setScanType:(unsigned int)a3;
- (void)_setScannableSize:(unsigned int)a3;
- (void)_setSize:(unsigned int)a3;
- (void)_setStride:(unsigned int)a3;
- (void)dealloc;
- (void)enumerateSublayoutsForSize:(int)a3 parentOffset:(unsigned int)a4 remotePointerSize:(uint64_t)a5 withBlock:;
- (void)initializeSubFieldArray;
- (void)serializeWithClassMap:(id)a3 simpleSerializer:(id)a4 version:(unsigned int)a5;
- (void)setDestinationLayout:(id)a3;
- (void)setTypeName:(id)a3;
- (void)swiftTyperef;
@end

@implementation VMUFieldInfo

- (NSArray)subFieldArray
{
  return (NSArray *)self->_subFieldArray;
}

- (NSArray)possibleEnumPayloadFieldArray
{
  return self->_possibleEnumPayloadFieldArray;
}

- (void)initializeSubFieldArray
{
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
  subFieldArray = self->_subFieldArray;
  self->_subFieldArray = v3;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_ivarName, "hash") ^ self->_flags ^ (self->_offset << self->_scanType);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v6) = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && self->_offset == *((_DWORD *)a3 + 7)
      && self->_scanType == *((_DWORD *)a3 + 6)
      && self->_flags == *((_DWORD *)a3 + 11)
      && self->_size == *((_DWORD *)a3 + 8)
      && self->_scannable == *((_DWORD *)a3 + 9)
      && self->_stride == *((_DWORD *)a3 + 10))
    {
      ivarName = self->_ivarName;
      if (ivarName == *((NSString **)a3 + 1) || (int v6 = -[NSString isEqualToString:](ivarName, "isEqualToString:")) != 0)
      {
        typeName = self->_typeName;
        if (typeName == *((NSString **)a3 + 2)
          || (int v6 = -[NSString isEqualToString:](typeName, "isEqualToString:")) != 0)
        {
          destinationLayout = self->_destinationLayout;
          if (destinationLayout == *((VMUClassInfo **)a3 + 6)
            || (int v6 = -[VMUClassInfo isEqual:](destinationLayout, "isEqual:")) != 0)
          {
            subFieldArray = self->_subFieldArray;
            if (subFieldArray == *((NSMutableArray **)a3 + 7)
              || (int v6 = -[NSMutableArray isEqual:](subFieldArray, "isEqual:")) != 0)
            {
              possibleEnumPayloadFieldArray = self->_possibleEnumPayloadFieldArray;
              if (possibleEnumPayloadFieldArray == *((NSArray **)a3 + 8)
                || (int v6 = -[NSArray isEqual:](possibleEnumPayloadFieldArray, "isEqual:")) != 0)
              {
                LOBYTE(v6) = 1;
              }
            }
          }
        }
      }
    }

    else
    {
      LOBYTE(v6) = 0;
    }
  }

  return v6;
}

- (NSString)typedDescription
{
  typeName = self->_typeName;
  if (typeName)
  {
    descriptionForTypeEncoding( (unsigned __int8 *)-[NSString UTF8String](typeName, "UTF8String"),  (uint64_t)-[NSString UTF8String](self->_ivarName, "UTF8String"));
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v4 = self->_ivarName;
  }

  return v4;
}

- (id)mutableCopy
{
  v3 = objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo);
  LODWORD(v6) = self->_stride;
  v4 = -[VMUFieldInfo initWithName:type:kind:scan:offset:size:stride:subFieldArray:swiftTyperef:]( v3,  "initWithName:type:kind:scan:offset:size:stride:subFieldArray:swiftTyperef:",  self->_ivarName,  0LL,  0LL,  self->_scanType,  self->_offset,  self->_size,  v6,  self->_subFieldArray,  self->_swiftTyperef);
  [v4 setTypeName:self->_typeName];
  [v4 setDestinationLayout:self->_destinationLayout];
  [v4 setScannableSize:self->_scannable];
  [v4 setFlags:self->_flags];
  objc_storeStrong(v4 + 8, self->_possibleEnumPayloadFieldArray);
  return v4;
}

- (VMUFieldInfo)initWithObjcIvar:(objc_ivar *)a3 size:(unsigned int)a4 offset:(unsigned int)a5 ivarName:(const char *)a6 isARC:(BOOL)a7 is64Bit:(BOOL)a8
{
  BOOL v9 = a7;
  uint64_t v12 = *(void *)&a4;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___VMUFieldInfo;
  v14 = -[VMUFieldInfo init](&v26, sel_init);
  v15 = v14;
  if (!v14) {
    return v15;
  }
  if (a6)
  {
    uint64_t v16 = [objc_alloc(NSString) initWithUTF8String:a6];
    ivarName = v15->_ivarName;
    v15->_ivarName = (NSString *)v16;
  }

  else
  {
    ivarName = v14->_ivarName;
    v14->_ivarName = 0LL;
  }

  TypeEncoding = (unsigned __int8 *)ivar_getTypeEncoding(a3);
  if (TypeEncoding)
  {
    uint64_t v19 = [objc_alloc(NSString) initWithUTF8String:TypeEncoding];
    typeName = v15->_typeName;
    v15->_typeName = (NSString *)v19;
  }

  else
  {
    typeName = v15->_typeName;
    v15->_typeName = 0LL;
  }

  v15->_offset = a5;
  v15->_size = v12;
  char v25 = 63;
  unsigned int v21 = pointerScanSizeForTypeEncoding(TypeEncoding, v12, a8, (uint64_t)&v25);
  v15->_unsigned int scannable = v21;
  if (!v21)
  {
    v15->_stride = v12;
LABEL_16:
    v15->_scanType = 0;
    return v15;
  }

  unsigned int scannable = v15->_scannable;
  v15->_stride = v12;
  if (scannable <= 7) {
    goto LABEL_16;
  }
  if (v9 && v25 == 64) {
    int v23 = 8;
  }
  else {
    int v23 = 1;
  }
  v15->_scanType = v23;
  return v15;
}

- (VMUFieldInfo)initWithName:(id)a3 type:(id)a4 kind:(unsigned int)a5 scan:(unsigned int)a6 offset:(unsigned int)a7 size:(unsigned int)a8 stride:(unsigned int)a9 subFieldArray:(id)a10 swiftTyperef:(void *)a11
{
  uint64_t v11 = *(void *)&a8;
  uint64_t v14 = *(void *)&a5;
  uint64_t v47 = *MEMORY[0x1895F89C0];
  id v17 = a3;
  id v18 = a4;
  id v19 = a10;
  v45.receiver = self;
  v45.super_class = (Class)&OBJC_CLASS___VMUFieldInfo;
  v20 = -[VMUFieldInfo init](&v45, sel_init);
  if (v20)
  {
    unsigned int v21 = a11;
    uint64_t v22 = [v17 copy];
    ivarName = v20->_ivarName;
    v20->_ivarName = (NSString *)v22;

    uint64_t v24 = [v18 copy];
    typeName = v20->_typeName;
    v20->_typeName = (NSString *)v24;

    -[VMUFieldInfo _setKind:](v20, "_setKind:", v14);
    v20->_scanType = a6;
    v20->_offset = a7;
    v20->_size = v11;
    if ([v18 length])
    {
      char v44 = 63;
      objc_super v26 = (unsigned __int8 *)[v18 UTF8String];
      unsigned int v27 = pointerScanSizeForTypeEncoding(v26, v11, 1, (uint64_t)&v44);
      v20->_unsigned int scannable = v27;
    }

    else
    {
      else {
        unsigned int v28 = 0;
      }
      v20->_unsigned int scannable = v28;
    }

    v20->_stride = a9;
    if (v19)
    {
      uint64_t v29 = objc_opt_new();
      subFieldArray = v20->_subFieldArray;
      v20->_subFieldArray = (NSMutableArray *)v29;

      __int128 v42 = 0u;
      __int128 v43 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      id v31 = v19;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v40 objects:v46 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v41;
        do
        {
          for (uint64_t i = 0LL; i != v33; ++i)
          {
            if (*(void *)v41 != v34) {
              objc_enumerationMutation(v31);
            }
            v36 = v20->_subFieldArray;
            v37 = (void *)[*(id *)(*((void *)&v40 + 1) + 8 * i) mutableCopy];
            -[NSMutableArray addObject:](v36, "addObject:", v37);
          }

          uint64_t v33 = [v31 countByEnumeratingWithState:&v40 objects:v46 count:16];
        }

        while (v33);
      }

      unsigned int v21 = a11;
    }

    if (v21)
    {
      v38 = calloc(1uLL, 0x10uLL);
      v20->_swiftTyperef = v38;
      _OWORD *v38 = *v21;
    }
  }

  return v20;
}

- (void)dealloc
{
  swiftTyperef = self->_swiftTyperef;
  if (swiftTyperef)
  {
    free(swiftTyperef);
    self->_swiftTyperef = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___VMUFieldInfo;
  -[VMUFieldInfo dealloc](&v4, sel_dealloc);
}

- (id)initSwiftEnumPayloadFieldWithName:(id)a3 type:(id)a4 kind:(unsigned int)a5 scan:(unsigned int)a6 offset:(unsigned int)a7 size:(unsigned int)a8 stride:(unsigned int)a9 possibleEnumSubFieldArray:(id)a10 swiftTyperef:(void *)a11
{
  uint64_t v11 = *(void *)&a8;
  uint64_t v12 = *(void *)&a7;
  uint64_t v13 = *(void *)&a6;
  uint64_t v14 = *(void *)&a5;
  id v22 = a10;
  LODWORD(v21) = a9;
  id v18 = -[VMUFieldInfo initWithName:type:kind:scan:offset:size:stride:subFieldArray:swiftTyperef:]( self,  "initWithName:type:kind:scan:offset:size:stride:subFieldArray:swiftTyperef:",  a3,  a4,  v14,  v13,  v12,  v11,  v21,  0LL,  a11);
  id v19 = v18;
  if (v18) {
    objc_storeStrong((id *)&v18->_possibleEnumPayloadFieldArray, a10);
  }

  return v19;
}

- (id)initStorageInfoFieldWithName:(id)a3 type:(id)a4 kind:(unsigned int)a5 scan:(unsigned int)a6 offset:(unsigned int)a7 size:(unsigned int)a8 stride:(unsigned int)a9 subFieldArray:(id)a10
{
  LODWORD(v11) = a9;
  id result = -[VMUFieldInfo initWithName:type:kind:scan:offset:size:stride:subFieldArray:swiftTyperef:]( self,  "initWithName:type:kind:scan:offset:size:stride:subFieldArray:swiftTyperef:",  a3,  a4,  *(void *)&a5,  *(void *)&a6,  *(void *)&a7,  *(void *)&a8,  v11,  a10,  0LL);
  if (result) {
    *((_DWORD *)result + 11) |= 4u;
  }
  return result;
}

- (id)initStorageEntryFieldWithName:(id)a3 type:(id)a4 kind:(unsigned int)a5 scan:(unsigned int)a6 offset:(unsigned int)a7 size:(unsigned int)a8 stride:(unsigned int)a9 subFieldArray:(id)a10
{
  LODWORD(v11) = a9;
  id result = -[VMUFieldInfo initWithName:type:kind:scan:offset:size:stride:subFieldArray:swiftTyperef:]( self,  "initWithName:type:kind:scan:offset:size:stride:subFieldArray:swiftTyperef:",  a3,  a4,  *(void *)&a5,  *(void *)&a6,  *(void *)&a7,  *(void *)&a8,  v11,  a10,  0LL);
  if (result) {
    *((_DWORD *)result + 11) |= 8u;
  }
  return result;
}

- (VMUFieldInfo)initWithName:(id)a3 type:(id)a4 scan:(unsigned int)a5 offset:(unsigned int)a6 size:(unsigned int)a7
{
  LODWORD(v8) = a7;
  return -[VMUFieldInfo initWithName:type:kind:scan:offset:size:stride:subFieldArray:swiftTyperef:]( self,  "initWithName:type:kind:scan:offset:size:stride:subFieldArray:swiftTyperef:",  a3,  a4,  0LL,  *(void *)&a5,  *(void *)&a6,  v8,  0LL,  0LL);
}

- (VMUFieldInfo)initWithSerializer:(id)a3 classMap:(id)a4 version:(unsigned int)a5 error:(id *)a6
{
  return -[VMUFieldInfo initWithSerializer:classMap:version:returnedDestinationLayoutClassInfoIndex:error:]( self,  "initWithSerializer:classMap:version:returnedDestinationLayoutClassInfoIndex:error:",  a3,  a4,  *(void *)&a5,  0LL,  a6);
}

- (VMUFieldInfo)initWithSerializer:(id)a3 classMap:(id)a4 version:(unsigned int)a5 returnedDestinationLayoutClassInfoIndex:(unsigned int *)a6 error:(id *)a7
{
  v34[3] = *MEMORY[0x1895F89C0];
  id v12 = a3;
  id v13 = a4;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___VMUFieldInfo;
  uint64_t v14 = -[VMUFieldInfo init](&v33, sel_init);
  if (!v14) {
    goto LABEL_31;
  }
  uint64_t v32 = 0LL;
  if (!a7) {
    a7 = (id *)&v32;
  }
  v15 = (unsigned int *)[v12 _deserializeValues:2 error:a7];
  if (*a7) {
    goto LABEL_9;
  }
  v14->_offset = *v15;
  v14->_size = v15[1];
  if (*a7) {
    goto LABEL_9;
  }
  v34[0] = &v14->_scanType;
  v34[1] = &v14->_flags;
  v34[2] = &v14->_scannable;
  uint64_t v16 = [v12 _deserializeValues:3 error:a7];
  id v17 = *a7;
  if (*a7) {
    goto LABEL_9;
  }
  do
  {
    *(_DWORD *)v34[(void)v17] = *(_DWORD *)(v16 + 4LL * (void)v17);
    id v17 = (char *)v17 + 1;
  }

  while (v17 != (id)3);
  if (*a7) {
    goto LABEL_9;
  }
  if (a5 >= 4)
  {
    id v19 = (unsigned int *)[v12 _deserializeValues:1 error:a7];
    if (*a7) {
      goto LABEL_9;
    }
    v14->_stride = *v19;
    if (*a7) {
      goto LABEL_9;
    }
  }

  unsigned int v20 = [v12 deserialize32WithError:a7];
  if (*a7) {
    goto LABEL_9;
  }
  if (a6) {
    *a6 = v20;
  }
  uint64_t v21 = [v12 copyDeserializedStringWithError:a7];
  ivarName = v14->_ivarName;
  v14->_ivarName = (NSString *)v21;

  if (*a7) {
    goto LABEL_9;
  }
  uint64_t v23 = [v12 copyDeserializedStringWithError:a7];
  typeName = v14->_typeName;
  v14->_typeName = (NSString *)v23;

  if (*a7) {
    goto LABEL_9;
  }
  if (a5 < 4)
  {
LABEL_31:
    id v18 = v14;
    goto LABEL_32;
  }

  int v25 = [v12 deserialize32WithError:a7];
  if (!*a7)
  {
    int v26 = v25;
    if (v25)
    {
      unsigned int v27 = (void *)objc_opt_new();
      do
      {
        uint64_t v28 = [v12 deserialize32WithError:a7];
        if (*a7)
        {

          goto LABEL_9;
        }

        [v13 fieldInfoForIndex:v28];
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29) {
          [v27 addObject:v29];
        }
        else {
          NSLog(@"Bad field index in document");
        }

        --v26;
      }

      while (v26);
      if ([v27 count]) {
        v30 = v27;
      }
      else {
        v30 = 0LL;
      }
      objc_storeStrong((id *)&v14->_subFieldArray, v30);
    }

    goto LABEL_31;
  }

- (void)serializeWithClassMap:(id)a3 simpleSerializer:(id)a4 version:(unsigned int)a5
{
  v22[1] = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  v22[0] = *(void *)&self->_offset;
  [v8 _serializeValues:v22 count:2];
  unsigned int flags = self->_flags;
  v21[0] = self->_scanType;
  v21[1] = flags;
  v21[2] = self->_scannable;
  [v8 _serializeValues:v21 count:3];
  unsigned int stride = self->_stride;
  [v8 _serializeValues:&stride count:1];
  [v8 serialize32:[v7 indexForClassInfo:self->_destinationLayout]];
  [v8 serializeString:self->_ivarName];
  [v8 serializeString:self->_typeName];
  [v8 serialize32:[self->_subFieldArray count]];
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v10 = self->_subFieldArray;
  uint64_t v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v15,  v20,  16LL);
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0LL;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [v8 serialize32:[v7 indexForFieldInfo:*(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15]];
      }

      while (v12 != v14);
      uint64_t v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v15,  v20,  16LL);
    }

    while (v12);
  }
}

- (id)getLeafFieldAtOffset:(unsigned int)a3 leafOffset:(unsigned int *)a4
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  subFieldArray = self->_subFieldArray;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v8 = subFieldArray;
  uint64_t v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
LABEL_3:
    uint64_t v12 = 0LL;
    while (1)
    {
      if (*(void *)v20 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * v12);
      unsigned int v14 = [v13 offset:(void)v19];
      if (v10 == ++v12)
      {
        uint64_t v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }

    if (v14 > a3) {
      goto LABEL_11;
    }
    id v17 = v13;

    if (v17)
    {
      [v17 getLeafFieldAtOffset:a3 - [v17 offset] leafOffset:v23];
      __int128 v15 = (VMUFieldInfo *)objc_claimAutoreleasedReturnValue();
      if (a4)
      {
        int v18 = [v17 offset];
        *a4 = v23[0] + v18;
      }

      return v15;
    }
  }

  else
  {
LABEL_11:
  }

  if (a4) {
    *a4 = 0;
  }
  __int128 v15 = self;
  return v15;
}

- (id)_fullIvarNameAtOffset:(unsigned int)a3 leafOffset:(unsigned int *)a4 depth:(unsigned int)a5
{
  uint64_t v7 = *(void *)&a3;
  uint64_t v31 = *MEMORY[0x1895F89C0];
  if (_fullIvarNameAtOffset_leafOffset_depth__onceToken != -1) {
    dispatch_once(&_fullIvarNameAtOffset_leafOffset_depth__onceToken, &__block_literal_global_12);
  }
  subFieldArray = self->_subFieldArray;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  uint64_t v10 = subFieldArray;
  uint64_t v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v26,  v30,  16LL);
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
LABEL_5:
    uint64_t v14 = 0LL;
    while (1)
    {
      if (*(void *)v27 != v13) {
        objc_enumerationMutation(v10);
      }
      __int128 v15 = *(void **)(*((void *)&v26 + 1) + 8 * v14);
      unsigned int v16 = [v15 offset];
      if (v12 == ++v14)
      {
        uint64_t v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v26,  v30,  16LL);
        if (v12) {
          goto LABEL_5;
        }
        goto LABEL_13;
      }
    }

    id v20 = v15;

    if (v20)
    {
      [v20 _fullIvarNameAtOffset:v7 - [v20 offset] leafOffset:v30 depth:a5 + 1];
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (a4)
      {
        int v22 = [v20 offset];
        *a4 = v30[0] + v22;
      }

      if (a5 && -[NSString isEqualToString:](self->_ivarName, "isEqualToString:", @"some"))
      {
        uint64_t v23 = v21;
      }

      else if (v21 {
             && [v21 length]
      }
             && ![(id)_fullIvarNameAtOffset_leafOffset_depth__internalPartialIvarNames containsObject:v21])
      {
        [NSString stringWithFormat:@"%@.%@", self->_ivarName, v21, (void)v26];
        uint64_t v23 = (NSString *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        ivarName = self->_ivarName;
        if ((_DWORD)v7)
        {
          -[NSString stringByAppendingFormat:](ivarName, "stringByAppendingFormat:", @" + %u", v7);
          uint64_t v23 = (NSString *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          uint64_t v23 = ivarName;
        }
      }

      int v25 = v23;

      return v25;
    }
  }

  else
  {
LABEL_13:
  }

  if (a4) {
    *a4 = 0;
  }
  if (a5
    && ([(id)_fullIvarNameAtOffset_leafOffset_depth__internalPartialIvarNames containsObject:self->_ivarName] & 1) != 0)
  {
    return 0LL;
  }

  int v18 = self->_ivarName;
  if ((_DWORD)v7)
  {
    -[NSString stringByAppendingFormat:](v18, "stringByAppendingFormat:", @" + %u", v7);
    __int128 v19 = (NSString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    __int128 v19 = v18;
  }

  return v19;
}

void __55__VMUFieldInfo__fullIvarNameAtOffset_leafOffset_depth___block_invoke()
{
  uint64_t v0 = [MEMORY[0x189604010] setWithObjects:@"_guts", @"_object", @"_otherBits", @"_rawValue", @"rawValue", @"_value", @"_variantBuffer", @"_storage", @"_buffer", @"object", @"some", @"native", 0];
  v1 = (void *)_fullIvarNameAtOffset_leafOffset_depth__internalPartialIvarNames;
  _fullIvarNameAtOffset_leafOffset_depth__internalPartialIvarNames = v0;
}

- (id)fullIvarNameAtOffset:(unsigned int)a3
{
  int v4 = 0;
  -[VMUFieldInfo _fullIvarNameAtOffset:leafOffset:depth:]( self,  "_fullIvarNameAtOffset:leafOffset:depth:",  *(void *)&a3,  &v4,  0LL);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_setIvarName:(id)a3
{
  if (self->_ivarName != a3)
  {
    int v4 = (NSString *)[a3 copy];
    ivarName = self->_ivarName;
    self->_ivarName = v4;
  }

- (void)setTypeName:(id)a3
{
  if (self->_typeName != a3)
  {
    int v4 = (NSString *)[a3 copy];
    typeName = self->_typeName;
    self->_typeName = v4;
  }

- (void)_setScanType:(unsigned int)a3
{
  self->_scanType = a3;
}

- (void)_setOffset:(unsigned int)a3
{
  self->_offset = a3;
}

- (void)_setSize:(unsigned int)a3
{
  unsigned int scannable = self->_scannable;
  if (scannable >= a3) {
    unsigned int scannable = a3;
  }
  self->_size = a3;
  self->_unsigned int scannable = scannable;
}

- (void)_setFlags:(unsigned int)a3
{
  self->_unsigned int flags = a3;
  if ((a3 & 2) != 0)
  {
    +[VMUClassInfo _genericBlockByrefInfo](&OBJC_CLASS___VMUClassInfo, "_genericBlockByrefInfo");
    int v4 = (VMUClassInfo *)objc_claimAutoreleasedReturnValue();
    destinationLayout = self->_destinationLayout;
    self->_destinationLayout = v4;
  }

- (unsigned)bitfieldWidth
{
  typeName = self->_typeName;
  if (typeName)
  {
    uint64_t v3 = -[NSString UTF8String](typeName, "UTF8String");
    if (*(_BYTE *)v3 == 98) {
      LODWORD(typeName) = strtol((const char *)(v3 + 1), 0LL, 10);
    }
    else {
      LODWORD(typeName) = 0;
    }
  }

  return typeName;
}

- (BOOL)isCapture
{
  return self->_flags & 1;
}

- (BOOL)isByref
{
  return (LOBYTE(self->_flags) >> 1) & 1;
}

- (BOOL)isStorageImplPointer
{
  return (self->_flags & 4) != 0
      && -[NSString isEqualToString:](self->_ivarName, "isEqualToString:", storageInfoTypeStorageImplPointer);
}

- (BOOL)isArraySize
{
  return (self->_flags & 4) != 0
      && -[NSString isEqualToString:](self->_ivarName, "isEqualToString:", storageInfoTypeArraySize);
}

- (BOOL)isArrayEntries
{
  return (self->_flags & 4) != 0
      && -[NSString isEqualToString:](self->_ivarName, "isEqualToString:", storageInfoTypeArrayEntries);
}

- (BOOL)isStorageBitmapPointer
{
  return (self->_flags & 4) != 0
      && -[NSString isEqualToString:](self->_ivarName, "isEqualToString:", storageInfoTypeBitmapPointer);
}

- (BOOL)isKeysPointer
{
  return (self->_flags & 4) != 0
      && -[NSString isEqualToString:](self->_ivarName, "isEqualToString:", storageInfoTypeKeysPointer);
}

- (BOOL)isValuesPointer
{
  return (self->_flags & 4) != 0
      && -[NSString isEqualToString:](self->_ivarName, "isEqualToString:", storageInfoTypeValuesPointer);
}

- (BOOL)isKeyField
{
  return (self->_flags & 8) != 0
      && -[NSString isEqualToString:](self->_ivarName, "isEqualToString:", storageInfoEntryKeyField);
}

- (BOOL)isValueField
{
  return (self->_flags & 8) != 0
      && -[NSString isEqualToString:](self->_ivarName, "isEqualToString:", storageInfoEntryValueField);
}

- (BOOL)typeNameMayDescribeReferencedAllocation
{
  return (LOBYTE(self->_flags) >> 4) & 1;
}

- (void)_setKind:(unsigned int)a3
{
  self->_unsigned int flags = self->_flags & 0xFFFFFFF | (a3 << 28);
}

- (void)enumerateSublayoutsForSize:(int)a3 parentOffset:(unsigned int)a4 remotePointerSize:(uint64_t)a5 withBlock:
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if ((uint64_t v7 = *(void **)(a1 + 56)) != 0 && [v7 count] || *(void *)(a1 + 48))
    {
      int v8 = *(_DWORD *)(a1 + 28) + a3;
      int v24 = a4 + v8 - 1;
      uint64_t v9 = v24 & -a4;
      unsigned int v27 = v8;
      unsigned int v10 = v8 + *(_DWORD *)(a1 + 36);
      if (v10 >= a2) {
        unsigned int v10 = a2;
      }
      uint64_t v11 = v9 + a4;
      unsigned int v28 = v10;
      while (v11 <= v10)
      {
        uint64_t v12 = *(void **)(a1 + 56);
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          unsigned int v16 = v9 - v27;
          uint64_t v17 = *(void *)v31;
LABEL_11:
          uint64_t v18 = 0LL;
          while (1)
          {
            if (*(void *)v31 != v17) {
              objc_enumerationMutation(v13);
            }
            __int128 v19 = *(void **)(*((void *)&v30 + 1) + 8 * v18);
            unsigned int v20 = [v19 offset];
            if (v15 == ++v18)
            {
              uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
              if (v15) {
                goto LABEL_11;
              }
              goto LABEL_19;
            }
          }

          if (v20 > v16) {
            goto LABEL_19;
          }
          id v22 = v19;

          if (v22)
          {
            -[VMUFieldInfo enumerateSublayoutsForSize:parentOffset:remotePointerSize:withBlock:](v22, a2, v27, a4, a5);
            int v23 = [v22 offset];
            uint64_t v11 = (v24 + v23 + [v22 size]) & -a4;

            goto LABEL_24;
          }
        }

        else
        {
LABEL_19:
        }

        uint64_t v21 = *(void *)(a1 + 48);
        if (v21) {
          (*(void (**)(uint64_t, uint64_t, uint64_t, void))(a5 + 16))(a5, v21, v9, *(unsigned int *)(a1 + 24));
        }
LABEL_24:
        uint64_t v9 = v11;
        uint64_t v11 = v11 + a4;
        unsigned int v10 = v28;
      }
    }
  }

- (unsigned)kind
{
  return self->_flags >> 28;
}

- (void)_setScannableSize:(unsigned int)a3
{
  self->_unsigned int scannable = a3;
}

- (void)_setStride:(unsigned int)a3
{
  self->_unsigned int stride = a3;
}

- (void)setDestinationLayout:(id)a3
{
  v5 = (VMUClassInfo *)a3;
  destinationLayout = self->_destinationLayout;
  p_destinationLayout = &self->_destinationLayout;
  if (destinationLayout != v5)
  {
    int v8 = v5;
    objc_storeStrong((id *)p_destinationLayout, a3);
    v5 = v8;
  }
}

- (VMUClassInfo)destinationLayout
{
  if ((self->_flags & 2) == 0) {
    return self->_destinationLayout;
  }
  +[VMUClassInfo _genericBlockByrefInfo](&OBJC_CLASS___VMUClassInfo, "_genericBlockByrefInfo");
  return (VMUClassInfo *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)descriptionOfFieldValueInObjectMemory:(void *)a3 scanner:(id)a4
{
  v5 = (char *)a3 + self->_offset;
  typeName = self->_typeName;
  id v7 = a4;
  descriptionOfValueAtAddressWithTypeEncoding( (uint64_t)v5,  (unsigned __int8 *)-[NSString UTF8String](typeName, "UTF8String"),  self->_size,  v7);
  int v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)description
{
  destinationLayout = self->_destinationLayout;
  if (destinationLayout)
  {
    -[VMUClassInfo className](destinationLayout, "className");
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    int v4 = &stru_189E010C8;
  }

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___VMUFieldInfo;
  v5 = -[VMUFieldInfo description](&v10, sel_description);
  uint64_t v6 = -[VMUFieldInfo offset](self, "offset");
  -[VMUFieldInfo typedDescription](self, "typedDescription");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 stringByAppendingFormat:@"%+3d %@ size %u (%s)  %@", v6, v7, -[VMUFieldInfo size](self, "size"), VMUScanTypeScanDescription(-[VMUFieldInfo scanType](self, "scanType")), v4];
  int v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)ivarName
{
  return self->_ivarName;
}

- (NSString)typeName
{
  return self->_typeName;
}

- (unsigned)scanType
{
  return self->_scanType;
}

- (unsigned)offset
{
  return self->_offset;
}

- (unsigned)size
{
  return self->_size;
}

- (unsigned)scannableSize
{
  return self->_scannable;
}

- (unsigned)stride
{
  return self->_stride;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)swiftTyperef
{
  return self->_swiftTyperef;
}

- (void).cxx_destruct
{
}

@end