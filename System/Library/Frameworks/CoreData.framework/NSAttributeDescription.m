@interface NSAttributeDescription
+ (BOOL)supportsSecureCoding;
+ (NSString)_classNameForType:(uint64_t)a1;
+ (id)stringForAttributeType:(unint64_t)a3;
+ (void)initialize;
- (BOOL)_attributeTypeIsSchemaEqual:(unint64_t)a3;
- (BOOL)_comparePredicatesAndWarnings:(id)a3;
- (BOOL)_epsilonEquals:(id)a3 rhs:(id)a4 withFlags:(int)a5;
- (BOOL)_isAttribute;
- (BOOL)_isEqual:(id)a3 skipIndexCheck:(BOOL)a4;
- (BOOL)_isEqualWithoutIndex:(id)a3;
- (BOOL)_isSchemaEqual:(id)a3;
- (BOOL)_nonPredicateValidateValue:(id *)a3 forKey:(id)a4 inObject:(id)a5 error:(id *)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIndexed;
- (BOOL)usesMergeableStorage;
- (Class)_attributeValueClass;
- (NSAttributeDescription)initWithCoder:(id)a3;
- (NSAttributeType)attributeType;
- (NSData)versionHash;
- (NSString)attributeValueClassName;
- (NSString)valueTransformerName;
- (id)_initWithName:(id)a3 type:(unint64_t)a4;
- (id)_initWithName:(id)a3 type:(unint64_t)a4 withClassName:(id)a5;
- (id)_initWithType:(unint64_t)a3;
- (id)_rawValidationPredicates;
- (id)_rawValidationWarnings;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultValue;
- (id)description;
- (id)validationPredicates;
- (id)validationWarnings;
- (int)_encodedAttributeFlagsForFlags:(int)a3;
- (uint64_t)_attributeValueClasses;
- (uint64_t)_canConvertPredicate:(void *)a3 andWarning:;
- (uint64_t)_comparePredicatesAndWarningsWithUnoptimizedAttributeDescription:(uint64_t)result;
- (uint64_t)_sortOutDefaultNumericValuesBecauseDoublesAndFloatsDontCompareEqualAndThatBreaksTests;
- (unint64_t)_propertyType;
- (void)_createCachesAndOptimizeState;
- (void)_versionHash:(char *)a3 inStyle:(unint64_t)a4;
- (void)_writeIntoData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 entitiesSlots:(id)a8 fetchRequests:(id)a9;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowsCloudEncryption:(BOOL)allowsCloudEncryption;
- (void)setAllowsExternalBinaryDataStorage:(BOOL)allowsExternalBinaryDataStorage;
- (void)setAttributeType:(NSAttributeType)attributeType;
- (void)setAttributeValueClassName:(NSString *)attributeValueClassName;
- (void)setDefaultValue:(id)defaultValue;
- (void)setIsFileBackedFuture:(BOOL)a3;
- (void)setPreserveValueOnDeletionInPersistentHistory:(BOOL)a3;
- (void)setPreservesValueInHistoryOnDeletion:(BOOL)preservesValueInHistoryOnDeletion;
- (void)setValueTransformerName:(NSString *)valueTransformerName;
@end

@implementation NSAttributeDescription

- (NSAttributeType)attributeType
{
  return (unint64_t)self->_type;
}

- (unint64_t)_propertyType
{
  return 2LL;
}

- (BOOL)_isAttribute
{
  return 1;
}

- (NSString)valueTransformerName
{
  return self->_valueTransformerName;
}

+ (void)initialize
{
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class()) {
    objc_opt_self();
  }
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSAttributeDescription;
  objc_msgSendSuper2(&v4, sel_initialize);
}

- (void)dealloc
{
  self->_attributeValueClassName = 0LL;
  self->_valueTransformerName = 0LL;

  self->_defaultValue = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSAttributeDescription;
  -[NSPropertyDescription dealloc](&v3, sel_dealloc);
}

- (int)_encodedAttributeFlagsForFlags:(int)a3
{
  return a3;
}

- (void)encodeWithCoder:(id)a3
{
  v5 = (void *)MEMORY[0x186E3E5D8](self, a2);
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSAttributeDescription;
  -[NSPropertyDescription encodeWithCoder:](&v8, sel_encodeWithCoder_, a3);
  objc_msgSend( a3,  "encodeInt:forKey:",  -[NSAttributeDescription attributeType](self, "attributeType"),  @"NSAttributeType");
  objc_msgSend( a3,  "encodeObject:forKey:",  -[NSAttributeDescription attributeValueClassName](self, "attributeValueClassName"),  @"NSAttributeValueClassName");
  objc_msgSend( a3,  "encodeObject:forKey:",  -[NSAttributeDescription defaultValue](self, "defaultValue"),  @"NSDefaultValue");
  objc_msgSend( a3,  "encodeObject:forKey:",  -[NSAttributeDescription valueTransformerName](self, "valueTransformerName"),  @"NSValueTransformerName");
  if (-[NSAttributeDescription isIndexed](self, "isIndexed")) {
    [a3 encodeBool:1 forKey:@"NSIsIndexed"];
  }
  if (-[NSPropertyDescription _storeBinaryDataExternally](self, "_storeBinaryDataExternally")) {
    unsigned int v6 = 4;
  }
  else {
    unsigned int v6 = 0;
  }
  if (-[NSAttributeDescription preservesValueInHistoryOnDeletion](self, "preservesValueInHistoryOnDeletion")) {
    v6 |= 0x10u;
  }
  if (-[NSAttributeDescription isFileBackedFuture](self, "isFileBackedFuture")) {
    uint64_t v7 = v6 | 0x20;
  }
  else {
    uint64_t v7 = v6;
  }
  objc_msgSend( a3,  "encodeInt32:forKey:",  -[NSAttributeDescription _encodedAttributeFlagsForFlags:](self, "_encodedAttributeFlagsForFlags:", v7),  @"NSFlagsKey");
  objc_autoreleasePoolPop(v5);
}

