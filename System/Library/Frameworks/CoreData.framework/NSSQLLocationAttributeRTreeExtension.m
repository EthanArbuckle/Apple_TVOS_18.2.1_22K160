@interface NSSQLLocationAttributeRTreeExtension
+ (uint64_t)newRTReeTableNameForAttribute:(uint64_t)a3 onEntity:;
- (BOOL)isEqualToExtension:(id)a3;
- (BOOL)validate:(id *)a3;
- (BOOL)validatePropertyWithDescription:(uint64_t)a3 andName:(uint64_t)a4 forUseAs:(uint64_t)a5 onAttributeNamed:(uint64_t)a6 onEntityNamed:(uint64_t *)a7 error:;
- (NSArray)bulkUpdateSQLStrings;
- (NSArray)dropSQLStrings;
- (NSArray)insertSQLStrings;
- (NSSQLLocationAttributeRTreeExtension)initWithObjectFromUserInfo:(id)a3 onAttributeNamed:(id)a4 onEntity:(id)a5;
- (void)dealloc;
- (void)generateSQLStrings;
@end

@implementation NSSQLLocationAttributeRTreeExtension

- (NSSQLLocationAttributeRTreeExtension)initWithObjectFromUserInfo:(id)a3 onAttributeNamed:(id)a4 onEntity:(id)a5
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___NSSQLLocationAttributeRTreeExtension;
  v14 = -[NSSQLLocationAttributeRTreeExtension init](&v20, sel_init);
  if (v14)
  {
    if (a3 && (([a3 isNSArray] & 1) != 0 || (objc_msgSend(a3, "isNSString") & 1) != 0))
    {
      v14->_userInfoObject = a3;
      v14->_sqlEntity = (NSSQLEntity *)a5;
      v14->_attributeName = (NSString *)a4;
      v14->_components = 0LL;
      v15 = (NSAttributeDescription *)(id)objc_msgSend( (id)objc_msgSend( -[NSSQLEntity entityDescription]( v14->_sqlEntity,  "entityDescription"),  "attributesByName"),  "valueForKey:",  a4);
      v14->_attributeDescription = v15;
      v14->_rtreeTableName = (NSString *)+[NSSQLLocationAttributeRTreeExtension newRTReeTableNameForAttribute:onEntity:]( (uint64_t)&OBJC_CLASS___NSSQLLocationAttributeRTreeExtension,  v15,  (uint64_t)-[NSSQLEntity entityDescription]( v14->_sqlEntity,  "entityDescription"));
      v14->_latProp = 0LL;
      v14->_longProp = 0LL;
      v14->_insertSQLStrings = (NSArray *)objc_alloc_init(MEMORY[0x189603F18]);
      v14->_dropSQLStrings = (NSArray *)objc_alloc_init(MEMORY[0x189603F18]);
      v14->_bulkUpdateSQLStrings = (NSArray *)objc_alloc_init(MEMORY[0x189603F18]);
      int v16 = -[NSObject isNSArray](v14->_userInfoObject, "isNSArray");
      userInfoObject = v14->_userInfoObject;
      if (v16)
      {
        v18 = -[NSObject copy](userInfoObject, "copy");
LABEL_10:
        v14->_components = v18;
        return v14;
      }

      if (-[NSObject isNSString](userInfoObject, "isNSString"))
      {
        v18 = (NSArray *)(id)objc_msgSend( (id)-[NSObject stringByReplacingOccurrencesOfString:withString:]( v14->_userInfoObject,  "stringByReplacingOccurrencesOfString:withString:",  @" ",  &stru_189EAC2E8),  "componentsSeparatedByString:",  @",");
        goto LABEL_10;
      }
    }

    else
    {
      _NSCoreDataLog( 1LL,  (uint64_t)@"UserInfo Object for RTree location must be either an array or a comma separated string of two components identifying the latitude / longitude properties - %@",  v8,  v9,  v10,  v11,  v12,  v13,  (uint64_t)a4);

      return 0LL;
    }
  }

  return v14;
}

+ (uint64_t)newRTReeTableNameForAttribute:(uint64_t)a3 onEntity:
{
  id v5 = objc_alloc(NSString);
  if (a3)
  {
    if ((*(_BYTE *)(a3 + 120) & 4) != 0)
    {
      v6 = *(void **)(a3 + 72);
    }

    else
    {
      do
      {
        v6 = (void *)a3;
        a3 = [(id)a3 superentity];
      }

      while (a3);
    }
  }

  else
  {
    v6 = 0LL;
  }

  return [v5 initWithFormat:@"Z_RT_%@_%@", objc_msgSend(v6, "name"), objc_msgSend(a2, "name")];
}

