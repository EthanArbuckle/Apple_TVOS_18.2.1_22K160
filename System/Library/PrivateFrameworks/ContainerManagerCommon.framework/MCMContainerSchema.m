@interface MCMContainerSchema
+ (BOOL)schemaIsUpToDateForIdentifier:(id)a3 containerClass:(unint64_t)a4 currentSchemaVersion:(id)a5 latestSchemaVersion:(id *)a6;
+ (id)containerSchemaWithMetadata:(id)a3 finalContainerPath:(id)a4 dataProtectionClass:(int)a5 libraryRepair:(id)a6;
- (BOOL)_executeActions:(id)a3 error:(id *)a4;
- (BOOL)writeSchemaFromVersion:(id)a3 toTargetVersion:(id)a4 error:(id *)a5;
- (BOOL)writeSchemaToTargetVersion:(id)a3 error:(id *)a4;
- (MCMContainerSchema)initWithMetadata:(id)a3 finalContainerPath:(id)a4 dataProtectionClass:(int)a5 libraryRepair:(id)a6;
- (MCMContainerSchemaContext)context;
- (MCMMetadataMinimal)metadata;
- (NSNumber)latestSchemaVersion;
- (id)_actionArgsAfterInterpolationOnActionArgs:(id)a3 replacements:(id)a4;
- (id)_actionsFromVersion:(id)a3 toTargetVersion:(id)a4 context:(id)a5;
- (id)_interpolationReplacements;
@end

@implementation MCMContainerSchema

- (MCMContainerSchema)initWithMetadata:(id)a3 finalContainerPath:(id)a4 dataProtectionClass:(int)a5 libraryRepair:(id)a6
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___MCMContainerSchema;
  v14 = -[MCMContainerSchema init](&v29, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_metadata, a3);
    [v11 containerPath];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = [v11 containerClass];
    [v11 containerPath];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned int v26 = [v16 schemaPOSIXMode];

    [v11 containerPath];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 schemaPOSIXOwner];
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    [v11 identifier];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = +[MCMPOSIXUser currentPOSIXUser](&OBJC_CLASS___MCMPOSIXUser, "currentPOSIXUser");
    [v20 homeDirectoryURL];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v25) = a5;
    uint64_t v22 = +[MCMContainerSchemaContext contextWithHomeDirectoryURL:containerPath:finalContainerPath:POSIXMode:POSIXOwner:containerClass:dataProtectionClass:libraryRepair:identifier:]( &OBJC_CLASS___MCMContainerSchemaContext,  "contextWithHomeDirectoryURL:containerPath:finalContainerPath:POSIXMode:POSIXOwner:containerClass:dataProtectionCla ss:libraryRepair:identifier:",  v21,  v28,  v12,  v26,  v18,  v27,  v25,  v13,  v19);
    context = v15->_context;
    v15->_context = (MCMContainerSchemaContext *)v22;
  }

  return v15;
}

