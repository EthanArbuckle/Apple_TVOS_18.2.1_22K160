@interface TransparencyGPBMessage
+ (BOOL)accessInstanceVariablesDirectly;
+ (BOOL)resolveClassMethod:(SEL)a3;
+ (BOOL)resolveInstanceMethod:(SEL)a3;
+ (BOOL)supportsSecureCoding;
+ (TransparencyGPBMessage)allocWithZone:(_NSZone *)a3;
+ (id)descriptor;
+ (id)message;
+ (id)parseDelimitedFromCodedInputStream:(id)a3 extensionRegistry:(id)a4 error:(id *)a5;
+ (id)parseFromCodedInputStream:(id)a3 extensionRegistry:(id)a4 error:(id *)a5;
+ (id)parseFromData:(id)a3 error:(id *)a4;
+ (id)parseFromData:(id)a3 extensionRegistry:(id)a4 error:(id *)a5;
+ (void)initialize;
- (BOOL)hasExtension:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInitialized;
- (BOOL)parseUnknownField:(id)a3 extensionRegistry:(id)a4 tag:(unsigned int)a5;
- (TransparencyGPBMessage)init;
- (TransparencyGPBMessage)initWithCodedInputStream:(id)a3 extensionRegistry:(id)a4 error:(id *)a5;
- (TransparencyGPBMessage)initWithCoder:(id)a3;
- (TransparencyGPBMessage)initWithData:(id)a3 error:(id *)a4;
- (TransparencyGPBMessage)initWithData:(id)a3 extensionRegistry:(id)a4 error:(id *)a5;
- (TransparencyGPBUnknownFieldSet)unknownFields;
- (id)copyWithZone:(_NSZone *)a3;
- (id)data;
- (id)delimitedData;
- (id)description;
- (id)descriptor;
- (id)extensionsCurrentlySet;
- (id)getExistingExtension:(id)a3;
- (id)getExtension:(id)a3;
- (unint64_t)hash;
- (unint64_t)serializedSize;
- (void)addExtension:(id)a3 value:(id)a4;
- (void)addUnknownMapEntry:(int)a3 value:(id)a4;
- (void)clear;
- (void)clearExtension:(id)a3;
- (void)copyFieldsInto:(id)a3 zone:(_NSZone *)a4 descriptor:(id)a5;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)internalClear:(BOOL)a3;
- (void)mergeDelimitedFromCodedInputStream:(id)a3 extensionRegistry:(id)a4;
- (void)mergeFrom:(id)a3;
- (void)mergeFromCodedInputStream:(id)a3 extensionRegistry:(id)a4;
- (void)mergeFromData:(id)a3 extensionRegistry:(id)a4;
- (void)parseMessageSet:(id)a3 extensionRegistry:(id)a4;
- (void)setExtension:(id)a3 index:(unint64_t)a4 value:(id)a5;
- (void)setExtension:(id)a3 value:(id)a4;
- (void)setUnknownFields:(id)a3;
- (void)writeDelimitedToCodedOutputStream:(id)a3;
- (void)writeDelimitedToOutputStream:(id)a3;
- (void)writeExtensionsToCodedOutputStream:(id)a3 range:(TransparencyGPBExtensionRange)a4 sortedExtensions:(id)a5;
- (void)writeField:(id)a3 toCodedOutputStream:(id)a4;
- (void)writeToCodedOutputStream:(id)a3;
- (void)writeToOutputStream:(id)a3;
@end

@implementation TransparencyGPBMessage

+ (void)initialize
{
  id v3 = (id)objc_opt_class(&OBJC_CLASS___TransparencyGPBMessage, a2);
  if ((id)objc_opt_class(a1, v4) == v3)
  {
    [a1 descriptor];
    objc_opt_class(&OBJC_CLASS___TransparencyGPBRootObject, v5);
  }

  else if ([a1 superclass] == v3)
  {
    [a1 descriptor];
  }

+ (TransparencyGPBMessage)allocWithZone:(_NSZone *)a3
{
  return (TransparencyGPBMessage *)NSAllocateObject( (Class)a1,  *((unsigned int *)[a1 descriptor] + 6),  a3);
}

+ (id)descriptor
{
  id result = (id)qword_1002EE700;
  if (!qword_1002EE700)
  {
    qword_1002EE708 = -[TransparencyGPBFileDescriptor initWithPackage:syntax:]( objc_alloc(&OBJC_CLASS___TransparencyGPBFileDescriptor),  "initWithPackage:syntax:",  @"internal",  2LL);
    LODWORD(v4) = 0;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:",  objc_opt_class(&OBJC_CLASS___TransparencyGPBMessage, v3),  0LL,  qword_1002EE708,  0LL,  0LL,  0LL,  v4);
    qword_1002EE700 = (uint64_t)result;
  }

  return result;
}

+ (id)message
{
  return objc_alloc_init((Class)a1);
}

- (TransparencyGPBMessage)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TransparencyGPBMessage;
  v2 = -[TransparencyGPBMessage init](&v7, "init");
  uint64_t v4 = v2;
  if (v2)
  {
    uint64_t v5 = (objc_class *)objc_opt_class(v2, v3);
    v4->messageStorage_ = (TransparencyGPBMessage_Storage *)((char *)v4 + class_getInstanceSize(v5));
    v4->readOnlyLock_._os_unfair_lock_opaque = 0;
  }

  return v4;
}

- (TransparencyGPBMessage)initWithData:(id)a3 error:(id *)a4
{
  return -[TransparencyGPBMessage initWithData:extensionRegistry:error:]( self,  "initWithData:extensionRegistry:error:",  a3,  0LL,  a4);
}

- (TransparencyGPBMessage)initWithData:(id)a3 extensionRegistry:(id)a4 error:(id *)a5
{
  v8 = -[TransparencyGPBMessage init](self, "init");
  v9 = v8;
  if (v8)
  {
    -[TransparencyGPBMessage mergeFromData:extensionRegistry:](v8, "mergeFromData:extensionRegistry:", a3, a4);
    if (a5) {
      *a5 = 0LL;
    }
  }

  return v9;
}

- (TransparencyGPBMessage)initWithCodedInputStream:(id)a3 extensionRegistry:(id)a4 error:(id *)a5
{
  v8 = -[TransparencyGPBMessage init](self, "init");
  v9 = v8;
  if (v8)
  {
    -[TransparencyGPBMessage mergeFromCodedInputStream:extensionRegistry:]( v8,  "mergeFromCodedInputStream:extensionRegistry:",  a3,  a4);
    if (a5) {
      *a5 = 0LL;
    }
  }

  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TransparencyGPBMessage;
  -[TransparencyGPBMessage dealloc](&v3, "dealloc");
}

