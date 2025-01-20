@interface NSSQLDerivedAttributeSQLGenerator
+ (PFCloudKitImportZoneContext)generateSQLForDerivedAttribute:(void *)a3 keypaths:;
+ (const)_triggerColumnListComponentForAttributeKeypaths:(uint64_t)a3 startingAt:;
+ (uint64_t)_computeNewColumnTokenForKeypathExpression:(uint64_t)a3 governingEntity:;
+ (uint64_t)_computeSingleParameterTokenForFunctionAttribute:(uint64_t)a3 functionName:;
+ (uint64_t)_generateSQLForAttributeFunctionDerivationForDerivedAttribute:(void *)a3 keypaths:;
+ (uint64_t)_generateSQLForDerivedAttributeWithOneParameterKeypath:(void *)a3 keypaths:;
+ (uint64_t)_generateSQLForToOneDerivationForDerivedAttribute:(void *)a3 toOneKeypath:;
+ (uint64_t)_generateTriggerForAttribute:(uint64_t)a1 newToken:(void *)a2 updateToken:(uint64_t)a3 triggerColumnListComponent:(uint64_t)a4 triggerColumnWhereComponent:(void *)a5;
+ (uint64_t)_parameterPropertyTokenForDerivedAttribute:(void *)a3 andKeypath:(id *)a4 onEntity:;
@end

@implementation NSSQLDerivedAttributeSQLGenerator

+ (uint64_t)_parameterPropertyTokenForDerivedAttribute:(void *)a3 andKeypath:(id *)a4 onEntity:
{
  v17[1] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  uint64_t v7 = [a2 propertyDescription];
  if ([a3 count] != 2)
  {
    v10 = (void *)MEMORY[0x189603F70];
    uint64_t v11 = *MEMORY[0x189603A60];
    v16 = @"derived attribute";
    v17[0] = v7;
    uint64_t v12 = [MEMORY[0x189603F68] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    v13 = @"Unsupported: (multi-step keypath)";
    goto LABEL_8;
  }

  uint64_t v8 = [a3 objectAtIndexedSubscript:1];
  if (a4) {
    a4 = (id *)[a4[5] objectForKey:v8];
  }
  if ([a4 propertyType] != 1)
  {
    v10 = (void *)MEMORY[0x189603F70];
    uint64_t v11 = *MEMORY[0x189603A60];
    v14 = @"derived attribute";
    uint64_t v15 = v7;
    uint64_t v12 = [MEMORY[0x189603F68] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    v13 = @"Unsupported: (bad keypath, should be toOne.attribute)";
LABEL_8:
    objc_exception_throw((id)[v10 exceptionWithName:v11 reason:v13 userInfo:v12]);
  }

  return [a4 columnName];
}

+ (uint64_t)_generateSQLForToOneDerivationForDerivedAttribute:(void *)a3 toOneKeypath:
{
  v90[1] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  uint64_t v5 = [a2 entity];
  v6 = (void *)[a2 propertyDescription];
  uint64_t v7 = (void *)[v6 derivationExpression];
  uint64_t v8 = [v7 expressionType];
  uint64_t v9 = [a3 objectAtIndexedSubscript:0];
  if (v5) {
    v10 = (void *)[*(id *)(v5 + 40) objectForKey:v9];
  }
  else {
    v10 = 0LL;
  }
  uint64_t v11 = (id *)[v10 destinationEntity];
  v81 = a2;
  uint64_t v82 = [a2 columnName];
  if (v8 == 4)
  {
    uint64_t v13 = +[NSSQLDerivedAttributeSQLGenerator _parameterPropertyTokenForDerivedAttribute:andKeypath:onEntity:]( (uint64_t)&OBJC_CLASS___NSSQLDerivedAttributeSQLGenerator,  a2,  a3,  v11);
    v14 = (char *)[v7 selector];
    uint64_t v75 = v13;
    if (sel_canonical_ == v14)
    {
      uint64_t v72 = [NSString stringWithFormat:@"NSCoreDataCanonical(NEW.%@)", v13];
      uint64_t v15 = [NSString stringWithFormat:@"NSCoreDataCanonical(%@)", v13];
    }

    else if (sel_uppercase_ == v14)
    {
      uint64_t v72 = [NSString stringWithFormat:@"NSCoreDataToUpper(NEW.%@)", v13];
      uint64_t v15 = [NSString stringWithFormat:@"NSCoreDataToUpper(%@)", v13];
    }

    else
    {
      if (sel_lowercase_ != v14)
      {
        v62 = (void *)MEMORY[0x189603F70];
        uint64_t v63 = *MEMORY[0x189603A60];
        v89 = @"derived attribute";
        v90[0] = v6;
        uint64_t v64 = [MEMORY[0x189603F68] dictionaryWithObjects:v90 forKeys:&v89 count:1];
        v65 = @"Unsupported: (unsupported function for to one)";
        goto LABEL_49;
      }

      uint64_t v72 = [NSString stringWithFormat:@"NSCoreDataToLower(NEW.%@)", v13];
      uint64_t v15 = [NSString stringWithFormat:@"NSCoreDataToLower(%@)", v13];
    }

    uint64_t v77 = v15;
    goto LABEL_13;
  }

  if (v8 != 3)
  {
    v62 = (void *)MEMORY[0x189603F70];
    uint64_t v63 = *MEMORY[0x189603A60];
    v87 = @"derived attribute";
    v88 = v6;
    uint64_t v64 = [MEMORY[0x189603F68] dictionaryWithObjects:&v88 forKeys:&v87 count:1];
    v65 = @"Unsupported: (unsupported expression for to one)";
LABEL_49:
    objc_exception_throw((id)[v62 exceptionWithName:v63 reason:v65 userInfo:v64]);
    return +[NSSQLDerivedAttributeSQLGenerator _generateTriggerForAttribute:newToken:updateToken:triggerColumnListComponent:triggerColumnWhereComponent:]( v66,  v67,  v68,  v69,  v70);
  }

  uint64_t v12 = +[NSSQLDerivedAttributeSQLGenerator _parameterPropertyTokenForDerivedAttribute:andKeypath:onEntity:]( (uint64_t)&OBJC_CLASS___NSSQLDerivedAttributeSQLGenerator,  a2,  a3,  v11);
  uint64_t v72 = [NSString stringWithFormat:@"NEW.%@", v12];
  uint64_t v77 = v12;
  uint64_t v75 = v12;
LABEL_13:
  uint64_t v16 = [(id)v5 tableName];
  uint64_t v17 = [v11 tableName];
  uint64_t v79 = [v10 columnName];
  uint64_t v18 = [objc_alloc(NSString) initWithFormat:@"Z_DA_%@_%@_%@_SOURCE", v16, objc_msgSend((id)objc_msgSend(v6, "entity"), "name"), objc_msgSend(v6, "name")];
  uint64_t v80 = v17;
  uint64_t v19 = [objc_alloc(NSString) initWithFormat:@"Z_DA_%@_%@_%@_PARAMETER", v17, objc_msgSend((id)objc_msgSend(v6, "entity"), "name"), objc_msgSend(v6, "name")];
  v20 = (void *)[objc_alloc(NSString) initWithFormat:@"DROP TRIGGER IF EXISTS %@_INSERT", v18];
  v76 = (void *)v18;
  v21 = (void *)[objc_alloc(NSString) initWithFormat:@"DROP TRIGGER IF EXISTS %@_UPDATE", v18];
  v22 = (void *)[objc_alloc(NSString) initWithFormat:@"DROP TRIGGER IF EXISTS %@_INSERT", v19];
  v78 = (void *)v19;
  v23 = (void *)[objc_alloc(NSString) initWithFormat:@"DROP TRIGGER IF EXISTS %@_UPDATE", v19];
  v24 = (void *)[MEMORY[0x189603FA8] array];
  v25 = (void *)[MEMORY[0x189603FC8] dictionary];
  v26 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v5,  v20);

  [v24 addObject:v26];
  v27 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v5,  v21);

  [v24 addObject:v27];
  v28 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v5,  v22);

  [v24 addObject:v28];
  v29 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v5,  v23);

  [v24 addObject:v29];
  v86[0] = v26;
  v86[1] = v27;
  v86[2] = v28;
  v86[3] = v29;
  v73 = v25;
  objc_msgSend( v25,  "setValue:forKey:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v86, 4),  @"dropStatements");
  v74 = v24;
  if (v5)
  {
    v30 = v76;
    unint64_t v31 = 0x189607000uLL;
    uint64_t v32 = v79;
    if (*(void *)(v5 + 160)
      || (v38 = *(void **)(v5 + 152)) != 0 && [v38 count] && *(void *)(v5 + 160))
    {
      uint64_t v33 = *(unsigned int *)(v5 + 184);
      uint64_t v34 = *(unsigned int *)(v5 + 188);
      id v35 = objc_alloc(NSString);
      if (v33 >= v34)
      {
        v36 = (void *)objc_msgSend(v35, "initWithFormat:", @"%d = NEW.Z_ENT", v33);
        uint64_t v37 = objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"%d = Z_ENT", v33, v71);
      }

      else
      {
        v36 = (void *)objc_msgSend(v35, "initWithFormat:", @"%d <= NEW.Z_ENT AND NEW.Z_ENT <= %d", v33, v34);
        uint64_t v37 = objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%d <= Z_ENT AND Z_ENT <= %d",  v33,  v34);
      }

      v39 = (void *)v37;
    }

    else
    {
      v39 = 0LL;
      v36 = 0LL;
    }
  }

  else
  {
    v39 = 0LL;
    v36 = 0LL;
    v30 = v76;
    unint64_t v31 = 0x189607000LL;
    uint64_t v32 = v79;
  }

  id v40 = objc_alloc_init(MEMORY[0x189607940]);
  [v40 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@_INSERT AFTER INSERT ON %@ FOR EACH ROW", v30, v16];
  [v40 appendString:@" BEGIN"];
  if (v36) {
    v41 = (const __CFString *)[*(id *)(v31 + 2600) stringWithFormat:@" AND %@", v36];
  }
  else {
    v41 = &stru_189EAC2E8;
  }
  objc_msgSend( v40,  "appendFormat:",  @" UPDATE %@ SET %@ = (SELECT %@ FROM %@ WHERE Z_PK = NEW.%@) WHERE Z_PK = NEW.Z_PK%@;",
    v16,
    v82,
    v77,
    v80,
    v32,
    v41);
  uint64_t v42 = [v81 name];
  if (v36) {
    v43 = (const __CFString *)[*(id *)(v31 + 2600) stringWithFormat:@" AND %@", v36];
  }
  else {
    v43 = &stru_189EAC2E8;
  }
  objc_msgSend( v40,  "appendFormat:",  @" SELECT NSCoreDataDATriggerInsertUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = NEW.Z_PK%@;",
    v16,
    v42,
    v82,
    v16,
    v43);
  [v40 appendFormat:@" END"];
  id v44 = objc_alloc_init(MEMORY[0x189607940]);
  if (v36) {
    v45 = (const __CFString *)[*(id *)(v31 + 2600) stringWithFormat:@" WHEN %@", v36];
  }
  else {
    v45 = &stru_189EAC2E8;
  }
  [v44 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@_UPDATE AFTER UPDATE OF %@ ON %@ FOR EACH ROW%@", v30, v79, v16, v45];
  [v44 appendString:@" BEGIN"];
  objc_msgSend( v44,  "appendFormat:",  @" UPDATE %@ SET %@ = (SELECT %@ FROM %@ WHERE Z_PK = NEW.%@) WHERE Z_PK = NEW.Z_PK;",
    v16,
    v82,
    v77,
    v80,
    v79);
  objc_msgSend( v44,  "appendFormat:",  @" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = NEW.Z_PK;",
    v16,
    [v81 name],
    v82,
    v16);
  [v44 appendFormat:@" END"];
  id v46 = objc_alloc_init(MEMORY[0x189607940]);
  [v46 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@_INSERT AFTER INSERT ON %@ FOR EACH ROW", v78, v80];
  [v46 appendString:@" BEGIN"];
  if (v39)
  {
    unint64_t v47 = v31;
    v48 = (const __CFString *)[*(id *)(v31 + 2600) stringWithFormat:@" AND %@", v39];
  }

  else
  {
    v48 = &stru_189EAC2E8;
    unint64_t v47 = v31;
  }

  [v46 appendFormat:@" UPDATE %@ SET %@ = %@ WHERE %@ = NEW.Z_PK%@;", v16, v82, v72, v79, v48];
  uint64_t v49 = [v81 name];
  if (v39) {
    v50 = (const __CFString *)[*(id *)(v47 + 2600) stringWithFormat:@" AND %@", v39];
  }
  else {
    v50 = &stru_189EAC2E8;
  }
  objc_msgSend( v46,  "appendFormat:",  @" SELECT NSCoreDataDATriggerInsertUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE %@ = NEW.Z_PK%@;",
    v16,
    v49,
    v82,
    v16,
    v79,
    v50);
  [v46 appendFormat:@" END"];
  id v51 = objc_alloc_init(MEMORY[0x189607940]);
  [v51 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@_UPDATE AFTER UPDATE OF %@ ON %@ FOR EACH ROW", v78, v75, v80];
  [v51 appendString:@" BEGIN"];
  if (v39) {
    v52 = (const __CFString *)[*(id *)(v47 + 2600) stringWithFormat:@" AND %@", v39];
  }
  else {
    v52 = &stru_189EAC2E8;
  }
  [v51 appendFormat:@" UPDATE %@ SET %@ = %@ WHERE %@ = NEW.Z_PK%@;", v16, v82, v72, v79, v52];
  uint64_t v53 = [v81 name];
  if (v39) {
    v54 = (const __CFString *)[*(id *)(v47 + 2600) stringWithFormat:@" AND %@", v39];
  }
  else {
    v54 = &stru_189EAC2E8;
  }
  objc_msgSend( v51,  "appendFormat:",  @" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE %@ = NEW.Z_PK%@;",
    v16,
    v53,
    v82,
    v16,
    v79,
    v54);
  [v51 appendFormat:@" END"];

  v55 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v5,  v40);
  [v74 addObject:v55];

  v56 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v5,  v44);
  [v74 addObject:v56];

  v57 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v5,  v46);
  [v74 addObject:v57];

  v58 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v5,  v51);
  [v74 addObject:v58];

  v59 = (void *)[objc_alloc(NSString) initWithFormat:@"UPDATE %@ SET %@ = (SELECT %@ FROM %@ WHERE Z_PK = %@.%@)%@", v16, v82, v77, v80, v16, v79, &stru_189EAC2E8];
  v60 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v5,  v59);

  v85 = v60;
  objc_msgSend( v73,  "setValue:forKey:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", &v85, 1),  @"dataStatements");

  v84[0] = v55;
  v84[1] = v56;
  v84[2] = v57;
  v84[3] = v58;
  objc_msgSend( v73,  "setValue:forKey:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v84, 4),  @"triggerCreationStatements");
  v83[0] = v74;
  v83[1] = v73;
  return [MEMORY[0x189603F18] arrayWithObjects:v83 count:2];
}