- (BOOL)writeSchemaFromVersion:(id)a3 toTargetVersion:(id)a4 error:(id *)a5
{
  uint64_t v77 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  v10 = -[MCMContainerSchema metadata](self, "metadata");
  -[MCMContainerSchema context](self, "context");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerSchema _actionsFromVersion:toTargetVersion:context:]( self,  "_actionsFromVersion:toTargetVersion:context:",  v8,  v9,  v11);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v13, self);

    container_log_handle_for_category();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    os_signpost_id_t spid = v15;
    unint64_t v18 = v15 - 1;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      [v10 identifier];
      id v19 = v8;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v60 = v20;
      _os_signpost_emit_with_name_impl( &dword_188846000,  v17,  OS_SIGNPOST_INTERVAL_BEGIN,  spid,  "SchemaUpdate",  " identifier=%{private, signpost.description:attribute}@ ",  buf,  0xCu);

      id v8 = v19;
    }

    id v58 = 0LL;
    BOOL v21 = -[MCMContainerSchema _executeActions:error:](self, "_executeActions:error:", v12, &v58);
    id v22 = v58;
    container_log_handle_for_category();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v21)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v49 = a5;
        id v55 = v8;
        [v10 uuid];
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 containerPath];
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        [v47 containerPathIdentifier];
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 identifier];
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v45 = [v10 containerClass];
        int v26 = [v10 conformsToProtocol:&unk_18C735DA0];
        if (v26)
        {
          [v10 fsNode];
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v27 = [v44 inode];
        }

        else
        {
          uint64_t v27 = 0LL;
        }

        uint64_t v31 = [v12 count];
        *(_DWORD *)buf = 138545154;
        v60 = v53;
        __int16 v61 = 2114;
        v62 = v51;
        __int16 v63 = 2112;
        v64 = v25;
        __int16 v65 = 2050;
        uint64_t v66 = v45;
        __int16 v67 = 2048;
        uint64_t v68 = v27;
        __int16 v69 = 2114;
        id v70 = v55;
        __int16 v71 = 2114;
        id v72 = v9;
        __int16 v73 = 2050;
        uint64_t v74 = v31;
        _os_log_impl( &dword_188846000,  v24,  OS_LOG_TYPE_DEFAULT,  "[u %{public}@:p %{public}@:c %@(%{public}llu):i%llu] Successfully updated schema from (%{public}@) → (%{public }@), actions count = %{public}lu",  buf,  0x52u);
        if (v26) {

        }
        v32 = v47;
LABEL_18:

        id v8 = v55;
        a5 = v49;
      }
    }

    else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v49 = a5;
      id v55 = v8;
      [v10 uuid];
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 containerPath];
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      [v46 containerPathIdentifier];
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 identifier];
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v28 = [v10 containerClass];
      int v29 = [v10 conformsToProtocol:&unk_18C735DA0];
      if (v29)
      {
        [v10 fsNode];
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v30 = [v44 inode];
      }

      else
      {
        uint64_t v30 = 0LL;
      }

      uint64_t v43 = [v12 count];
      *(_DWORD *)buf = 138545410;
      v60 = v53;
      __int16 v61 = 2114;
      v62 = v52;
      __int16 v63 = 2112;
      v64 = v48;
      __int16 v65 = 2050;
      uint64_t v66 = v28;
      __int16 v67 = 2048;
      uint64_t v68 = v30;
      __int16 v69 = 2114;
      id v70 = v55;
      __int16 v71 = 2114;
      id v72 = v9;
      __int16 v73 = 2050;
      uint64_t v74 = v43;
      __int16 v75 = 2114;
      id v76 = v22;
      _os_log_error_impl( &dword_188846000,  v24,  OS_LOG_TYPE_ERROR,  "[u %{public}@:p %{public}@:c %@(%{public}llu):i%llu] Could not update schema from (%{public}@) → (%{public}@), a ctions count = %{public}lu, error = %{public}@",  buf,  0x5Cu);
      if (v29) {

      }
      v32 = v46;
      goto LABEL_18;
    }

    container_log_handle_for_category();
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v14 = v33;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
    {
      [v10 identifier];
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v60 = v34;
      _os_signpost_emit_with_name_impl( &dword_188846000,  v14,  OS_SIGNPOST_INTERVAL_END,  spid,  "SchemaUpdate",  " identifier=%{private, signpost.description:attribute}@ ",  buf,  0xCu);
    }

    goto LABEL_22;
  }

  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v50 = a5;
    id v36 = v8;
    [v10 uuid];
    spida = (void *)objc_claimAutoreleasedReturnValue();
    [v10 containerPath];
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    [v37 containerPathIdentifier];
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 identifier];
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v40 = [v10 containerClass];
    int v41 = [v10 conformsToProtocol:&unk_18C735DA0];
    if (v41)
    {
      [v10 fsNode];
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v42 = [v54 inode];
    }

    else
    {
      uint64_t v42 = 0LL;
    }

    *(_DWORD *)buf = 138544898;
    v60 = spida;
    __int16 v61 = 2114;
    v62 = v38;
    __int16 v63 = 2112;
    v64 = v39;
    __int16 v65 = 2050;
    uint64_t v66 = v40;
    __int16 v67 = 2048;
    uint64_t v68 = v42;
    __int16 v69 = 2114;
    id v70 = v36;
    __int16 v71 = 2114;
    id v72 = v9;
    _os_log_error_impl( &dword_188846000,  v14,  OS_LOG_TYPE_ERROR,  "[u %{public}@:p %{public}@:c %@(%{public}llu):i%llu] Could not update schema from (%{public}@) → (%{public}@), no actions available",  buf,  0x48u);
    if (v41) {

    }
    LOBYTE(v21) = 0;
    id v22 = 0LL;
    id v8 = v36;
    a5 = v50;
  }

  else
  {
    LOBYTE(v21) = 0;
    id v22 = 0LL;
  }