- (void)copyFieldsInto:(id)a3 zone:(_NSZone *)a4 descriptor:(id)a5
{
  objc_super v7 = a3;
  v8 = self;
  memcpy(*((void **)a3 + 8), self->messageStorage_, *((unsigned int *)a5 + 6));
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  v9 = (void *)*((void *)a5 + 1);
  id v10 = [v9 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v10)
  {
    id v11 = v10;
    v12 = &OBJC_IVAR___TransparencyGPBFieldDescriptor_description_;
    uint64_t v35 = *(void *)v42;
    v31 = v8;
    v32 = v7;
    v33 = v9;
    do
    {
      v13 = 0LL;
      id v34 = v11;
      do
      {
        if (*(void *)v42 != v35) {
          objc_enumerationMutation(v9);
        }
        v14 = *(char **)(*((void *)&v41 + 1) + 8LL * (void)v13);
        uint64_t v15 = *(void *)&v14[*v12];
        if ((*(_WORD *)(v15 + 28) & 0xF02) != 0)
        {
          uint64_t v16 = sub_100137E7C((uint64_t)v8, *(void *)(*((void *)&v41 + 1) + 8LL * (void)v13));
          if (!v16) {
            goto LABEL_38;
          }
          v17 = (void *)v16;
          v18 = v12;
          unsigned int v19 = *(unsigned __int8 *)(*(void *)&v14[*v12] + 30LL) - 15;
          unsigned int v20 = [v14 fieldType];
          if (v19 <= 1)
          {
            if (v20 == 1)
            {
              v21 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v17 count]);
              __int128 v37 = 0u;
              __int128 v38 = 0u;
              __int128 v39 = 0u;
              __int128 v40 = 0u;
              id v22 = [v17 countByEnumeratingWithState:&v37 objects:v45 count:16];
              if (v22)
              {
                id v23 = v22;
                uint64_t v24 = *(void *)v38;
                do
                {
                  for (i = 0LL; i != v23; i = (char *)i + 1)
                  {
                    if (*(void *)v38 != v24) {
                      objc_enumerationMutation(v17);
                    }
                    id v26 = [*(id *)(*((void *)&v37 + 1) + 8 * (void)i) copyWithZone:a4];
                    -[NSMutableArray addObject:](v21, "addObject:", v26);
                  }

                  id v23 = [v17 countByEnumeratingWithState:&v37 objects:v45 count:16];
                }

                while (v23);
                v8 = v31;
                objc_super v7 = v32;
              }

              v9 = v33;
              v12 = v18;
LABEL_36:
              id v11 = v34;
LABEL_37:
              id v30 = v17;
              sub_100138498((uint64_t)v7, v14, v21);
              goto LABEL_38;
            }

            v12 = v18;
            if ([v14 mapKeyDataType] == 14)
            {
              v21 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v17 count]);
              v36[0] = _NSConcreteStackBlock;
              v36[1] = 3221225472LL;
              v36[2] = sub_10012E97C;
              v36[3] = &unk_100283148;
              v36[4] = v21;
              v36[5] = a4;
              [v17 enumerateKeysAndObjectsUsingBlock:v36];
              goto LABEL_36;
            }

            v29 = (NSMutableArray *)[v17 deepCopyWithZone:a4];
LABEL_35:
            v21 = v29;
            goto LABEL_36;
          }

          if (v20 == 1)
          {
            v12 = v18;
            uint64_t v28 = *v18;
LABEL_31:
            if (*(unsigned __int8 *)(*(void *)&v14[v28] + 30LL) - 13 <= 3)
            {
              v29 = (NSMutableArray *)[v17 mutableCopyWithZone:a4];
              goto LABEL_35;
            }
          }

          else
          {
            v12 = v18;
            if ([v14 mapKeyDataType] == 14)
            {
              uint64_t v28 = *v18;
              goto LABEL_31;
            }
          }

          v29 = (NSMutableArray *)[v17 copyWithZone:a4];
          goto LABEL_35;
        }

        int v27 = *(unsigned __int8 *)(v15 + 30);
        if ((v27 - 15) <= 1)
        {
          if (!sub_100138364((uint64_t)v8, *(_DWORD *)(v15 + 20), *(_DWORD *)(v15 + 16)))
          {
            *(void *)(v7[8] + *(unsigned int *)(*(void *)&v14[*v12] + 24LL)) = 0LL;
            goto LABEL_38;
          }

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = -[TransparencyGPBMessage descriptor](self, "descriptor");
  v6 = objc_msgSend(objc_msgSend(objc_msgSend(v5, "messageClass"), "allocWithZone:", a3), "init");
  -[TransparencyGPBMessage copyFieldsInto:zone:descriptor:](self, "copyFieldsInto:zone:descriptor:", v6, a3, v5);
  v6[1] = -[TransparencyGPBUnknownFieldSet copyWithZone:](self->unknownFields_, "copyWithZone:", a3);
  v6[2] = sub_10012EA48(self->extensionMap_, (uint64_t)a3);
  return v6;
}

- (void)clear
{
}