- (uint64_t)_sortOutDefaultNumericValuesBecauseDoublesAndFloatsDontCompareEqualAndThatBreaksTests
{
  if (result)
  {
    uint64_t v1 = result;
    result = *(void *)(result + 112);
    if (result)
    {
      result = [(id)result isNSNumber];
      if ((_DWORD)result)
      {
        result = [*(id *)(v1 + 112) objCType];
        int v2 = *(unsigned __int16 *)(v1 + 80);
        if (v2 == 600)
        {
          result = strcmp("d", (const char *)result);
          if ((_DWORD)result) {
            return result;
          }
          [*(id *)(v1 + 112) doubleValue];
          double v7 = v6;

          *(float *)&double v8 = v7;
          v5 = (void *)[MEMORY[0x189607968] numberWithFloat:v8];
          goto LABEL_10;
        }

        if (v2 == 500)
        {
          result = strcmp("f", (const char *)result);
          if (!(_DWORD)result)
          {
            [*(id *)(v1 + 112) floatValue];
            float v4 = v3;

            v5 = (void *)[MEMORY[0x189607968] numberWithDouble:v4];
LABEL_10:
            result = v5;
            *(void *)(v1 + 112) = result;
          }
        }
      }
    }
  }

  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSAttributeDescription)initWithCoder:(id)a3
{
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___NSAttributeDescription;
  float v4 = -[NSPropertyDescription initWithCoder:](&v37, sel_initWithCoder_);
  if (!v4) {
    return v4;
  }
  v5 = (void *)MEMORY[0x189604010];
  uint64_t v6 = objc_opt_class();
  double v7 = (NSString *)(id)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0),  @"NSValueTransformerName");
  v4->_valueTransformerName = v7;
  if (v7)
  {
    if (!-[NSString isNSString](v7, "isNSString"))
    {
      v26 = (void *)MEMORY[0x189607870];
      uint64_t v27 = *MEMORY[0x189607460];
      v28 = &unk_189F03270;
LABEL_32:
      objc_msgSend(a3, "failWithError:", objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, 4866, v28));

      return 0LL;
    }

    if (-[NSString isEqualToString:]( v4->_valueTransformerName,  "isEqualToString:",  @"NSSecureUnarchiveFromDataTransformerName"))
    {

      v4->_valueTransformerName = (NSString *)[(id)*MEMORY[0x1896076E8] copy];
    }
  }

  v4->_unsigned int type = [a3 decodeIntForKey:@"NSAttributeType"];
  double v8 = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSAttributeValueClassName"];
  v4->_attributeValueClassName = v8;
  if (v8 && (-[NSString isNSString](v8, "isNSString") & 1) == 0)
  {
    v26 = (void *)MEMORY[0x189607870];
    uint64_t v27 = *MEMORY[0x189607460];
    v28 = &unk_189F03298;
    goto LABEL_32;
  }

  v9 = (void *)+[_PFRoutines attributeClassesForSecureCoding]();
  if (v4->_type == 1800)
  {
    v10 = (void *)-[NSAttributeDescription _attributeValueClasses]((id *)&v4->super.super.isa);
    if (!v10) {
      v10 = (void *)[MEMORY[0x189603FA8] array];
    }
    Class v11 = NSClassFromString(v4->_valueTransformerName);
    if (v11)
    {
      v12 = v11;
      if (!-[objc_class instancesRespondToSelector:]( v11,  "instancesRespondToSelector:",  sel_transformedValue_)
        || ([v12 instancesRespondToSelector:sel_reverseTransformedValue_] & 1) == 0)
      {
        uint64_t v13 = -[NSPropertyDescription name](v4, "name");
        -[NSEntityDescription name](-[NSPropertyDescription entity](v4, "entity"), "name");

        v4->_valueTransformerName = (NSString *)[(id)*MEMORY[0x1896076E8] copy];
        v12 = (void *)objc_opt_class();
      }

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        uint64_t v20 = [v12 allowedTopLevelClasses];
        if (v20) {
          uint64_t v21 = v20;
        }
        else {
          uint64_t v21 = MEMORY[0x189604A58];
        }
        [v10 addObjectsFromArray:v21];
      }

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        uint64_t v22 = [v12 transformedValueClass];
        if (v22) {
          [v10 addObject:v22];
        }
      }
    }

    v9 = (void *)[v9 setByAddingObjectsFromArray:v10];
  }

  v4->_defaultValue = (id)[a3 decodeObjectOfClasses:v9 forKey:@"NSDefaultValue"];
  -[NSAttributeDescription _sortOutDefaultNumericValuesBecauseDoublesAndFloatsDontCompareEqualAndThatBreaksTests]((uint64_t)v4);
  unsigned int v23 = [a3 decodeInt32ForKey:@"NSFlagsKey"];
  if (!v23) {
    goto LABEL_47;
  }
  int v24 = v23 & 2;
  *(_WORD *)&v4->super._propertyDescriptionFlags = *(_WORD *)&v4->super._propertyDescriptionFlags & 0xA1FF | ((v23 & 3) << 9) & 0xA7FF | (((v23 >> 2) & 1) << 11) & 0xAFFF | (((v23 >> 4) & 1) << 12) & 0xBFFF | (((v23 >> 5) & 1) << 14);
  if ((v23 & 1) == 0)
  {
LABEL_36:
    if (!v24) {
      goto LABEL_47;
    }
LABEL_37:
    unsigned int type = v4->_type;
    if (type > 0x12B)
    {
      if (type != 700 && type != 300) {
        goto LABEL_46;
      }
    }

    else if (type != 100 && type != 200)
    {
LABEL_46:
      uint64_t v34 = -[NSPropertyDescription _extraIVars](v4, "_extraIVars");
      [a3 decodeDoubleForKey:@"NSMinValueName"];
      *(void *)(v34 + 8) = v35;
      goto LABEL_47;
    }

    uint64_t v31 = [a3 decodeInt64ForKey:@"NSMinValueName"];
    *(void *)(-[NSPropertyDescription _extraIVars](v4, "_extraIVars") + 8) = v31;
    goto LABEL_47;
  }

  unsigned int v25 = v4->_type;
  if (v25 <= 0x12B)
  {
    if (v25 != 100 && v25 != 200) {
      goto LABEL_44;
    }
    goto LABEL_35;
  }

  if (v25 == 700 || v25 == 300)
  {
LABEL_35:
    uint64_t v29 = [a3 decodeInt64ForKey:@"NSMaxValueName"];
    *(void *)(-[NSPropertyDescription _extraIVars](v4, "_extraIVars") + 16) = v29;
    goto LABEL_36;
  }

- (uint64_t)_attributeValueClasses
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  int v2 = (NSString *)a1[13];
  if (!v2) {
    return 0LL;
  }
  Class v3 = NSClassFromString(v2);
  if (v3) {
    return [MEMORY[0x189603FA8] arrayWithObject:v3];
  }
  v5 = (void *)[MEMORY[0x189607930] characterSetWithCharactersInString:@"$_"];
  objc_msgSend(v5, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x189607810], "alphanumericCharacterSet"));
  [v5 invert];
  if (objc_msgSend(v5, "characterIsMember:", objc_msgSend(a1[13], "characterAtIndex:", 0)))
  {
    if (!byte_18C4ABDC6) {
      return 0LL;
    }
    uint64_t v6 = [NSString stringWithUTF8String:"Declared Objective-C type %@ for attribute named %@ is not valid"];
    uint64_t v7 = (uint64_t)a1[13];
    [a1 name];
    _NSCoreDataLog(17LL, v6, v8, v9, v10, v11, v12, v13, v7);
    uint64_t v14 = __pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
      return 0LL;
    }
    uint64_t v15 = (NSString *)a1[13];
    *(_DWORD *)buf = 138412546;
    v51 = v15;
    __int16 v52 = 2112;
    uint64_t v53 = [a1 name];
    uint64_t v16 = "CoreData: Declared Objective-C type %@ for attribute named %@ is not valid";
LABEL_9:
    uint64_t v17 = (os_log_s *)v14;
    uint32_t v18 = 22;
LABEL_31:
    _os_log_fault_impl(&dword_186681000, v17, OS_LOG_TYPE_FAULT, v16, buf, v18);
    return 0LL;
  }

  uint64_t v19 = (void *)[a1[13] componentsSeparatedByCharactersInSet:v5];
  if ([v19 count] == 1
    && objc_msgSend(a1[13], "isEqualToString:", objc_msgSend(v19, "firstObject")))
  {
    if (!byte_18C4ABDC6) {
      return 0LL;
    }
    uint64_t v20 = [NSString stringWithUTF8String:"Could not materialize Objective-C class for declared attribute value class name %@ of attribute named %@"];
    uint64_t v21 = (uint64_t)a1[13];
    [a1 name];
    _NSCoreDataLog(17LL, v20, v22, v23, v24, v25, v26, v27, v21);
    uint64_t v14 = __pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
      return 0LL;
    }
    v28 = (NSString *)a1[13];
    *(_DWORD *)buf = 138412546;
    v51 = v28;
    __int16 v52 = 2112;
    uint64_t v53 = [a1 name];
    uint64_t v16 = "CoreData: Could not materialize Objective-C class for declared attribute value class name %@ of attribute named %@";
    goto LABEL_9;
  }

  uint64_t v29 = (void *)[MEMORY[0x189603FA8] array];
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  uint64_t v30 = [v19 countByEnumeratingWithState:&v46 objects:v56 count:16];
  if (!v30) {
    return (uint64_t)v29;
  }
  uint64_t v31 = v30;
  uint64_t v32 = *(void *)v47;