- (BOOL)writeSchemaToTargetVersion:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = -[MCMContainerSchema metadata](self, "metadata");
  [v7 schemaVersion];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[MCMContainerSchema writeSchemaFromVersion:toTargetVersion:error:]( self,  "writeSchemaFromVersion:toTargetVersion:error:",  v8,  v6,  a4);

  return (char)a4;
}

- (id)_actionArgsAfterInterpolationOnActionArgs:(id)a3 replacements:(id)a4
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v29 = a4;
  objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  int v26 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v37 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v38;
    uint64_t v27 = *(void *)v38;
    id v28 = v6;
    do
    {
      uint64_t v10 = 0LL;
      uint64_t v30 = v8;
      do
      {
        if (*(void *)v38 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v37 + 1) + 8 * v10);
        [v11 string];
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 pathComponents];
        id v13 = (void *)objc_claimAutoreleasedReturnValue();

        if ([v13 count] && (objc_msgSend(v13, "containsObject:", @"..") & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            [v11 string];
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            __int128 v32 = 0u;
            __int128 v33 = 0u;
            __int128 v34 = 0u;
            __int128 v35 = 0u;
            id v15 = v29;
            uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v31 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = *(void *)v33;
              do
              {
                uint64_t v19 = 0LL;
                v20 = v14;
                do
                {
                  if (*(void *)v33 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  uint64_t v21 = *(void *)(*((void *)&v32 + 1) + 8 * v19);
                  [v15 objectForKeyedSubscript:v21];
                  id v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend( v20,  "stringByReplacingOccurrencesOfString:withString:options:range:",  v21,  v22,  1,  0,  objc_msgSend(v20, "length"));
                  v14 = (void *)objc_claimAutoreleasedReturnValue();

                  ++v19;
                  v20 = v14;
                }

                while (v17 != v19);
                uint64_t v17 = [v15 countByEnumeratingWithState:&v32 objects:v31 count:16];
              }

              while (v17);
            }

            v23 = (void *)[objc_alloc((Class)objc_opt_class()) initWithString:v14];
            if (v23) {
              [v26 addObject:v23];
            }

            uint64_t v9 = v27;
            id v6 = v28;
            uint64_t v8 = v30;
          }

          else
          {
            [v26 addObject:v11];
          }
        }

        ++v10;
      }

      while (v10 != v8);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v37 objects:v36 count:16];
    }

    while (v8);
  }

  v24 = (void *)[v26 copy];
  return v24;
}

