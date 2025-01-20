@interface DBGSnapshotProperty
+ (id)propertyWithDebugHierarchyProperty:(id)a3;
+ (id)propertyWithName:(id)a3;
+ (id)propertyWithName:(id)a3 runtimeTypeName:(id)a4 value:(id)a5;
- (BOOL)BOOLValue;
- (BOOL)logicalTypeEquals:(id)a3;
- (CGPoint)pointValue;
- (CGRect)rectValue;
- (CGSize)sizeValue;
- (DBGSnapshotNode)snapshotNode;
- (DBGSnapshotProperty)initWithName:(id)a3 runtimeTypeName:(id)a4 value:(id)a5 fetchStatus:(int64_t)a6;
- (DBGValue)value;
- (DebugHierarchyProperty)backingRuntimeTypeProperty;
- (NSData)dataValue;
- (NSMutableDictionary)subpropertiesMap;
- (NSString)stringValue;
- (double)CGFloatValue;
- (float)floatValue;
- (id)JSONPropertyDescription;
- (id)allSubproperties;
- (id)debugDescription;
- (id)description;
- (id)dictionaryRepresentation;
- (id)format;
- (id)logicalType;
- (id)subpropertyWithName:(id)a3;
- (int64_t)fetchStatus;
- (int64_t)integerValue;
- (int64_t)options;
- (int64_t)visibility;
- (void)addSubproperties:(id)a3;
- (void)addSubproperty:(id)a3;
- (void)setBackingRuntimeTypeProperty:(id)a3;
- (void)setBoolValue:(BOOL)a3;
- (void)setCGFloatValue:(double)a3;
- (void)setFetchStatus:(int64_t)a3;
- (void)setIntegerValue:(int64_t)a3;
- (void)setPointValue:(CGPoint)a3;
- (void)setRectValue:(CGRect)a3;
- (void)setSizeValue:(CGSize)a3;
- (void)setSnapshotNode:(id)a3;
- (void)setSubpropertiesMap:(id)a3;
- (void)setValue:(id)a3;
- (void)updateWithJSONPropertyDescription:(id)a3;
@end

@implementation DBGSnapshotProperty

+ (id)propertyWithName:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithName:v4 runtimeTypeName:0 value:0 fetchStatus:0];

  return v5;
}

+ (id)propertyWithName:(id)a3 runtimeTypeName:(id)a4 value:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithName:v10 runtimeTypeName:v9 value:v8 fetchStatus:4];

  return v11;
}

+ (id)propertyWithDebugHierarchyProperty:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 runtimeTypeName]);
  id v8 = [v5 initWithName:v6 runtimeTypeName:v7 value:0 fetchStatus:0];

  [v8 setBackingRuntimeTypeProperty:v4];
  return v8;
}

- (DBGSnapshotProperty)initWithName:(id)a3 runtimeTypeName:(id)a4 value:(id)a5 fetchStatus:(int64_t)a6
{
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___DBGSnapshotProperty;
  v12 = -[DBGSnapshotProperty initWithName:runtimeTypeName:](&v15, "initWithName:runtimeTypeName:", a3, a4);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_value, a5);
    v13->_fetchStatus = a6;
  }

  return v13;
}

- (id)allSubproperties
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty subpropertiesMap](self, "subpropertiesMap"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allValues]);

  return v3;
}

- (id)subpropertyWithName:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty subpropertiesMap](self, "subpropertiesMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  return v6;
}

- (void)addSubproperty:(id)a3
{
  id v8 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty snapshotNode](self, "snapshotNode"));
  [v8 setSnapshotNode:v4];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty subpropertiesMap](self, "subpropertiesMap"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty subpropertiesMap](self, "subpropertiesMap"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
    [v6 setObject:v8 forKey:v7];
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObject:forKey:",  v8,  v6));
    -[DBGSnapshotProperty setSubpropertiesMap:](self, "setSubpropertiesMap:", v7);
  }
}

- (void)addSubproperties:(id)a3
{
  id v4 = a3;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[DBGSnapshotProperty addSubproperty:]( self,  "addSubproperty:",  *(void *)(*((void *)&v9 + 1) + 8LL * (void)v8));
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }
}