+ (uint64_t)_generateTriggerForAttribute:(uint64_t)a1 newToken:(void *)a2 updateToken:(uint64_t)a3 triggerColumnListComponent:(uint64_t)a4 triggerColumnWhereComponent:(void *)a5
{
  v45[2] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  uint64_t v7 = [a2 entity];
  uint64_t v8 = (void *)[a2 propertyDescription];
  uint64_t v9 = (void *)[objc_alloc(NSString) initWithFormat:@"Z_DA_%@_%@_%@", objc_msgSend((id)v7, "tableName"), objc_msgSend((id)objc_msgSend(v8, "entity"), "name"), objc_msgSend(v8, "name")];
  uint64_t v10 = [(id)v7 tableName];
  uint64_t v11 = [a2 columnName];
  uint64_t v12 = [objc_alloc(NSString) initWithFormat:@"DROP TRIGGER IF EXISTS %@_INSERT", v9];
  v38 = (void *)[objc_alloc(NSString) initWithFormat:@"DROP TRIGGER IF EXISTS %@_UPDATE", v9];
  if (objc_msgSend((id)objc_msgSend(v8, "derivationExpression"), "expressionType") == 3
    && (uint64_t v13 = objc_msgSend((id)objc_msgSend(v8, "derivationExpression"), "keyPath"), v7)
    && (v14 = (void *)[*(id *)(v7 + 40) objectForKey:v13]) != 0)
  {
    int v41 = objc_msgSend((id)objc_msgSend(v14, "propertyDescription"), "usesMergeableStorage");
  }

  else
  {
    int v41 = 0;
  }

  id v15 = objc_alloc_init(MEMORY[0x189607940]);
  [v15 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@_INSERT AFTER INSERT ON %@ FOR EACH ROW", v9, v10];
  if ([a5 length]) {
    [v15 appendFormat:@" WHEN (NEW.%@ NOT NULL)", a5];
  }
  [v15 appendString:@" BEGIN"];
  if (v41) {
    objc_msgSend( v15,  "appendFormat:",  @" UPDATE %@ SET %@ = NSCoreDataDATriggerMergeableString('%@', Z_ENT, Z_PK, '%@', %@) WHERE Z_PK = NEW.Z_PK;",
  }
      v10,
      v11,
      v10,
      [a2 name],
      a4);
  else {
    [v15 appendFormat:@" UPDATE %@ SET %@ = %@ WHERE Z_PK = NEW.Z_PK;", v10, v11, a3, v32, v34];
  }
  objc_msgSend( v15,  "appendFormat:",  @" SELECT NSCoreDataDATriggerInsertUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = NEW.Z_PK;",
    v10,
    [a2 name],
    v11,
    v10);
  [v15 appendFormat:@" END"];
  id v16 = objc_alloc_init(MEMORY[0x189607940]);
  [v16 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@_UPDATE AFTER UPDATE OF %@ ON %@ FOR EACH ROW", v9, a5, v10];
  if ([&stru_189EAC2E8 length]) {
    [v16 appendFormat:@" %@", &stru_189EAC2E8];
  }
  [v16 appendString:@" BEGIN"];
  if (v41) {
    objc_msgSend( v16,  "appendFormat:",  @" UPDATE %@ SET %@ = NSCoreDataDATriggerMergeableString('%@', Z_ENT, Z_PK, '%@', %@) WHERE Z_PK = NEW.Z_PK;",
  }
      v10,
      v11,
      v10,
      [a2 name],
      a4);
  else {
    [v16 appendFormat:@" UPDATE %@ SET %@ = %@ WHERE Z_PK = NEW.Z_PK;", v10, v11, a3, v33, v35];
  }
  uint64_t v17 = (void *)v12;
  objc_msgSend( v16,  "appendFormat:",  @" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = NEW.Z_PK;",
    v10,
    [a2 name],
    v11,
    v10);
  [v16 appendFormat:@" END"];

  uint64_t v18 = (void *)[MEMORY[0x189603FA8] array];
  uint64_t v19 = (void *)[MEMORY[0x189603FC8] dictionary];
  v20 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v7,  v12);
  [v18 addObject:v20];

  v21 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v7,  v38);
  [v18 addObject:v21];

  v45[0] = v20;
  v45[1] = v21;
  objc_msgSend( v19,  "setValue:forKey:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v45, 2),  @"dropStatements");

  v22 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v7,  v15);
  [v18 addObject:v22];

  v23 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v7,  v16);
  [v18 addObject:v23];

  if (v7
    && (*(void *)(v7 + 160)
     || (v25 = *(void **)(v7 + 152)) != 0 && [v25 count] && *(void *)(v7 + 160)))
  {
    v24 = (__CFString *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"WHERE %d <= Z_ENT AND Z_ENT <= %d",  *(unsigned int *)(v7 + 184),  *(unsigned int *)(v7 + 188));
  }

  else
  {
    v24 = &stru_189EAC2E8;
  }

  v26 = v24;
  id v27 = objc_alloc(MEMORY[0x189607940]);
  if (v41) {
    uint64_t v28 = [v27 initWithFormat:@"UPDATE %@ SET %@ = NSCoreDataDATriggerMergeableString('%@', Z_ENT, Z_PK, '%@', %@) %@", v10, v11, v10, objc_msgSend(a2, "name"), a4, v26];
  }
  else {
    uint64_t v28 = [v27 initWithFormat:@"UPDATE %@ SET %@ = %@ %@", v10, v11, a4, v26, v36, v37];
  }
  v29 = (void *)v28;

  v30 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v7,  v29);
  id v44 = v30;
  objc_msgSend( v19,  "setValue:forKey:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", &v44, 1),  @"dataStatements");
  v43[0] = v22;
  v43[1] = v23;
  objc_msgSend( v19,  "setValue:forKey:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v43, 2),  @"triggerCreationStatements");

  v42[0] = v18;
  v42[1] = v19;
  return [MEMORY[0x189603F18] arrayWithObjects:v42 count:2];
}

