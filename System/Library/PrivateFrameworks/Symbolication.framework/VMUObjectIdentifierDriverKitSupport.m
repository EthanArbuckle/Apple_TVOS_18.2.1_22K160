@interface VMUObjectIdentifierDriverKitSupport
- (VMUObjectIdentifierDriverKitSupport)initWithObjectIdentifier:(id)a3;
- (id)_fieldsFromStructureLayout:(id *)a3 withOffset:(unint64_t)a4;
- (id)_fieldsOfLegacyOSObject:(id)a3;
- (id)_fieldsOfLocalDriverKitOSObject:(id)a3;
- (id)_fieldsOfOSObject:(id)a3 startOffset:(unint64_t)a4;
- (id)_fieldsOfRemoteDriverKitOSObject:(id)a3;
- (id)_labelForDriverKitOSClassLoadInformation:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)_labelForDriverKitOSMetaClass:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)classInfoForDriverKitMemory:(void *)a3 length:(unint64_t)a4 atOffset:(unint64_t)a5 translatedIsa:(unint64_t)a6 symbol:(_CSTypeRef)a7;
- (id)classInfoForDriverKitOSClassScan;
- (id)classInfoForDriverKitOSMetaClass;
- (id)classInfoForDriverKitOSMetaClassPrivate;
- (id)driverKitClassInfoForMemory:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5;
- (id)labelForDriverKitMemory:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5 class:(id)a6;
- (void)dealloc;
@end

@implementation VMUObjectIdentifierDriverKitSupport

- (VMUObjectIdentifierDriverKitSupport)initWithObjectIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 taskIsDriverKit])
  {
    v23.receiver = self;
    v23.super_class = (Class)&OBJC_CLASS___VMUObjectIdentifierDriverKitSupport;
    v5 = -[VMUObjectIdentifierDriverKitSupport init](&v23, sel_init);
    v6 = v5;
    if (v5)
    {
      objc_storeWeak((id *)&v5->_objectIdentifier, v4);
      [v4 scanner];
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_task = [v7 task];

      [v4 symbolicator];
      uint64_t SymbolOwnerWithNameAtTime = CSSymbolicatorGetSymbolOwnerWithNameAtTime();
      uint64_t v10 = v9;
      [v4 memoryReader];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t StructureLayoutDescription = getStructureLayoutDescription( SymbolOwnerWithNameAtTime,  v10,  (uint64_t)"gOSMetaClassBasePrivateLayout",  v11);

      [v4 memoryReader];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = getStructureLayoutDescription( SymbolOwnerWithNameAtTime,  v10,  (uint64_t)"gOSMetaClassBaseRemotePrivateLayout",  v13);

      if (StructureLayoutDescription)
      {
        v6->_vtableOffsetOfLocalDriverKitOSObject = *(void *)(StructureLayoutDescription + 24);
        uint64_t v15 = -[VMUObjectIdentifierDriverKitSupport _fieldsFromStructureLayout:withOffset:]( v6,  "_fieldsFromStructureLayout:withOffset:",  StructureLayoutDescription,  0LL);
        privateFieldsOfLocalDriverKitOSObject = v6->_privateFieldsOfLocalDriverKitOSObject;
        v6->_privateFieldsOfLocalDriverKitOSObject = (NSArray *)v15;

        if (v14)
        {
          v6->_vtableOffsetOfRemoteDriverKitOSObject = *(void *)(StructureLayoutDescription + 24)
                                                     + *(void *)(v14 + 24);
          -[VMUObjectIdentifierDriverKitSupport _fieldsFromStructureLayout:withOffset:]( v6,  "_fieldsFromStructureLayout:withOffset:",  v14,  0LL);
          v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
          v18 = -[VMUObjectIdentifierDriverKitSupport _fieldsFromStructureLayout:withOffset:]( v6,  "_fieldsFromStructureLayout:withOffset:",  StructureLayoutDescription,  *(void *)(v14 + 24));
          -[NSArray addObjectsFromArray:](v17, "addObjectsFromArray:", v18);

          privateFieldsOfRemoteDriverKitOSObject = v6->_privateFieldsOfRemoteDriverKitOSObject;
          v6->_privateFieldsOfRemoteDriverKitOSObject = v17;
        }
      }

      else
      {
        v6->_vtableOffsetOfLegacyOSObject = 88LL;
      }

      v6->_vtableOffsetsCount = 3;
      v21 = (unint64_t *)malloc(0x18uLL);
      v6->_vtableOffsets = v21;
      unint64_t *v21 = v6->_vtableOffsetOfRemoteDriverKitOSObject;
      v21[1] = v6->_vtableOffsetOfLocalDriverKitOSObject;
      v21[2] = v6->_vtableOffsetOfLegacyOSObject;
    }

    self = v6;
    v20 = self;
  }

  else
  {
    v20 = 0LL;
  }

  return v20;
}

