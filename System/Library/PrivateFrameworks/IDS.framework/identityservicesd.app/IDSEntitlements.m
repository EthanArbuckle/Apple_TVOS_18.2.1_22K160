@interface IDSEntitlements
- (BOOL)hasAnyEntitlements;
- (BOOL)hasEntitlement:(id)a3;
- (BOOL)hasService:(id)a3 forAnyOfEntitlements:(id)a4;
- (BOOL)hasService:(id)a3 forEntitlement:(id)a4;
- (IDSEntitlements)initWithEntitlements:(id)a3;
- (id)debugDescription;
- (id)dictionaryRepresentation;
- (void)dealloc;
@end

@implementation IDSEntitlements

- (IDSEntitlements)initWithEntitlements:(id)a3
{
  id v4 = a3;
  v78.receiver = self;
  v78.super_class = (Class)&OBJC_CLASS___IDSEntitlements;
  v5 = -[IDSEntitlements init](&v78, "init");
  if (v5)
  {
    v59 = objc_autoreleasePoolPush();
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    unsigned __int8 v7 = [v4 count];
    v5->_specificEntitlementCount = v7;
    v5->_specificEntitlements = (_SpecificEntitlement *)calloc(v7, 0x18uLL);
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    __int128 v76 = 0u;
    __int128 v77 = 0u;
    id v60 = v4;
    id v8 = v4;
    v9 = v5;
    id v10 = v8;
    id v67 = [v8 countByEnumeratingWithState:&v74 objects:v84 count:16];
    if (v67)
    {
      LODWORD(v11) = 0;
      uint64_t v12 = *(void *)v75;
      uint64_t v64 = *(void *)v75;
      id v61 = v10;
      v62 = v5;
      do
      {
        uint64_t v13 = 0LL;
        uint64_t v11 = (int)v11;
        do
        {
          if (*(void *)v75 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v69 = v13;
          v14 = *(void **)(*((void *)&v74 + 1) + 8 * v13);
          specificEntitlements = v9->_specificEntitlements;
          context = objc_autoreleasePoolPush();
          int v16 = sub_1001CE80C(v14);
          if (v16 >= 1)
          {
            unsigned __int8 v17 = v16;
            v65 = (__int16 *)&specificEntitlements[v11];
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v14, v59));
            uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSString, v19);
            if ((objc_opt_isKindOfClass(v18, v20) & 1) != 0)
            {
              v22 = v9;
              id v23 = v10;
              v24 = v18;
              id v25 = sub_1001CEC90(v18);
              v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
              uint64_t v27 = (uint64_t)-[NSMutableArray indexOfObject:](v6, "indexOfObject:", v26);
              if (v27 == 0x7FFFFFFFFFFFFFFFLL)
              {
                uint64_t v27 = (uint64_t)-[NSMutableArray count](v6, "count");
                -[NSMutableArray addObject:](v6, "addObject:", v26);
              }

              if (v27 >= 0x10000)
              {
                v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog warning](&OBJC_CLASS___IMRGLog, "warning"));
                if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v81 = v24;
                  __int16 v82 = 2048;
                  uint64_t v83 = v27;
                  _os_log_fault_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_FAULT,  "Too many services in entitlements! {value: %@, index: %llx}",  buf,  0x16u);
                }
              }

              else
              {
                v28 = &specificEntitlements[v11];
                v28->var2 = v17;
                __int16 *v65 = -8529;
                v28->var1.var1 = v27;
              }

              v33 = v22;
              uint64_t v12 = v64;

              v18 = v24;
              id v10 = v23;
              v9 = v33;
            }

            else
            {
              uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSNumber, v21);
              if ((objc_opt_isKindOfClass(v18, v29) & 1) != 0)
              {
                specificEntitlements[v11].var2 = v17;
                if (qword_1009BEE00 != -1) {
                  dispatch_once(&qword_1009BEE00, &stru_1008FD570);
                }
                if (byte_1009BEDF8 == v17
                  || _os_feature_enabled_impl("IDS", "BlockBooleanServiceEntitlements")
                  && (byte_1009BEDF9 == v17 || byte_1009BEDFA == v17))
                {
                  __int16 v31 = -8531;
                }

                else
                {
                  __int16 v31 = -8467;
                }

                __int16 *v65 = v31;
                specificEntitlements[v11].var1.var1 = (unsigned __int16)[v18 unsignedShortValue];
              }

              else
              {
                uint64_t v34 = objc_opt_class(&OBJC_CLASS___NSArray, v30);
                if ((objc_opt_isKindOfClass(v18, v34) & 1) != 0)
                {
                  uint64_t v63 = v11;
                  v35 = &specificEntitlements[v11];
                  v35->var2 = v17;
                  unsigned __int16 v36 = (unsigned __int16)[v18 count];
                  if ((v36 & 0xFFBF) == 0xDEAD || v36 == 57007) {
                    unsigned __int16 v38 = v36 + 1;
                  }
                  else {
                    unsigned __int16 v38 = v36;
                  }
                  __int16 *v65 = v38;
                  v35->var1.var0 = (unsigned __int16 *)calloc(v38, 2uLL);
                  p_var1 = &v35->var1;
                  __int128 v70 = 0u;
                  __int128 v71 = 0u;
                  __int128 v72 = 0u;
                  __int128 v73 = 0u;
                  v66 = v18;
                  id v40 = v18;
                  id v41 = [v40 countByEnumeratingWithState:&v70 objects:v79 count:16];
                  if (v41)
                  {
                    id v43 = v41;
                    LODWORD(v44) = 0;
                    uint64_t v45 = *(void *)v71;
                    do
                    {
                      v46 = 0LL;
                      uint64_t v44 = (int)v44;
                      do
                      {
                        if (*(void *)v71 != v45) {
                          objc_enumerationMutation(v40);
                        }
                        v47 = *(void **)(*((void *)&v70 + 1) + 8LL * (void)v46);
                        uint64_t v48 = objc_opt_class(&OBJC_CLASS___NSString, v42);
                        if ((objc_opt_isKindOfClass(v47, v48) & 1) != 0)
                        {
                          id v49 = sub_1001CEC90(v47);
                          v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
                          id v51 = -[NSMutableArray indexOfObject:](v6, "indexOfObject:", v50);
                          unsigned __int16 v52 = (unsigned __int16)v51;
                          if (v51 == (id)0x7FFFFFFFFFFFFFFFLL)
                          {
                            unsigned __int16 v52 = (unsigned __int16)-[NSMutableArray count](v6, "count");
                            -[NSMutableArray addObject:](v6, "addObject:", v50);
                          }

                          p_var1->var0[v44] = v52 + 1;
                        }

                        ++v44;
                        v46 = (char *)v46 + 1;
                      }

                      while (v43 != v46);
                      id v43 = [v40 countByEnumeratingWithState:&v70 objects:v79 count:16];
                    }

                    while (v43);
                  }

                  id v10 = v61;
                  v9 = v62;
                  uint64_t v11 = v63;
                  uint64_t v12 = v64;
                  v18 = v66;
                }
              }
            }
          }

          ++v11;
          objc_autoreleasePoolPop(context);
          uint64_t v13 = v69 + 1;
        }

        while ((id)(v69 + 1) != v67);
        id v67 = [v10 countByEnumeratingWithState:&v74 objects:v84 count:16];
      }

      while (v67);
    }

    unsigned __int16 v53 = (unsigned __int16)-[NSMutableArray count](v6, "count");
    v9->_serviceIdentifierCount = v53;
    v9->_shrunkenServiceIdentifiers = (char **)calloc(v53, 8uLL);
    if (v9->_serviceIdentifierCount)
    {
      unint64_t v54 = 0LL;
      do
      {
        v55 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](v6, "objectAtIndex:", v54, v59));
        v56 = (char *)[v55 lengthOfBytesUsingEncoding:4] + 1;
        v57 = (char *)malloc((size_t)v56);
        v9->_shrunkenServiceIdentifiers[v54] = v57;
        [v55 getCString:v57 maxLength:v56 encoding:4];

        ++v54;
      }

      while (v54 < v9->_serviceIdentifierCount);
    }

    v5 = v9;

    objc_autoreleasePoolPop(v59);
    id v4 = v60;
  }

  return v5;
}