- (BOOL)logicalTypeEquals:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty logicalType](self, "logicalType"));

  unsigned __int8 v6 = 0;
  if (v4 && v5)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty logicalType](self, "logicalType"));
    unsigned __int8 v6 = [v7 isEqualToString:v4];
  }

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty name](self, "name"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty runtimeTypeName](self, "runtimeTypeName"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty logicalType](self, "logicalType"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty format](self, "format"));
  int64_t v8 = -[DBGSnapshotProperty visibility](self, "visibility");
  int64_t v9 = -[DBGSnapshotProperty options](self, "options");
  id v10 = v3;
  id v11 = v4;
  id v12 = v5;
  v13 = v6;
  id v14 = v7;
  Mutable = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v16 = Mutable;
  if (v10) {
    CFDictionaryAddValue(Mutable, @"propertyValue", v10);
  }
  if (v11) {
    CFDictionaryAddValue(v16, @"propertyName", v11);
  }
  if (v12) {
    CFDictionaryAddValue(v16, @"propertyRuntimeType", v12);
  }
  if (v13) {
    v17 = v13;
  }
  else {
    v17 = @"DebugHierarchyLogicalPropertyTypeCustom";
  }
  CFDictionaryAddValue(v16, @"propertyLogicalType", v17);
  if (v14) {
    CFDictionaryAddValue(v16, @"propertyFormat", v14);
  }
  if (v8 != 1)
  {
    int64_t valuePtr = v8;
    CFNumberRef v18 = CFNumberCreate(0LL, kCFNumberCFIndexType, &valuePtr);
    CFDictionaryAddValue(v16, @"visibility", v18);
    CFRelease(v18);
  }

  if (v9)
  {
    int64_t valuePtr = v9;
    CFNumberRef v19 = CFNumberCreate(0LL, kCFNumberCFIndexType, &valuePtr);
    CFDictionaryAddValue(v16, @"propertyOptions", v19);
    CFRelease(v19);
  }

  return v16;
}

- (id)logicalType
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___DBGSnapshotProperty;
  id v3 = -[DBGSnapshotProperty logicalType](&v7, "logicalType");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (!v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty backingRuntimeTypeProperty](self, "backingRuntimeTypeProperty"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 logicalType]);
  }

  return v4;
}

- (id)format
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___DBGSnapshotProperty;
  id v3 = -[DBGSnapshotProperty format](&v7, "format");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (!v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty backingRuntimeTypeProperty](self, "backingRuntimeTypeProperty"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 format]);
  }

  return v4;
}

- (int64_t)visibility
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DBGSnapshotProperty;
  id v3 = -[DBGSnapshotProperty visibility](&v6, "visibility");
  if (!v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty backingRuntimeTypeProperty](self, "backingRuntimeTypeProperty"));
    id v3 = [v4 visibility];
  }

  return (int64_t)v3;
}

- (int64_t)options
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DBGSnapshotProperty;
  id v3 = -[DBGSnapshotProperty options](&v6, "options");
  if (!v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty backingRuntimeTypeProperty](self, "backingRuntimeTypeProperty"));
    id v3 = [v4 options];
  }

  return (int64_t)v3;
}

- (DebugHierarchyProperty)backingRuntimeTypeProperty
{
  backingRuntimeTypeProperty = self->_backingRuntimeTypeProperty;
  if (!backingRuntimeTypeProperty)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty snapshotNode](self, "snapshotNode"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 runtimeType]);
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty name](self, "name"));
    objc_super v7 = (DebugHierarchyProperty *)objc_claimAutoreleasedReturnValue([v5 propertyWithName:v6]);
    int64_t v8 = self->_backingRuntimeTypeProperty;
    self->_backingRuntimeTypeProperty = v7;

    backingRuntimeTypeProperty = self->_backingRuntimeTypeProperty;
  }

  return backingRuntimeTypeProperty;
}

- (BOOL)BOOLValue
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___DBGBool, v5);
    objc_opt_isKindOfClass(v4, v6);
  }

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
  unsigned __int8 v8 = [v7 BOOLValue];

  return v8;
}

- (void)setBoolValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___DBGBool, v7);
    objc_opt_isKindOfClass(v6, v8);
  }

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
  [v9 setBoolValue:v3];
}

- (int64_t)integerValue
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___DBGInteger, v4);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___DBGEnumValue, v8);
  char v10 = objc_opt_isKindOfClass(v7, v9);

  if ((isKindOfClass & 1) == 0 && (v10 & 1) == 0) {
    return 0LL;
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
  id v13 = [v12 integerValue];

  return (int64_t)v13;
}

- (void)setIntegerValue:(int64_t)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___DBGInteger, v6);
  char isKindOfClass = objc_opt_isKindOfClass(v5, v7);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___DBGEnumValue, v10);
  char v12 = objc_opt_isKindOfClass(v9, v11);

  if ((isKindOfClass & 1) != 0)
  {
    id v14 = (id)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
    [v14 setIntegerValue:a3];
  }

  else
  {
    if ((v12 & 1) == 0) {
      return;
    }
    id v14 = (id)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    [v14 setEnumValue:v13];
  }
}