- (void)dealloc
{
  self->_userInfoObject = 0LL;
  self->_components = 0LL;

  self->_sqlEntity = 0LL;
  self->_attributeName = 0LL;

  self->_attributeDescription = 0LL;
  self->_rtreeTableName = 0LL;

  self->_latProp = 0LL;
  self->_longProp = 0LL;

  self->_insertSQLStrings = 0LL;
  self->_dropSQLStrings = 0LL;

  self->_bulkUpdateSQLStrings = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLLocationAttributeRTreeExtension;
  -[NSSQLLocationAttributeRTreeExtension dealloc](&v3, sel_dealloc);
}

- (NSArray)insertSQLStrings
{
  return self->_insertSQLStrings;
}

- (NSArray)dropSQLStrings
{
  return self->_dropSQLStrings;
}

- (NSArray)bulkUpdateSQLStrings
{
  return self->_bulkUpdateSQLStrings;
}

- (BOOL)isEqualToExtension:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___NSSQLLocationAttributeRTreeExtension;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  NSUInteger v6 = -[NSArray count](self->_components, "count");
  v7 = a3 ? (void *)*((void *)a3 + 2) : 0LL;
  if (v6 != [v7 count]) {
    return 0;
  }
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  char v16 = 1;
  components = self->_components;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __59__NSSQLLocationAttributeRTreeExtension_isEqualToExtension___block_invoke;
  v12[3] = &unk_189EAAB60;
  v12[4] = a3;
  v12[5] = &v13;
  -[NSArray enumerateObjectsUsingBlock:](components, "enumerateObjectsUsingBlock:", v12);
  if (*((_BYTE *)v14 + 24)
    && (!a3 ? (uint64_t v9 = 0LL) : (uint64_t v9 = *((void *)a3 + 6)),
        -[NSAttributeDescription isEqual:](self->_attributeDescription, "isEqual:", v9)))
  {
    if (a3) {
      uint64_t v10 = *((void *)a3 + 3);
    }
    else {
      uint64_t v10 = 0LL;
    }
    BOOL v5 = -[NSStoreMapping isEqual:](self->_sqlEntity, "isEqual:", v10);
  }

  else
  {
    BOOL v5 = 0;
  }

  _Block_object_dispose(&v13, 8);
  return v5;
}

uint64_t __59__NSSQLLocationAttributeRTreeExtension_isEqualToExtension___block_invoke( uint64_t a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    v7 = *(void **)(v6 + 16);
  }
  else {
    v7 = 0LL;
  }
  uint64_t result = objc_msgSend(a2, "isEqualToString:", objc_msgSend(v7, "objectAtIndexedSubscript:"));
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
    *a4 = 1;
  }

  return result;
}