LABEL_17:
  uint64_t v33 = 0LL;
  while (1)
  {
    if (*(void *)v47 != v32) {
      objc_enumerationMutation(v19);
    }
    uint64_t v34 = *(NSString **)(*((void *)&v46 + 1) + 8 * v33);
    if (!-[NSString length](v34, "length")) {
      goto LABEL_23;
    }
    Class v35 = NSClassFromString(v34);
    if (!v35) {
      break;
    }
    [v29 addObject:v35];
LABEL_23:
    if (v31 == ++v33)
    {
      uint64_t v31 = [v19 countByEnumeratingWithState:&v46 objects:v56 count:16];
      if (v31) {
        goto LABEL_17;
      }
      return (uint64_t)v29;
    }
  }

  if (byte_18C4ABDC6)
  {
    uint64_t v36 = [NSString stringWithUTF8String:"Could not materialize Objective-C class named %@ from declared attribute value type %@ of attribute named %@"];
    [a1 name];
    _NSCoreDataLog(17LL, v36, v37, v38, v39, v40, v41, v42, (uint64_t)v34);
    uint64_t v43 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      id v44 = a1[13];
      uint64_t v45 = [a1 name];
      *(_DWORD *)buf = 138412802;
      v51 = v34;
      __int16 v52 = 2112;
      uint64_t v53 = (uint64_t)v44;
      __int16 v54 = 2112;
      uint64_t v55 = v45;
      uint64_t v16 = "CoreData: Could not materialize Objective-C class named %@ from declared attribute value type %@ of "
            "attribute named %@";
      uint64_t v17 = (os_log_s *)v43;
      uint32_t v18 = 32;
      goto LABEL_31;
    }
  }

  return 0LL;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSAttributeDescription;
  float v4 = -[NSPropertyDescription copyWithZone:](&v7, sel_copyWithZone_, a3);
  uint64_t v5 = (uint64_t)v4;
  if (v4)
  {
    v4[40] = self->_type;
    *((void *)v4 + 13) = -[NSString copy](self->_attributeValueClassName, "copy");
    *(void *)(v5 + 112) = self->_defaultValue;
    -[NSAttributeDescription _sortOutDefaultNumericValuesBecauseDoublesAndFloatsDontCompareEqualAndThatBreaksTests](v5);
    *(void *)(v5 + 96) = self->_valueTransformerName;
    if (-[NSPropertyDescription _storeBinaryDataExternally](self, "_storeBinaryDataExternally")) {
      *(_WORD *)(v5 + 72) |= 0x800u;
    }
    if (-[NSAttributeDescription preservesValueInHistoryOnDeletion](self, "preservesValueInHistoryOnDeletion")) {
      *(_WORD *)(v5 + 72) |= 0x1000u;
    }
    if (-[NSAttributeDescription isFileBackedFuture](self, "isFileBackedFuture")) {
      *(_WORD *)(v5 + 72) |= 0x4000u;
    }
    if (-[NSAttributeDescription allowsCloudEncryption](self, "allowsCloudEncryption")) {
      *(_WORD *)(v5 + 72) |= 0x8000u;
    }
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  return -[NSAttributeDescription _isEqual:skipIndexCheck:](self, "_isEqual:skipIndexCheck:", a3, 0LL);
}

- (BOOL)_isEqual:(id)a3 skipIndexCheck:(BOOL)a4
{
  if (a3 == self)
  {
    LOBYTE(v8) = 1;
  }

  else
  {
    uint64_t v22 = v4;
    uint64_t v23 = v5;
    v21.receiver = self;
    v21.super_class = (Class)&OBJC_CLASS___NSAttributeDescription;
    LODWORD(v8) = -[NSPropertyDescription _isEqual:skipIndexCheck:](&v21, sel__isEqual_skipIndexCheck_, a3, a4);
    if ((_DWORD)v8)
    {
      NSAttributeType v9 = -[NSAttributeDescription attributeType](self, "attributeType");
      if (v9 != [a3 attributeType])
      {
LABEL_19:
        LOBYTE(v8) = 0;
        return v8;
      }

      uint64_t v10 = -[NSAttributeDescription attributeValueClassName](self, "attributeValueClassName");
      uint64_t v8 = [a3 attributeValueClassName];
      if (v10 == (NSString *)v8
        || (uint64_t v11 = v8, LOBYTE(v8) = 0, v10) && v11 && (LODWORD(v8) = -[NSString isEqual:](v10, "isEqual:"), (_DWORD)v8))
      {
        id v12 = -[NSAttributeDescription defaultValue](self, "defaultValue");
        uint64_t v8 = [a3 defaultValue];
        if (v12 == (id)v8
          || (uint64_t v13 = v8, LOBYTE(v8) = 0, v12) && v13 && (LODWORD(v8) = objc_msgSend(v12, "isEqual:"), (_DWORD)v8))
        {
          uint64_t v14 = -[NSAttributeDescription valueTransformerName](self, "valueTransformerName");
          uint64_t v8 = [a3 valueTransformerName];
          if (v14 == (NSString *)v8
            || (uint64_t v15 = v8, LOBYTE(v8) = 0, v14)
            && v15
            && (LODWORD(v8) = -[NSString isEqual:](v14, "isEqual:"), (_DWORD)v8))
          {
            int v16 = -[NSAttributeDescription preservesValueInHistoryOnDeletion](self, "preservesValueInHistoryOnDeletion");
            int v17 = -[NSAttributeDescription isFileBackedFuture](self, "isFileBackedFuture");
            int v18 = -[NSAttributeDescription allowsCloudEncryption](self, "allowsCloudEncryption");
            BOOL v19 = -[NSAttributeDescription usesMergeableStorage](self, "usesMergeableStorage");
            LOBYTE(v8) = v19 ^ [a3 usesMergeableStorage] ^ 1;
          }
        }
      }
    }
  }

  return v8;
}

- (BOOL)_isSchemaEqual:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSAttributeDescription;
  unsigned int v5 = -[NSPropertyDescription _isSchemaEqual:](&v9, sel__isSchemaEqual_);
  if (v5)
  {
    unsigned int v5 = -[NSAttributeDescription _attributeTypeIsSchemaEqual:]( self,  "_attributeTypeIsSchemaEqual:",  [a3 attributeType]);
    if (v5)
    {
      int v6 = -[NSAttributeDescription isFileBackedFuture](self, "isFileBackedFuture");
      if (v6 == [a3 isFileBackedFuture])
      {
        BOOL v7 = -[NSAttributeDescription storesBinaryDataExternally](self, "storesBinaryDataExternally");
        LOBYTE(v5) = v7 ^ [a3 storesBinaryDataExternally] ^ 1;
      }

      else
      {
        LOBYTE(v5) = 0;
      }
    }
  }

  return v5;
}

- (id)description
{
  Class v3 = (void *)NSString;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NSAttributeDescription;
  id v4 = -[NSPropertyDescription description](&v13, sel_description);
  NSAttributeType v5 = -[NSAttributeDescription attributeType](self, "attributeType");
  int v6 = -[NSAttributeDescription attributeValueClassName](self, "attributeValueClassName");
  id v7 = -[NSAttributeDescription defaultValue](self, "defaultValue");
  uint64_t v8 = @"NO";
  if (-[NSAttributeDescription preservesValueInHistoryOnDeletion](self, "preservesValueInHistoryOnDeletion")) {
    objc_super v9 = @"YES";
  }
  else {
    objc_super v9 = @"NO";
  }
  if (-[NSAttributeDescription allowsCloudEncryption](self, "allowsCloudEncryption")) {
    uint64_t v8 = @"YES";
  }
  BOOL v10 = -[NSAttributeDescription usesMergeableStorage](self, "usesMergeableStorage");
  uint64_t v11 = &stru_189EAC2E8;
  if (v10) {
    uint64_t v11 = @", usesMergeableStorage YES";
  }
  return (id)[v3 stringWithFormat:@"%@, attributeType %lu, attributeValueClassName %@, defaultValue %@, preservesValueInHistoryOnDeletion %@, allowsCloudEncryption %@%@", v4, v5, v6, v7, v9, v8, v11];
}

- (NSString)attributeValueClassName
{
  return self->_attributeValueClassName;
}