+ (uint64_t)_computeNewColumnTokenForKeypathExpression:(uint64_t)a3 governingEntity:
{
  v20[1] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  uint64_t v5 = [a2 keyPath];
  if (!a3 || (v6 = (void *)[*(id *)(a3 + 40) objectForKey:v5]) == 0)
  {
    uint64_t v9 = (void *)MEMORY[0x189603F70];
    uint64_t v10 = *MEMORY[0x189603A60];
    uint64_t v19 = @"bad keypath";
    v20[0] = a2;
    uint64_t v11 = [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    uint64_t v12 = v9;
    uint64_t v13 = v10;
    v14 = @"bad keypath";
    goto LABEL_7;
  }

  uint64_t v7 = v6;
  if (objc_msgSend((id)objc_msgSend(v6, "propertyDescription"), "_propertyType") != 2)
  {
    id v15 = (void *)MEMORY[0x189603F70];
    uint64_t v16 = *MEMORY[0x189603A60];
    uint64_t v17 = @"bad keypath";
    uint64_t v18 = a2;
    uint64_t v11 = [MEMORY[0x189603F68] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    v14 = @"currently unsupported (bad root property type)";
    uint64_t v12 = v15;
    uint64_t v13 = v16;
LABEL_7:
    objc_exception_throw((id)[v12 exceptionWithName:v13 reason:v14 userInfo:v11]);
  }

  return [NSString stringWithFormat:@"NEW.%@", objc_msgSend(v7, "columnName")];
}

+ (uint64_t)_computeSingleParameterTokenForFunctionAttribute:(uint64_t)a3 functionName:
{
  v17[1] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  uint64_t v5 = (void *)[a2 propertyDescription];
  v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "derivationExpression"), "arguments");
  if ([v6 count] != 1)
  {
    uint64_t v10 = (void *)MEMORY[0x189603F70];
    uint64_t v11 = *MEMORY[0x189603A60];
    uint64_t v16 = @"derived attribute";
    v17[0] = v5;
    uint64_t v12 = [MEMORY[0x189603F68] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    uint64_t v13 = @"currently unsupported (wrong number of arguments)";
    goto LABEL_6;
  }

  uint64_t v7 = [a2 entity];
  uint64_t v8 = (void *)[v6 firstObject];
  if ([v8 expressionType] != 3)
  {
    uint64_t v10 = (void *)MEMORY[0x189603F70];
    uint64_t v11 = *MEMORY[0x189603A60];
    v14 = @"derived attribute";
    id v15 = v5;
    uint64_t v12 = [MEMORY[0x189603F68] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    uint64_t v13 = @"bad parameter to function expression canonical: (not a keypath expression)";
LABEL_6:
    objc_exception_throw((id)[v10 exceptionWithName:v11 reason:v13 userInfo:v12]);
  }

  return [NSString stringWithFormat:@"%@(%@)", a3, +[NSSQLDerivedAttributeSQLGenerator _computeNewColumnTokenForKeypathExpression:governingEntity:]( (uint64_t)NSSQLDerivedAttributeSQLGenerator, v8, v7)];
}

+ (const)_triggerColumnListComponentForAttributeKeypaths:(uint64_t)a3 startingAt:
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  if (![a2 count]
    || [a2 count] == 1 && !objc_msgSend((id)objc_msgSend(a2, "anyObject"), "count"))
  {
    return @"Z_OPT";
  }

  id v5 = objc_alloc_init(MEMORY[0x189607940]);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  uint64_t v6 = [a2 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    char v9 = 1;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(a2);
        }
        uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * v10);
        if ((unint64_t)[v11 count] >= 2)
        {
          uint64_t v17 = *MEMORY[0x189603A60];
          v22 = @"problem keypath";
          v23 = v11;
          objc_exception_throw((id)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  v17,  @"currently unsupported (extended keypath)",  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1)));
        }

        uint64_t v12 = [v11 firstObject];
        if (a3) {
          uint64_t v13 = (void *)[*(id *)(a3 + 40) objectForKey:v12];
        }
        else {
          uint64_t v13 = 0LL;
        }
        uint64_t v14 = [v13 columnName];
        if ((v9 & 1) == 0) {
          objc_msgSend(v5, "appendString:", @" , ");
        }
        [v5 appendString:v14];
        char v9 = 0;
        ++v10;
      }

      while (v7 != v10);
      uint64_t v15 = [a2 countByEnumeratingWithState:&v18 objects:v24 count:16];
      uint64_t v7 = v15;
      char v9 = 0;
    }

    while (v15);
  }

  return (const __CFString *)v5;
}