- (void)dealloc
{
  vtableOffsets = self->_vtableOffsets;
  if (vtableOffsets) {
    free(vtableOffsets);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___VMUObjectIdentifierDriverKitSupport;
  -[VMUObjectIdentifierDriverKitSupport dealloc](&v4, sel_dealloc);
}

- (id)_fieldsFromStructureLayout:(id *)a3 withOffset:(unint64_t)a4
{
  int v4 = a4;
  v7 = (void *)objc_opt_new();
  unint64_t var4 = a3->var4;
  if (var4)
  {
    var5 = a3->var5;
    do
    {
      mach_vm_address_t v10 = task_peek_string(self->_task, (mach_vm_address_t)var5->var0);
      mach_vm_address_t v11 = task_peek_string(self->_task, (mach_vm_address_t)var5->var1);
      v12 = objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo);
      [NSString stringWithUTF8String:v10];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      [NSString stringWithUTF8String:v11];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( v12,  "initWithName:type:scan:offset:size:",  v13,  v14,  1LL,  (LODWORD(var5->var2) + v4),  LODWORD(var5->var3));

      [v7 addObject:v15];
      ++var5;
      --var4;
    }

    while (var4);
  }

  return v7;
}

- (id)_fieldsOfLegacyOSObject:(id)a3
{
  v29[19] = *MEMORY[0x1895F89C0];
  id v3 = a3;
  uint64_t v4 = [v3 pointerSize];
  v28 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo),  "initWithName:type:scan:offset:size:",  @"server",  @"^{IOUserServer_IVars}",  1LL,  0LL,  v4);
  v25 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo),  "initWithName:type:scan:offset:size:",  @"objectRefsListEntryNext",  @"^v",  4LL,  8LL,  v4);
  v24 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo),  "initWithName:type:scan:offset:size:",  @"objectRefsListEntryPrev",  @"^v",  4LL,  16LL,  v4);
  v27 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo),  "initWithName:type:scan:offset:size:",  @"objectRef",  @"Q",  0LL,  24LL,  8LL);
  v26 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo),  "initWithName:type:scan:offset:size:",  @"flags",  @"Q",  0LL,  32LL,  8LL);
  v20 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo),  "initWithName:type:scan:offset:size:",  @"sendRights",  @"L",  0LL,  40LL,  4LL);
  objc_super v23 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo),  "initWithName:type:scan:offset:size:",  @"remoteQueueCount",  @"L",  0LL,  44LL,  4LL);
  v19 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo),  "initWithName:type:scan:offset:size:",  @"remoteMethodsCount",  @"L",  0LL,  48LL,  4LL);
  v22 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo),  "initWithName:type:scan:offset:size:",  @"remoteQueues",  @"^Q",  1LL,  56LL,  v4);
  v21 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo),  "initWithName:type:scan:offset:size:",  @"remoteMethods",  @"^Q",  1LL,  64LL,  v4);
  v5 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo),  "initWithName:type:scan:offset:size:",  @"queueAlloc",  @"L",  0LL,  72LL,  4LL);
  v6 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo),  "initWithName:type:scan:offset:size:",  @"queueArray",  @"^@\"IODispatchQueue\"",  1LL,  80LL,  v4);
  v18 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo),  "initWithName:type:scan:offset:size:",  @"vtable",  @"^",  0LL,  88LL,  v4);
  v17 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo),  "initWithName:type:scan:offset:size:",  @"refcount",  @"l",  0LL,  96LL,  4LL);
  v7 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo),  "initWithName:type:scan:offset:size:",  @"reserved",  @"l",  0LL,  100LL,  4LL);
  v8 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo),  "initWithName:type:scan:offset:size:",  @"meta",  @"@",  1LL,  104LL,  v4);
  v16 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo),  "initWithName:type:scan:offset:size:",  @"metaClassPrivate",  @"^{OSMetaClassPrivate}",  1LL,  112LL,  v4);
  uint64_t v15 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo),  "initWithName:type:scan:offset:size:",  @"retainCount",  @"i",  0LL,  120LL,  4LL);
  uint64_t v9 = (void *)NSString;
  [v3 className];
  mach_vm_address_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  [v9 stringWithFormat:@"^{%@_IVars}", v10];
  mach_vm_address_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo),  "initWithName:type:scan:offset:size:",  @"ivars",  v11,  1LL,  128LL,  v4);
  v29[0] = v28;
  v29[1] = v25;
  v29[2] = v24;
  v29[3] = v27;
  v29[4] = v26;
  v29[5] = v20;
  v29[6] = v23;
  v29[7] = v19;
  v29[8] = v22;
  v29[9] = v21;
  v29[10] = v5;
  v29[11] = v6;
  v29[12] = v18;
  v29[13] = v17;
  v29[14] = v7;
  v29[15] = v8;
  v29[16] = v16;
  v29[17] = v15;
  v29[18] = v12;
  [MEMORY[0x189603F18] arrayWithObjects:v29 count:19];
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_fieldsOfOSObject:(id)a3 startOffset:(unint64_t)a4
{
  v19[7] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  uint64_t v6 = [v5 pointerSize];
  v18 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo),  "initWithName:type:scan:offset:size:",  @"vtable",  @"^",  0LL,  a4,  v6);
  v17 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo),  "initWithName:type:scan:offset:size:",  @"refcount",  @"l",  0LL,  (a4 + 8),  4LL);
  v7 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo),  "initWithName:type:scan:offset:size:",  @"reserved",  @"l",  0LL,  (a4 + 12),  4LL);
  v8 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo),  "initWithName:type:scan:offset:size:",  @"meta",  @"@",  1LL,  (a4 + 16),  v6);
  uint64_t v9 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo),  "initWithName:type:scan:offset:size:",  @"metaClassPrivate",  @"^{OSMetaClassPrivate}",  1LL,  (a4 + 24),  v6);
  mach_vm_address_t v10 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo),  "initWithName:type:scan:offset:size:",  @"extra",  @"i",  0LL,  (a4 + 32),  4LL);
  mach_vm_address_t v11 = (void *)NSString;
  [v5 displayName];
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  [v11 stringWithFormat:@"^{%@_IVars}", v12];
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  id v14 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo),  "initWithName:type:scan:offset:size:",  @"ivars",  v13,  1LL,  (a4 + 40),  v6);
  v19[0] = v18;
  v19[1] = v17;
  v19[2] = v7;
  v19[3] = v8;
  v19[4] = v9;
  v19[5] = v10;
  v19[6] = v14;
  [MEMORY[0x189603F18] arrayWithObjects:v19 count:7];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_fieldsOfRemoteDriverKitOSObject:(id)a3
{
  unint64_t vtableOffsetOfRemoteDriverKitOSObject = self->_vtableOffsetOfRemoteDriverKitOSObject;
  uint64_t v6 = self->_privateFieldsOfRemoteDriverKitOSObject;
  v7 = -[VMUObjectIdentifierDriverKitSupport _fieldsOfOSObject:startOffset:]( self,  "_fieldsOfOSObject:startOffset:",  a3,  vtableOffsetOfRemoteDriverKitOSObject);
  v8 = -[NSArray arrayByAddingObjectsFromArray:](v6, "arrayByAddingObjectsFromArray:", v7);
  return v8;
}

