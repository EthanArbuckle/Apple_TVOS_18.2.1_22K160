@interface NSSQLJoinIntermediate
+ (id)createJoinIntermediatesForKeypath:(uint64_t)a3 startEntity:(void *)a4 startAlias:(void *)a5 forScope:(uint64_t)a6 inStatementIntermediate:(void *)a7 inContext:;
- (id)description;
- (id)generateSQLStringInContext:(id)a3;
- (void)dealloc;
- (void)initForRelationship:(void *)a3 sourceAlias:(void *)a4 destinationAlias:(void *)a5 correlationAlias:(char)a6 direct:(uint64_t)a7 inScope:;
@end

@implementation NSSQLJoinIntermediate

+ (id)createJoinIntermediatesForKeypath:(uint64_t)a3 startEntity:(void *)a4 startAlias:(void *)a5 forScope:(uint64_t)a6 inStatementIntermediate:(void *)a7 inContext:
{
  int v12 = [a5 isUpdateScoped];
  if ((v12 & 1) == 0 && (!a6 || !*(void *)(a6 + 112)))
  {
    v17 = (void *)MEMORY[0x189603F70];
    uint64_t v18 = *MEMORY[0x189603A60];
    uint64_t v19 = [NSString stringWithFormat:@"Join being created outside a fetch scope for keypath %@ entity %@", a2, a3];
    goto LABEL_71;
  }

  if ([a5 isOrScoped]) {
    int v49 = 1;
  }
  else {
    int v49 = [a5 isTargetColumnsScoped];
  }
  int v44 = v12;
  else {
    char v13 = 1;
  }
  unint64_t v14 = [a2 count];
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(a2, "count"));
  v16 = (void *)[a5 disambiguationKeypath];
  uint64_t v51 = [a5 disambiguatingEntity];
  if (v51 && [v16 count] <= v14)
  {
    if ([v16 count])
    {
      unint64_t v53 = v14;
      unint64_t v20 = 0LL;
      do
      {
        char v21 = objc_msgSend( (id)objc_msgSend(v16, "objectAtIndex:", v20),  "isEqual:",  objc_msgSend(a2, "objectAtIndex:", v20));
        if ((v21 & 1) == 0) {
          break;
        }
        ++v20;
      }

      while (v20 < [v16 count]);
      char v55 = v21 ^ 1;
      unint64_t v14 = v53;
      if (!v53) {
        goto LABEL_65;
      }
    }

    else
    {
      char v55 = 0;
      if (!v14)
      {
LABEL_65:

        v41 = 0LL;
        return v41;
      }
    }
  }

  else
  {
    char v55 = 1;
    if (!v14) {
      goto LABEL_65;
    }
  }

  uint64_t v22 = 0LL;
  v52 = 0LL;
  unint64_t v54 = v14;
  if (a6) {
    char v23 = v13;
  }
  else {
    char v23 = 1;
  }
  char v45 = v23;
  uint64_t v47 = a6;
  unint64_t v48 = v14 - 1;
  uint64_t v46 = (uint64_t)a5;
  while (1)
  {
    uint64_t v24 = [a2 objectAtIndex:v22];
    v25 = a3 ? (void *)[*(id *)(a3 + 40) objectForKey:v24] : 0;
    char v26 = v25 ? 1 : v55;
    if ((v26 & 1) == 0) {
      break;
    }
LABEL_32:
    int v27 = [v25 propertyType];
    if (!v25) {
      goto LABEL_67;
    }
    int v28 = v27;
    [v15 addObject:v24];
    if (v28 == 9)
    {
      char v33 = v48 == v22 && [a7 objectForKey:@"subqueryCollectionContext"] == 0;
      objc_opt_self();
      if (v52) {
        v34 = (void *)v52[4];
      }
      else {
        v34 = 0LL;
      }
      uint64_t v35 = objc_msgSend((id)objc_msgSend(a7, "objectForKey:", @"aliasGenerator"), "generateTableAlias");
      v36 = (void *)objc_msgSend((id)objc_msgSend(a7, "objectForKey:", @"aliasGenerator"), "generateTableAlias");
      v37 = objc_alloc(&OBJC_CLASS___NSSQLJoinIntermediate);
      v38 = (void *)v35;
      a5 = (void *)v46;
      v30 = -[NSSQLJoinIntermediate initForRelationship:sourceAlias:destinationAlias:correlationAlias:direct:inScope:]( v37,  (uint64_t)v25,  v34,  v36,  v38,  v33,  v46);
      a6 = v47;
    }

    else
    {
      if (v28 != 8)
      {
        if (v28 != 7 || v48 == v22 && ![a7 objectForKey:@"subqueryCollectionContext"]) {
          goto LABEL_61;
        }
        v29 = (void *)-[NSSQLFetchIntermediate finalJoinForKeypathWithComponents:](a6, v15);
        if (v29)
        {
          v30 = v29;
          v31 = v29;
LABEL_53:
          a3 = [(id)v30[2] destinationEntity];
          if (v49)
          {
            v30[6] = 2LL;
            if ((v45 & 1) == 0)
            {
              uint64_t v39 = *(void *)(a6 + 64);
              if (v39) {
                *(_BYTE *)(v39 + 48) = 1;
              }
            }
          }

          if (a4 && !v30[3])
          {
            id v40 = a4;

            v30[3] = a4;
          }

          v52 = v30;
          goto LABEL_61;
        }
      }

      objc_opt_self();
      if (v52) {
        v32 = (void *)v52[4];
      }
      else {
        v32 = 0LL;
      }
      v30 = -[NSSQLJoinIntermediate initForRelationship:sourceAlias:destinationAlias:correlationAlias:direct:inScope:]( [NSSQLJoinIntermediate alloc],  (uint64_t)v25,  v32,  (void *)objc_msgSend((id)objc_msgSend(a7, "objectForKey:", @"aliasGenerator"), "generateTableAlias"),  0,  0,  (uint64_t)a5);
    }

    -[NSSQLFetchIntermediate addJoinIntermediate:atKeypathWithComponents:](a6, (uint64_t)v30, v15);
    if (v30) {
      goto LABEL_53;
    }
LABEL_61:
    if (v54 == ++v22) {
      goto LABEL_67;
    }
  }

  if (v51)
  {
    v25 = (void *)[*(id *)(v51 + 40) objectForKey:v24];
    goto LABEL_32;
  }

  [0 propertyType];