- (BOOL)validate:(id *)a3
{
  v51[1] = *MEMORY[0x1895F89C0];
  v37 = 0LL;
  id v5 = -[NSSQLEntity entityDescription](self->_sqlEntity, "entityDescription");
  attributeDescription = self->_attributeDescription;
  if (!attributeDescription)
  {
    uint64_t v13 = (void *)MEMORY[0x189607870];
    uint64_t v14 = *MEMORY[0x189607460];
    uint64_t v42 = *MEMORY[0x1896075F0];
    uint64_t v43 = [NSString stringWithFormat:@"Unable to configure location index: couldn't find an attribute named '%@' on '%@'", self->_attributeName, objc_msgSend(-[NSSQLEntity entityDescription](self->_sqlEntity, "entityDescription"), "name")];
    uint64_t v15 = (void *)MEMORY[0x189603F68];
    char v16 = &v43;
    objc_super v17 = &v42;
LABEL_6:
    uint64_t v18 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:1];
    v19 = v13;
    uint64_t v20 = v14;
    goto LABEL_9;
  }

  if (!-[NSPropertyDescription isTransient](attributeDescription, "isTransient"))
  {
    uint64_t v21 = [NSString stringWithFormat:@"RTree tables can only be created to back transient attributes. %@.%@ is not transient.", objc_msgSend(v5, "name"), -[NSPropertyDescription name](self->_attributeDescription, "name")];
    uint64_t v8 = (void *)MEMORY[0x189607870];
    uint64_t v9 = *MEMORY[0x189607460];
    uint64_t v44 = *MEMORY[0x1896075F0];
    uint64_t v45 = v21;
    uint64_t v10 = (void *)MEMORY[0x189603F68];
    uint64_t v11 = &v45;
    uint64_t v12 = &v44;
    goto LABEL_8;
  }

  if (-[NSAttributeDescription attributeType](self->_attributeDescription, "attributeType"))
  {
    uint64_t v7 = [NSString stringWithFormat:@"Unable to configure location index: %@.%@ type is %@ but should be %@.", objc_msgSend(v5, "name"), -[NSPropertyDescription name](self->_attributeDescription, "name"), +[NSAttributeDescription stringForAttributeType:]( NSAttributeDescription, "stringForAttributeType:", -[NSAttributeDescription attributeType](self->_attributeDescription, "attributeType")), +[NSAttributeDescription stringForAttributeType:]( NSAttributeDescription, "stringForAttributeType:", 0)];
    uint64_t v8 = (void *)MEMORY[0x189607870];
    uint64_t v9 = *MEMORY[0x189607460];
    uint64_t v46 = *MEMORY[0x1896075F0];
    uint64_t v47 = v7;
    uint64_t v10 = (void *)MEMORY[0x189603F68];
    uint64_t v11 = &v47;
    uint64_t v12 = &v46;
LABEL_8:
    uint64_t v18 = [v10 dictionaryWithObjects:v11 forKeys:v12 count:1];
    v19 = v8;
    uint64_t v20 = v9;
LABEL_9:
    v22 = (void *)[v19 errorWithDomain:v20 code:134060 userInfo:v18];
    v37 = v22;
    if (v22) {
      goto LABEL_10;
    }
LABEL_22:
    uint64_t v28 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog( 17LL,  v28,  v29,  v30,  v31,  v32,  v33,  v34,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLLocationAttributeRTreeExtension.m");
    v35 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v39 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLLocationAttributeRTreeExtension.m";
      __int16 v40 = 1024;
      int v41 = 181;
      _os_log_fault_impl( &dword_186681000,  v35,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
    }

    return 0;
  }

  components = self->_components;
  if (!components)
  {
    uint64_t v13 = (void *)MEMORY[0x189607870];
    uint64_t v14 = *MEMORY[0x189607460];
    uint64_t v48 = *MEMORY[0x1896075F0];
    uint64_t v49 = [NSString stringWithFormat:@"%@.%@ has an invalid description for a location index. It must be either an array or a comma separated string of two components identifying the latitude / longitude properties to use.", objc_msgSend(-[NSSQLEntity entityDescription](self->_sqlEntity, "entityDescription"), "name"), self->_attributeName];
    uint64_t v15 = (void *)MEMORY[0x189603F68];
    char v16 = &v49;
    objc_super v17 = &v48;
    goto LABEL_6;
  }

  if (-[NSArray count](components, "count") != 2)
  {
    uint64_t v13 = (void *)MEMORY[0x189607870];
    uint64_t v14 = *MEMORY[0x189607460];
    uint64_t v50 = *MEMORY[0x1896075F0];
    v51[0] = [NSString stringWithFormat:@"'%@' is not a valid description for a location index, it should include two comma separated components or be an array of two string identifying the attributes which make up the location index.", self->_userInfoObject];
    uint64_t v15 = (void *)MEMORY[0x189603F68];
    char v16 = v51;
    objc_super v17 = &v50;
    goto LABEL_6;
  }

  id v25 = -[NSArray firstObject](self->_components, "firstObject");
  id v26 = -[NSArray lastObject](self->_components, "lastObject");
  if (v5)
  {
    self->_latProp = (NSAttributeDescription *)(id)objc_msgSend( (id)objc_msgSend(v5, "propertiesByName"),  "objectForKey:",  v25);
    v27 = (void *)objc_msgSend((id)objc_msgSend(v5, "propertiesByName"), "objectForKey:", v26);
  }

  else
  {
    v27 = 0LL;
    self->_latProp = 0LL;
  }

  self->_longProp = (NSAttributeDescription *)v27;
  if (-[NSSQLLocationAttributeRTreeExtension validatePropertyWithDescription:andName:forUseAs:onAttributeNamed:onEntityNamed:error:]( (BOOL)self,  self->_latProp,  (uint64_t)v25,  (uint64_t)@"latitude",  (uint64_t)self->_attributeName,  [v5 name],  (uint64_t *)&v37)
    && -[NSSQLLocationAttributeRTreeExtension validatePropertyWithDescription:andName:forUseAs:onAttributeNamed:onEntityNamed:error:]( (BOOL)self,  self->_longProp,  (uint64_t)v26,  (uint64_t)@"longitude",  (uint64_t)self->_attributeName,  [v5 name],  (uint64_t *)&v37))
  {
    -[NSSQLLocationAttributeRTreeExtension generateSQLStrings]((uint64_t)self);
    return 1;
  }

  v22 = v37;
  if (!v37) {
    goto LABEL_22;
  }
LABEL_10:
  if (!a3) {
    return 0;
  }
  BOOL v23 = 0;
  *a3 = v22;
  return v23;
}