+ (uint64_t)_generateSQLForAttributeFunctionDerivationForDerivedAttribute:(void *)a3 keypaths:
{
  v13[1] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  id v5 = (__CFString *)+[NSSQLDerivedAttributeSQLGenerator _triggerColumnListComponentForAttributeKeypaths:startingAt:]( (uint64_t)NSSQLDerivedAttributeSQLGenerator,  a3,  [a2 entity]);
  [a2 entity];
  objc_opt_self();
  objc_opt_self();
  uint64_t v6 = (void *)[a2 propertyDescription];
  uint64_t v7 = (char *)objc_msgSend((id)objc_msgSend(v6, "derivationExpression"), "selector");
  if (sel_canonical_ == v7)
  {
    char v9 = @"NSCoreDataCanonical";
LABEL_11:
    uint64_t v8 = (void *)+[NSSQLDerivedAttributeSQLGenerator _computeSingleParameterTokenForFunctionAttribute:functionName:]( (uint64_t)&OBJC_CLASS___NSSQLDerivedAttributeSQLGenerator,  a2,  (uint64_t)v9);
    return +[NSSQLDerivedAttributeSQLGenerator _generateTriggerForAttribute:newToken:updateToken:triggerColumnListComponent:triggerColumnWhereComponent:]( (uint64_t)NSSQLDerivedAttributeSQLGenerator,  a2,  (uint64_t)v8,  [v8 stringByReplacingOccurrencesOfString:@"NEW." withString:&stru_189EAC2E8],  v5);
  }

  if (sel_uppercase_ == v7)
  {
    char v9 = @"NSCoreDataToUpper";
    goto LABEL_11;
  }

  if (sel_lowercase_ == v7)
  {
    char v9 = @"NSCoreDataToLower";
    goto LABEL_11;
  }

  if (sel_random == v7)
  {
    char v9 = @"random";
    goto LABEL_11;
  }

  if (sel_now == v7)
  {
    objc_opt_self();
    uint64_t v8 = (void *)[NSString stringWithFormat:@"NSCoreDataNow()"];
    return +[NSSQLDerivedAttributeSQLGenerator _generateTriggerForAttribute:newToken:updateToken:triggerColumnListComponent:triggerColumnWhereComponent:]( (uint64_t)NSSQLDerivedAttributeSQLGenerator,  a2,  (uint64_t)v8,  [v8 stringByReplacingOccurrencesOfString:@"NEW." withString:&stru_189EAC2E8],  v5);
  }

  uint64_t v11 = *MEMORY[0x189603A60];
  uint64_t v12 = @"derived attribute";
  v13[0] = v6;
  objc_exception_throw((id)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  v11,  @"currently unsupported (unsupported function)",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1)));
  return +[NSSQLDerivedAttributeSQLGenerator _generateSQLForDerivedAttributeWithOneParameterKeypath:keypaths:]();
}