- (id)_fieldsOfLocalDriverKitOSObject:(id)a3
{
  unint64_t vtableOffsetOfLocalDriverKitOSObject = self->_vtableOffsetOfLocalDriverKitOSObject;
  uint64_t v6 = self->_privateFieldsOfLocalDriverKitOSObject;
  v7 = -[VMUObjectIdentifierDriverKitSupport _fieldsOfOSObject:startOffset:]( self,  "_fieldsOfOSObject:startOffset:",  a3,  vtableOffsetOfLocalDriverKitOSObject);
  v8 = -[NSArray arrayByAddingObjectsFromArray:](v6, "arrayByAddingObjectsFromArray:", v7);
  return v8;
}

- (id)classInfoForDriverKitOSClassScan
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_objectIdentifier);
  [WeakRetained classInfoWithNonobjectType:@"struct OSClassScan" binaryPath:@"DriverKit"];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)classInfoForDriverKitOSMetaClassPrivate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_objectIdentifier);
  [WeakRetained classInfoWithNonobjectType:@"struct OSMetaClassPrivate" binaryPath:@"DriverKit"];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)classInfoForDriverKitOSMetaClass
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_objectIdentifier);
  [WeakRetained classInfoWithNonobjectType:@"OSMetaClass" binaryPath:@"DriverKit"];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)classInfoForDriverKitMemory:(void *)a3 length:(unint64_t)a4 atOffset:(unint64_t)a5 translatedIsa:(unint64_t)a6 symbol:(_CSTypeRef)a7
{
  Name = (const char *)CSSymbolGetName();
  if (!Name) {
    goto LABEL_4;
  }
  mach_vm_address_t v11 = Name;
  if (!strncmp(Name, "vtable for ", 0xBuLL))
  {
    [NSString stringWithUTF8String:v11 + 11];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v13 hasSuffix:@"MetaClass"])
    {
      v12 = -[VMUObjectIdentifierDriverKitSupport classInfoForDriverKitOSMetaClass](self, "classInfoForDriverKitOSMetaClass");
    }

    else
    {
      if (a5)
      {
        CSSymbolGetSymbolOwner();
        [NSString stringWithUTF8String:CSSymbolOwnerGetPath()];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = +[VMUClassInfo classInfoWithClassName:binaryPath:type:]( &OBJC_CLASS___VMUMutableClassInfo,  "classInfoWithClassName:binaryPath:type:",  v13,  v14,  128LL);
        if (self->_vtableOffsetOfRemoteDriverKitOSObject == a5)
        {
          uint64_t v15 = -[VMUObjectIdentifierDriverKitSupport _fieldsOfRemoteDriverKitOSObject:]( self,  "_fieldsOfRemoteDriverKitOSObject:",  v12);
        }

        else if (self->_vtableOffsetOfLocalDriverKitOSObject == a5)
        {
          uint64_t v15 = -[VMUObjectIdentifierDriverKitSupport _fieldsOfLocalDriverKitOSObject:]( self,  "_fieldsOfLocalDriverKitOSObject:",  v12);
        }

        else
        {
          if (self->_vtableOffsetOfLegacyOSObject != a5) {
            goto LABEL_22;
          }
          uint64_t v15 = -[VMUObjectIdentifierDriverKitSupport _fieldsOfLegacyOSObject:](self, "_fieldsOfLegacyOSObject:", v12);
        }

        v16 = (void *)v15;
        if (v15)
        {
          [v12 setFields:v15];
        }

        goto LABEL_22;
      }

      v12 = 0LL;
    }