- (id)_interpolationReplacements
{
  v14[4] = *MEMORY[0x1895F89C0];
  v2 = -[MCMContainerSchema metadata](self, "metadata");
  [v2 containerPath];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v4 = [v3 destinationContainerPath];

    v3 = (void *)v4;
  }

  [v3 containerPathIdentifier];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = @"${RealHome}";
  +[MCMPOSIXUser currentPOSIXUser](&OBJC_CLASS___MCMPOSIXUser, "currentPOSIXUser");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 homeDirectoryURL];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 path];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v13[1] = @"${BundleId}";
  [v2 identifier];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v9;
  v13[2] = @"${SigningId}";
  [v2 identifier];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = @"${ContainerId}";
  v14[2] = v10;
  v14[3] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v14 forKeys:v13 count:4];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_actionsFromVersion:(id)a3 toTargetVersion:(id)a4 context:(id)a5
{
  uint64_t v100 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [MEMORY[0x189603FA8] array];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = (void *)MEMORY[0x1895CE3A8]();
  uint64_t v77 = v10;
  MCMContainerSchemaDefinitionForClass([v10 containerClass]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v14 = [v9 unsignedIntegerValue];
  id v76 = self;
  if (v14 > [v13 count])
  {
    container_log_handle_for_category();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      contexta = v12;
      __int16 v71 = v13;
      __int16 v75 = v11;
      v64 = -[MCMContainerSchema metadata](self, "metadata");
      [v64 uuid];
      __int16 v73 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = -[MCMContainerSchema metadata](self, "metadata");
      [v62 containerPath];
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      [v60 containerPathIdentifier];
      uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMContainerSchema metadata](self, "metadata");
      __int128 v38 = (void *)objc_claimAutoreleasedReturnValue();
      [v38 identifier];
      __int128 v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMContainerSchema metadata](self, "metadata");
      __int128 v40 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v41 = self;
      uint64_t v42 = [v40 containerClass];
      -[MCMContainerSchema metadata](v41, "metadata");
      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
      int v44 = [v43 conformsToProtocol:&unk_18C735DA0];
      if (v44)
      {
        v57 = -[MCMContainerSchema metadata](v41, "metadata");
        [v57 fsNode];
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v45 = [v56 inode];
      }

      else
      {
        uint64_t v45 = 0LL;
      }

      *(_DWORD *)buf = 138544898;
      v80 = v73;
      __int16 v81 = 2114;
      v82 = v66;
      __int16 v83 = 2112;
      v84 = v39;
      __int16 v85 = 2050;
      uint64_t v86 = v42;
      __int16 v87 = 2048;
      uint64_t v88 = v45;
      __int16 v89 = 2112;
      id v90 = v9;
      __int16 v91 = 2048;
      uint64_t v92 = [v71 count];
      _os_log_error_impl( &dword_188846000,  v15,  OS_LOG_TYPE_ERROR,  "[u %{public}@:p %{public}@:c %@(%{public}llu):i%llu] Trying to target a version [%@] higher than available [%lu] , capping to max",  buf,  0x48u);
      if (v44)
      {
      }

      id v11 = v75;
      self = v76;
      id v12 = contexta;
      id v13 = v71;
    }

    uint64_t v16 = objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));

    id v9 = (id)v16;
  }

  -[MCMContainerSchema _interpolationReplacements](self, "_interpolationReplacements");
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v18 = [v8 unsignedIntegerValue];
  if (v18 < [v9 unsignedIntegerValue])
  {
    unint64_t v19 = [v8 unsignedIntegerValue];
    if (v19 < [v9 unsignedIntegerValue])
    {
      __int16 v65 = v9;
      id v67 = v8;
      uint64_t v74 = v11;
      context = v12;
      id v70 = v13;
      do
      {
        unint64_t v63 = v19;
        [v13 objectAtIndexedSubscript:v19];
        id v72 = (void *)objc_claimAutoreleasedReturnValue();
        [v72 objectForKeyedSubscript:@"script"];
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v96 = 0u;
        __int128 v97 = 0u;
        __int128 v98 = 0u;
        __int128 v99 = 0u;
        id v21 = v20;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v96 objects:v95 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v97;
          do
          {
            uint64_t v25 = 0LL;
            do
            {
              if (*(void *)v97 != v24) {
                objc_enumerationMutation(v21);
              }
              int v26 = *(void **)(*((void *)&v96 + 1) + 8 * v25);
              [v26 objectAtIndexedSubscript:0];
              uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
              [v27 string];
              id v28 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v26, "subarrayWithRange:", 1, objc_msgSend(v26, "count") - 1);
              id v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[MCMContainerSchema _actionArgsAfterInterpolationOnActionArgs:replacements:]( self,  "_actionArgsAfterInterpolationOnActionArgs:replacements:",  v29,  v17);
              uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();

              id v78 = 0LL;
              +[MCMContainerSchemaActionBase actionWithName:arguments:context:error:]( &OBJC_CLASS___MCMContainerSchemaActionBase,  "actionWithName:arguments:context:error:",  v28,  v30,  v77,  &v78);
              uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
              id v32 = v78;
              if (v31)
              {
                [v74 addObject:v31];
              }

              else
              {
                container_log_handle_for_category();
                __int128 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
                {
                  -[MCMContainerSchema metadata](v76, "metadata");
                  id v55 = (void *)objc_claimAutoreleasedReturnValue();
                  [v55 uuid];
                  __int16 v61 = (void *)objc_claimAutoreleasedReturnValue();
                  v54 = -[MCMContainerSchema metadata](v76, "metadata");
                  [v54 containerPath];
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  [v53 containerPathIdentifier];
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  v52 = -[MCMContainerSchema metadata](v76, "metadata");
                  [v52 identifier];
                  id v58 = (void *)objc_claimAutoreleasedReturnValue();
                  v51 = -[MCMContainerSchema metadata](v76, "metadata");
                  uint64_t v48 = [v51 containerClass];
                  v50 = -[MCMContainerSchema metadata](v76, "metadata");
                  int v49 = [v50 conformsToProtocol:&unk_18C735DA0];
                  if (v49)
                  {
                    v47 = -[MCMContainerSchema metadata](v76, "metadata");
                    [v47 fsNode];
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    uint64_t v34 = [v46 inode];
                  }

                  else
                  {
                    uint64_t v34 = 0LL;
                  }

                  *(_DWORD *)buf = 138545154;
                  v80 = v61;
                  __int16 v81 = 2114;
                  v82 = v59;
                  __int16 v83 = 2112;
                  v84 = v58;
                  __int16 v85 = 2050;
                  uint64_t v86 = v48;
                  __int16 v87 = 2048;
                  uint64_t v88 = v34;
                  __int16 v89 = 2112;
                  id v90 = v28;
                  __int16 v91 = 2112;
                  uint64_t v92 = (uint64_t)v30;
                  __int16 v93 = 2112;
                  id v94 = v32;
                  _os_log_fault_impl( &dword_188846000,  v33,  OS_LOG_TYPE_FAULT,  "[u %{public}@:p %{public}@:c %@(%{public}llu):i%llu] Could not form action [%@] with args: %@, error = %@",  buf,  0x52u);
                  if (v49)
                  {
                  }
                }
              }

              if (!v31)
              {

                objc_autoreleasePoolPop(context);
                id v36 = 0LL;
                id v9 = v65;
                id v8 = v67;
                id v11 = v74;
                goto LABEL_29;
              }

              ++v25;
              self = v76;
            }

            while (v23 != v25);
            uint64_t v35 = [v21 countByEnumeratingWithState:&v96 objects:v95 count:16];
            uint64_t v23 = v35;
          }

          while (v35);
        }

        id v9 = v65;
        unint64_t v19 = v63 + 1;
        id v8 = v67;
        id v12 = context;
        id v11 = v74;
        id v13 = v70;
      }

      while (v63 + 1 < [v65 unsignedIntegerValue]);
    }
  }

  objc_autoreleasePoolPop(v12);
  id v36 = (void *)[v11 copy];