+ (uint64_t)_generateSQLForDerivedAttributeWithOneParameterKeypath:(void *)a3 keypaths:
{
  v253[1] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  id v5 = (void *)[a2 propertyDescription];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(v5, "derivationExpression"), "expressionType");
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "anyObject"), "objectAtIndexedSubscript:", 0);
  v227 = a2;
  uint64_t v8 = (id *)[a2 entity];
  if (v8) {
    uint64_t v8 = (id *)[v8[5] objectForKey:v7];
  }
  int v9 = [v8 propertyType];
  if (v6 == 4)
  {
    switch(v9)
    {
      case 1:
        return +[NSSQLDerivedAttributeSQLGenerator _generateSQLForAttributeFunctionDerivationForDerivedAttribute:keypaths:]( (uint64_t)&OBJC_CLASS___NSSQLDerivedAttributeSQLGenerator,  a2,  a3);
      case 7:
        goto LABEL_11;
      case 8:
        objc_opt_self();
        uint64_t v17 = (void *)[a2 propertyDescription];
        __int128 v18 = (char *)objc_msgSend((id)objc_msgSend(v17, "derivationExpression"), "selector");
        if (sel_count_ != v18 && sel_sum_ != v18)
        {
          if (sel_min_ == v18 || sel_max_ == v18)
          {
            __int128 v19 = (void *)[a3 anyObject];
            objc_opt_self();
            __int128 v20 = (id *)[v227 entity];
            uint64_t v11 = (NSSQLiteStatement *)[v227 propertyDescription];
            __int128 v21 = (void *)-[NSSQLiteStatement derivationExpression](v11, "derivationExpression");
            uint64_t v22 = [v19 objectAtIndexedSubscript:0];
            if (v20) {
              v23 = (void *)[v20[5] objectForKey:v22];
            }
            else {
              v23 = 0LL;
            }
            uint64_t v224 = [v23 destinationEntity];
            uint64_t v190 = [v227 columnName];
            if (v23) {
              v24 = (void *)v23[7];
            }
            else {
              v24 = 0LL;
            }
            uint64_t v25 = [v24 columnName];
            uint64_t v26 = [v19 objectAtIndexedSubscript:1];
            if (v224) {
              id v27 = (void *)[*(id *)(v224 + 40) objectForKey:v26];
            }
            else {
              id v27 = 0LL;
            }
            uint64_t v192 = [v27 columnName];
            uint64_t v202 = v25;
            uint64_t v200 = [NSString stringWithFormat:@"%@, %@", v25, v192];
            if (sel_min_ == (char *)[v21 selector])
            {
              v206 = @"<";
              uint64_t v28 = @"MIN";
            }

            else
            {
              v206 = @">";
              uint64_t v28 = @"MAX";
            }

            v210 = v28;
            uint64_t v188 = [v20 tableName];
            uint64_t v216 = [(id)v224 tableName];
            uint64_t v80 = [objc_alloc(NSString) initWithFormat:@"Z_DA_%@_%@_%@", objc_msgSend((id)v224, "tableName"), objc_msgSend(v20, "name"), -[NSSQLiteStatement name](v11, "name")];
            uint64_t v81 = [objc_alloc(NSString) initWithFormat:@"Z_DA_%@_%@_%@", objc_msgSend(v20, "tableName"), objc_msgSend(v20, "name"), -[NSSQLiteStatement name](v11, "name")];
            v213 = v20;
            uint64_t v82 = (void *)[objc_alloc(NSString) initWithFormat:@"DROP TRIGGER IF EXISTS %@_INSERT", v80];
            v83 = (void *)[objc_alloc(NSString) initWithFormat:@"DROP TRIGGER IF EXISTS %@_UPDATE_SET", v80];
            v84 = (void *)[objc_alloc(NSString) initWithFormat:@"DROP TRIGGER IF EXISTS %@_UPDATE_UNSET", v80];
            v221 = (void *)v80;
            v85 = (void *)[objc_alloc(NSString) initWithFormat:@"DROP TRIGGER IF EXISTS %@_DELETE", v80];
            v183 = (void *)v81;
            v86 = (void *)[objc_alloc(NSString) initWithFormat:@"DROP TRIGGER IF EXISTS %@_INSERT", v81];
            v87 = (void *)[MEMORY[0x189603FA8] array];
            v88 = (void *)[MEMORY[0x189603FC8] dictionary];
            v89 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v224,  v82);
            [v87 addObject:v89];

            v90 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v224,  v83);
            [v87 addObject:v90];

            v91 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v224,  v84);
            [v87 addObject:v91];

            v92 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v224,  v85);
            [v87 addObject:v92];

            v93 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v213,  v86);
            [v87 addObject:v93];

            v246 = v89;
            v247 = v90;
            v248 = v91;
            v249 = v92;
            v250 = v93;
            v185 = v88;
            objc_msgSend( v88,  "setValue:forKey:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", &v246, 5),  @"dropStatements");

            if (v213 && (v213[20] || (id v101 = v213[19]) != 0 && [v101 count] && v213[20]))
            {
              uint64_t v94 = *((unsigned int *)v213 + 46);
              uint64_t v95 = *((unsigned int *)v213 + 47);
              unint64_t v96 = 0x189607000uLL;
              id v97 = objc_alloc(NSString);
              uint64_t v98 = v202;
              if (v94 >= v95)
              {
                v179 = (__CFString *)objc_msgSend(v97, "initWithFormat:", @" WHEN %d = NEW.Z_ENT", v94);
                v99 = (__CFString *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @" AND %d = Z_ENT",  v94);
                uint64_t v100 = objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @" WHERE %d = Z_ENT",  v94,  v174);
              }

              else
              {
                v179 = (__CFString *)objc_msgSend( v97,  "initWithFormat:",  @" WHEN %d <= NEW.Z_ENT AND NEW.Z_ENT <= %d",  v94,  v95);
                v99 = (__CFString *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @" AND %d <= Z_ENT AND Z_ENT <= %d",  v94,  v95);
                uint64_t v100 = objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @" WHERE %d <= Z_ENT AND Z_ENT <= %d",  v94,  v95);
              }

              v181 = (__CFString *)v100;
            }

            else
            {
              v179 = &stru_189EAC2E8;
              v99 = &stru_189EAC2E8;
              v181 = &stru_189EAC2E8;
              unint64_t v96 = 0x189607000LL;
              uint64_t v98 = v202;
            }

            uint64_t v102 = v224;
            v187 = v87;
            if (v224
              && (*(void *)(v224 + 160)
               || (v108 = *(void **)(v224 + 152)) != 0LL
               && (v109 = [v108 count], uint64_t v102 = v224, v109)
               && *(void *)(v224 + 160)))
            {
              uint64_t v103 = *(unsigned int *)(v102 + 184);
              uint64_t v104 = *(unsigned int *)(v102 + 188);
              id v105 = objc_alloc(*(Class *)(v96 + 2600));
              if (v103 >= v104)
              {
                v106 = (__CFString *)objc_msgSend(v105, "initWithFormat:", @" AND %d = Z_ENT", v103);
                v107 = (__CFString *)objc_msgSend( objc_alloc(*(Class *)(v96 + 2600)),  "initWithFormat:",  @" WHERE %d = Z_ENT",  v103,  v174);
              }

              else
              {
                v106 = (__CFString *)objc_msgSend( v105,  "initWithFormat:",  @" AND %d <= Z_ENT AND Z_ENT <= %d",  v103,  v104);
                v107 = (__CFString *)objc_msgSend( objc_alloc(*(Class *)(v96 + 2600)),  "initWithFormat:",  @" WHERE %d <= Z_ENT AND Z_ENT <= %d",  v103,  v104);
              }
            }

            else
            {
              v106 = &stru_189EAC2E8;
              v107 = &stru_189EAC2E8;
            }

            v177 = v107;
            id v110 = objc_alloc_init(MEMORY[0x189607940]);
            [v110 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@_INSERT AFTER INSERT ON %@ FOR EACH ROW WHEN (NEW.%@ NOT NULL AND NEW.%@ NOT NULL%@)", v221, v216, v98, v192, v106];
            [v110 appendString:@" BEGIN"];
            v111 = v106;
            v205 = v106;
            uint64_t v112 = v190;
            uint64_t v113 = v188;
            v176 = v110;
            objc_msgSend( v110,  "appendFormat:",  @" UPDATE %@ SET %@ = NEW.%@ WHERE Z_PK = NEW.%@%@ AND %@;",
              v188,
              v190,
              v192,
              v98,
              v99,
              [*(id *)(v96 + 2600) stringWithFormat:@"(%@ IS NULL OR NEW.%@ %@ %@)", v190, v192, v206, v190]);
            objc_msgSend( v110,  "appendFormat:",  @" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = NEW.%@%@ AND %@;",
              v113,
              [v227 name],
              v112,
              v113,
              v98,
              v99,
              [*(id *)(v96 + 2600) stringWithFormat:@"(%@ IS NULL OR NEW.%@ %@= %@)", v112, v192, v206, v112]);
            [v110 appendFormat:@" END"];
            id v114 = objc_alloc_init(MEMORY[0x189607940]);
            [v114 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@_UPDATE_SET AFTER UPDATE OF %@ ON %@ FOR EACH ROW WHEN (NEW.%@ NOT NULL AND NEW.%@ NOT NULL%@)", v221, v200, v216, v98, v192, v111];
            v198 = v114;
            [v114 appendString:@" BEGIN"];
            objc_msgSend( v114,  "appendFormat:",  @" UPDATE %@ SET %@ = (SELECT %@(%@) FROM %@ WHERE %@ = OLD.%@) WHERE Z_PK = OLD.%@%@ AND %@;",
              v188,
              v190,
              v210,
              v192,
              v216,
              v98,
              v98,
              v98,
              v99,
              [NSString stringWithFormat:@"OLD.%@ %@= %@", v192, v206, v190]);
            uint64_t v115 = [v227 name];
            objc_msgSend( v198,  "appendFormat:",  @" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = OLD.%@%@ AND %@;",
              v113,
              v115,
              v190,
              v113,
              v98,
              v99,
              [NSString stringWithFormat:@"OLD.%@ %@= %@", v192, v206, v190]);
            objc_msgSend( v198,  "appendFormat:",  @" UPDATE %@ SET %@ = NEW.%@ WHERE Z_PK = NEW.%@%@ AND %@;",
              v188,
              v112,
              v192,
              v98,
              v99,
              [NSString stringWithFormat:@"(%@ IS NULL OR NEW.%@ %@ %@)", v112, v192, v206, v112]);
            uint64_t v116 = [v227 name];
            objc_msgSend( v198,  "appendFormat:",  @" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = NEW.%@%@ AND %@;",
              v113,
              v116,
              v190,
              v113,
              v98,
              v99,
              [NSString stringWithFormat:@"NEW.%@ %@= %@", v192, v206, v190]);
            [v198 appendFormat:@" END"];
            id v117 = objc_alloc_init(MEMORY[0x189607940]);
            [v117 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@_UPDATE_UNSET AFTER UPDATE OF %@ ON %@ FOR EACH ROW WHEN (OLD.%@ NOT NULL AND OLD.%@ NOT NULL AND (NEW.%@ IS NULL OR NEW.%@ IS NULL)%@)", v221, v200, v216, v98, v192, v98, v192, v205];
            [v117 appendString:@" BEGIN"];
            objc_msgSend( v117,  "appendFormat:",  @" UPDATE %@ SET %@ = (SELECT %@(%@) FROM %@ WHERE %@ = OLD.%@) WHERE Z_PK = OLD.%@%@ AND %@;",
              v188,
              v190,
              v210,
              v192,
              v216,
              v98,
              v98,
              v98,
              v99,
              [NSString stringWithFormat:@"OLD.%@ %@= %@", v192, v206, v190]);
            uint64_t v118 = [v227 name];
            objc_msgSend( v117,  "appendFormat:",  @" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = OLD.%@%@ AND %@;",
              v113,
              v118,
              v112,
              v113,
              v98,
              v99,
              [NSString stringWithFormat:@"(%@ IS NULL OR OLD.%@ %@= %@)", v112, v192, v206, v112]);
            [v117 appendFormat:@" END"];
            id v119 = objc_alloc_init(MEMORY[0x189607940]);
            [v119 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@_DELETE AFTER DELETE ON %@ FOR EACH ROW WHEN (OLD.%@ NOT NULL AND OLD.%@ NOT NULL%@)", v221, v216, v98, v192, v205];
            [v119 appendString:@" BEGIN"];
            objc_msgSend( v119,  "appendFormat:",  @" UPDATE %@ SET %@ = (SELECT %@(%@) FROM %@ WHERE %@ = OLD.%@) WHERE Z_PK = OLD.%@%@ AND %@;",
              v188,
              v190,
              v210,
              v192,
              v216,
              v98,
              v98,
              v98,
              v99,
              [NSString stringWithFormat:@"OLD.%@ %@= %@", v192, v206, v190]);
            uint64_t v120 = [v227 name];
            objc_msgSend( v119,  "appendFormat:",  @" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = OLD.%@%@ AND %@;",
              v113,
              v120,
              v112,
              v113,
              v98,
              v99,
              [NSString stringWithFormat:@"(%@ IS NULL OR OLD.%@ %@= %@)", v112, v192, v206, v112]);
            [v119 appendFormat:@" END"];
            id v121 = objc_alloc_init(MEMORY[0x189607940]);
            [v121 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@_INSERT AFTER INSERT ON %@ FOR EACH ROW%@", v183, v188, v179];
            [v121 appendString:@" BEGIN"];
            objc_msgSend( v121,  "appendFormat:",  @" UPDATE %@ SET %@ = (SELECT %@(%@) FROM %@ WHERE %@ = NEW.Z_PK) WHERE Z_PK = NEW.Z_PK;",
              v188,
              v190,
              v210,
              v192,
              [(id)v224 tableName],
              v98);
            objc_msgSend( v121,  "appendFormat:",  @" SELECT NSCoreDataDATriggerInsertUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = NEW.Z_PK;",
              v113,
              [v227 name],
              v190,
              v113);
            [v121 appendFormat:@" END"];

            v229 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v224,  v176);
            [v187 addObject:v229];

            v222 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v224,  v198);
            [v187 addObject:v222];

            v217 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v224,  v117);
            [v187 addObject:v217];

            v122 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v224,  v119);
            [v187 addObject:v122];

            v123 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v213,  v121);
            [v187 addObject:v123];

            v124 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"UPDATE %@ SET %@ = (SELECT %@(%@) FROM %@ WHERE %@ = %@.Z_PK)%@;",
                             v113,
                             v190,
                             v210,
                             v192,
                             [(id)v224 tableName],
                             v98,
                             v113,
                             v177);

            v125 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v213,  v124);
            v253[0] = v125;
            objc_msgSend( v185,  "setValue:forKey:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v253, 1),  @"dataStatements");
            v241 = (const __CFString *)v229;
            v242 = v222;
            v243 = v217;
            v244 = v122;
            v245 = v123;
            objc_msgSend( v185,  "setValue:forKey:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", &v241, 5),  @"triggerCreationStatements");

            v251 = v187;
            v252 = v185;
            goto LABEL_93;
          }

          uint64_t v10 = (void *)MEMORY[0x189603F70];
          uint64_t v11 = (NSSQLiteStatement *)*MEMORY[0x189603A60];
          v239 = @"derived attribute";
          v240 = v17;
          v166 = (void *)MEMORY[0x189603F68];
          v167 = (NSSQLiteStatement **)&v240;
          v168 = &v239;