- (BOOL)validatePropertyWithDescription:(uint64_t)a3 andName:(uint64_t)a4 forUseAs:(uint64_t)a5 onAttributeNamed:(uint64_t)a6 onEntityNamed:(uint64_t *)a7 error:
{
  v49[1] = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v13 = result;
    uint64_t v14 = (void *)[NSString stringWithFormat:@"Unable to configure location index (invalid %@ on %@.%@): ", a4, a6, a5];
    uint64_t v15 = v14;
    if (a2)
    {
      if ([a2 _isAttribute])
      {
        if ([a2 isTransient])
        {
          uint64_t v16 = [v15 stringByAppendingFormat:@"%@.%@ is a transient attribute.", a6, a3];
          objc_super v17 = (void *)MEMORY[0x189607870];
          uint64_t v18 = *MEMORY[0x189607460];
          uint64_t v46 = *MEMORY[0x1896075F0];
          uint64_t v47 = v16;
          v19 = (void *)MEMORY[0x189603F68];
          uint64_t v20 = &v47;
          uint64_t v21 = &v46;
        }

        else
        {
          if ([a2 attributeType] == 500) {
            return 1LL;
          }
          uint64_t v28 = [NSString stringWithFormat:@"Unable to configure location index (invalid %@ on %@.%@): %@.%@ is of type %@ and should be of type %@.", a4, objc_msgSend((id)objc_msgSend(*(id *)(v13 + 24), "entityDescription"), "name"), a5, objc_msgSend((id)objc_msgSend(*(id *)(v13 + 24), "entityDescription"), "name"), a3, +[NSAttributeDescription stringForAttributeType:]( NSAttributeDescription, "stringForAttributeType:", objc_msgSend(a2, "attributeType")), +[NSAttributeDescription stringForAttributeType:]( NSAttributeDescription, "stringForAttributeType:", 500)];
          objc_super v17 = (void *)MEMORY[0x189607870];
          uint64_t v18 = *MEMORY[0x189607460];
          uint64_t v48 = *MEMORY[0x1896075F0];
          v49[0] = v28;
          v19 = (void *)MEMORY[0x189603F68];
          uint64_t v20 = v49;
          uint64_t v21 = &v48;
        }
      }

      else
      {
        uint64_t v27 = [v15 stringByAppendingFormat:@"%@.%@ is a relationship.", a6, a3];
        objc_super v17 = (void *)MEMORY[0x189607870];
        uint64_t v18 = *MEMORY[0x189607460];
        uint64_t v44 = *MEMORY[0x1896075F0];
        uint64_t v45 = v27;
        v19 = (void *)MEMORY[0x189603F68];
        uint64_t v20 = &v45;
        uint64_t v21 = &v44;
      }

      uint64_t v24 = [v19 dictionaryWithObjects:v20 forKeys:v21 count:1];
      id v25 = v17;
      uint64_t v26 = v18;
    }

    else
    {
      v22 = (void *)MEMORY[0x189607870];
      uint64_t v23 = *MEMORY[0x189607460];
      uint64_t v42 = *MEMORY[0x1896075F0];
      uint64_t v43 = [v14 stringByAppendingFormat:@"couldn't find an attribute named '%@' on '%@' to use as the %@.", a3, a6, a4];
      uint64_t v24 = [MEMORY[0x189603F68] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
      id v25 = v22;
      uint64_t v26 = v23;
    }

    uint64_t v29 = [v25 errorWithDomain:v26 code:134060 userInfo:v24];
    if (v29)
    {
      if (a7)
      {
        uint64_t result = 0LL;
        *a7 = v29;
        return result;
      }
    }

    else
    {
      uint64_t v30 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v30,  v31,  v32,  v33,  v34,  v35,  v36,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLLocationAttributeRTreeExtension.m");
      v37 = (os_log_s *)__pflogFaultLog;
      uint64_t result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!result) {
        return result;
      }
      *(_DWORD *)buf = 136315394;
      v39 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLLocationAttributeRTreeExtension.m";
      __int16 v40 = 1024;
      int v41 = 226;
      _os_log_fault_impl( &dword_186681000,  v37,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
    }

    return 0LL;
  }

  return result;
}