- (double)CGFloatValue
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___DBGCGFloat, v5);
    objc_opt_isKindOfClass(v4, v6);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
  [v7 CGFloatValue];
  double v9 = v8;

  return v9;
}

- (void)setCGFloatValue:(double)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___DBGCGFloat, v7);
    objc_opt_isKindOfClass(v6, v8);
  }

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
  [v9 setCGFloatValue:a3];
}

- (CGPoint)pointValue
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___DBGPoint, v5);
    objc_opt_isKindOfClass(v4, v6);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
  [v7 point];
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (void)setPointValue:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___DBGPoint, v8);
    objc_opt_isKindOfClass(v7, v9);
  }

  id v10 = (id)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
  objc_msgSend(v10, "setPoint:", x, y);
}

- (CGSize)sizeValue
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___DBGSize, v5);
    objc_opt_isKindOfClass(v4, v6);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
  [v7 size];
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)setSizeValue:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___DBGSize, v8);
    objc_opt_isKindOfClass(v7, v9);
  }

  id v10 = (id)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
  objc_msgSend(v10, "setSize:", width, height);
}

- (CGRect)rectValue
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___DBGRect, v5);
    objc_opt_isKindOfClass(v4, v6);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
  [v7 rect];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (void)setRectValue:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
  if (v8)
  {
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___DBGRect, v10);
    objc_opt_isKindOfClass(v9, v11);
  }

  id v12 = (id)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
  objc_msgSend(v12, "setRect:", x, y, width, height);
}

- (float)floatValue
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___DBGFloat, v5);
    objc_opt_isKindOfClass(v4, v6);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
  [v7 floatValue];
  float v9 = v8;

  return v9;
}

- (NSString)stringValue
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___DBGString, v5);
    objc_opt_isKindOfClass(v4, v6);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
  float v8 = (void *)objc_claimAutoreleasedReturnValue([v7 string]);

  return (NSString *)v8;
}

- (NSData)dataValue
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___DBGData, v5);
    objc_opt_isKindOfClass(v4, v6);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
  float v8 = (void *)objc_claimAutoreleasedReturnValue([v7 data]);

  return (NSData *)v8;
}

- (id)debugDescription
{
  BOOL v3 = (objc_class *)objc_opt_class(self, a2);
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty name](self, "name"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty runtimeTypeName](self, "runtimeTypeName"));
  float v8 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
  int64_t v9 = -[DBGSnapshotProperty visibility](self, "visibility");
  else {
    uint64_t v10 = *(&off_208C8 + v9 - 1);
  }
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p; name = %@; type = %@; value = %@; visibility = %@>",
                    v5,
                    self,
                    v6,
                    v7,
                    v8,
                    v10));

  return v11;
}

- (id)description
{
  BOOL v3 = (objc_class *)objc_opt_class(self, a2);
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty name](self, "name"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
  float v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p; %@ = %@>",
                   v5,
                   self,
                   v6,
                   v7));

  return v8;
}