LABEL_103:
          uint64_t v12 = [v166 dictionaryWithObjects:v167 forKeys:v168 count:1];
          uint64_t v13 = @"currently unsupported (unsupported function on to many (not count or sum))";
          goto LABEL_111;
        }

        v58 = (void *)[a3 anyObject];
        objc_opt_self();
        uint64_t v59 = [a2 entity];
        v60 = (NSSQLiteStatement *)[a2 propertyDescription];
        v61 = (void *)-[NSSQLiteStatement derivationExpression](v60, "derivationExpression");
        uint64_t v62 = [v58 objectAtIndexedSubscript:0];
        if (v59) {
          uint64_t v63 = (void *)[*(id *)(v59 + 40) objectForKey:v62];
        }
        else {
          uint64_t v63 = 0LL;
        }
        uint64_t v64 = (id *)[v63 destinationEntity];
        uint64_t v201 = [v227 columnName];
        if (v63) {
          v65 = (void *)v63[7];
        }
        else {
          v65 = 0LL;
        }
        uint64_t v204 = [v65 columnName];
        if ((unint64_t)[v58 count] < 2)
        {
          BOOL v66 = 0;
          int v196 = 1;
          uint64_t v220 = v204;
          v226 = @"+ 1";
          v67 = @"- 1";
        }

        else
        {
          uint64_t v78 = [v58 objectAtIndexedSubscript:1];
          if (v64 && (uint64_t v79 = (_BYTE *)[v64[5] objectForKey:v78]) != 0 && v79[24] == 1)
          {
            v67 = 0LL;
            uint64_t v220 = 0LL;
            v226 = 0LL;
            BOOL v66 = objc_msgSend((id)objc_msgSend(v79, "propertyDescription"), "attributeType") == 800;
            int v196 = v66;
          }

          else
          {
LABEL_39:
            BOOL v66 = 0;
            int v196 = 0;
            v67 = 0LL;
            uint64_t v220 = 0LL;
            v226 = 0LL;
          }
        }

        v126 = (char *)[v61 selector];
        if (v66 || (uint64_t v127 = v220, sel_sum_ == v126))
        {
          uint64_t v128 = [v58 objectAtIndexedSubscript:1];
          if (v64) {
            v129 = (void *)[v64[5] objectForKey:v128];
          }
          else {
            v129 = 0LL;
          }
          uint64_t v127 = [v129 columnName];
          v226 = (const __CFString *)[NSString stringWithFormat:@"+ IFNULL(NEW.%@, 0)", v127];
          v67 = (const __CFString *)[NSString stringWithFormat:@"- IFNULL(OLD.%@, 0)", v127];
          uint64_t v220 = [NSString stringWithFormat:@"%@, %@", v204, v127];
        }

        BOOL v199 = v66;
        uint64_t v218 = v127;
        if (v226 && v67)
        {
          v182 = v67;
          uint64_t v186 = [(id)v59 tableName];
          uint64_t v214 = [v64 tableName];
          v211 = v64;
          uint64_t v130 = [objc_alloc(NSString) initWithFormat:@"Z_DA_%@_%@_%@_PARAMETER", objc_msgSend(v64, "tableName"), objc_msgSend((id)v59, "name"), -[NSSQLiteStatement name](v60, "name")];
          uint64_t v131 = [objc_alloc(NSString) initWithFormat:@"Z_DA_%@_%@_%@_SOURCE", objc_msgSend((id)v59, "tableName"), objc_msgSend((id)v59, "name"), -[NSSQLiteStatement name](v60, "name")];
          v132 = (void *)[objc_alloc(NSString) initWithFormat:@"DROP TRIGGER IF EXISTS %@_INSERT", v130];
          v133 = (void *)[objc_alloc(NSString) initWithFormat:@"DROP TRIGGER IF EXISTS %@_UPDATE_INCREMENT", v130];
          v134 = (void *)[objc_alloc(NSString) initWithFormat:@"DROP TRIGGER IF EXISTS %@_UPDATE_DECREMENT", v130];
          v208 = (void *)v130;
          v135 = (void *)[objc_alloc(NSString) initWithFormat:@"DROP TRIGGER IF EXISTS %@_DELETE", v130];
          v180 = (void *)v131;
          v136 = (void *)[objc_alloc(NSString) initWithFormat:@"DROP TRIGGER IF EXISTS %@_INSERT", v131];
          v137 = (void *)[MEMORY[0x189603FA8] array];
          v138 = (void *)[MEMORY[0x189603FC8] dictionary];
          v139 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v59,  v132);
          [v137 addObject:v139];

          v140 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v59,  v133);
          [v137 addObject:v140];

          v141 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v59,  v134);
          [v137 addObject:v141];

          v142 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v59,  v135);
          [v137 addObject:v142];

          v143 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v59,  v136);
          [v137 addObject:v143];

          v246 = v139;
          v247 = v140;
          v248 = v141;
          v249 = v142;
          v250 = v143;
          v184 = v138;
          objc_msgSend( v138,  "setValue:forKey:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", &v246, 5),  @"dropStatements");
          uint64_t v189 = v59;
          if (v59
            && (*(void *)(v59 + 160)
             || (v149 = *(void **)(v59 + 152)) != 0 && [v149 count] && *(void *)(v59 + 160)))
          {
            uint64_t v144 = *(unsigned int *)(v59 + 184);
            uint64_t v145 = *(unsigned int *)(v59 + 188);
            id v146 = objc_alloc(NSString);
            if (v144 >= v145)
            {
              v191 = (__CFString *)objc_msgSend(v146, "initWithFormat:", @" WHEN %d = NEW.Z_ENT", v144);
              v147 = (__CFString *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @" AND %d = Z_ENT",  v144);
              v148 = (__CFString *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @" WHERE %d = Z_ENT",  v144,  v175);
            }

            else
            {
              v191 = (__CFString *)objc_msgSend( v146,  "initWithFormat:",  @" WHEN %d <= NEW.Z_ENT AND NEW.Z_ENT <= %d",  v144,  v145);
              v147 = (__CFString *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @" AND %d <= Z_ENT AND Z_ENT <= %d",  v144,  v145);
              v148 = (__CFString *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @" WHERE %d <= Z_ENT AND Z_ENT <= %d",  v144,  v145);
            }
          }

          else
          {
            v191 = &stru_189EAC2E8;
            v147 = &stru_189EAC2E8;
            v148 = &stru_189EAC2E8;
          }

          v194 = v148;
          id v150 = objc_alloc_init(MEMORY[0x189607940]);
          [v150 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@_INSERT AFTER INSERT ON %@ FOR EACH ROW WHEN (NEW.%@ NOT NULL)", v208, v214, v204];
          v178 = v150;
          [v150 appendString:@" BEGIN"];
          uint64_t v151 = v201;
          uint64_t v152 = v186;
          objc_msgSend( v150,  "appendFormat:",  @" UPDATE %@ SET %@ = IFNULL(%@, 0) %@ WHERE Z_PK = NEW.%@%@;",
            v186,
            v201,
            v201,
            v226,
            v204,
            v147);
          objc_msgSend( v150,  "appendFormat:",  @" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = NEW.%@%@;",
            v152,
            [v227 name],
            v201,
            v152,
            v204,
            v147);
          [v150 appendFormat:@" END"];
          id v153 = objc_alloc_init(MEMORY[0x189607940]);
          [v153 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@_UPDATE_INCREMENT AFTER UPDATE OF %@ ON %@ FOR EACH ROW WHEN (NEW.%@ NOT NULL)", v208, v220, v214, v204];
          [v153 appendString:@" BEGIN"];
          objc_msgSend( v153,  "appendFormat:",  @" UPDATE %@ SET %@ = %@ %@ WHERE Z_PK = NEW.%@%@;",
            v186,
            v151,
            v151,
            v226,
            v204,
            v147);
          objc_msgSend( v153,  "appendFormat:",  @" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = NEW.%@%@;",
            v152,
            [v227 name],
            v201,
            v152,
            v204,
            v147);
          [v153 appendFormat:@" END"];
          id v154 = objc_alloc_init(MEMORY[0x189607940]);
          [v154 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@_UPDATE_DECREMENT AFTER UPDATE OF %@ ON %@ FOR EACH ROW WHEN (OLD.%@ NOT NULL)", v208, v220, v214, v204];
          [v154 appendString:@" BEGIN"];
          objc_msgSend( v154,  "appendFormat:",  @" UPDATE %@ SET %@ = %@ %@ WHERE Z_PK = OLD.%@%@;",
            v186,
            v151,
            v151,
            v182,
            v204,
            v147);
          objc_msgSend( v154,  "appendFormat:",  @" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = OLD.%@%@;",
            v152,
            [v227 name],
            v201,
            v152,
            v204,
            v147);
          objc_msgSend(v154, "appendFormat:");
          id v155 = objc_alloc_init(MEMORY[0x189607940]);
          [v155 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@_DELETE AFTER DELETE ON %@ FOR EACH ROW WHEN (OLD.%@ NOT NULL)", v208, v214, v204];
          [v155 appendString:@" BEGIN"];
          objc_msgSend( v155,  "appendFormat:",  @" UPDATE %@ SET %@ = %@ %@ WHERE Z_PK = OLD.%@%@;",
            v186,
            v151,
            v151,
            v182,
            v204,
            v147);
          objc_msgSend( v155,  "appendFormat:",  @" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = OLD.%@%@;",
            v152,
            [v227 name],
            v201,
            v152,
            v204,
            v147);
          [v155 appendFormat:@" END"];
          id v156 = objc_alloc_init(MEMORY[0x189607940]);
          [v156 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@_INSERT AFTER INSERT ON %@ FOR EACH ROW%@", v180, v186, v191];
          [v156 appendString:@" BEGIN"];
          if ((v196 & !v199) != 0) {
            v157 = @"COUNT";
          }
          else {
            v157 = @"SUM";
          }
          objc_msgSend( v156,  "appendFormat:",  @" UPDATE %@ SET %@ = (SELECT IFNULL(%@(%@), 0) FROM %@ WHERE %@ = NEW.Z_PK) WHERE Z_PK = NEW.Z_PK;",
            v186,
            v201,
            v157,
            v218,
            [v211 tableName],
            v204);
          objc_msgSend( v156,  "appendFormat:",  @" SELECT NSCoreDataDATriggerInsertUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = NEW.Z_PK;",
            v186,
            [v227 name],
            v201,
            v186);
          [v156 appendFormat:@" END"];

          v230 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v189,  v178);
          [v137 addObject:v230];

          v223 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v189,  v153);
          [v137 addObject:v223];

          v158 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v189,  v154);
          [v137 addObject:v158];

          v159 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v189,  v155);
          [v137 addObject:v159];

          v160 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v189,  v156);
          [v137 addObject:v160];

          v161 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"UPDATE %@ SET %@ = (SELECT IFNULL(%@(%@), 0) FROM %@ WHERE %@ = %@.Z_PK)%@;",
                           v186,
                           v201,
                           v157,
                           v218,
                           [v211 tableName],
                           v204,
                           v186,
                           v194);

          v162 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v189,  v161);
          v253[0] = v162;
          objc_msgSend( v184,  "setValue:forKey:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v253, 1),  @"dataStatements");
          v241 = (const __CFString *)v230;
          v242 = v223;
          v243 = v158;
          v244 = v159;
          v245 = v160;
          objc_msgSend( v184,  "setValue:forKey:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", &v241, 5),  @"triggerCreationStatements");

          v251 = v137;
          v252 = v184;