LABEL_29:

  return v36;
}

- (BOOL)_executeActions:(id)a3 error:(id *)a4
{
  uint64_t v56 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1895CE3A8]();
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v52 objects:v51 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v35 = a4;
    id v11 = self;
    id v12 = 0LL;
    uint64_t v13 = *(void *)v53;
    while (2)
    {
      uint64_t v14 = 0LL;
      id v15 = v12;
      do
      {
        if (*(void *)v53 != v13) {
          objc_enumerationMutation(v8);
        }
        uint64_t v16 = *(void **)(*((void *)&v52 + 1) + 8 * v14);
        id v36 = v15;
        char v17 = [v16 performWithError:&v36];
        id v12 = v36;

        if ((v17 & 1) == 0)
        {
          container_log_handle_for_category();
          unint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            id v21 = v11;
            -[MCMContainerSchema metadata](v11, "metadata");
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
            [v22 uuid];
            uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
            [v21 metadata];
            uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
            [v31 containerPath];
            uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
            [v30 containerPathIdentifier];
            __int128 v33 = (void *)objc_claimAutoreleasedReturnValue();
            [v21 metadata];
            id v29 = (void *)objc_claimAutoreleasedReturnValue();
            [v29 identifier];
            id v32 = (void *)objc_claimAutoreleasedReturnValue();
            [v21 metadata];
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v28 = [v23 containerClass];
            [v21 metadata];
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
            int v25 = [v24 conformsToProtocol:&unk_18C735DA0];
            if (v25)
            {
              [v21 metadata];
              uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
              [v27 fsNode];
              id v21 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v26 = [v21 inode];
            }

            else
            {
              uint64_t v26 = 0LL;
            }

            *(_DWORD *)buf = 138544898;
            __int128 v38 = v34;
            __int16 v39 = 2114;
            __int128 v40 = v33;
            __int16 v41 = 2112;
            uint64_t v42 = v32;
            __int16 v43 = 2050;
            uint64_t v44 = v28;
            __int16 v45 = 2048;
            uint64_t v46 = v26;
            __int16 v47 = 2112;
            uint64_t v48 = v16;
            __int16 v49 = 2112;
            id v50 = v12;
            _os_log_error_impl( &dword_188846000,  v18,  OS_LOG_TYPE_ERROR,  "[u %{public}@:p %{public}@:c %@(%{public}llu):i%llu] Action [%@] failed; error = %@",
              buf,
              0x48u);
            if (v25)
            {
            }
          }

          objc_autoreleasePoolPop(v7);
          if (v35)
          {
            id v12 = v12;
            BOOL v19 = 0;
            *uint64_t v35 = v12;
          }

          else
          {
            BOOL v19 = 0;
          }

          goto LABEL_16;
        }

        ++v14;
        id v15 = v12;
      }

      while (v10 != v14);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v52 objects:v51 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  else
  {
    id v12 = 0LL;
  }

  objc_autoreleasePoolPop(v7);
  BOOL v19 = 1;