- (id)driverKitClassInfoForMemory:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  unint64_t vtableOffsetsCount = self->_vtableOffsetsCount;
  if ((_DWORD)vtableOffsetsCount)
  {
    unint64_t v10 = 0LL;
    p_objectIdentifier = &self->_objectIdentifier;
    do
    {
      unint64_t v12 = self->_vtableOffsets[v10];
      if (v12 + 8 <= a4)
      {
        id WeakRetained = objc_loadWeakRetained((id *)p_objectIdentifier);
        [WeakRetained _classInfoForMemory:a3 length:a4 atOffset:v12 remoteAddress:a5];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14) {
          return v14;
        }
        unint64_t vtableOffsetsCount = self->_vtableOffsetsCount;
      }

      ++v10;
    }

    while (v10 < vtableOffsetsCount);
  }

  id v14 = 0LL;
  return v14;
}

- (id)_labelForDriverKitOSClassLoadInformation:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  if (HIDWORD(*(void *)a3)) {
    BOOL v5 = (*(void *)a3 & 7LL) == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5
    && (id WeakRetained = objc_loadWeakRetained((id *)&self->_objectIdentifier),
        [WeakRetained symbolicator],
        CSSymbolicatorGetSymbolWithAddressAtTime(),
        WeakRetained,
        (CSIsNull() & 1) == 0))
  {
    Name = (void *)CSSymbolGetName();
    if (Name)
    {
      [NSString stringWithUTF8String:Name];
      Name = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    Name = 0LL;
  }

  return Name;
}