- (DBGValue)value
{
  return (DBGValue *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setValue:(id)a3
{
}

- (int64_t)fetchStatus
{
  return self->_fetchStatus;
}

- (void)setFetchStatus:(int64_t)a3
{
  self->_fetchStatus = a3;
}

- (DBGSnapshotNode)snapshotNode
{
  return (DBGSnapshotNode *)objc_loadWeakRetained((id *)&self->_snapshotNode);
}

- (void)setSnapshotNode:(id)a3
{
}

- (NSMutableDictionary)subpropertiesMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setSubpropertiesMap:(id)a3
{
}

- (void)setBackingRuntimeTypeProperty:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)updateWithJSONPropertyDescription:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"visibility"]);
  uint64_t v6 = v5;
  if (v5) {
    -[DBGSnapshotProperty setVisibility:](self, "setVisibility:", [v5 integerValue]);
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"propertyRuntimeType"]);
  if (v7) {
    -[DBGSnapshotProperty setRuntimeTypeName:](self, "setRuntimeTypeName:", v7);
  }
  float v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"propertyLogicalType"]);
  if (v8) {
    -[DBGSnapshotProperty setLogicalType:](self, "setLogicalType:", v8);
  }
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"propertyFormat"]);
  if (v9) {
    -[DBGSnapshotProperty setFormat:](self, "setFormat:", v9);
  }
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"fetchStatus"]);
  id v11 = [v10 integerValue];

  -[DBGSnapshotProperty setFetchStatus:](self, "setFetchStatus:", v11);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"propertyValue"]);
  if (v12 && [v9 length])
  {
    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty logicalType](self, "logicalType"));
    double v14 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty format](self, "format"));
    double v15 = (objc_class *)DBGValueClassForPropertyWith(v13, v14);

    if (-[objc_class conformsToProtocol:]( v15,  "conformsToProtocol:",  &OBJC_PROTOCOL___DBGValueJSONSerialization))
    {
      double v16 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty format](self, "format"));
      id v28 = 0LL;
      double v17 = (void *)objc_claimAutoreleasedReturnValue( -[objc_class valueWithEncodedValue:format:error:]( v15,  "valueWithEncodedValue:format:error:",  v12,  v16,  &v28));
      id v18 = v28;

      if (v18)
      {
        double v19 = (void *)objc_claimAutoreleasedReturnValue([v18 localizedDescription]);
        NSLog( @"%s - Error: %@",  "-[DBGSnapshotProperty(JSONSerialization) updateWithJSONPropertyDescription:]",  v19);

        id v20 = 0LL;
      }

      else
      {
        id v20 = v17;
      }
    }

    else
    {
      v21 = NSStringFromClass(v15);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v23 = NSStringFromProtocol((Protocol *)&OBJC_PROTOCOL___DBGValueJSONSerialization);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      NSLog(@"Can't create property value. Class %@ does not conform to %@", v22, v24);

      id v20 = 0LL;
    }

    -[DBGSnapshotProperty setValue:](self, "setValue:", v20);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"propertyOptions"]);
  id v26 = [v25 unsignedIntegerValue];

  -[DBGSnapshotProperty setOptions:](self, "setOptions:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty snapshotNode](self, "snapshotNode"));
  [v27 didUpdateProperty:self];
}

- (id)JSONPropertyDescription
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
  unsigned int v4 = [v3 conformsToProtocol:&OBJC_PROTOCOL___DBGValueJSONSerialization];

  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DBGSnapshotProperty value](self, "value"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 JSONCompatibleRepresentation]);
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  uint64_t v7 = *(void **)&self->DebugHierarchyProperty_opaque[OBJC_IVAR___DebugHierarchyProperty__name];
  float v8 = *(void **)&self->DebugHierarchyProperty_opaque[OBJC_IVAR___DebugHierarchyProperty__runtimeTypeName];
  int64_t v9 = *(void **)&self->DebugHierarchyProperty_opaque[OBJC_IVAR___DebugHierarchyProperty__logicalType];
  uint64_t v10 = *(void **)&self->DebugHierarchyProperty_opaque[OBJC_IVAR___DebugHierarchyProperty__format];
  uint64_t v11 = *(void *)&self->DebugHierarchyProperty_opaque[OBJC_IVAR___DebugHierarchyProperty__visibility];
  uint64_t v12 = *(void *)&self->DebugHierarchyProperty_opaque[OBJC_IVAR___DebugHierarchyProperty__options];
  id v13 = v6;
  id v14 = v7;
  id v15 = v8;
  double v16 = v9;
  id v17 = v10;
  Mutable = CFDictionaryCreateMutable(0LL, 7LL, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  double v19 = Mutable;
  if (v13) {
    CFDictionaryAddValue(Mutable, @"propertyValue", v13);
  }
  if (v14) {
    CFDictionaryAddValue(v19, @"propertyName", v14);
  }
  if (v15) {
    CFDictionaryAddValue(v19, @"propertyRuntimeType", v15);
  }
  if (v16) {
    id v20 = v16;
  }
  else {
    id v20 = @"DebugHierarchyLogicalPropertyTypeCustom";
  }
  CFDictionaryAddValue(v19, @"propertyLogicalType", v20);
  if (v17) {
    CFDictionaryAddValue(v19, @"propertyFormat", v17);
  }
  if (v11 != 1)
  {
    uint64_t valuePtr = v11;
    CFNumberRef v21 = CFNumberCreate(0LL, kCFNumberCFIndexType, &valuePtr);
    CFDictionaryAddValue(v19, @"visibility", v21);
    CFRelease(v21);
  }

  if (v12)
  {
    uint64_t valuePtr = v12;
    CFNumberRef v22 = CFNumberCreate(0LL, kCFNumberCFIndexType, &valuePtr);
    CFDictionaryAddValue(v19, @"propertyOptions", v22);
    CFRelease(v22);
  }

  return v19;
}

@end