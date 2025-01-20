@interface SAPAStyleSymbolDataStore
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
@end

@implementation SAPAStyleSymbolDataStore

+ (id)classDictionaryKey
{
  return @"PASymbolDataStore";
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5 = a5;
  +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Encoding failure",  @"Trying to encode SAPAStyleSymbolDataStore",  0LL);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
  -[SAPAStyleSymbolDataStore addSelfToSerializationDictionary:](v7, v8, v9);
  return result;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3 = a3;
  +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Encoding failure",  @"Trying to encode SAPAStyleSymbolDataStore",  0LL);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
  -[SAPAStyleSymbolDataStore sizeInBytesForSerializedVersion](v5, v6);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
  return (unint64_t)+[SAPAStyleSymbolDataStore newInstanceWithoutReferencesFromSerializedBuffer:bufferLength:]( v3,  v4,  v5,  v6);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v5);
  -[SAPAStyleSymbolDataStore populateReferencesUsingBuffer:bufferLength:andDeserializationDictionary:andDataBufferDictionary:]( v6,  v7,  v8,  v9,  v10,  v11);
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v140 = *MEMORY[0x1895F89C0];
  id v8 = a5;
  id v122 = a6;
  unint64_t v9 = *(void *)a3 - 324506182LL;
  if (v9 >= 3)
  {
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Bad PASymbolDataStore magic",  0LL);
    id v113 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v113);
  }

  id v10 = (char *)a3 + qword_186D74B18[v9];
  uint64_t v11 = *((void *)a3 + 1);
  if (v11)
  {
    v12 = (void *)objc_opt_class();
    v13 = (void *)objc_opt_class();
    id v14 = SASerializableNewMutableDictionaryFromIndexList((uint64_t)v10, v11, v8, v122, v12, v13);
    uint64_t v15 = *((void *)a3 + 1);
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  uint64_t v16 = *((void *)a3 + 2);
  if (v16)
  {
    v17 = &v10[24 * v15];
    v18 = (void *)objc_opt_class();
    v19 = (void *)objc_opt_class();
    SASerializableNewMutableDictionaryOfArraysFromIndexList(v17, v16, v8, v122, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v20 = 0LL;
  }

  if (*(void *)a3 > 0x13579246uLL)
  {
    v121 = v20;
    if (*(void *)a3 != 324506183LL)
    {
      unint64_t v21 = *((void *)a3 + 5);
      v22 = (void *)objc_opt_class();
      _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass( v21,  v8,  v122,  v22,  0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v23;
      if (v23)
      {
        objc_msgSend(objc_getProperty(v23, v24, 8, 1), "binary");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        [v26 uuid];
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[SAKernelCache kernelCacheWithUUID:loadAddress:]( SAKernelCache,  "kernelCacheWithUUID:loadAddress:",  v27,  objc_msgSend(objc_getProperty(v25, v28, 8, 1), "loadAddress"));
        v29 = (SAKernelCache *)objc_claimAutoreleasedReturnValue();
        kernelCache = self->_kernelCache;
        self->_kernelCache = v29;
      }
    }

    unint64_t v31 = *((void *)a3 + 3);
    v32 = (void *)objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v31, v8, v122, v32, 0);
    Property = (void *)objc_claimAutoreleasedReturnValue();
    selfa = Property;
    if (Property) {
      Property = objc_getProperty(Property, v34, 8LL, 1);
    }
    [Property binary];
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v36 = [v35 uuid];

    v119 = (void *)v36;
    if (v36)
    {
      [v121 objectForKeyedSubscript:v36];
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37;
      if (v37 && [v37 count])
      {
        id v123 = (id)a3;
        id v117 = v8;
        v127 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v38, "count"));
        __int128 v134 = 0u;
        __int128 v135 = 0u;
        __int128 v136 = 0u;
        __int128 v137 = 0u;
        v115 = v38;
        id obj = v38;
        uint64_t v39 = [obj countByEnumeratingWithState:&v134 objects:v139 count:16];
        if (v39)
        {
          uint64_t v41 = v39;
          uint64_t v42 = *(void *)v135;
          do
          {
            uint64_t v43 = 0LL;
            do
            {
              if (*(void *)v135 != v42) {
                objc_enumerationMutation(obj);
              }
              v44 = *(void **)(*((void *)&v134 + 1) + 8 * v43);
              if (v44) {
                id v45 = objc_getProperty(*(id *)(*((void *)&v134 + 1) + 8 * v43), v40, 8LL, 1);
              }
              else {
                id v45 = 0LL;
              }
              [v45 binary];
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = -[SABinary segmentWithCleanName:](v46, @"__TEXT");
              if (!v48)
              {
                v48 = +[SASegment segmentWithBinary:name:length:]( (uint64_t)SASegment,  v46,  @"__TEXT",  [v46 length]);
                -[SABinary addSegment:](v46, v48);
              }

              if (v44) {
                id v49 = objc_getProperty(v44, v47, 8LL, 1);
              }
              else {
                id v49 = 0LL;
              }
              uint64_t v51 = [v49 loadAddress];
              id v52 = selfa;
              if (selfa) {
                id v52 = objc_getProperty(selfa, v50, 8LL, 1);
              }
              uint64_t v54 = [v52 loadAddress];
              if (v44)
              {
                int v55 = objc_msgSend(objc_getProperty(v44, v53, 8, 1), "isInKernelAddressSpace");
                id v57 = objc_getProperty(v44, v56, 8LL, 1);
              }

              else
              {
                int v55 = [0 isInKernelAddressSpace];
                id v57 = 0LL;
              }

              uint64_t v58 = v54 + v51;
              [v57 exclave];
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = +[SABinaryLoadInfo binaryLoadInfoWithSegment:loadAddress:isInKernelAddressSpace:exclave:]( &OBJC_CLASS___SABinaryLoadInfo,  v48,  v58,  v55,  v59);
              [v127 addObject:v60];

              ++v43;
            }

            while (v41 != v43);
            uint64_t v61 = [obj countByEnumeratingWithState:&v134 objects:v139 count:16];
            uint64_t v41 = v61;
          }

          while (v61);
        }

        if (selfa) {
          id v63 = objc_getProperty(selfa, v62, 8LL, 1);
        }
        else {
          id v63 = 0LL;
        }
        id v8 = v117;
        [v63 binary];
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        [v64 uuid];
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        a3 = v123;
        if (selfa) {
          id v67 = objc_getProperty(selfa, v65, 8LL, 1);
        }
        else {
          id v67 = 0LL;
        }
        v38 = v115;
        uint64_t v68 = [v67 loadAddress];
        v69 = (void *)[v127 copy];
        +[SASharedCache sharedCacheWithUUID:slide:binaryLoadInfos:]((uint64_t)&OBJC_CLASS___SASharedCache, v66, v68, v69);
        v70 = (SASharedCache *)objc_claimAutoreleasedReturnValue();
        sharedCache64Bit = self->_sharedCache64Bit;
        self->_sharedCache64Bit = v70;
      }
    }

    unint64_t v72 = *((void *)a3 + 4);
    v73 = (void *)objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v72, v8, v122, v73, 0);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v74;
    if (v74) {
      v74 = objc_getProperty(v74, v75, 8LL, 1);
    }
    [v74 binary];
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    [v77 uuid];
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v121;
    if (v78)
    {
      [v121 objectForKeyedSubscript:v78];
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = v79;
      if (v79 && [v79 count])
      {
        v116 = v78;
        id v118 = v8;
        v128 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v80, "count"));
        __int128 v130 = 0u;
        __int128 v131 = 0u;
        __int128 v132 = 0u;
        __int128 v133 = 0u;
        v114 = v80;
        id v124 = v80;
        uint64_t v81 = [v124 countByEnumeratingWithState:&v130 objects:v138 count:16];
        if (v81)
        {
          uint64_t v83 = v81;
          id obja = *(id *)v131;
          do
          {
            uint64_t v84 = 0LL;
            do
            {
              if (*(id *)v131 != obja) {
                objc_enumerationMutation(v124);
              }
              v85 = *(void **)(*((void *)&v130 + 1) + 8 * v84);
              if (v85) {
                id v86 = objc_getProperty(*(id *)(*((void *)&v130 + 1) + 8 * v84), v82, 8LL, 1);
              }
              else {
                id v86 = 0LL;
              }
              [v86 binary];
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              v89 = -[SABinary segmentWithCleanName:](v87, @"__TEXT");
              if (!v89)
              {
                v89 = +[SASegment segmentWithBinary:name:length:]( (uint64_t)SASegment,  v87,  @"__TEXT",  [v87 length]);
                -[SABinary addSegment:](v87, v89);
              }

              if (v85) {
                id v90 = objc_getProperty(v85, v88, 8LL, 1);
              }
              else {
                id v90 = 0LL;
              }
              uint64_t v92 = [v90 loadAddress];
              if (v76) {
                id v93 = objc_getProperty(v76, v91, 8LL, 1);
              }
              else {
                id v93 = 0LL;
              }
              uint64_t v95 = [v93 loadAddress];
              if (v85)
              {
                int v96 = objc_msgSend(objc_getProperty(v85, v94, 8, 1), "isInKernelAddressSpace");
                id v98 = objc_getProperty(v85, v97, 8LL, 1);
              }

              else
              {
                int v96 = [0 isInKernelAddressSpace];
                id v98 = 0LL;
              }

              uint64_t v99 = v95 + v92;
              [v98 exclave];
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              v101 = +[SABinaryLoadInfo binaryLoadInfoWithSegment:loadAddress:isInKernelAddressSpace:exclave:]( &OBJC_CLASS___SABinaryLoadInfo,  v89,  v99,  v96,  v100);
              [v128 addObject:v101];

              ++v84;
            }

            while (v83 != v84);
            uint64_t v102 = [v124 countByEnumeratingWithState:&v130 objects:v138 count:16];
            uint64_t v83 = v102;
          }

          while (v102);
        }

        if (v76) {
          id v104 = objc_getProperty(v76, v103, 8LL, 1);
        }
        else {
          id v104 = 0LL;
        }
        [v104 binary];
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        [v105 uuid];
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        id v8 = v118;
        if (v76) {
          id v108 = objc_getProperty(v76, v106, 8LL, 1);
        }
        else {
          id v108 = 0LL;
        }
        uint64_t v109 = [v108 loadAddress];
        v110 = (void *)[v128 copy];
        +[SASharedCache sharedCacheWithUUID:slide:binaryLoadInfos:]( (uint64_t)&OBJC_CLASS___SASharedCache,  v107,  v109,  v110);
        v111 = (SASharedCache *)objc_claimAutoreleasedReturnValue();
        sharedCache32Bit = self->_sharedCache32Bit;
        self->_sharedCache32Bit = v111;

        v20 = v121;
        v80 = v114;
        v78 = v116;
      }
    }
  }
}

- (void).cxx_destruct
{
}

@end