- (id)_labelForDriverKitOSMetaClass:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  if (self->_vtableOffsetsCount)
  {
    uint64_t v7 = 0LL;
    p_objectIdentifier = &self->_objectIdentifier;
    while (1)
    {
      if (HIDWORD(*(void *)((char *)a3 + self->_vtableOffsets[v7]))
        && (*(void *)((_BYTE *)a3 + self->_vtableOffsets[v7]) & 7LL) == 0)
      {
        id WeakRetained = objc_loadWeakRetained((id *)p_objectIdentifier);
        [WeakRetained symbolicator];
        CSSymbolicatorGetSymbolWithAddressAtTime();

        if ((CSIsNull() & 1) == 0)
        {
          Name = (const char *)CSSymbolGetName();
          if (Name)
          {
            unint64_t v12 = Name;
            if (!strncmp(Name, "vtable for ", 0xBuLL)) {
              break;
            }
          }
        }
      }
    }

    [NSString stringWithUTF8String:v12 + 11];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
LABEL_12:
    v13 = 0LL;
  }

  return v13;
}

- (id)labelForDriverKitMemory:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5 class:(id)a6
{
  id v10 = a6;
  [v10 className];
  mach_vm_address_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v11 isEqualToString:@"struct OSClassScan"])
  {

LABEL_4:
    uint64_t v14 = -[VMUObjectIdentifierDriverKitSupport _labelForDriverKitOSClassLoadInformation:length:remoteAddress:]( self,  "_labelForDriverKitOSClassLoadInformation:length:remoteAddress:",  a3,  a4,  a5);
    goto LABEL_5;
  }

  [v10 className];
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  int v13 = [v12 isEqualToString:@"struct OSMetaClassPrivate"];

  if (v13) {
    goto LABEL_4;
  }
  [v10 className];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  int v18 = [v17 isEqualToString:@"OSMetaClass"];

  if (!v18)
  {
    uint64_t v15 = 0LL;
    goto LABEL_6;
  }

  uint64_t v14 = -[VMUObjectIdentifierDriverKitSupport _labelForDriverKitOSMetaClass:length:remoteAddress:]( self,  "_labelForDriverKitOSMetaClass:length:remoteAddress:",  a3,  a4,  a5);
LABEL_5:
  uint64_t v15 = (void *)v14;
LABEL_6:

  return v15;
}

- (void).cxx_destruct
{
}

@end