- (void)internalClear:(BOOL)a3
{
  BOOL v28 = a3;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  int v27 = -[TransparencyGPBMessage descriptor](self, "descriptor");
  uint64_t v4 = (void *)v27[1];
  id v5 = [v4 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v34;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v34 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
        uint64_t v10 = v9[1];
        if ((*(_WORD *)(v10 + 28) & 0xF02) != 0)
        {
          uint64_t v11 = sub_100137E7C((uint64_t)self, *(void *)(*((void *)&v33 + 1) + 8LL * (void)i));
          if (!v11) {
            continue;
          }
          v12 = (char *)v11;
          if ([v9 fieldType] == 1)
          {
            if (*(unsigned __int8 *)(v9[1] + 30LL) - 13 <= 3)
            {
              uint64_t v14 = objc_opt_class(&OBJC_CLASS___TransparencyGPBAutocreatedArray, v13);
              if ((objc_opt_isKindOfClass(v12, v14) & 1) != 0)
              {
                uint64_t v15 = &OBJC_IVAR___TransparencyGPBAutocreatedArray__autocreator;
                goto LABEL_24;
              }

- (BOOL)isInitialized
{
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  objc_super v3 = (void *)*((void *)-[TransparencyGPBMessage descriptor](self, "descriptor") + 1);
  id v4 = [v3 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v29;
LABEL_3:
    uint64_t v6 = 0LL;
    while (1)
    {
      if (*(void *)v29 != v5) {
        objc_enumerationMutation(v3);
      }
      uint64_t v7 = *(void **)(*((void *)&v28 + 1) + 8 * v6);
      if ([v7 isRequired]
        && !sub_100138364((uint64_t)self, *(_DWORD *)(v7[1] + 20LL), *(_DWORD *)(v7[1] + 16LL)))
      {
        return 0;
      }

      unsigned int v8 = [v7 fieldType];
      if (v8 == 1)
      {
        v9 = (void *)sub_100137E7C((uint64_t)self, (uint64_t)v7);
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        id v10 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v25;
LABEL_15:
          uint64_t v12 = 0LL;
          while (1)
          {
            if (*(void *)v25 != v11) {
              objc_enumerationMutation(v9);
            }
            if (v10 == (id)++v12)
            {
              id v10 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
              if (v10) {
                goto LABEL_15;
              }
              goto LABEL_31;
            }
          }
        }

        goto LABEL_31;
      }

      if (v8)
      {
        BOOL v13 = [v7 mapKeyDataType] == 14;
        uint64_t v14 = (void *)sub_100137E7C((uint64_t)self, (uint64_t)v7);
        if (!v13)
        {
          goto LABEL_31;
        }

        if (v14)
        {
          unsigned __int8 v15 = sub_100112638(v14);
          goto LABEL_27;
        }
      }

      else if ([v7 isRequired] {
             || sub_100138364((uint64_t)self, *(_DWORD *)(v7[1] + 20LL), *(_DWORD *)(v7[1] + 16LL)))
      }
      {
        unsigned __int8 v15 = objc_msgSend(sub_100138F60((uint64_t)self, v7), "isInitialized");
LABEL_27:
        if ((v15 & 1) == 0) {
          return 0;
        }
      }

- (id)descriptor
{
  return objc_msgSend((id)objc_opt_class(self, a2), "descriptor");
}

- (id)data
{
  objc_super v3 = +[NSMutableData dataWithLength:]( &OBJC_CLASS___NSMutableData,  "dataWithLength:",  -[TransparencyGPBMessage serializedSize](self, "serializedSize"));
  id v4 = -[TransparencyGPBCodedOutputStream initWithData:]( objc_alloc(&OBJC_CLASS___TransparencyGPBCodedOutputStream),  "initWithData:",  v3);
  -[TransparencyGPBMessage writeToCodedOutputStream:](self, "writeToCodedOutputStream:", v4);

  return v3;
}

- (id)delimitedData
{
  unint64_t v3 = -[TransparencyGPBMessage serializedSize](self, "serializedSize");
  id v4 = +[NSMutableData dataWithLength:](&OBJC_CLASS___NSMutableData, "dataWithLength:", sub_10010E104(v3) + v3);
  uint64_t v5 = -[TransparencyGPBCodedOutputStream initWithData:]( objc_alloc(&OBJC_CLASS___TransparencyGPBCodedOutputStream),  "initWithData:",  v4);
  -[TransparencyGPBMessage writeDelimitedToCodedOutputStream:](self, "writeDelimitedToCodedOutputStream:", v5);

  return v4;
}

- (void)writeToOutputStream:(id)a3
{
  id v4 = -[TransparencyGPBCodedOutputStream initWithOutputStream:]( objc_alloc(&OBJC_CLASS___TransparencyGPBCodedOutputStream),  "initWithOutputStream:",  a3);
  -[TransparencyGPBMessage writeToCodedOutputStream:](self, "writeToCodedOutputStream:", v4);
}

- (void)writeToCodedOutputStream:(id)a3
{
  uint64_t v5 = -[TransparencyGPBMessage descriptor](self, "descriptor");
  uint64_t v6 = (void *)v5[1];
  uint64_t v7 = (char *)[v6 count];
  unsigned int v8 = [v5 extensionRanges];
  uint64_t v19 = v5;
  unsigned int v9 = [v5 extensionRangesCount];
  id v10 = objc_msgSend( -[NSMutableDictionary allKeys](self->extensionMap_, "allKeys"),  "sortedArrayUsingSelector:",  "compareByFieldNumber:");
  if (v7) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = v9 == 0;
  }
  if (!v11)
  {
    id v12 = v10;
    unint64_t v13 = 0LL;
    uint64_t v14 = 0LL;
    do
    {
      if (v14 == v7)
      {
        -[TransparencyGPBMessage writeExtensionsToCodedOutputStream:range:sortedExtensions:]( self,  "writeExtensionsToCodedOutputStream:range:sortedExtensions:",  a3,  v8[v13],  v12);
        uint64_t v14 = v7;
        ++v13;
      }

      else if (v13 == v9 {
             || (unsigned __int8 v15 = [v6 objectAtIndexedSubscript:v14],
      }
                 int v16 = &v8[v13],
                 *(_DWORD *)(v15[1] + 16LL) < *(_DWORD *)v16))
      {
        -[TransparencyGPBMessage writeField:toCodedOutputStream:]( self,  "writeField:toCodedOutputStream:",  [v6 objectAtIndexedSubscript:v14++],  a3);
      }

      else
      {
        ++v13;
        -[TransparencyGPBMessage writeExtensionsToCodedOutputStream:range:sortedExtensions:]( self,  "writeExtensionsToCodedOutputStream:range:sortedExtensions:",  a3,  *v16,  v12);
      }
    }

    while (v14 < v7 || v13 < v9);
  }

  unsigned __int8 v17 = [v19 isWireFormat];
  unknownFields = self->unknownFields_;
  if ((v17 & 1) != 0) {
    -[TransparencyGPBUnknownFieldSet writeAsMessageSetTo:](unknownFields, "writeAsMessageSetTo:", a3);
  }
  else {
    -[TransparencyGPBUnknownFieldSet writeToCodedOutputStream:](unknownFields, "writeToCodedOutputStream:", a3);
  }
}

- (void)writeDelimitedToOutputStream:(id)a3
{
  id v4 = -[TransparencyGPBCodedOutputStream initWithOutputStream:]( objc_alloc(&OBJC_CLASS___TransparencyGPBCodedOutputStream),  "initWithOutputStream:",  a3);
  -[TransparencyGPBMessage writeDelimitedToCodedOutputStream:](self, "writeDelimitedToCodedOutputStream:", v4);
}

- (void)writeDelimitedToCodedOutputStream:(id)a3
{
}

- (void)writeField:(id)a3 toCodedOutputStream:(id)a4
{
  unsigned int v7 = [a3 fieldType];
  if (v7
    || sub_100138364((uint64_t)self, *(_DWORD *)(*((void *)a3 + 1) + 20LL), *(_DWORD *)(*((void *)a3 + 1) + 16LL)))
  {
    uint64_t v8 = *((void *)a3 + 1);
    uint64_t v9 = *(unsigned int *)(v8 + 16);
    switch(*(_BYTE *)(v8 + 30))
    {
      case 0:
        if (v7 == 1)
        {
          else {
            uint64_t v10 = 0LL;
          }
          uint64_t v37 = sub_100137E7C((uint64_t)self, (uint64_t)a3);
          _[a4 writeBoolArray:v9 values:v37 tag:v10];
        }

        else
        {
          if (v7) {
            goto LABEL_92;
          }
          objc_msgSend(a4, "writeBool:value:", v9, sub_100138914((uint64_t)self, a3));
        }

        break;
      case 1:
        if (v7 == 1)
        {
          else {
            uint64_t v11 = 0LL;
          }
          objc_msgSend(a4, "writeFixed32Array:values:tag:", v9, sub_100137E7C((uint64_t)self, (uint64_t)a3), v11);
        }

        else
        {
          if (v7) {
            goto LABEL_92;
          }
          objc_msgSend(a4, "writeFixed32:value:", v9, sub_100138708((uint64_t)self, a3));
        }

        break;
      case 2:
        if (v7 == 1)
        {
          else {
            uint64_t v12 = 0LL;
          }
          uint64_t v38 = sub_100137E7C((uint64_t)self, (uint64_t)a3);
          _[a4 writeSFixed32Array:v9 values:v38 tag:v12];
        }

        else
        {
          if (v7) {
            goto LABEL_92;
          }
          id v28 = sub_100138708((uint64_t)self, a3);
          _objc_msgSend(a4, "writeSFixed32:value:", v9, v28, v50);
        }

        break;
      case 3:
        if (v7 == 1)
        {
          else {
            uint64_t v13 = 0LL;
          }
          uint64_t v39 = sub_100137E7C((uint64_t)self, (uint64_t)a3);
          _[a4 writeFloatArray:v9 values:v39 tag:v13];
        }

        else
        {
          if (v7) {
            goto LABEL_92;
          }
          *(float *)&double v29 = sub_100138C60((uint64_t)self, a3);
          [a4 writeFloat:v9 value:v29];
        }

        break;
      case 4:
        if (v7 == 1)
        {
          else {
            uint64_t v14 = 0LL;
          }
          objc_msgSend(a4, "writeFixed64Array:values:tag:", v9, sub_100137E7C((uint64_t)self, (uint64_t)a3), v14);
        }

        else
        {
          if (v7) {
            goto LABEL_92;
          }
          objc_msgSend(a4, "writeFixed64:value:", v9, sub_100138AF8((uint64_t)self, a3));
        }

        break;
      case 5:
        if (v7 == 1)
        {
          else {
            uint64_t v15 = 0LL;
          }
          uint64_t v40 = sub_100137E7C((uint64_t)self, (uint64_t)a3);
          _[a4 writeSFixed64Array:v9 values:v40 tag:v15];
        }

        else
        {
          if (v7) {
            goto LABEL_92;
          }
          id v30 = sub_100138AF8((uint64_t)self, a3);
          _objc_msgSend(a4, "writeSFixed64:value:", v9, v30, v51);
        }

        break;
      case 6:
        if (v7 == 1)
        {
          else {
            uint64_t v16 = 0LL;
          }
          uint64_t v41 = sub_100137E7C((uint64_t)self, (uint64_t)a3);
          _[a4 writeDoubleArray:v9 values:v41 tag:v16];
        }

        else
        {
          if (v7) {
            goto LABEL_92;
          }
          objc_msgSend(a4, "writeDouble:value:", v9, sub_100138DE0((uint64_t)self, a3));
        }

        break;
      case 7:
        if (v7 == 1)
        {
          else {
            uint64_t v17 = 0LL;
          }
          uint64_t v42 = sub_100137E7C((uint64_t)self, (uint64_t)a3);
          _[a4 writeInt32Array:v9 values:v42 tag:v17];
        }

        else
        {
          if (v7) {
            goto LABEL_92;
          }
          id v31 = sub_100138708((uint64_t)self, a3);
          _objc_msgSend(a4, "writeInt32:value:", v9, v31, v48);
        }

        break;
      case 8:
        if (v7 == 1)
        {
          else {
            uint64_t v18 = 0LL;
          }
          uint64_t v43 = sub_100137E7C((uint64_t)self, (uint64_t)a3);
          _[a4 writeInt64Array:v9 values:v43 tag:v18];
        }

        else
        {
          if (v7) {
            goto LABEL_92;
          }
          id v32 = sub_100138AF8((uint64_t)self, a3);
          _objc_msgSend(a4, "writeInt64:value:", v9, v32, v49);
        }

        break;
      case 9:
        if (v7 == 1)
        {
          else {
            uint64_t v19 = 0LL;
          }
          uint64_t v44 = sub_100137E7C((uint64_t)self, (uint64_t)a3);
          _[a4 writeSInt32Array:v9 values:v44 tag:v19];
        }

        else
        {
          if (v7) {
            goto LABEL_92;
          }
          id v33 = sub_100138708((uint64_t)self, a3);
          _objc_msgSend(a4, "writeSInt32:value:", v9, v33, v52);
        }

        break;
      case 0xA:
        if (v7 == 1)
        {
          else {
            uint64_t v20 = 0LL;
          }
          uint64_t v45 = sub_100137E7C((uint64_t)self, (uint64_t)a3);
          _[a4 writeSInt64Array:v9 values:v45 tag:v20];
        }

        else
        {
          if (v7) {
            goto LABEL_92;
          }
          id v34 = sub_100138AF8((uint64_t)self, a3);
          _objc_msgSend(a4, "writeSInt64:value:", v9, v34, v53);
        }

        break;
      case 0xB:
        if (v7 == 1)
        {
          else {
            uint64_t v21 = 0LL;
          }
          uint64_t v46 = sub_100137E7C((uint64_t)self, (uint64_t)a3);
          _[a4 writeUInt32Array:v9 values:v46 tag:v21];
        }

        else
        {
          if (v7) {
            goto LABEL_92;
          }
          objc_msgSend(a4, "writeUInt32:value:", v9, sub_100138708((uint64_t)self, a3));
        }

        break;
      case 0xC:
        if (v7 == 1)
        {
          else {
            uint64_t v22 = 0LL;
          }
          objc_msgSend(a4, "writeUInt64Array:values:tag:", v9, sub_100137E7C((uint64_t)self, (uint64_t)a3), v22);
        }

        else
        {
          if (v7) {
            goto LABEL_92;
          }
          objc_msgSend(a4, "writeUInt64:value:", v9, sub_100138AF8((uint64_t)self, a3));
        }

        break;
      case 0xD:
        char v23 = (void *)sub_100137E7C((uint64_t)self, (uint64_t)a3);
        if (v7 == 1)
        {
          [a4 writeBytesArray:v9 values:v23];
        }

        else
        {
          if (v7) {
            goto LABEL_88;
          }
          [a4 writeBytes:v9 value:v23];
        }

        break;
      case 0xE:
        char v23 = (void *)sub_100137E7C((uint64_t)self, (uint64_t)a3);
        if (v7 == 1)
        {
          _objc_msgSend(a4, "writeStringArray:values:", v9, v23, v24);
        }

        else
        {
          if (v7) {
            goto LABEL_88;
          }
          [a4 writeString:v9 value:v23];
        }

        break;
      case 0xF:
        char v23 = (void *)sub_100137E7C((uint64_t)self, (uint64_t)a3);
        if (v7 == 1)
        {
          _objc_msgSend(a4, "writeMessageArray:values:", v9, v23, v25);
        }

        else
        {
          if (v7) {
            goto LABEL_88;
          }
          [a4 writeMessage:v9 value:v23];
        }

        break;
      case 0x10:
        char v23 = (void *)sub_100137E7C((uint64_t)self, (uint64_t)a3);
        if (v7 == 1)
        {
          _objc_msgSend(a4, "writeGroupArray:values:", v9, v23, v26);
        }

        else if (v7)
        {
LABEL_88:
          if ([a3 mapKeyDataType] != 14)
          {
            __int128 v36 = v23;
            goto LABEL_93;
          }

          sub_100112510(a4, v23, (uint64_t)a3);
        }

        else
        {
          [a4 writeGroup:v9 value:v23];
        }

        break;
      case 0x11:
        if (v7 == 1)
        {
          else {
            uint64_t v27 = 0LL;
          }
          uint64_t v47 = sub_100137E7C((uint64_t)self, (uint64_t)a3);
          _[a4 writeEnumArray:v9 values:v47 tag:v27];
        }

        else if (v7)
        {
LABEL_92:
          __int128 v36 = (void *)sub_100137E7C((uint64_t)self, (uint64_t)a3);
LABEL_93:
          _objc_msgSend(v36, "writeToCodedOutputStream:asField:", a4, a3, v35);
        }

        else
        {
          objc_msgSend(a4, "writeEnum:value:", v9, sub_100138708((uint64_t)self, a3));
        }

        break;
      default:
        return;
    }
  }

- (id)getExtension:(id)a3
{
  uint64_t v5 = -[NSMutableDictionary objectForKey:](self->extensionMap_, "objectForKey:", a3);
  if (v5) {
    return v5;
  }
  if (*(unsigned __int8 *)(*((void *)a3 + 1) + 44LL) - 15 < 2)
  {
    os_unfair_lock_lock(&self->readOnlyLock_);
    uint64_t v5 = -[NSMutableDictionary objectForKey:](self->autocreatedExtensionMap_, "objectForKey:", a3);
    if (!v5)
    {
      uint64_t v5 = objc_alloc_init((Class)[a3 msgClass]);
      v5[4] = self;
      v5[6] = a3;
      autocreatedExtensionMap = self->autocreatedExtensionMap_;
      if (!autocreatedExtensionMap)
      {
        autocreatedExtensionMap = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        self->autocreatedExtensionMap_ = autocreatedExtensionMap;
      }

      -[NSMutableDictionary setObject:forKey:](autocreatedExtensionMap, "setObject:forKey:", v5, a3);
    }

    os_unfair_lock_unlock(&self->readOnlyLock_);
    return v5;
  }

  return [a3 defaultValue];
}

- (id)getExistingExtension:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->extensionMap_, "objectForKey:", a3);
}

- (BOOL)hasExtension:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->extensionMap_, "objectForKey:", a3) != 0LL;
}

- (id)extensionsCurrentlySet
{
  return -[NSMutableDictionary allKeys](self->extensionMap_, "allKeys");
}

- (void)writeExtensionsToCodedOutputStream:(id)a3 range:(TransparencyGPBExtensionRange)a4 sortedExtensions:(id)a5
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v9 = [a5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(a5);
        }
        uint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        unsigned int v14 = [v13 fieldNumber];
        if (v14 >= a4.var0)
        {
          if (v14 >= a4.var1) {
            return;
          }
          sub_10012CE18( (uint64_t)v13,  -[NSMutableDictionary objectForKey:](self->extensionMap_, "objectForKey:", v13),  a3);
        }
      }

      id v10 = [a5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v10);
  }

- (void)setExtension:(id)a3 value:(id)a4
{
  if (a4)
  {
    sub_100130414((uint64_t)self, a3);
    if ([a3 isRepeated]) {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"Must call addExtension() for repeated types.");
    }
    extensionMap = self->extensionMap_;
    if (!extensionMap)
    {
      extensionMap = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      self->extensionMap_ = extensionMap;
    }

    -[NSMutableDictionary setObject:forKey:](extensionMap, "setObject:forKey:", a4, a3);
    if (*(unsigned __int8 *)(*((void *)a3 + 1) + 44LL) - 15 <= 1
      && ([a3 isRepeated] & 1) == 0)
    {
      id v8 = -[NSMutableDictionary objectForKey:](self->autocreatedExtensionMap_, "objectForKey:", a3);
      -[NSMutableDictionary removeObjectForKey:](self->autocreatedExtensionMap_, "removeObjectForKey:", a3);
      sub_10012E124((uint64_t)v8);
    }

    sub_10012DE18(self);
  }

  else
  {
    -[TransparencyGPBMessage clearExtension:](self, "clearExtension:");
  }

- (void)addExtension:(id)a3 value:(id)a4
{
  if (([a3 isRepeated] & 1) == 0) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"Must call setExtension() for singular types.");
  }
  extensionMap = self->extensionMap_;
  if (!extensionMap)
  {
    extensionMap = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    self->extensionMap_ = extensionMap;
  }

  id v8 = -[NSMutableDictionary objectForKey:](extensionMap, "objectForKey:", a3);
  if (!v8)
  {
    id v8 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    -[NSMutableDictionary setObject:forKey:](self->extensionMap_, "setObject:forKey:", v8, a3);
  }

  [v8 addObject:a4];
  sub_10012DE18(self);
}