LABEL_67:

  v41 = v52;
  int v42 = v44;
  if (!v52) {
    int v42 = 0;
  }
  if (v42 != 1) {
    return v41;
  }
  v17 = (void *)MEMORY[0x189603F70];
  uint64_t v18 = *MEMORY[0x189603A60];
  uint64_t v19 = [NSString stringWithFormat:@"Join being created inside an update scope for keypath %@ entity %@", a2, a3];
LABEL_71:
  objc_msgSend( a7,  "setObject:forKey:",  objc_msgSend(v17, "exceptionWithName:reason:userInfo:", v18, v19, 0),  @"NSUnderlyingException");
  return 0LL;
}

- (void)initForRelationship:(void *)a3 sourceAlias:(void *)a4 destinationAlias:(void *)a5 correlationAlias:(char)a6 direct:(uint64_t)a7 inScope:
{
  if (!a1) {
    return 0LL;
  }
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_CLASS___NSSQLJoinIntermediate;
  int v12 = objc_msgSendSuper2(&v15, sel_initWithScope_, a7);
  char v13 = v12;
  if (v12)
  {
    v12[2] = a2;
    v12[3] = a3;
    v13[4] = a4;
    v13[5] = a5;
    *((_BYTE *)v13 + 56) = a6;
  }

  return v13;
}

- (void)dealloc
{
  self->_relationship = 0LL;

  self->_sourceAlias = 0LL;
  self->_destinationAlias = 0LL;

  self->_correlationAlias = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLJoinIntermediate;
  -[NSSQLJoinIntermediate dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"source (%@, %@), destination (%@, %@), correlation (%@)", objc_msgSend(-[NSSQLProperty entity](self->_relationship, "entity"), "name"), self->_sourceAlias, objc_msgSend(-[NSSQLRelationship destinationEntity](self->_relationship, "destinationEntity"), "name"), self->_destinationAlias, self->_correlationAlias];
}

- (id)generateSQLStringInContext:(id)a3
{
  if ([a3 objectForKey:@"NSUnderlyingException"]) {
    return 0LL;
  }
  relationship = self->_relationship;
  if (relationship && relationship->super._propertyType == 7)
  {
    id v4 = objc_alloc_init(MEMORY[0x189607940]);
    sourceAlias = self->_sourceAlias;
    if (!sourceAlias) {
      sourceAlias = -[NSSQLIntermediate governingAlias](self, "governingAlias");
    }
    unint64_t type = self->_type;
    if (type == 1)
    {
      v8 = @"INNER ";
    }

    else
    {
      if (type != 2) {
        goto LABEL_23;
      }
      v8 = @"LEFT OUTER ";
    }

    [v4 appendString:v8];
LABEL_23:
    [v4 appendString:@"JOIN "];
    objc_msgSend( v4,  "appendString:",  objc_msgSend(-[NSSQLRelationship destinationEntity](self->_relationship, "destinationEntity"), "tableName"));
    [v4 appendString:@" "];
    [v4 appendString:self->_destinationAlias];
    [v4 appendString:@" ON "];
    [v4 appendString:sourceAlias];
    [v4 appendString:@"."];
    objc_msgSend(v4, "appendString:", -[NSSQLProperty columnName](self->_relationship, "columnName"));
    [v4 appendString:@" = "];
    [v4 appendString:self->_destinationAlias];
    [v4 appendString:@"."];
    objc_super v15 = -[NSSQLRelationship sourceEntity](self->_relationship, "sourceEntity");
    if (!v15)
    {
LABEL_32:
      objc_msgSend(v4, "appendString:", objc_msgSend(v15, "columnName"));
      return v4;
    }

@end