- (void)generateSQLStrings
{
  if (a1)
  {
    v2 = *(id **)(a1 + 24);
    uint64_t v3 = [*(id *)(a1 + 56) name];
    if (v2) {
      v2 = (id *)[v2[5] objectForKey:v3];
    }
    uint64_t v4 = *(void *)(a1 + 24);
    uint64_t v5 = [*(id *)(a1 + 64) name];
    if (v4) {
      uint64_t v6 = (void *)[*(id *)(v4 + 40) objectForKey:v5];
    }
    else {
      uint64_t v6 = 0LL;
    }
    uint64_t v7 = [*(id *)(a1 + 24) tableName];
    uint64_t v8 = [v2 columnName];
    uint64_t v9 = [v6 columnName];
    id v10 = objc_alloc_init(MEMORY[0x189603FA8]);
    id v11 = objc_alloc_init(MEMORY[0x189603FA8]);
    id v12 = objc_alloc_init(MEMORY[0x189603FA8]);
    [v10 addObject:objc_msgSend( NSString, "stringWithFormat:", @"CREATE VIRTUAL TABLE IF NOT EXISTS %@ USING RTREE (Z_PK INTEGER PRIMARY KEY, %@_MIN FLOAT, %@_MAX FLOAT, %@_MIN FLOAT, %@_MAX FLOAT)", *(void *)(a1 + 40), v8, v8, v9, v9)];
    [v11 addObject:objc_msgSend(NSString, "stringWithFormat:", @"DROP TABLE IF EXISTS %@", *(void *)(a1 + 40))];
    objc_msgSend( v10,  "addObject:",  objc_msgSend( NSString,  "stringWithFormat:",  @"CREATE TRIGGER IF NOT EXISTS %@_INSERT AFTER INSERT ON %@ FOR EACH ROW BEGIN INSERT OR REPLACE INTO %@ (Z_PK, %@_MIN, %@_MAX, %@_MIN, %@_MAX) VALUES (NEW.Z_PK, NEW.%@ ,NEW.%@, NEW.%@, NEW.%@) ; END",
        *(void *)(a1 + 40),
        v7,
        *(void *)(a1 + 40),
        v8,
        v8,
        v9,
        v9,
        v8,
        v8,
        v9,
        v9));
    [v11 addObject:objc_msgSend( NSString, "stringWithFormat:", @"DROP TRIGGER IF EXISTS %@_INSERT", *(void *)(a1 + 40))];
    objc_msgSend( v10,  "addObject:",  objc_msgSend( NSString,  "stringWithFormat:",  @"CREATE TRIGGER IF NOT EXISTS %@_UPDATE AFTER UPDATE ON %@ FOR EACH ROW BEGIN DELETE FROM %@ WHERE Z_PK = NEW.Z_PK ; INSERT INTO %@ (Z_PK, %@_MIN, %@_MAX, %@_MIN, %@_MAX) VALUES (NEW.Z_PK, NEW.%@ ,NEW.%@, NEW.%@, NEW.%@) ; END",
        *(void *)(a1 + 40),
        v7,
        *(void *)(a1 + 40),
        *(void *)(a1 + 40),
        v8,
        v8,
        v9,
        v9,
        v8,
        v8,
        v9,
        v9));
    [v11 addObject:objc_msgSend( NSString, "stringWithFormat:", @"DROP TRIGGER IF EXISTS %@_UPDATE", *(void *)(a1 + 40))];
    objc_msgSend( v10,  "addObject:",  objc_msgSend( NSString,  "stringWithFormat:",  @"CREATE TRIGGER IF NOT EXISTS %@_DELETE AFTER DELETE ON %@ FOR EACH ROW BEGIN DELETE FROM %@ WHERE Z_PK = OLD.Z_PK ; END",
        *(void *)(a1 + 40),
        v7,
        *(void *)(a1 + 40)));
    [v11 addObject:objc_msgSend( NSString, "stringWithFormat:", @"DROP TRIGGER IF EXISTS %@_DELETE", *(void *)(a1 + 40))];
    [v12 addObject:objc_msgSend( NSString, "stringWithFormat:", @"INSERT OR REPLACE INTO %@ (Z_PK, %@_MIN, %@_MAX, %@_MIN, %@_MAX) SELECT Z_PK, %@, %@, %@, %@ from %@ where %@ NOT NULL and %@ NOT NULL", *(void *)(a1 + 40), v8, v8, v9, v9, v8, v8, v9, v9, v7, v8, v9)];

    *(void *)(a1 + 72) = [v10 copy];
    *(void *)(a1 + 80) = [v11 copy];

    *(void *)(a1 + 88) = [v12 copy];
  }

@end