LABEL_16:

  return v19;
}

- (MCMMetadataMinimal)metadata
{
  return self->_metadata;
}

- (MCMContainerSchemaContext)context
{
  return self->_context;
}

- (NSNumber)latestSchemaVersion
{
  return self->_latestSchemaVersion;
}

- (void).cxx_destruct
{
}

+ (BOOL)schemaIsUpToDateForIdentifier:(id)a3 containerClass:(unint64_t)a4 currentSchemaVersion:(id)a5 latestSchemaVersion:(id *)a6
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a5;
  MCMContainerSchemaDefinitionForClass(a4);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ([v10 compare:v12])
  {
    if ([v10 compare:v12] != 1)
    {
      BOOL v14 = 0;
      if (!a6) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }

    container_log_handle_for_category();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138413058;
      id v17 = v9;
      __int16 v18 = 2048;
      unint64_t v19 = a4;
      __int16 v20 = 2112;
      id v21 = v10;
      __int16 v22 = 2112;
      uint64_t v23 = v12;
      _os_log_error_impl( &dword_188846000,  v13,  OS_LOG_TYPE_ERROR,  "[%@(%llu)] Current schema version (%@) is newer than the latest (%@), ignoring.",  (uint8_t *)&v16,  0x2Au);
    }
  }

  BOOL v14 = 1;
  if (a6) {
LABEL_7:
  }
    *a6 = v12;
LABEL_8:

  return v14;
}

+ (id)containerSchemaWithMetadata:(id)a3 finalContainerPath:(id)a4 dataProtectionClass:(int)a5 libraryRepair:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = (void *)[objc_alloc((Class)a1) initWithMetadata:v12 finalContainerPath:v11 dataProtectionClass:v6 libraryRepair:v10];

  return v13;
}

@end