- (void)setExtension:(id)a3 index:(unint64_t)a4 value:(id)a5
{
  if (([a3 isRepeated] & 1) == 0) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"Must call setExtension() for singular types.");
  }
  extensionMap = self->extensionMap_;
  if (!extensionMap)
  {
    extensionMap = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    self->extensionMap_ = extensionMap;
  }

  objc_msgSend( -[NSMutableDictionary objectForKey:](extensionMap, "objectForKey:", a3),  "replaceObjectAtIndex:withObject:",  a4,  a5);
  sub_10012DE18(self);
}

- (void)clearExtension:(id)a3
{
  if (-[NSMutableDictionary objectForKey:](self->extensionMap_, "objectForKey:", a3))
  {
    -[NSMutableDictionary removeObjectForKey:](self->extensionMap_, "removeObjectForKey:", a3);
    sub_10012DE18(self);
  }

- (void)mergeFromData:(id)a3 extensionRegistry:(id)a4
{
  uint64_t v6 = -[TransparencyGPBCodedInputStream initWithData:]( objc_alloc(&OBJC_CLASS___TransparencyGPBCodedInputStream),  "initWithData:",  a3);
  -[TransparencyGPBMessage mergeFromCodedInputStream:extensionRegistry:]( self,  "mergeFromCodedInputStream:extensionRegistry:",  v6,  a4);
  -[TransparencyGPBCodedInputStream checkLastTagWas:](v6, "checkLastTagWas:", 0LL);
}

- (void)mergeDelimitedFromCodedInputStream:(id)a3 extensionRegistry:(id)a4
{
  uint64_t v6 = (uint64_t *)((char *)a3 + 8);
  if (!sub_10010BD9C((void *)a3 + 1))
  {
    unsigned int v7 = sub_10010C014(v6);
    if (v7)
    {
      id v8 = v7;
      -[TransparencyGPBMessage mergeFromData:extensionRegistry:](self, "mergeFromData:extensionRegistry:", v7, a4);
    }
  }

+ (id)parseFromData:(id)a3 error:(id *)a4
{
  return _[a1 parseFromData:a3 extensionRegistry:0 error:a4];
}

+ (id)parseFromData:(id)a3 extensionRegistry:(id)a4 error:(id *)a5
{
  return [objc_alloc((Class)a1) initWithData:a3 extensionRegistry:a4 error:a5];
}

+ (id)parseFromCodedInputStream:(id)a3 extensionRegistry:(id)a4 error:(id *)a5
{
  return [objc_alloc((Class)a1) initWithCodedInputStream:a3 extensionRegistry:a4 error:a5];
}

+ (id)parseDelimitedFromCodedInputStream:(id)a3 extensionRegistry:(id)a4 error:(id *)a5
{
  id v8 = objc_alloc_init((Class)a1);
  [v8 mergeDelimitedFromCodedInputStream:a3 extensionRegistry:a4];
  if (a5) {
    *a5 = 0LL;
  }
  return v8;
}

- (TransparencyGPBUnknownFieldSet)unknownFields
{
  return self->unknownFields_;
}

- (void)setUnknownFields:(id)a3
{
  unknownFields = self->unknownFields_;
  if (unknownFields != a3)
  {

    self->unknownFields_ = (TransparencyGPBUnknownFieldSet *)[a3 copy];
    sub_10012DE18(self);
  }

- (void)parseMessageSet:(id)a3 extensionRegistry:(id)a4
{
  unsigned int v7 = (uint64_t *)((char *)a3 + 8);
  uint64_t v8 = sub_10010BD0C((uint64_t)a3 + 8);
  if ((_DWORD)v8)
  {
    uint64_t v9 = v8;
    int v10 = sub_10013B0C8(2, 0);
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = 0LL;
    do
    {
      if ((_DWORD)v9 == v10)
      {
        uint64_t v11 = sub_10010BC2C(v7);
        if ((_DWORD)v11) {
          uint64_t v13 = objc_msgSend( a4,  "extensionForDescriptor:fieldNumber:",  -[TransparencyGPBMessage descriptor](self, "descriptor"),  v11);
        }
      }

      else if ((_DWORD)v9 == sub_10013B0C8(3, 2))
      {
        uint64_t v12 = sub_10010C014(v7);
      }

      else if (![a3 skipField:v9])
      {
        break;
      }

      uint64_t v9 = sub_10010BD0C((uint64_t)v7);
    }

    while ((_DWORD)v9);
  }

  else
  {
    uint64_t v13 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v11 = 0LL;
  }

  objc_msgSend(a3, "checkLastTagWas:", sub_10013B0C8(1, 4));
  if (v12 && (_DWORD)v11)
  {
    if (v13)
    {
      __int128 v15 = -[TransparencyGPBCodedInputStream initWithData:]( objc_alloc(&OBJC_CLASS___TransparencyGPBCodedInputStream),  "initWithData:",  v12);
      sub_100130CF4(v13, (int)[v13 isPackable], (uint64_t *)v15, (uint64_t)a4, self);
    }

    else
    {
      unsigned int v14 = (void *)sub_100130E98(self);
      _objc_msgSend( v14,  "mergeMessageSetMessage:data:",  v11,  +[NSData dataWithData:](NSData, "dataWithData:", v12));
    }
  }

- (BOOL)parseUnknownField:(id)a3 extensionRegistry:(id)a4 tag:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  int v9 = sub_10013B0D0(a5);
  int v10 = sub_10013B0D8(v5);
  id v11 = -[TransparencyGPBMessage descriptor](self, "descriptor");
  uint64_t v12 = [a4 extensionForDescriptor:v11 fieldNumber:v10];
  if (v12)
  {
    uint64_t v13 = v12;
    if ([v12 wireType] == v9)
    {
      unsigned int v14 = [v13 isPackable];
LABEL_4:
      sub_100130CF4(v13, v14, (uint64_t *)a3, (uint64_t)a4, self);
LABEL_8:
      LOBYTE(v15) = 1;
      return v15;
    }

    if ([v13 isRepeated]
      && *(unsigned __int8 *)(v13[1] + 44LL) - 13 >= 4
      && [v13 alternateWireType] == v9)
    {
      unsigned int v14 = [v13 isPackable] ^ 1;
      goto LABEL_4;
    }
  }

  else if ([v11 isWireFormat] && sub_10013B0C8(1, 3) == (_DWORD)v5)
  {
    -[TransparencyGPBMessage parseMessageSet:extensionRegistry:](self, "parseMessageSet:extensionRegistry:", a3, a4);
    goto LABEL_8;
  }

  unsigned int v15 = +[TransparencyGPBUnknownFieldSet isFieldTag:](&OBJC_CLASS___TransparencyGPBUnknownFieldSet, "isFieldTag:", v5);
  if (v15) {
    LOBYTE(v15) = [(id)sub_100130E98(self) mergeFieldFrom:v5 input:a3];
  }
  return v15;
}

- (void)addUnknownMapEntry:(int)a3 value:(id)a4
{
}

- (void)mergeFromCodedInputStream:(id)a3 extensionRegistry:(id)a4
{
  uint64_t v6 = (void *)*((void *)-[TransparencyGPBMessage descriptor](self, "descriptor") + 1);
  unsigned int v7 = (char *)[v6 count];
  uint64_t v8 = sub_10010BD0C((uint64_t)a3 + 8);
  if ((_DWORD)v8)
  {
    uint64_t v9 = v8;
    unint64_t v10 = 0LL;
    do
    {
      id v11 = v7;
      if (v7)
      {
        while (1)
        {
          uint64_t v12 = [v6 objectAtIndexedSubscript:v10];
          ++v10;
          if (!--v11)
          {
            uint64_t v13 = v7;
            while (1)
            {
              uint64_t v12 = [v6 objectAtIndexedSubscript:v10];
              if ([v12 fieldType] == 1
                && *(unsigned __int8 *)(v12[1] + 30LL) - 13 >= 4
                && sub_10011153C((uint64_t)v12) == (_DWORD)v9)
              {
                break;
              }

              ++v10;
              if (!--v13) {
                goto LABEL_15;
              }
            }

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = (void *)objc_opt_class(self, a2);
  unsigned int v7 = (void *)objc_opt_class(a3, v6);
  if (([v5 isSubclassOfClass:v7] & 1) == 0
    && ([v7 isSubclassOfClass:v5] & 1) == 0)
  {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"Classes must match %@ != %@",  v5,  v7);
  }

  sub_10012DE18(self);
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  uint64_t v9 = (void *)*((void *)objc_msgSend((id)objc_opt_class(self, v8), "descriptor") + 1);
  id v10 = [v9 countByEnumeratingWithState:&v66 objects:v72 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v67;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v67 != v12) {
          objc_enumerationMutation(v9);
        }
        unsigned int v14 = *(void **)(*((void *)&v66 + 1) + 8LL * (void)i);
        unsigned int v15 = [v14 fieldType];
        if (v15 == 1)
        {
          uint64_t v20 = sub_100137E7C((uint64_t)a3, (uint64_t)v14);
          if (v20)
          {
            uint64_t v21 = v20;
            int v22 = *(unsigned __int8 *)(v14[1] + 30LL);
            if ((v22 - 13) > 3)
            {
              id v28 = sub_1001320DC((uint64_t)self, v14);
              if (v22 == 17) {
                [v28 addRawValuesFromArray:v21];
              }
              else {
                [v28 addValuesFromArray:v21];
              }
            }

            else
            {
              objc_msgSend(sub_1001320DC((uint64_t)self, v14), "addObjectsFromArray:", v20);
            }
          }
        }

        else if (v15)
        {
          uint64_t v23 = sub_100137E7C((uint64_t)a3, (uint64_t)v14);
          if (!v23) {
            continue;
          }
          uint64_t v24 = v23;
          unsigned int v25 = [v14 mapKeyDataType];
          int v26 = *(unsigned __int8 *)(v14[1] + 30LL);
          if (v25 - 13 > 3 || (v26 - 13) > 3)
          {
            uint64_t v29 = sub_100131A00((uint64_t)self, v14);
            if (v26 == 17)
            {
              [v29 addRawEntriesFromDictionary:v24];
              continue;
            }
          }

          else
          {
            uint64_t v29 = sub_100131A00((uint64_t)self, v14);
          }

          [v29 addEntriesFromDictionary:v24];
        }

        else
        {
          uint64_t v16 = v14[1];
          int v18 = *(_DWORD *)(v16 + 16);
          unsigned int v17 = *(_DWORD *)(v16 + 20);
          if (sub_100138364((uint64_t)a3, v17, v18))
          {
            switch(*(_BYTE *)(v14[1] + 30LL))
            {
              case 0:
                BOOL v32 = sub_100138914((uint64_t)a3, v14);
                sub_1001389C8(self, (uint64_t)v14, v32);
                break;
              case 1:
              case 2:
              case 7:
              case 9:
              case 0xB:
              case 0x11:
                int v19 = sub_100138708((uint64_t)a3, v14);
                sub_100138828(self, (uint64_t)v14, v19);
                break;
              case 3:
                float v33 = sub_100138C60((uint64_t)a3, v14);
                sub_100138CF8(self, (uint64_t)v14, v33);
                break;
              case 4:
              case 5:
              case 8:
              case 0xA:
              case 0xC:
                id v30 = sub_100138AF8((uint64_t)a3, v14);
                sub_100138B7C(self, (uint64_t)v14, (uint64_t)v30);
                break;
              case 6:
                double v34 = sub_100138DE0((uint64_t)a3, v14);
                sub_100138E78(self, (uint64_t)v14, v34);
                break;
              case 0xD:
              case 0xE:
                id v31 = (void *)sub_100137E7C((uint64_t)a3, (uint64_t)v14);
                sub_100138468((uint64_t)self, v14, v31);
                break;
              case 0xF:
              case 0x10:
                id obj = (id)sub_100137E7C((uint64_t)a3, (uint64_t)v14);
                else {
                  sub_100138498((uint64_t)self, v14, [obj copy]);
                }
                break;
              default:
                continue;
            }
          }
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v66 objects:v72 count:16];
    }

    while (v11);
  }

  unknownFields = self->unknownFields_;
  id v36 = [a3 unknownFields];
  if (unknownFields) {
    -[TransparencyGPBUnknownFieldSet mergeUnknownFields:](unknownFields, "mergeUnknownFields:", v36);
  }
  else {
    -[TransparencyGPBMessage setUnknownFields:](self, "setUnknownFields:", v36);
  }
  if ([*((id *)a3 + 2) count])
  {
    if (!self->extensionMap_)
    {
      uint64_t v52 = (void *)*((void *)a3 + 2);
      uint64_t v53 = NSZoneFromPointer(self);
      self->extensionMap_ = sub_10012EA48(v52, (uint64_t)v53);
      return;
    }

    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    id obja = (id)*((void *)a3 + 2);
    id v37 = [obja countByEnumeratingWithState:&v62 objects:v71 count:16];
    if (!v37) {
      return;
    }
    id v38 = v37;
    uint64_t v39 = *(void *)v63;
    uint64_t v54 = *(void *)v63;
    do
    {
      uint64_t v40 = 0LL;
      id v55 = v38;
      do
      {
        if (*(void *)v63 != v39) {
          objc_enumerationMutation(obja);
        }
        uint64_t v41 = *(void **)(*((void *)&v62 + 1) + 8LL * (void)v40);
        id v42 = [*((id *)a3 + 2) objectForKey:v41];
        uint64_t v43 = (NSMutableArray *)-[NSMutableDictionary objectForKey:](self->extensionMap_, "objectForKey:", v41);
        unsigned int v44 = *(unsigned __int8 *)(v41[1] + 44LL) - 15;
        if ([v41 isRepeated])
        {
          if (!v43)
          {
            uint64_t v43 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            -[NSMutableDictionary setObject:forKey:](self->extensionMap_, "setObject:forKey:", v43, v41);
          }

          if (v44 > 1)
          {
            -[NSMutableArray addObjectsFromArray:](v43, "addObjectsFromArray:", v42);
            goto LABEL_69;
          }

          __int128 v60 = 0u;
          __int128 v61 = 0u;
          __int128 v58 = 0u;
          __int128 v59 = 0u;
          id v45 = [v42 countByEnumeratingWithState:&v58 objects:v70 count:16];
          if (v45)
          {
            id v46 = v45;
            uint64_t v47 = *(void *)v59;
            do
            {
              for (j = 0LL; j != v46; j = (char *)j + 1)
              {
                if (*(void *)v59 != v47) {
                  objc_enumerationMutation(v42);
                }
                id v49 = [*(id *)(*((void *)&v58 + 1) + 8 * (void)j) copy];
                -[NSMutableArray addObject:](v43, "addObject:", v49);
              }

              id v46 = [v42 countByEnumeratingWithState:&v58 objects:v70 count:16];
            }

            while (v46);
          }
        }

        else
        {
          if (v44 > 1)
          {
            -[NSMutableDictionary setObject:forKey:](self->extensionMap_, "setObject:forKey:", v42, v41);
            goto LABEL_69;
          }

          if (v43)
          {
            -[NSMutableArray mergeFrom:](v43, "mergeFrom:", v42);
          }

          else
          {
            id v50 = [v42 copy];
            -[NSMutableDictionary setObject:forKey:](self->extensionMap_, "setObject:forKey:", v50, v41);
          }
        }

        uint64_t v39 = v54;
        id v38 = v55;
        if (([v41 isRepeated] & 1) == 0)
        {
          id v51 = -[NSMutableDictionary objectForKey:](self->autocreatedExtensionMap_, "objectForKey:", v41);
          -[NSMutableDictionary removeObjectForKey:](self->autocreatedExtensionMap_, "removeObjectForKey:", v41);
          sub_10012E124((uint64_t)v51);
        }

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    goto LABEL_39;
  }
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TransparencyGPBMessage, a2);
  if ((objc_opt_isKindOfClass(a3, v5) & 1) == 0
    || (unsigned int v7 = objc_msgSend((id)objc_opt_class(self, v6), "descriptor"),
        objc_msgSend((id)objc_opt_class(a3, v8), "descriptor") != v7))
  {
LABEL_4:
    LOBYTE(v9) = 0;
    return v9;
  }

  uint64_t v31 = *((void *)a3 + 8);
  messageStorage = self->messageStorage_;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id obj = (id)v7[1];
  id v10 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v35;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v34 + 1) + 8LL * (void)v13);
        uint64_t v15 = *(void *)(v14 + 8);
        if ((*(_WORD *)(v15 + 28) & 0xF02) != 0)
        {
          uint64_t v16 = (void *)sub_100137E7C((uint64_t)self, *(void *)(*((void *)&v34 + 1) + 8LL * (void)v13));
          unsigned int v17 = (void *)sub_100137E7C((uint64_t)a3, v14);
          if ([v16 count] || objc_msgSend(v17, "count"))
          {
            int v18 = v16;
            int v19 = v17;
LABEL_14:
          }
        }

        else
        {
          int v21 = *(_DWORD *)(v15 + 16);
          unsigned int v20 = *(_DWORD *)(v15 + 20);
          int v22 = sub_100138364((uint64_t)self, v20, v21);
          int v23 = sub_100138364((uint64_t)a3, v20, v21);
          if (v22) {
            BOOL v24 = v23 == 0;
          }
          else {
            BOOL v24 = 1;
          }
          if (!v24)
          {
            uint64_t v25 = *(void *)(v14 + 8);
            uint64_t v26 = *(unsigned int *)(v25 + 24);
            switch(*(_BYTE *)(v25 + 30))
            {
              case 0:
                BOOL v27 = sub_100138364((uint64_t)self, *(_DWORD *)(v25 + 24), 0);
                goto LABEL_27;
              case 1:
              case 2:
              case 3:
              case 7:
              case 9:
              case 0xB:
              case 0x11:
                goto LABEL_27;
              case 4:
              case 5:
              case 6:
              case 8:
              case 0xA:
              case 0xC:
                goto LABEL_4;
              case 0xD:
              case 0xE:
              case 0xF:
              case 0x10:
                int v18 = *(void **)((char *)messageStorage + v26);
                int v19 = *(void **)(v31 + v26);
                goto LABEL_14;
              default:
                goto LABEL_27;
            }
          }

          if (v22 != v23) {
            goto LABEL_4;
          }
        }

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)objc_msgSend((id)objc_opt_class(self, a2), "descriptor");
  messageStorage = self->messageStorage_;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v4 = *(void **)(v3 + 8);
  id v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
        uint64_t v10 = *(void *)(v9 + 8);
        if ((*(_WORD *)(v10 + 28) & 0xF02) != 0)
        {
          id v11 = objc_msgSend( (id)sub_100137E7C((uint64_t)self, *(void *)(*((void *)&v18 + 1) + 8 * (void)i)),  "count");
          if (v11) {
            unint64_t v3 = (unint64_t)v11 + 361 * v3 + 19 * *(unsigned int *)(*(void *)(v9 + 8) + 16LL);
          }
        }

        else if (sub_100138364((uint64_t)self, *(_DWORD *)(v10 + 20), *(_DWORD *)(v10 + 16)))
        {
          uint64_t v12 = *(void *)(v9 + 8);
          uint64_t v13 = *(unsigned int *)(v12 + 24);
          switch(*(_BYTE *)(v12 + 30))
          {
            case 0:
              unint64_t v3 = 19 * v3 + sub_100138364((uint64_t)self, v13, 0);
              continue;
            case 1:
            case 2:
            case 3:
            case 7:
            case 9:
            case 0xB:
            case 0x11:
              uint64_t v14 = *(unsigned int *)((char *)messageStorage + v13);
              goto LABEL_13;
            case 4:
            case 5:
            case 6:
            case 8:
            case 0xA:
            case 0xC:
              uint64_t v14 = *(void *)((char *)messageStorage + v13);
LABEL_13:
              unint64_t v3 = v14 + 19 * v3;
              continue;
            case 0xD:
            case 0xE:
              id v15 = [*(id *)((char *)messageStorage + v13) hash];
              goto LABEL_16;
            case 0xF:
            case 0x10:
              unint64_t v3 = *(unsigned int *)(v12 + 16) + 19 * v3;
              id v15 = objc_msgSend((id)objc_opt_class(*(void *)((char *)messageStorage + v13), v13), "descriptor");
LABEL_16:
              unint64_t v3 = (unint64_t)v15 + 19 * v3;
              break;
            default:
              continue;
          }
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v6);
  }

  return v3;
}

- (id)description
{
  unint64_t v3 = sub_100139034(self, @"    ");
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p>: {\n%@}",  objc_opt_class(self, v4),  self,  v3);
}

- (unint64_t)serializedSize
{
  __int128 v99 = 0u;
  __int128 v100 = 0u;
  __int128 v101 = 0u;
  __int128 v102 = 0u;
  v57 = objc_msgSend((id)objc_opt_class(self, a2), "descriptor");
  unint64_t v3 = (void *)v57[1];
  uint64_t v4 = 0LL;
  id v5 = [v3 countByEnumeratingWithState:&v99 objects:v108 count:16];
  if (!v5) {
    goto LABEL_85;
  }
  uint64_t v60 = *(void *)v100;
  __int128 v58 = v3;
  do
  {
    id v6 = 0LL;
    id v59 = v5;
    do
    {
      if (*(void *)v100 != v60) {
        objc_enumerationMutation(v3);
      }
      uint64_t v7 = *(void **)(*((void *)&v99 + 1) + 8LL * (void)v6);
      unsigned int v8 = [v7 fieldType];
      uint64_t v9 = v7[1];
      int v10 = *(unsigned __int8 *)(v9 + 30);
      if (v8 == 1)
      {
        uint64_t v13 = (void *)sub_100137E7C((uint64_t)self, (uint64_t)v7);
        id v14 = [v13 count];
        if (v14)
        {
          uint64_t v95 = 0LL;
          v96 = &v95;
          uint64_t v97 = 0x2020000000LL;
          uint64_t v98 = 0LL;
          switch(v10)
          {
            case 0:
              v94[0] = _NSConcreteStackBlock;
              v94[1] = 3221225472LL;
              v94[2] = sub_100133250;
              v94[3] = &unk_100282AA8;
              v94[4] = &v95;
              [v13 enumerateValuesWithBlock:v94];
              break;
            case 1:
              v93[0] = _NSConcreteStackBlock;
              v93[1] = 3221225472LL;
              v93[2] = sub_100133288;
              v93[3] = &unk_100282A30;
              v93[4] = &v95;
              [v13 enumerateValuesWithBlock:v93];
              break;
            case 2:
              v92[0] = _NSConcreteStackBlock;
              v92[1] = 3221225472LL;
              v92[2] = sub_1001332C0;
              v92[3] = &unk_1002829B8;
              v92[4] = &v95;
              [v13 enumerateValuesWithBlock:v92];
              break;
            case 3:
              v91[0] = _NSConcreteStackBlock;
              v91[1] = 3221225472LL;
              v91[2] = sub_1001332F8;
              v91[3] = &unk_100282850;
              v91[4] = &v95;
              [v13 enumerateValuesWithBlock:v91];
              break;
            case 4:
              v90[0] = _NSConcreteStackBlock;
              v90[1] = 3221225472LL;
              v90[2] = sub_10013332C;
              v90[3] = &unk_1002828C8;
              v90[4] = &v95;
              [v13 enumerateValuesWithBlock:v90];
              break;
            case 5:
              v89[0] = _NSConcreteStackBlock;
              v89[1] = 3221225472LL;
              v89[2] = sub_100133364;
              v89[3] = &unk_100282940;
              v89[4] = &v95;
              [v13 enumerateValuesWithBlock:v89];
              break;
            case 6:
              v88[0] = _NSConcreteStackBlock;
              v88[1] = 3221225472LL;
              v88[2] = sub_10013339C;
              v88[3] = &unk_1002827D8;
              v88[4] = &v95;
              [v13 enumerateValuesWithBlock:v88];
              break;
            case 7:
              v87[0] = _NSConcreteStackBlock;
              v87[1] = 3221225472LL;
              v87[2] = sub_1001333D0;
              v87[3] = &unk_1002829B8;
              v87[4] = &v95;
              [v13 enumerateValuesWithBlock:v87];
              break;
            case 8:
              v86[0] = _NSConcreteStackBlock;
              v86[1] = 3221225472LL;
              v86[2] = sub_100133408;
              v86[3] = &unk_100282940;
              v86[4] = &v95;
              [v13 enumerateValuesWithBlock:v86];
              break;
            case 9:
              v85[0] = _NSConcreteStackBlock;
              v85[1] = 3221225472LL;
              v85[2] = sub_100133440;
              v85[3] = &unk_1002829B8;
              v85[4] = &v95;
              [v13 enumerateValuesWithBlock:v85];
              break;
            case 10:
              v84[0] = _NSConcreteStackBlock;
              v84[1] = 3221225472LL;
              v84[2] = sub_100133478;
              v84[3] = &unk_100282940;
              v84[4] = &v95;
              [v13 enumerateValuesWithBlock:v84];
              break;
            case 11:
              v83[0] = _NSConcreteStackBlock;
              v83[1] = 3221225472LL;
              v83[2] = sub_1001334B0;
              v83[3] = &unk_100282A30;
              v83[4] = &v95;
              [v13 enumerateValuesWithBlock:v83];
              break;
            case 12:
              v82[0] = _NSConcreteStackBlock;
              v82[1] = 3221225472LL;
              v82[2] = sub_1001334E8;
              v82[3] = &unk_1002828C8;
              v82[4] = &v95;
              [v13 enumerateValuesWithBlock:v82];
              break;
            case 13:
              __int128 v80 = 0u;
              __int128 v81 = 0u;
              __int128 v78 = 0u;
              __int128 v79 = 0u;
              id v16 = [v13 countByEnumeratingWithState:&v78 objects:v107 count:16];
              if (v16)
              {
                uint64_t v17 = *(void *)v79;
                do
                {
                  for (i = 0LL; i != v16; i = (char *)i + 1)
                  {
                    if (*(void *)v79 != v17) {
                      objc_enumerationMutation(v13);
                    }
                    __int128 v19 = sub_10010F87C(*(void **)(*((void *)&v78 + 1) + 8LL * (void)i));
                    v96[3] += (uint64_t)v19;
                  }

                  id v16 = [v13 countByEnumeratingWithState:&v78 objects:v107 count:16];
                }

                while (v16);
              }

              break;
            case 14:
              __int128 v76 = 0u;
              __int128 v77 = 0u;
              __int128 v74 = 0u;
              __int128 v75 = 0u;
              id v20 = [v13 countByEnumeratingWithState:&v74 objects:v106 count:16];
              if (v20)
              {
                uint64_t v21 = *(void *)v75;
                do
                {
                  for (j = 0LL; j != v20; j = (char *)j + 1)
                  {
                    if (*(void *)v75 != v21) {
                      objc_enumerationMutation(v13);
                    }
                    int v23 = sub_10010F7DC(*(void **)(*((void *)&v74 + 1) + 8LL * (void)j));
                    v96[3] += (uint64_t)v23;
                  }

                  id v20 = [v13 countByEnumeratingWithState:&v74 objects:v106 count:16];
                }

                while (v20);
              }

              break;
            case 15:
              __int128 v72 = 0u;
              __int128 v73 = 0u;
              __int128 v70 = 0u;
              __int128 v71 = 0u;
              id v24 = [v13 countByEnumeratingWithState:&v70 objects:v105 count:16];
              if (v24)
              {
                uint64_t v25 = *(void *)v71;
                do
                {
                  for (k = 0LL; k != v24; k = (char *)k + 1)
                  {
                    if (*(void *)v71 != v25) {
                      objc_enumerationMutation(v13);
                    }
                    BOOL v27 = sub_10010F830(*(void **)(*((void *)&v70 + 1) + 8LL * (void)k));
                    v96[3] += (uint64_t)v27;
                  }

                  id v24 = [v13 countByEnumeratingWithState:&v70 objects:v105 count:16];
                }

                while (v24);
              }

              break;
            case 16:
              __int128 v68 = 0u;
              __int128 v69 = 0u;
              __int128 v66 = 0u;
              __int128 v67 = 0u;
              id v28 = [v13 countByEnumeratingWithState:&v66 objects:v104 count:16];
              if (v28)
              {
                uint64_t v29 = *(void *)v67;
                do
                {
                  for (m = 0LL; m != v28; m = (char *)m + 1)
                  {
                    if (*(void *)v67 != v29) {
                      objc_enumerationMutation(v13);
                    }
                    id v31 = [*(id *)(*((void *)&v66 + 1) + 8 * (void)m) serializedSize];
                    v96[3] += (uint64_t)v31;
                  }

                  id v28 = [v13 countByEnumeratingWithState:&v66 objects:v104 count:16];
                }

                while (v28);
              }

              break;
            case 17:
              v65[0] = _NSConcreteStackBlock;
              v65[1] = 3221225472LL;
              v65[2] = sub_100133520;
              v65[3] = &unk_1002829B8;
              v65[4] = &v95;
              [v13 enumerateRawValuesWithBlock:v65];
              break;
            default:
              break;
          }

          uint64_t v32 = v96[3];
          uint64_t v33 = sub_10010F914(*(_DWORD *)(v7[1] + 16LL));
          unsigned int v34 = [v7 isPackable];
          uint64_t v35 = v32 + v4;
          uint64_t v36 = v33 << (v10 == 16);
          if (v34) {
            uint64_t v4 = v36 + v35 + sub_10010DEF8(v96[3]);
          }
          else {
            uint64_t v4 = v35 + v36 * (void)v14;
          }
          unint64_t v3 = v58;
          id v5 = v59;
          _Block_object_dispose(&v95, 8);
        }
      }

      else if (v8)
      {
        if ((v10 - 13) <= 3 && [v7 mapKeyDataType] == 14)
        {
          id v15 = (void *)sub_100137E7C((uint64_t)self, (uint64_t)v7);
          if (!v15) {
            goto LABEL_69;
          }
          uint64_t v12 = sub_1001123E8(v15, (uint64_t)v7);
        }

        else
        {
          uint64_t v12 = (uint64_t)objc_msgSend( (id)sub_100137E7C((uint64_t)self, (uint64_t)v7),  "computeSerializedSizeAsField:",  v7);
        }

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  id v5 = [a1 descriptor];
  if (!v5)
  {
    v45.receiver = a1;
    v45.super_class = (Class)&OBJC_METACLASS___TransparencyGPBMessage;
    return objc_msgSendSuper2(&v45, "resolveInstanceMethod:", a3);
  }

  name = a3;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id v30 = v5;
  id v6 = (void *)*((void *)v5 + 1);
  id v7 = [v6 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (!v7)
  {
LABEL_73:
    v32.receiver = a1;
    v32.super_class = (Class)&OBJC_METACLASS___TransparencyGPBMessage;
    return objc_msgSendSuper2(&v32, "resolveInstanceMethod:", name);
  }

  id v8 = v7;
  uint64_t v9 = *(void *)v42;
LABEL_4:
  uint64_t v10 = 0LL;
  int v11 = name;
  while (1)
  {
    if (*(void *)v42 != v9)
    {
      objc_enumerationMutation(v6);
      int v11 = name;
    }

    uint64_t v12 = *(void ***)(*((void *)&v41 + 1) + 8 * v10);
    uint64_t v13 = (int32x2_t *)v12[1];
    id v14 = (const char *)v12[3];
    if ((v13[3].i16[2] & 0xF02) == 0) {
      break;
    }
    if (v14 == v11)
    {
      if ([*(id *)(*((void *)&v41 + 1) + 8 * v10) fieldType] == 1)
      {
        uint64_t v36 = _NSConcreteStackBlock;
        uint64_t v17 = (void **)sub_100134080;
        __int128 v18 = &v36;
      }

      else
      {
        uint64_t v35 = _NSConcreteStackBlock;
        uint64_t v17 = (void **)sub_100134130;
        __int128 v18 = &v35;
      }

      v18[1] = (void **)3221225472LL;
      v18[2] = v17;
      v18[3] = (void **)&unk_1002831F0;
      v18[4] = v12;
      __int128 v19 = imp_implementationWithBlock(v18);
      id v20 = "getArray";
      goto LABEL_70;
    }

    if (v12[4] == v11)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100134204;
      block[3] = &unk_100283210;
      block[4] = v12;
      __int128 v19 = imp_implementationWithBlock(block);
      id v20 = "setArray:";
      goto LABEL_70;
    }

    if (v12[5] == v11)
    {
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      v33[2] = sub_100134214;
      v33[3] = &unk_100283230;
      v33[4] = v12;
      __int128 v19 = imp_implementationWithBlock(v33);
      id v20 = "getArrayCount";
      goto LABEL_70;
    }

+ (BOOL)resolveClassMethod:(SEL)a3
{
  if ((sub_1001350D0((objc_class *)a1, a3) & 1) != 0) {
    return 1;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___TransparencyGPBMessage;
  return objc_msgSendSuper2(&v6, "resolveClassMethod:", a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TransparencyGPBMessage)initWithCoder:(id)a3
{
  id v5 = -[TransparencyGPBMessage init](self, "init");
  if (v5)
  {
    id v6 = objc_msgSend( a3,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSData, v4),  @"TransparencyGPBData");
    if ([v6 length]) {
      -[TransparencyGPBMessage mergeFromData:extensionRegistry:](v5, "mergeFromData:extensionRegistry:", v6, 0LL);
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = -[TransparencyGPBMessage data](self, "data");
  if ([v4 length]) {
    [a3 encodeObject:v4 forKey:@"TransparencyGPBData"];
  }
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

@end