- (void)dealloc
{
  unsigned int specificEntitlementCount = self->_specificEntitlementCount;
  if (self->_specificEntitlementCount)
  {
    uint64_t v4 = 0LL;
    unint64_t v5 = 0LL;
    do
    {
      specificEntitlements = self->_specificEntitlements;
      int var0 = specificEntitlements[v4].var0;
      if (var0 != 57005 && var0 != 57007 && var0 != 57069)
      {
        free(specificEntitlements[v4].var1.var0);
        unsigned int specificEntitlementCount = self->_specificEntitlementCount;
      }

      ++v5;
      ++v4;
    }

    while (v5 < specificEntitlementCount);
  }

  free(self->_specificEntitlements);
  if (self->_serviceIdentifierCount)
  {
    unint64_t v10 = 0LL;
    do
      free(self->_shrunkenServiceIdentifiers[v10++]);
    while (v10 < self->_serviceIdentifierCount);
  }

  free(self->_shrunkenServiceIdentifiers);
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___IDSEntitlements;
  -[IDSEntitlements dealloc](&v11, "dealloc");
}

- (id)debugDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSEntitlements dictionaryRepresentation](self, "dictionaryRepresentation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 description]);

  return v3;
}

- (BOOL)hasService:(id)a3 forAnyOfEntitlements:(id)a4
{
  id v6 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = a4;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (-[IDSEntitlements hasService:forEntitlement:]( self,  "hasService:forEntitlement:",  v6,  *(void *)(*((void *)&v14 + 1) + 8LL * (void)i),  (void)v14))
        {
          BOOL v12 = 1;
          goto LABEL_11;
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (BOOL)hasService:(id)a3 forEntitlement:(id)a4
{
  id v6 = a3;
  int v7 = sub_1001CE80C(a4);
  if (!v7) {
    goto LABEL_17;
  }
  uint64_t specificEntitlementCount = self->_specificEntitlementCount;
  if (!self->_specificEntitlementCount) {
    goto LABEL_17;
  }
  p_uint64_t var1 = &self->_specificEntitlements->var1;
  while (LOBYTE(p_var1[1].var1) != v7)
  {
    p_var1 += 3;
    if (!--specificEntitlementCount) {
      goto LABEL_17;
    }
  }

  uint64_t var1 = p_var1[-1].var1;
  if ((_DWORD)var1 == 57005) {
    goto LABEL_17;
  }
  int var0 = p_var1->var0;
  if ((_DWORD)var1 == 57007)
  {
    id v13 = sub_1001CEC90(v6);
    id v14 = objc_claimAutoreleasedReturnValue(v13);
    __int128 v15 = (const char *)[v14 UTF8String];

    BOOL v12 = strcmp(v15, self->_shrunkenServiceIdentifiers[(unsigned __int16)var0]) == 0;
    goto LABEL_18;
  }

  if ((_DWORD)var1 == 57069)
  {
    BOOL v12 = (unsigned __int16)p_var1->var0 != 0LL;
    goto LABEL_18;
  }

  id v16 = sub_1001CEC90(v6);
  id v17 = objc_claimAutoreleasedReturnValue(v16);
  v18 = (const char *)[v17 UTF8String];

  uint64_t serviceIdentifierCount = self->_serviceIdentifierCount;
  if (!self->_serviceIdentifierCount)
  {
LABEL_17:
    BOOL v12 = 0;
    goto LABEL_18;
  }

  uint64_t v20 = 0LL;
  shrunkenServiceIdentifiers = self->_shrunkenServiceIdentifiers;
  while (1)
  {
    BOOL v12 = 0;
    if (!strcmp(v18, shrunkenServiceIdentifiers[v20])) {
      break;
    }
    if (serviceIdentifierCount == ++v20) {
      goto LABEL_18;
    }
  }

  if ((_DWORD)v20 != -1 && (_DWORD)var1)
  {
    uint64_t v23 = var1 - 1;
    do
    {
      int v24 = *var0++;
      BOOL v12 = (_DWORD)v20 - v24 == -1;
    }

    while ((_DWORD)v20 - v24 != -1 && v23-- != 0);
  }

- (BOOL)hasEntitlement:(id)a3
{
  int v4 = sub_1001CE80C(a3);
  if (v4)
  {
    uint64_t specificEntitlementCount = self->_specificEntitlementCount;
    if (self->_specificEntitlementCount)
    {
      uint64_t v6 = specificEntitlementCount - 1;
      p_var2 = &self->_specificEntitlements->var2;
      do
      {
        int v8 = *p_var2;
        p_var2 += 24;
        LOBYTE(specificEntitlementCount) = v8 == v4;
      }

      while (v8 != v4 && v6-- != 0);
    }
  }

  else
  {
    LOBYTE(specificEntitlementCount) = 0;
  }

  return specificEntitlementCount;
}

- (BOOL)hasAnyEntitlements
{
  return self->_specificEntitlementCount != 0;
}

- (id)dictionaryRepresentation
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  context = objc_autoreleasePoolPush();
  if (self->_specificEntitlementCount)
  {
    for (unint64_t i = 0LL; i < self->_specificEntitlementCount; ++i)
    {
      unint64_t v5 = &self->_specificEntitlements[i];
      uint64_t var0 = v5->var0;
      int v7 = v5->var1.var0;
      unsigned int v8 = v5->var2 - 1;
      if (v8 > 0x22) {
        id v9 = 0LL;
      }
      else {
        id v9 = *(id *)*(&off_1008FD590 + (char)v8);
      }
      if ((_DWORD)var0 == 57005)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", &off_1009474A0, v9);
      }

      else
      {
        if ((_DWORD)var0 == 57007)
        {
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  self->_shrunkenServiceIdentifiers[(unsigned __int16)v7],  4LL));
          id v11 = sub_1001CF438(v10);
          BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v12, v9);
        }

        else
        {
          if ((_DWORD)var0 != 57069)
          {
            id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            if ((_DWORD)var0)
            {
              do
              {
                unsigned int v15 = *v7++;
                uint64_t v14 = v15;
                if (v15 <= self->_serviceIdentifierCount)
                {
                  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  self->_shrunkenServiceIdentifiers[v14 - 1],  4LL));
                  id v17 = sub_1001CF438(v16);
                  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
                  -[NSMutableArray addObject:](v13, "addObject:", v18);
                }

                --var0;
              }

              while (var0);
            }

            id v19 = -[NSMutableArray copy](v13, "copy");
            -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v19, v9);

            goto LABEL_18;
          }

          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  (unsigned __int16)v7));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v10, v9);
        }
      }

@end