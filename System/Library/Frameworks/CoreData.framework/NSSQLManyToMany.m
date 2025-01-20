@interface NSSQLManyToMany
- (NSSQLManyToMany)initWithEntity:(id)a3 propertyDescription:(id)a4;
- (__CFString)inverseOrderColumnName;
- (const)inverseColumnName;
- (id)columnName;
- (id)correlationTableName;
- (uint64_t)isTableSchemaEqual:(uint64_t)result;
- (void)_setInverseManyToMany:(void *)a1;
- (void)dealloc;
@end

@implementation NSSQLManyToMany

- (NSSQLManyToMany)initWithEntity:(id)a3 propertyDescription:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSSQLManyToMany;
  result = -[NSSQLRelationship initWithEntity:propertyDescription:]( &v5,  sel_initWithEntity_propertyDescription_,  a3,  a4);
  if (result) {
    result->super.super._propertyType = 9;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLManyToMany;
  -[NSSQLRelationship dealloc](&v3, sel_dealloc);
}

- (id)correlationTableName
{
  if (self->_correlationTableName) {
    return self->_correlationTableName;
  }
  else {
    return -[NSSQLRelationship correlationTableName](self->super._inverse, "correlationTableName");
  }
}

- (void)_setInverseManyToMany:(void *)a1
{
  v34[3] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return;
  }
  uint64_t v5 = [a1 entity];
  if (a1[7] != a2)
  {
    -[NSSQLRelationship _setInverseRelationship:](a1, (void *)a2);
    if (a1[8])
    {
      if (!a2)
      {
LABEL_12:
        -[NSSQLManyToMany _setInverseManyToMany:](a2, a1);
        goto LABEL_13;
      }
    }

    else
    {
      id v6 = objc_alloc(NSString);
      v2 = (int *)@"Z";
      if (v5) {
        uint64_t v7 = *(unsigned int *)(v5 + 184);
      }
      else {
        uint64_t v7 = 0LL;
      }
      v8 = (void *)[v6 initWithFormat:@"%@_%d%@", @"Z", v7, objc_msgSend((id)objc_msgSend(a1, "name"), "uppercaseString")];
      v9 = (void *)a1[8];
      if (v9 != v8)
      {

        a1[8] = [v8 copy];
      }

      -[NSSQLRelationship _setInverseRelationship:]((void *)a2, a1);
      if (!a2) {
        goto LABEL_12;
      }
    }

    if (*(_BYTE *)(a2 + 24) != 9)
    {
      uint64_t v5 = MEMORY[0x189603F70];
      id v10 = (id)*MEMORY[0x189603A58];
      v33[0] = @"entity";
      uint64_t v26 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "entity"), "entityDescription"), "name");
      v11 = @"nil";
      if (v26) {
        v27 = (const __CFString *)v26;
      }
      else {
        v27 = @"nil";
      }
      v34[0] = v27;
      v33[1] = @"relationship";
      uint64_t v28 = [a1 name];
      if (v28) {
        v29 = (const __CFString *)v28;
      }
      else {
        v29 = @"nil";
      }
      v34[1] = v29;
      v33[2] = @"inverse";
      uint64_t v30 = [(id)a2 name];
      if (v30) {
        v31 = (const __CFString *)v30;
      }
      else {
        v31 = @"nil";
      }
      v34[2] = v31;
      objc_exception_throw((id)objc_msgSend( (id)v5,  "exceptionWithName:reason:userInfo:",  v10,  @"improper model with nonsensical relationship definitions",  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjects:forKeys:count:",  v34,  v33,  3)));
      goto LABEL_43;
    }

    goto LABEL_12;
  }

- (id)columnName
{
  return self->_columnName;
}

- (const)inverseColumnName
{
  if (result)
  {
    if ((const __CFString *)result[1].length == result) {
      return @"REFLEXIVE";
    }
    else {
      return (const __CFString *)[(id)result[1].length columnName];
    }
  }

  return result;
}

- (__CFString)inverseOrderColumnName
{
  if (result)
  {
    length = (__CFString *)result[1].length;
    if (length == result)
    {
      else {
        return 0LL;
      }
    }

    else if (length)
    {
      return (__CFString *)length[2].data;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

- (uint64_t)isTableSchemaEqual:(uint64_t)result
{
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  result = objc_msgSend(*(id *)(result + 72), "isEqualToString:", -[__CFString columnName](a2, "columnName"));
  if (!(_DWORD)result) {
    return result;
  }
  result = objc_msgSend( *(id *)(v3 + 64),  "isEqualToString:",  -[__CFString correlationTableName](a2, "correlationTableName"));
  if (!(_DWORD)result) {
    return result;
  }
  v4 = *(void **)(v3 + 56);
  if (v4 == (void *)v3)
  {
    uint64_t v5 = @"REFLEXIVE";
    if (a2) {
      goto LABEL_6;
    }
LABEL_9:
    result = -[__CFString isEqualToString:](v5, "isEqualToString:", 0LL);
    if (!(_DWORD)result) {
      return result;
    }
    if (*(void *)(v3 + 80)) {
      return 0LL;
    }
    goto LABEL_17;
  }

  uint64_t v5 = (__CFString *)[v4 columnName];
  if (!a2) {
    goto LABEL_9;
  }
LABEL_6:
  length = (__CFString *)a2[1].length;
  if (length == a2) {
    uint64_t v7 = @"REFLEXIVE";
  }
  else {
    uint64_t v7 = (const __CFString *)-[__CFString columnName](length, "columnName");
  }
  if ((-[__CFString isEqualToString:](v5, "isEqualToString:", v7) & 1) == 0) {
    return 0LL;
  }
  v8 = *(void **)(v3 + 80);
  if ((v8 != 0LL) == (a2[2].data == 0LL)) {
    return 0LL;
  }
  if (v8)
  {
    result = objc_msgSend(v8, "isEqualToString:");
    if (!(_DWORD)result) {
      return result;
    }
  }

@end