LABEL_93:
          uint64_t v77 = (void *)MEMORY[0x189603F18];
          return [v77 arrayWithObjects:&v251 count:2];
        }

        uint64_t v10 = (void *)MEMORY[0x189603F70];
        uint64_t v11 = (NSSQLiteStatement *)*MEMORY[0x189603A60];
        v241 = @"derived attribute";
        v246 = v60;
LABEL_110:
        uint64_t v12 = [MEMORY[0x189603F68] dictionaryWithObjects:&v246 forKeys:&v241 count:1];
        uint64_t v13 = @"Unsupported: (unsupported function)";
        goto LABEL_111;
      case 9:
        objc_opt_self();
        v29 = (NSSQLiteStatement *)[a2 propertyDescription];
        v30 = (char *)objc_msgSend( (id)-[NSSQLiteStatement derivationExpression](v29, "derivationExpression"),  "selector");
        if (sel_count_ != v30)
        {
          uint64_t v10 = (void *)MEMORY[0x189603F70];
          uint64_t v11 = (NSSQLiteStatement *)*MEMORY[0x189603A60];
          v241 = @"derived attribute";
          v246 = v29;
          v166 = (void *)MEMORY[0x189603F68];
          v167 = &v246;
          v168 = &v241;
          goto LABEL_103;
        }

        unint64_t v31 = v30;
        uint64_t v32 = (void *)[a3 anyObject];
        objc_opt_self();
        uint64_t v33 = [a2 entity];
        uint64_t v34 = (NSSQLiteStatement *)[a2 propertyDescription];
        uint64_t v35 = (void *)-[NSSQLiteStatement derivationExpression](v34, "derivationExpression");
        uint64_t v36 = [v32 objectAtIndexedSubscript:0];
        if (v33) {
          uint64_t v37 = (void *)[*(id *)(v33 + 40) objectForKey:v36];
        }
        else {
          uint64_t v37 = 0LL;
        }
        uint64_t v215 = [v227 columnName];
        uint64_t v212 = [v37 columnName];
        if (v31 == (char *)[v35 selector])
        {
          uint64_t v195 = [(id)v33 tableName];
          uint64_t v38 = [v37 correlationTableName];
          uint64_t v39 = [objc_alloc(NSString) initWithFormat:@"Z_DA_%@_%@_%@_PARAMETER", v38, objc_msgSend((id)v33, "name"), -[NSSQLiteStatement name](v34, "name")];
          id v40 = (void *)[objc_alloc(NSString) initWithFormat:@"Z_DA_%@_%@_%@_SOURCE", objc_msgSend((id)v33, "tableName"), objc_msgSend((id)v33, "name"), -[NSSQLiteStatement name](v34, "name")];
          int v41 = (void *)[objc_alloc(NSString) initWithFormat:@"DROP TRIGGER IF EXISTS %@_INSERT", v39];
          v225 = (void *)v39;
          uint64_t v42 = (void *)[objc_alloc(NSString) initWithFormat:@"DROP TRIGGER IF EXISTS %@_DELETE", v39];
          v43 = (void *)[objc_alloc(NSString) initWithFormat:@"DROP TRIGGER IF EXISTS %@_INSERT", v40];
          id v44 = (void *)[MEMORY[0x189603FA8] array];
          v45 = (void *)[MEMORY[0x189603FC8] dictionary];
          id v46 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v33,  v41);
          [v44 addObject:v46];

          unint64_t v47 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v33,  v42);
          [v44 addObject:v47];

          v48 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v33,  v43);
          [v44 addObject:v48];

          v246 = v46;
          v247 = v47;
          v248 = v48;
          v207 = v45;
          objc_msgSend( v45,  "setValue:forKey:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", &v246, 3),  @"dropStatements");
          uint64_t v209 = v33;
          v203 = v44;
          if (v33
            && (*(void *)(v33 + 160)
             || (uint64_t v68 = *(void **)(v33 + 152)) != 0 && [v68 count] && *(void *)(v33 + 160)))
          {
            uint64_t v49 = v33;
            uint64_t v50 = v195;
            uint64_t v51 = *(unsigned int *)(v49 + 184);
            uint64_t v52 = *(unsigned int *)(v49 + 188);
            id v53 = objc_alloc(NSString);
            uint64_t v54 = v38;
            uint64_t v55 = v212;
            if (v51 >= v52)
            {
              v219 = (__CFString *)objc_msgSend(v53, "initWithFormat:", @" WHEN %d = NEW.Z_ENT", v51);
              v56 = (__CFString *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @" AND %d = Z_ENT",  v51);
              v57 = (__CFString *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @" WHERE %d = Z_ENT",  v51,  v173);
            }

            else
            {
              v219 = (__CFString *)objc_msgSend( v53,  "initWithFormat:",  @" WHEN %d <= NEW.Z_ENT AND NEW.Z_ENT <= %d",  v51,  v52);
              v56 = (__CFString *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @" AND %d <= Z_ENT AND Z_ENT <= %d",  v51,  v52);
              v57 = (__CFString *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @" WHERE %d <= Z_ENT AND Z_ENT <= %d",  v51,  v52);
            }
          }

          else
          {
            uint64_t v50 = v195;
            uint64_t v54 = v38;
            uint64_t v55 = v212;
            v219 = &stru_189EAC2E8;
            v56 = &stru_189EAC2E8;
            v57 = &stru_189EAC2E8;
          }

          v197 = v57;
          id v69 = objc_alloc_init(MEMORY[0x189607940]);
          uint64_t v70 = v54;
          [v69 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@_INSERT AFTER INSERT ON %@ FOR EACH ROW", v225, v54];
          [v69 appendString:@" BEGIN"];
          objc_msgSend( v69,  "appendFormat:",  @" UPDATE %@ SET %@ = IFNULL(%@, 0) + 1 WHERE Z_PK = NEW.%@%@;",
            v50,
            v215,
            v215,
            v55,
            v56);
          objc_msgSend( v69,  "appendFormat:",  @" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = NEW.%@%@;",
            v50,
            [v227 name],
            v215,
            v50,
            v55,
            v56);
          [v69 appendFormat:@" END"];
          id v71 = objc_alloc_init(MEMORY[0x189607940]);
          uint64_t v193 = v70;
          [v71 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@_DELETE AFTER DELETE ON %@ FOR EACH ROW", v225, v70];
          [v71 appendString:@" BEGIN"];
          objc_msgSend( v71,  "appendFormat:",  @" UPDATE %@ SET %@ = %@ - 1 WHERE Z_PK = OLD.%@%@;",
            v50,
            v215,
            v215,
            v55,
            v56);
          objc_msgSend( v71,  "appendFormat:",  @" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = OLD.%@%@;",
            v50,
            [v227 name],
            v215,
            v50,
            v55,
            v56);
          [v71 appendFormat:@" END"];
          id v72 = objc_alloc_init(MEMORY[0x189607940]);
          [v72 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@_INSERT AFTER INSERT ON %@ FOR EACH ROW%@", v40, v50, v219];
          [v72 appendString:@" BEGIN"];
          objc_msgSend( v72,  "appendFormat:",  @" UPDATE %@ SET %@ = (SELECT IFNULL(COUNT(%@), 0) FROM %@ WHERE %@ = NEW.Z_PK) WHERE Z_PK = NEW.Z_PK;",
            v50,
            v215,
            v55,
            v70,
            v55);
          objc_msgSend( v72,  "appendFormat:",  @" SELECT NSCoreDataDATriggerUpdatedAffectedObjectValue('%@', Z_ENT, Z_PK, '%@', %@) FROM %@ WHERE Z_PK = NEW.Z_PK;",
            v50,
            [v227 name],
            v215,
            v50);
          [v72 appendFormat:@" END"];

          v228 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v209,  v69);
          [v203 addObject:v228];

          v73 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v209,  v71);
          [v203 addObject:v73];

          v74 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v209,  v72);
          [v203 addObject:v74];

          uint64_t v75 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"UPDATE %@ SET %@ = (SELECT IFNULL(COUNT(%@), 0) FROM %@ WHERE %@ = %@.Z_PK)%@;",
                          v50,
                          v215,
                          v55,
                          v193,
                          v55,
                          v50,
                          v197);

          v76 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v209,  v75);
          v253[0] = v76;
          objc_msgSend( v207,  "setValue:forKey:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v253, 1),  @"dataStatements");
          v241 = (const __CFString *)v228;
          v242 = v73;
          v243 = v74;
          objc_msgSend( v207,  "setValue:forKey:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", &v241, 3),  @"triggerCreationStatements");

          v251 = v203;
          v252 = v207;
          uint64_t v77 = (void *)MEMORY[0x189603F18];
          return [v77 arrayWithObjects:&v251 count:2];
        }

        uint64_t v10 = (void *)MEMORY[0x189603F70];
        uint64_t v11 = (NSSQLiteStatement *)*MEMORY[0x189603A60];
        v241 = @"derived attribute";
        v246 = v34;
        goto LABEL_110;
      default:
        uint64_t v10 = (void *)MEMORY[0x189603F70];
        uint64_t v11 = (NSSQLiteStatement *)*MEMORY[0x189603A60];
        v233 = @"derived attribute";
        v234 = v5;
        v163 = (void *)MEMORY[0x189603F68];
        v164 = &v234;
        v165 = &v233;
        goto LABEL_98;
    }
  }

  if (v6 != 3)
  {
    uint64_t v10 = (void *)MEMORY[0x189603F70];
    uint64_t v11 = (NSSQLiteStatement *)*MEMORY[0x189603A60];
    v231 = @"derived attribute";
    v232 = v5;
    uint64_t v12 = [MEMORY[0x189603F68] dictionaryWithObjects:&v232 forKeys:&v231 count:1];
    uint64_t v13 = @"currently unsupported (unsupported expression type)";
LABEL_111:
    v169 = v10;
    for (i = v11; ; i = v172)
    {
      objc_exception_throw((id)[v169 exceptionWithName:i reason:v13 userInfo:v12]);
LABEL_113:
      v171 = (void *)MEMORY[0x189603F70];
      v172 = (NSSQLiteStatement *)*MEMORY[0x189603A60];
      v241 = @"derived attribute";
      v246 = v11;
      uint64_t v12 = [MEMORY[0x189603F68] dictionaryWithObjects:&v246 forKeys:&v241 count:1];
      uint64_t v13 = @"Unsupported: (unsupported function)";
      v169 = v171;
    }
  }

  if (v9 == 1)
  {
    objc_opt_self();
    uint64_t v15 = (__CFString *)+[NSSQLDerivedAttributeSQLGenerator _triggerColumnListComponentForAttributeKeypaths:startingAt:]( (uint64_t)NSSQLDerivedAttributeSQLGenerator,  a3,  [a2 entity]);
    [a2 entity];
    objc_opt_self();
    objc_opt_self();
    uint64_t v16 = (void *)+[NSSQLDerivedAttributeSQLGenerator _computeNewColumnTokenForKeypathExpression:governingEntity:]( (uint64_t)NSSQLDerivedAttributeSQLGenerator,  (void *)objc_msgSend((id)objc_msgSend(a2, "propertyDescription"), "derivationExpression"),  objc_msgSend(a2, "entity"));
    return +[NSSQLDerivedAttributeSQLGenerator _generateTriggerForAttribute:newToken:updateToken:triggerColumnListComponent:triggerColumnWhereComponent:]( (uint64_t)NSSQLDerivedAttributeSQLGenerator,  a2,  (uint64_t)v16,  [v16 stringByReplacingOccurrencesOfString:@"NEW." withString:&stru_189EAC2E8],  v15);
  }

  else
  {
    if (v9 != 7)
    {
      if (v9 == 8)
      {
        uint64_t v10 = (void *)MEMORY[0x189603F70];
        uint64_t v11 = (NSSQLiteStatement *)*MEMORY[0x189603A60];
        v237 = @"derived attribute";
        v238 = v5;
        uint64_t v12 = [MEMORY[0x189603F68] dictionaryWithObjects:&v238 forKeys:&v237 count:1];
        uint64_t v13 = @"malformed expression (dependent property is to many, derivation expression is not a function)";
      }

      else
      {
        uint64_t v10 = (void *)MEMORY[0x189603F70];
        uint64_t v11 = (NSSQLiteStatement *)*MEMORY[0x189603A60];
        v235 = @"derived attribute";
        v236 = v5;
        v163 = (void *)MEMORY[0x189603F68];
        v164 = &v236;
        v165 = &v235;
LABEL_98:
        uint64_t v12 = [v163 dictionaryWithObjects:v164 forKeys:v165 count:1];
        uint64_t v13 = @"currently unsupported (unsupported keypath property type)";
      }

      goto LABEL_111;
    }

+ (PFCloudKitImportZoneContext)generateSQLForDerivedAttribute:(void *)a3 keypaths:
{
  v24[1] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  uint64_t v5 = [a2 propertyDescription];
  uint64_t v6 = v5;
  if (v5 && *(void *)(v5 + 128))
  {
    int v9 = (void *)MEMORY[0x189603F70];
    uint64_t v10 = *MEMORY[0x189603A60];
    v23 = @"derived attribute";
    v24[0] = v5;
    uint64_t v11 = [MEMORY[0x189603F68] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    uint64_t v12 = @"currently unsupported (predicate)";
  }

  else
  {
    if (![a3 count]) {
      return (PFCloudKitImportZoneContext *)+[NSSQLDerivedAttributeSQLGenerator _generateSQLForAttributeFunctionDerivationForDerivedAttribute:keypaths:]( (uint64_t)&OBJC_CLASS___NSSQLDerivedAttributeSQLGenerator,  a2,  a3);
    }
    if ([a3 count] == 1)
    {
      uint64_t v7 = (void *)[a3 anyObject];
      if ([v7 count] == 1 || objc_msgSend(v7, "count") == 2) {
        return (PFCloudKitImportZoneContext *)+[NSSQLDerivedAttributeSQLGenerator _generateSQLForDerivedAttributeWithOneParameterKeypath:keypaths:]( (uint64_t)&OBJC_CLASS___NSSQLDerivedAttributeSQLGenerator,  a2,  a3);
      }
      int v9 = (void *)MEMORY[0x189603F70];
      uint64_t v10 = *MEMORY[0x189603A60];
      __int128 v21 = @"derived attribute";
      uint64_t v22 = v6;
      uint64_t v11 = [MEMORY[0x189603F68] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      uint64_t v12 = @"currently unsupported (too many steps)";
    }

    else
    {
      int v9 = (void *)MEMORY[0x189603F70];
      uint64_t v10 = *MEMORY[0x189603A60];
      __int128 v19 = @"derived attribute";
      uint64_t v20 = v6;
      uint64_t v11 = [MEMORY[0x189603F68] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      uint64_t v12 = @"currently unsupported (too many keypaths)";
    }
  }

  objc_exception_throw((id)[v9 exceptionWithName:v10 reason:v12 userInfo:v11]);
  return -[PFCloudKitImportZoneContext initWithUpdatedRecords:deletedRecordTypeToRecordIDs:options:fileBackedFuturesDirectory:]( v13,  v14,  v15,  v16,  v17,  v18);
}

@end