- (void)setAttributeValueClassName:(NSString *)attributeValueClassName
{
  if (attributeValueClassName
    || -[NSPropertyDescription isTransient](self, "isTransient")
    || (int type = self->_type, type == 1800)
    || type == 2100)
  {
    if (self->_attributeValueClassName != attributeValueClassName)
    {
      self->_attributeValueClass = 0LL;

      self->_attributeValueClassName = (NSString *)-[NSString copy](attributeValueClassName, "copy");
    }
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"Can't set attributeValueClassName to nil for a non-transient attribute." userInfo:0]);
    -[NSAttributeDescription setAttributeType:](v6, v7, v8);
  }

- (void)setAttributeType:(NSAttributeType)attributeType
{
  if (self->_type != attributeType)
  {
    if (attributeType)
    {
      if (attributeType == NSObjectIDAttributeType)
      {
        NSAttributeType v5 = (void *)MEMORY[0x189603F70];
        uint64_t v6 = *MEMORY[0x189603A60];
        SEL v7 = (void *)NSString;
        id v8 = +[NSAttributeDescription stringForAttributeType:]( &OBJC_CLASS___NSAttributeDescription,  "stringForAttributeType:",  2000LL);
        objc_super v9 = (objc_class *)objc_opt_class();
        BOOL v10 = (const __CFString *)[v7 stringWithFormat:@"'%@' is only supported for use with '%@'.", v8, NSStringFromClass(v9)];
        uint64_t v11 = v5;
        uint64_t v12 = v6;
LABEL_10:
        objc_exception_throw((id)[v11 exceptionWithName:v12 reason:v10 userInfo:0]);
        +[NSAttributeDescription _classNameForType:](v16, v17);
        return;
      }
    }

    else if (!-[NSPropertyDescription isTransient](self, "isTransient"))
    {
      uint64_t v11 = (void *)MEMORY[0x189603F70];
      uint64_t v12 = *MEMORY[0x189603A60];
      BOOL v10 = @"Can't set attribute type to undefined for non-transient attribute.";
      goto LABEL_10;
    }

    objc_super v13 = +[NSAttributeDescription _classNameForType:]((uint64_t)&OBJC_CLASS___NSAttributeDescription, attributeType);
    if (v13 != (NSString *)NSKeyValueCoding_NullValue)
    {
      self->_int type = attributeType;
      -[NSAttributeDescription setAttributeValueClassName:](self, "setAttributeValueClassName:", v13);
      return;
    }

    uint64_t v14 = (void *)MEMORY[0x189603F70];
    uint64_t v15 = *MEMORY[0x189603A58];
    BOOL v10 = (const __CFString *)objc_msgSend( NSString,  "stringWithFormat:",  @"Can't find class for type %lu",  attributeType);
    uint64_t v11 = v14;
    uint64_t v12 = v15;
    goto LABEL_10;
  }

+ (NSString)_classNameForType:(uint64_t)a1
{
  result = 0LL;
  if (a2 <= 699)
  {
    if (a2 <= 299)
    {
      if (!a2) {
        return result;
      }
      if (a2 != 100 && a2 != 200) {
        return (NSString *)NSKeyValueCoding_NullValue;
      }
    }

    else if (a2 > 499)
    {
      if (a2 != 500 && a2 != 600) {
        return (NSString *)NSKeyValueCoding_NullValue;
      }
    }

    else if (a2 != 300 && a2 != 400)
    {
      return (NSString *)NSKeyValueCoding_NullValue;
    }

    goto LABEL_25;
  }

  if (a2 <= 1099)
  {
    if (a2 > 899)
    {
      if (a2 != 900 && a2 != 1000) {
        return (NSString *)NSKeyValueCoding_NullValue;
      }
    }

    else if (a2 != 700 && a2 != 800)
    {
      return (NSString *)NSKeyValueCoding_NullValue;
    }

- (id)defaultValue
{
  return self->_defaultValue;
}

- (void)setDefaultValue:(id)defaultValue
{
  id v5 = self->_defaultValue;
  if (v5 != defaultValue)
  {

    self->_defaultValue = defaultValue;
    -[NSAttributeDescription _sortOutDefaultNumericValuesBecauseDoublesAndFloatsDontCompareEqualAndThatBreaksTests]((uint64_t)self);
  }

- (BOOL)isIndexed
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSAttributeDescription;
  return -[NSPropertyDescription isIndexed](&v4, sel_isIndexed)
      || -[NSDictionary objectForKey:]( -[NSPropertyDescription userInfo](self, "userInfo"),  "objectForKey:",  @"_NSCreateIndex") != 0;
}

- (void)setValueTransformerName:(NSString *)valueTransformerName
{
  Class v3 = self->_valueTransformerName;
  if (v3 != valueTransformerName)
  {

    if (valueTransformerName)
    {
      BOOL v6 = -[NSString isEqualToString:]( valueTransformerName,  "isEqualToString:",  @"NSSecureUnarchiveFromDataTransformerName");
      SEL v7 = (NSString *)*MEMORY[0x1896076E8];
      if (!v6) {
        SEL v7 = valueTransformerName;
      }
    }

    else
    {
      SEL v7 = 0LL;
    }

    self->_valueTransformerName = v7;
  }

- (NSData)versionHash
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSAttributeDescription;
  return -[NSPropertyDescription versionHash](&v3, sel_versionHash);
}

- (id)validationPredicates
{
  BOOL v3 = -[NSPropertyDescription _hasMinValueInExtraIvars](self, "_hasMinValueInExtraIvars");
  BOOL v4 = -[NSPropertyDescription _hasMaxValueInExtraIvars](self, "_hasMaxValueInExtraIvars");
  BOOL v5 = v4;
  if (!v3 && !v4)
  {
    v20.receiver = self;
    v20.super_class = (Class)&OBJC_CLASS___NSAttributeDescription;
    return -[NSPropertyDescription validationPredicates](&v20, sel_validationPredicates);
  }

  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___NSAttributeDescription;
  BOOL v6 = (void *)objc_msgSend( MEMORY[0x189603FA8],  "arrayWithArray:",  -[NSPropertyDescription validationPredicates](&v21, sel_validationPredicates));
  SEL v7 = -[NSPropertyDescription _extraIVars](self, "_extraIVars");
  NSAttributeType v8 = -[NSAttributeDescription attributeType](self, "attributeType");
  if ((uint64_t)v8 <= 399)
  {
    if (v8 == NSInteger16AttributeType || v8 == NSInteger32AttributeType || v8 == NSInteger64AttributeType)
    {
      if (v3)
      {
        uint64_t v9 = [MEMORY[0x189607968] numberWithLongLong:v7->var1];
        [v6 addObject:objc_msgSend(MEMORY[0x1896079C8], "predicateWithFormat:", @"SELF >= %@", v9)];
      }

      if (!v5) {
        goto LABEL_33;
      }
      uint64_t v10 = [MEMORY[0x189607968] numberWithLongLong:v7->var2];
      goto LABEL_23;
    }

BOOL __46__NSAttributeDescription_validationPredicates__block_invoke(uint64_t a1, void *a2)
{
  return !a2 || [a2 absoluteString] != 0;
}

- (id)validationWarnings
{
  BOOL v3 = -[NSPropertyDescription _hasMinValueInExtraIvars](self, "_hasMinValueInExtraIvars");
  BOOL v4 = -[NSPropertyDescription _hasMaxValueInExtraIvars](self, "_hasMaxValueInExtraIvars");
  BOOL v5 = v4;
  if (!v3 && !v4)
  {
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___NSAttributeDescription;
    return -[NSPropertyDescription validationWarnings](&v11, sel_validationWarnings);
  }

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NSAttributeDescription;
  BOOL v6 = (void *)objc_msgSend( MEMORY[0x189603FA8],  "arrayWithArray:",  -[NSPropertyDescription validationWarnings](&v12, sel_validationWarnings));
  NSAttributeType v7 = -[NSAttributeDescription attributeType](self, "attributeType");
  if ((uint64_t)v7 <= 399)
  {
    if (v7 != NSInteger16AttributeType && v7 != NSInteger32AttributeType && v7 != NSInteger64AttributeType)
    {
LABEL_12:
      if (v3) {
        objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", 1640));
      }
      if (v5)
      {
        NSAttributeType v8 = (void *)MEMORY[0x189607968];
        uint64_t v9 = 1630LL;
LABEL_22:
        objc_msgSend(v6, "addObject:", objc_msgSend(v8, "numberWithInteger:", v9));
        return v6;
      }

      return v6;
    }
  }

  else if ((uint64_t)v7 > 599)
  {
    if (v7 == NSStringAttributeType)
    {
      if (v3) {
        objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", 1670));
      }
      if (v5)
      {
        NSAttributeType v8 = (void *)MEMORY[0x189607968];
        uint64_t v9 = 1660LL;
        goto LABEL_22;
      }

      return v6;
    }

    if (v7 != NSFloatAttributeType) {
      goto LABEL_12;
    }
  }

  else if (v7 != NSDecimalAttributeType && v7 != NSDoubleAttributeType)
  {
    goto LABEL_12;
  }

  if (v3) {
    objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", 1620));
  }
  if (v5)
  {
    NSAttributeType v8 = (void *)MEMORY[0x189607968];
    uint64_t v9 = 1610LL;
    goto LABEL_22;
  }

  return v6;
}

- (void)setAllowsExternalBinaryDataStorage:(BOOL)allowsExternalBinaryDataStorage
{
  BOOL v3 = allowsExternalBinaryDataStorage;
  -[NSPropertyDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  if (v3) {
    __int16 v5 = 2048;
  }
  else {
    __int16 v5 = 0;
  }
  __int16 v6 = *(_WORD *)&self->super._propertyDescriptionFlags & 0xF7FF | v5;
  __int16 v7 = *(_WORD *)&self->super._propertyDescriptionFlags & 0xB7FF | v5 & 0xBFFF;
  if (!v3) {
    __int16 v6 = v7;
  }
  *(_WORD *)&self->super._propertyDescriptionFlags = v6;
}

- (void)setAllowsCloudEncryption:(BOOL)allowsCloudEncryption
{
  BOOL v3 = allowsCloudEncryption;
  -[NSPropertyDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  if (v3) {
    __int16 v5 = 0x8000;
  }
  else {
    __int16 v5 = 0;
  }
  *(_WORD *)&self->super._propertyDescriptionFlags = v5 & 0x8000 | *(_WORD *)&self->super._propertyDescriptionFlags & 0x7FFF;
}

- (void)setPreservesValueInHistoryOnDeletion:(BOOL)preservesValueInHistoryOnDeletion
{
  BOOL v3 = preservesValueInHistoryOnDeletion;
  -[NSPropertyDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  if (self)
  {
    if (v3) {
      __int16 v5 = 4096;
    }
    else {
      __int16 v5 = 0;
    }
    *(_WORD *)&self->super._propertyDescriptionFlags = *(_WORD *)&self->super._propertyDescriptionFlags & 0xEFFF | v5;
  }

- (void)setPreserveValueOnDeletionInPersistentHistory:(BOOL)a3
{
  BOOL v3 = a3;
  -[NSPropertyDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  if (self)
  {
    if (v3) {
      __int16 v5 = 4096;
    }
    else {
      __int16 v5 = 0;
    }
    *(_WORD *)&self->super._propertyDescriptionFlags = *(_WORD *)&self->super._propertyDescriptionFlags & 0xEFFF | v5;
  }

- (BOOL)usesMergeableStorage
{
  if (-[NSAttributeDescription attributeType](self, "attributeType") == NSTransformableAttributeType
    && -[NSAttributeDescription valueTransformerName](self, "valueTransformerName")
    && -[NSAttributeDescription attributeValueClassName](self, "attributeValueClassName")
    && (Class v3 = NSClassFromString(-[NSAttributeDescription attributeValueClassName](self, "attributeValueClassName"))) != 0LL
    && (Class v4 = v3, (objc_opt_respondsToSelector() & 1) != 0)
    && -[objc_class supportsSecureCoding](v4, "supportsSecureCoding")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    return -[objc_class supportsMergeableTransformable](v4, "supportsMergeableTransformable");
  }

  else
  {
    return 0;
  }

- (BOOL)_attributeTypeIsSchemaEqual:(unint64_t)a3
{
  uint64_t type = self->_type;
  if (type == a3) {
    return 1;
  }
  if ((_DWORD)type == 100) {
    return a3 == 300 || a3 == 200;
  }
  if (a3 == 300 && (_DWORD)type == 200 || a3 == 500 && (_DWORD)type == 600) {
    return 1;
  }
  if ((_DWORD)type != 800) {
    return 0;
  }
  BOOL result = 1;
  if (a3 != 100 && a3 != 200 && a3 != 300) {
    return 0;
  }
  return result;
}

- (id)_initWithName:(id)a3 type:(unint64_t)a4 withClassName:(id)a5
{
  __int16 v6 = a4;
  __int16 v7 = -[NSPropertyDescription _initWithName:](self, "_initWithName:", a3);
  NSAttributeType v8 = v7;
  if (v7)
  {
    *((_WORD *)v7 + 40) = v6;
    v7[13] = [a5 copy];
    v8[14] = 0LL;
    v8[12] = 0LL;
  }

  return v8;
}

- (void)setIsFileBackedFuture:(BOOL)a3
{
  BOOL v3 = a3;
  -[NSPropertyDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  if (v3) {
    __int16 v5 = 18432;
  }
  else {
    __int16 v5 = 0;
  }
  *(_WORD *)&self->super._propertyDescriptionFlags = v5 | *(_WORD *)&self->super._propertyDescriptionFlags & 0xB7FF;
}

- (BOOL)_isEqualWithoutIndex:(id)a3
{
  return -[NSAttributeDescription _isEqual:skipIndexCheck:](self, "_isEqual:skipIndexCheck:", a3, 1LL);
}

+ (id)stringForAttributeType:(unint64_t)a3
{
  if ((uint64_t)a3 <= 799)
  {
    if ((uint64_t)a3 <= 399)
    {
      switch(a3)
      {
        case 0x64uLL:
          return @"NSInteger16AttributeType";
        case 0xC8uLL:
          return @"NSInteger32AttributeType";
        case 0x12CuLL:
          return @"NSInteger64AttributeType";
      }
    }

    else if ((uint64_t)a3 > 599)
    {
      if (a3 == 600) {
        return @"NSFloatAttributeType";
      }
      if (a3 == 700) {
        return @"NSStringAttributeType";
      }
    }

    else
    {
      if (a3 == 400) {
        return @"NSDecimalAttributeType";
      }
      if (a3 == 500) {
        return @"NSDoubleAttributeType";
      }
    }
  }

  else if ((uint64_t)a3 > 1199)
  {
    if ((uint64_t)a3 > 1999)
    {
      if (a3 == 2000) {
        return @"NSObjectIDAttributeType";
      }
      if (a3 == 2100) {
        return @"NSCompositeAttributeType";
      }
    }

    else
    {
      if (a3 == 1200) {
        return @"NSURIAttributeType";
      }
      if (a3 == 1800) {
        return @"NSTransformableAttributeType";
      }
    }
  }

  else if ((uint64_t)a3 > 999)
  {
    if (a3 == 1000) {
      return @"NSBinaryDataAttributeType";
    }
    if (a3 == 1100) {
      return @"NSUUIDAttributeType";
    }
  }

  else
  {
    if (a3 == 800) {
      return @"NSBooleanAttributeType";
    }
    if (a3 == 900) {
      return @"NSDateAttributeType";
    }
  }

  return @"NSUndefinedAttributeType";
}

- (BOOL)_epsilonEquals:(id)a3 rhs:(id)a4 withFlags:(int)a5
{
  if (a3 == a4 || a5 == 1 && -[NSPropertyDescription _isTriggerBacked](self, "_isTriggerBacked")) {
    return 1;
  }
  NSAttributeType v9 = -[NSAttributeDescription attributeType](self, "attributeType");
  if (v9 == NSDateAttributeType)
  {
    if ([a3 isNSDate] && objc_msgSend(a4, "isNSDate"))
    {
      [a3 timeIntervalSinceReferenceDate];
      double v11 = v13;
      [a4 timeIntervalSinceReferenceDate];
LABEL_14:
      if (v11 != v12) {
        return vabdd_f64(v11, v12) <= 2.22044605e-16;
      }
      return 1;
    }

    return [a3 isEqual:a4];
  }

  if (v9 != NSFloatAttributeType)
  {
    if (v9 == NSDoubleAttributeType
      && [a3 isNSNumber]
      && [a4 isNSNumber])
    {
      [a3 doubleValue];
      double v11 = v10;
      [a4 doubleValue];
      goto LABEL_14;
    }

    return [a3 isEqual:a4];
  }

  [a3 floatValue];
  float v16 = v15;
  [a4 floatValue];
  if (v16 == v17) {
    return 1;
  }
  return vabds_f32(v16, v17) <= 0.00000011921;
}

- (id)_rawValidationPredicates
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSAttributeDescription;
  return -[NSPropertyDescription validationPredicates](&v3, sel_validationPredicates);
}

- (id)_rawValidationWarnings
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSAttributeDescription;
  return -[NSPropertyDescription validationWarnings](&v3, sel_validationWarnings);
}

- (uint64_t)_canConvertPredicate:(void *)a3 andWarning:
{
  if (result)
  {
    uint64_t v4 = result;
    BOOL result = 0LL;
    unsigned int v5 = *(unsigned __int16 *)(v4 + 80);
    if (v5 > 0x1F3)
    {
      if (*(unsigned __int16 *)(v4 + 80) > 0x2BBu)
      {
        if (v5 == 700)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            return 0LL;
          }
          double v11 = (void *)[a2 leftExpression];
          if ([v11 expressionType] != 3) {
            return 0LL;
          }
          uint64_t v8 = [v11 keyPath];
          __int16 v7 = @"length";
        }

        else
        {
          if (v5 != 900) {
            return result;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            return 0LL;
          }
          double v10 = (void *)[a2 leftExpression];
          if ([v10 expressionType] != 3) {
            return 0LL;
          }
          uint64_t v8 = [v10 keyPath];
          __int16 v7 = @"timeIntervalSinceReferenceDate";
        }

- (uint64_t)_comparePredicatesAndWarningsWithUnoptimizedAttributeDescription:(uint64_t)result
{
  if (result)
  {
    objc_super v3 = (unsigned __int16 *)result;
    uint64_t v4 = (void *)[a2 _rawValidationPredicates];
    unsigned int v5 = (void *)[a2 _rawValidationWarnings];
    uint64_t v6 = (void *)[v3 _rawValidationPredicates];
    uint64_t v24 = (void *)[v3 _rawValidationWarnings];
    uint64_t v7 = [v3 _extraIVars];
    uint64_t v8 = [v4 count];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0LL;
      double v11 = (double *)(v7 + 16);
      double v12 = (double *)(v7 + 8);
      do
      {
        double v13 = (void *)[v4 objectAtIndex:v10];
        uint64_t v14 = -[NSAttributeDescription _canConvertPredicate:andWarning:]( (uint64_t)v3,  v13,  (void *)[v5 objectAtIndex:v10]);
        if (!v14)
        {
          if (!v6) {
            return 0LL;
          }
          uint64_t v18 = [v6 indexOfObject:v13];
          if (v18 == 0x7FFFFFFFFFFFFFFFLL
            || (objc_msgSend( (id)objc_msgSend(v24, "objectAtIndex:", v18),  "isEqual:",  objc_msgSend(v5, "objectAtIndex:", v10)) & 1) == 0)
          {
            return 0LL;
          }

          goto LABEL_19;
        }

        uint64_t v15 = v14;
        float v16 = (void *)objc_msgSend((id)objc_msgSend(v13, "rightExpression"), "constantValue");
        unsigned int v17 = v3[40];
        if (v17 > 0x12B)
        {
          if (v17 != 700 && v17 != 300)
          {
LABEL_21:
            if (v15 <= 0) {
              objc_super v21 = v12;
            }
            else {
              objc_super v21 = v11;
            }
            double v22 = *v21;
            [v16 doubleValue];
            if (v22 != v23) {
              return 0LL;
            }
            goto LABEL_19;
          }
        }

        else if (v17 != 100 && v17 != 200)
        {
          goto LABEL_21;
        }

        if (v15 <= 0) {
          BOOL v19 = v12;
        }
        else {
          BOOL v19 = v11;
        }
        uint64_t v20 = *(void *)v19;
        if (v20 != [v16 longLongValue]) {
          return 0LL;
        }
LABEL_19:
        ++v10;
      }

      while (v9 != v10);
    }

    return 1LL;
  }

  return result;
}

- (BOOL)_comparePredicatesAndWarnings:(id)a3
{
  BOOL v5 = -[NSPropertyDescription _hasMaxValueInExtraIvars](self, "_hasMaxValueInExtraIvars")
    || -[NSPropertyDescription _hasMinValueInExtraIvars](self, "_hasMinValueInExtraIvars");
  Class = object_getClass(self);
  if (Class != object_getClass(a3)) {
    a3 = (id)[a3 _underlyingProperty];
  }
  if (([a3 _hasMaxValueInExtraIvars] & 1) != 0
    || ([a3 _hasMinValueInExtraIvars] & 1) != 0)
  {
    if (!v5) {
      return -[NSAttributeDescription _comparePredicatesAndWarningsWithUnoptimizedAttributeDescription:]( (uint64_t)a3,  self);
    }
    uint64_t v7 = -[NSPropertyDescription _extraIVars](self, "_extraIVars");
    uint64_t v8 = [a3 _extraIVars];
    if (v7->var1 != *(void *)(v8 + 8) || v7->var2 != *(void *)(v8 + 16)) {
      return 0;
    }
    goto LABEL_17;
  }

  if (!v5)
  {
LABEL_17:
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___NSAttributeDescription;
    return -[NSPropertyDescription _comparePredicatesAndWarnings:](&v10, sel__comparePredicatesAndWarnings_, a3);
  }

  return -[NSAttributeDescription _comparePredicatesAndWarningsWithUnoptimizedAttributeDescription:]((uint64_t)self, a3);
}

- (void)_createCachesAndOptimizeState
{
  v42.receiver = self;
  v42.super_class = (Class)&OBJC_CLASS___NSAttributeDescription;
  -[NSPropertyDescription _createCachesAndOptimizeState](&v42, sel__createCachesAndOptimizeState);
  id v3 = -[NSDictionary objectForKey:]( -[NSEntityDescription propertiesByName]( -[NSEntityDescription superentity](-[NSPropertyDescription entity](self, "entity"), "superentity"),  "propertiesByName"),  "objectForKey:",  -[NSPropertyDescription name](self, "name"));
  if (v3)
  {
    int v4 = [v3 allowsCloudEncryption];
    if (v4 != -[NSAttributeDescription allowsCloudEncryption](self, "allowsCloudEncryption"))
    {
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], objc_msgSend( NSString, "stringWithFormat:", @"%@:%@ - Encryption must also be applied to all inherited attributes from the parent entity (%@)", -[NSEntityDescription name](-[NSPropertyDescription entity](self, "entity"), "name"), -[NSPropertyDescription name](self, "name"), -[NSEntityDescription name]( -[NSEntityDescription superentity]( -[NSPropertyDescription entity](self, "entity"), "superentity"), "name")), 0 reason userInfo]);
      __75__NSAttributeDescription__NSInternalMethods___createCachesAndOptimizeState__block_invoke();
      return;
    }
  }

  if (self->_type == 1800)
  {
    valueTransformerName = self->_valueTransformerName;
    if (-[NSString length](valueTransformerName, "length")
      && ![MEMORY[0x189607B20] valueTransformerForName:valueTransformerName])
    {
      if (-[NSString isEqualToString:]( valueTransformerName,  "isEqualToString:",  @"NSSecureUnarchiveFromDataTransformerName"))
      {
        self->_valueTransformerName = (NSString *)*MEMORY[0x1896076E8];
      }

      else if (!PFUseToolchainBehaviors())
      {
        uint64_t v6 = self->_valueTransformerName;
        -[NSPropertyDescription name](self, "name");
        -[NSEntityDescription name](-[NSPropertyDescription entity](self, "entity"), "name");
        _NSCoreDataLog( 5LL,  (uint64_t)@"no NSValueTransformer with class name '%@' was found for attribute '%@' on entity '%@'",  v7,  v8,  v9,  v10,  v11,  v12,  (uint64_t)v6);
      }
    }

    if (!PFUseToolchainBehaviors())
    {
      uint64_t v33 = self->_valueTransformerName;
      if (!v33
        || -[NSString isEqualToString:](self->_valueTransformerName, "isEqualToString:", *MEMORY[0x189607788])
        || -[NSString isEqualToString:](v33, "isEqualToString:", *MEMORY[0x1896075D0]))
      {
        uint64_t v34 = (void *)[MEMORY[0x1896079D8] processInfo];
        if ((objc_msgSend(@"xctest", "isEqual:", objc_msgSend(v34, "processName")) & 1) != 0
          || (objc_msgSend(@"cplctl", "isEqual:", objc_msgSend(v34, "processName")) & 1) != 0)
        {
          return;
        }

        if (_createCachesAndOptimizeState_token != -1) {
          dispatch_once(&_createCachesAndOptimizeState_token, &__block_literal_global_236);
        }
        Class v35 = -[NSPropertyDescription name](self, "name");
        -[NSEntityDescription name](-[NSPropertyDescription entity](self, "entity"), "name");
        _NSCoreDataLog( 5LL,  (uint64_t)@"Property '%@' on Entity '%@' is using nil or an insecure NSValueTransformer.  Please switch to using %@ or a subclass of NSSecureUnarchiveFromDataTransformer instead.",  v36,  v37,  v38,  v39,  v40,  v41,  (uint64_t)v35);
      }
    }
  }

  id v13 = -[NSDictionary objectForKey:]( -[NSPropertyDescription userInfo](self, "userInfo"),  "objectForKey:",  @"NSTriggerKey");
  id v14 = -[NSAttributeDescription validationWarnings](self, "validationWarnings");
  uint64_t v15 = [v14 count];
  if (v15)
  {
    uint64_t v16 = v15;
    id v17 = -[NSAttributeDescription validationPredicates](self, "validationPredicates");
    id v18 = objc_alloc_init(MEMORY[0x189603FA8]);
    id v19 = objc_alloc_init(MEMORY[0x189603FA8]);
    uint64_t v20 = 0LL;
    while (1)
    {
      objc_super v21 = (void *)[v17 objectAtIndex:v20];
      double v22 = (void *)[v14 objectAtIndex:v20];
      uint64_t v23 = -[NSAttributeDescription _canConvertPredicate:andWarning:]((uint64_t)self, v21, v22);
      if (v23)
      {
        uint64_t v24 = v23;
        if (v23 <= 0) {
          __int16 v25 = 1024;
        }
        else {
          __int16 v25 = 512;
        }
        *(_WORD *)&self->super._propertyDescriptionFlags |= v25;
        uint64_t v26 = (void *)objc_msgSend((id)objc_msgSend(v21, "rightExpression"), "constantValue");
        uint64_t v27 = -[NSPropertyDescription _extraIVars](self, "_extraIVars");
        unsigned int type = self->_type;
        if (type > 0x12B)
        {
          if (type == 700 || type == 300)
          {
LABEL_27:
            if (v24 <= 0) {
              uint64_t v29 = 8LL;
            }
            else {
              uint64_t v29 = 16LL;
            }
            *(id *)((char *)&v27->var0 + v29) = (id)[v26 longLongValue];
            goto LABEL_35;
          }
        }

        else if (type == 100 || type == 200)
        {
          goto LABEL_27;
        }

        if (v24 <= 0) {
          uint64_t v30 = 8LL;
        }
        else {
          uint64_t v30 = 16LL;
        }
        [v26 doubleValue];
        *(id *)((char *)&v27->var0 + v30) = v31;
      }

      else
      {
        [v18 addObject:v21];
        [v19 addObject:v22];
      }

void __75__NSAttributeDescription__NSInternalMethods___createCachesAndOptimizeState__block_invoke()
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v0 = [NSString stringWithUTF8String:"One or more models in this application are using transformable properties with transformer names that are eithe r unset, or set to NSKeyedUnarchiveFromDataTransformerName. Please switch to using %@ or a subclass of NSSe cureUnarchiveFromDataTransformer instead. At some point, Core Data will default to using %@ when nil is spe cified, and transformable properties containing classes that do not support NSSecureCoding will become unreadable."];
  uint64_t v1 = *MEMORY[0x1896076E8];
  _NSCoreDataLog(17LL, v0, v2, v3, v4, v5, v6, v7, *MEMORY[0x1896076E8]);
  uint64_t v8 = (os_log_s *)__pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v10 = v1;
    __int16 v11 = 2112;
    uint64_t v12 = v1;
    _os_log_fault_impl( &dword_186681000,  v8,  OS_LOG_TYPE_FAULT,  "CoreData: One or more models in this application are using transformable properties with transformer names that ar e either unset, or set to NSKeyedUnarchiveFromDataTransformerName. Please switch to using %@ or a subclass of NSSecureUnarchiveFromDataTransformer instead. At some point, Core Data will default to using %@ when nil is sp ecified, and transformable properties containing classes that do not support NSSecureCoding will become unreadable.",  buf,  0x16u);
  }

- (BOOL)_nonPredicateValidateValue:(id *)a3 forKey:(id)a4 inObject:(id)a5 error:(id *)a6
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___NSAttributeDescription;
  LODWORD(v10) = -[NSPropertyDescription _nonPredicateValidateValue:forKey:inObject:error:]( &v31,  sel__nonPredicateValidateValue_forKey_inObject_error_,  a3,  a4);
  if (!(_DWORD)v10) {
    return v10;
  }
  if (!*a3)
  {
    LOBYTE(v10) = 1;
    return v10;
  }

  BOOL v11 = -[NSPropertyDescription _hasMaxValueInExtraIvars](self, "_hasMaxValueInExtraIvars");
  BOOL v12 = -[NSPropertyDescription _hasMinValueInExtraIvars](self, "_hasMinValueInExtraIvars");
  BOOL v13 = v12;
  if (v11 || v12 || self->_type == 700)
  {
    id v14 = -[NSPropertyDescription _extraIVars](self, "_extraIVars");
    uint64_t v15 = 0LL;
    unsigned int type = self->_type;
    if (type > 0x1F3)
    {
      if (self->_type <= 0x2BBu)
      {
        if (type != 500 && type != 600) {
          goto LABEL_42;
        }
        goto LABEL_19;
      }

      if (type == 700)
      {
        if (v11)
        {
          if ([*a3 length] <= v14->var2) {
            uint64_t v15 = 0LL;
          }
          else {
            uint64_t v15 = 1660LL;
          }
        }

        else
        {
          uint64_t v15 = 0LL;
        }

        if (v13 && [*a3 length] < v14->var1) {
          uint64_t v15 = 1670LL;
        }
        unint64_t v26 = [*a3 length];
        if (CFStringGetCharactersPtr((CFStringRef)*a3))
        {
        }

        else
        {
          MEMORY[0x1895F8858](0LL);
          v28 = (UniChar *)((char *)&v30 - v27);
          if (v26 >= 0x80) {
            v28 = (UniChar *)malloc(4 * v26);
          }
          v33.location = 0LL;
          v33.length = v26;
          CFStringGetCharacters((CFStringRef)*a3, v33, v28);
          if (v26 >= 0x80) {
            free(v28);
          }
        }

        goto LABEL_42;
      }

      if (type == 900)
      {
        if (v11)
        {
          [*a3 timeIntervalSinceReferenceDate];
          uint64_t v15 = v18 <= *(double *)&v14->var2 ? 0LL : 1630LL;
        }

        else
        {
          uint64_t v15 = 0LL;
        }

        if (v13)
        {
          [*a3 timeIntervalSinceReferenceDate];
          BOOL v20 = v25 < *(double *)&v14->var1;
          uint64_t v21 = 1640LL;
LABEL_40:
          if (v20) {
            uint64_t v15 = v21;
          }
        }
      }
    }

    else
    {
      if (self->_type <= 0x12Bu)
      {
        if (type != 100 && type != 200) {
          goto LABEL_42;
        }
        goto LABEL_23;
      }

      if (type == 300)
      {
LABEL_23:
        if (v11)
        {
          if ([*a3 longLongValue] <= v14->var2) {
            uint64_t v15 = 0LL;
          }
          else {
            uint64_t v15 = 1610LL;
          }
        }

        else
        {
          uint64_t v15 = 0LL;
        }

        if (!v13) {
          goto LABEL_42;
        }
        BOOL v20 = [*a3 longLongValue] < v14->var1;
        goto LABEL_39;
      }

      if (type == 400)
      {
LABEL_19:
        if (v11)
        {
          [*a3 doubleValue];
          else {
            uint64_t v15 = 1610LL;
          }
        }

        else
        {
          uint64_t v15 = 0LL;
        }

        if (!v13) {
          goto LABEL_42;
        }
        [*a3 doubleValue];
        BOOL v20 = v19 < *(double *)&v14->var1;
LABEL_39:
        uint64_t v21 = 1620LL;
        goto LABEL_40;
      }
    }
  }

  else
  {
    uint64_t v15 = 0LL;
  }

- (void)_versionHash:(char *)a3 inStyle:(unint64_t)a4
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  CC_SHA256_Init(&c);
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSAttributeDescription;
  -[NSPropertyDescription _versionHash:inStyle:](&v9, sel__versionHash_inStyle_, data, a4);
  CC_SHA256_Update(&c, data, 0x20u);
  int v8 = -[NSAttributeDescription attributeType](self, "attributeType");
  CC_SHA256_Update(&c, &v8, 4u);
  if (-[NSAttributeDescription allowsExternalBinaryDataStorage](self, "allowsExternalBinaryDataStorage"))
  {
    char v7 = 1;
    CC_SHA256_Update(&c, &v7, 1u);
  }

  if (-[NSAttributeDescription preservesValueInHistoryOnDeletion](self, "preservesValueInHistoryOnDeletion"))
  {
    char v7 = 1;
    CC_SHA256_Update(&c, &v7, 1u);
  }

  CC_SHA256_Final((unsigned __int8 *)a3, &c);
}

- (id)_initWithName:(id)a3 type:(unint64_t)a4
{
  char v7 = +[NSAttributeDescription _classNameForType:]((uint64_t)&OBJC_CLASS___NSAttributeDescription, a4);
  if (v7 != (NSString *)NSKeyValueCoding_NullValue) {
    return -[NSAttributeDescription _initWithName:type:withClassName:]( self,  "_initWithName:type:withClassName:",  a3,  a4,  v7);
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], objc_msgSend( NSString, "stringWithFormat:", @"Can't find class for type %lu", a4), 0 reason userInfo]);
  return -[NSAttributeDescription _initWithType:](v9, v10, v11);
}

- (id)_initWithType:(unint64_t)a3
{
  return -[NSAttributeDescription _initWithName:type:](self, "_initWithName:type:", 0LL, a3);
}

- (Class)_attributeValueClass
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  attributeValueClass = self->_attributeValueClass;
  if (byte_18C4ABDC6)
  {
    if (!attributeValueClass)
    {
      if (!self->_attributeValueClassName
        || (uint64_t v4 = (void *)MEMORY[0x186E3E5D8](),
            self->_attributeValueClass = (Class)[(id)-[NSAttributeDescription _attributeValueClasses]((id *)&self->super.super.isa) firstObject],  objc_autoreleasePoolPop(v4),  (attributeValueClass = self->_attributeValueClass) == 0))
      {
        attributeValueClass = (objc_class *)objc_opt_class();
        self->_attributeValueClass = attributeValueClass;
      }
    }
  }

  else if (!attributeValueClass)
  {
    attributeValueClassName = self->_attributeValueClassName;
    if (attributeValueClassName)
    {
      attributeValueClass = NSClassFromString(attributeValueClassName);
      self->_attributeValueClass = attributeValueClass;
      if (!attributeValueClass)
      {
        if (byte_18C4ABDC6)
        {
          uint64_t v7 = [NSString stringWithUTF8String:"Could not materialize Objective-C class %@ for attribute named %@, property setter will not validate type"];
          int v8 = self->_attributeValueClassName;
          -[NSPropertyDescription name](self, "name");
          _NSCoreDataLog(17LL, v7, v9, v10, v11, v12, v13, v14, (uint64_t)v8);
          uint64_t v15 = (os_log_s *)__pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            uint64_t v16 = self->_attributeValueClassName;
            *(_DWORD *)buf = 138412546;
            double v18 = v16;
            __int16 v19 = 2112;
            BOOL v20 = -[NSPropertyDescription name](self, "name");
            _os_log_fault_impl( &dword_186681000,  v15,  OS_LOG_TYPE_FAULT,  "CoreData: Could not materialize Objective-C class %@ for attribute named %@, property setter will not validate type",  buf,  0x16u);
          }
        }

        attributeValueClass = (objc_class *)objc_opt_class();
        self->_attributeValueClass = attributeValueClass;
      }
    }

    else
    {
      attributeValueClass = 0LL;
    }
  }

  if (attributeValueClass == (objc_class *)objc_opt_class()) {
    return 0LL;
  }
  else {
    return self->_attributeValueClass;
  }
}

- (void)_writeIntoData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 entitiesSlots:(id)a8 fetchRequests:(id)a9
{
  int v16 = [a3 length];
  _writeInt32IntoData(a3, 0);
  uint64_t v17 = [a3 length];
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___NSAttributeDescription;
  -[NSPropertyDescription _appendPropertyFieldsToData:propertiesDict:uniquedPropertyNames:uniquedStrings:uniquedData:entitiesSlots:]( &v39,  sel__appendPropertyFieldsToData_propertiesDict_uniquedPropertyNames_uniquedStrings_uniquedData_entitiesSlots_,  a3,  a4,  a5,  a6,  a7,  a8);
  if (self->_valueTransformerName) {
    unsigned int v18 = objc_msgSend((id)objc_msgSend(a6, "valueForKey:"), "unsignedIntegerValue");
  }
  else {
    unsigned int v18 = 0;
  }
  _writeInt32IntoData(a3, v18);
  _writeInt32IntoData(a3, self->_type);
  if (self->_attributeValueClassName) {
    unsigned int v19 = objc_msgSend((id)objc_msgSend(a5, "valueForKey:"), "unsignedIntegerValue");
  }
  else {
    unsigned int v19 = 0;
  }
  _writeInt32IntoData(a3, v19);
  if (self->_defaultValue)
  {
    _writeInt32IntoData(a3, 1u);
    unsigned int type = self->_type;
    if (type <= 0x1F3)
    {
      if (self->_type > 0x12Bu)
      {
        if (type == 300)
        {
          _writeInt64IntoData(a3, [self->_defaultValue longLongValue]);
          goto LABEL_40;
        }

        if (type == 400)
        {
          id defaultValue = (id)[self->_defaultValue stringValue];
          id v22 = a5;
          goto LABEL_37;
        }

@end