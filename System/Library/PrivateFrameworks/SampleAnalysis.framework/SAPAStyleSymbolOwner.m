@interface SAPAStyleSymbolOwner
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
@end

@implementation SAPAStyleSymbolOwner

+ (id)classDictionaryKey
{
  return @"PASymbolOwner";
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5 = a5;
  +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Encoding failure",  @"Trying to encode SAPAStyleSymbolOwner",  0LL);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
  -[SAPAStyleSymbolOwner addSelfToSerializationDictionary:](v7, v8, v9);
  return result;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3 = a3;
  +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Encoding failure",  @"Trying to encode SAPAStyleSymbolOwner",  0LL);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
  -[SAPAStyleSymbolOwner sizeInBytesForSerializedVersion](v5, v6);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
  return (unint64_t)+[SAPAStyleSymbolOwner newInstanceWithoutReferencesFromSerializedBuffer:bufferLength:]( v3,  v4,  v5,  v6);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  if ((unint64_t)(*(void *)a3 - 4293844428LL) < 2 || *(void *)a3 == 287454020LL)
  {
    id result = objc_alloc_init(&OBJC_CLASS___SAPAStyleSymbolOwner);
    *((void *)result + 2) = *((void *)a3 + 4);
    if (*(void *)a3 < 0xFFEEDDCDuLL) {
      char v6 = 0;
    }
    else {
      char v6 = *((_BYTE *)a3 + 80);
    }
    *((_BYTE *)result + 8) = v6;
  }

  else
  {
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Bad PASymbolOwner magic",  0LL);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
    -[SAPAStyleSymbolOwner populateReferencesUsingBuffer:bufferLength:andDeserializationDictionary:andDataBufferDictionary:]( v8,  v9,  v10,  v11,  v12,  v13);
  }

  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v114 = *MEMORY[0x1895F89C0];
  id v9 = a5;
  id v10 = a6;
  if ((unint64_t)(*(void *)a3 - 4293844428LL) < 2 || *(void *)a3 == 287454020LL)
  {
    id v12 = v10;
    unint64_t v13 = *((void *)a3 + 3);
    v14 = (void *)objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v13, v9, v12, v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15) {
      goto LABEL_75;
    }
    unint64_t v16 = *((void *)a3 + 1);
    v17 = (void *)objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v16, v9, v12, v17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v19 = *((void *)a3 + 2);
    v20 = (void *)objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v19, v9, v12, v20, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v22 = *((void *)a3 + 5);
    v23 = (void *)objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v22, v9, v12, v23, 0);
    id newValue = (id)objc_claimAutoreleasedReturnValue();
    unint64_t v24 = *((void *)a3 + 6);
    v25 = (void *)objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v24, v9, v12, v25, 0);
    id v95 = (id)objc_claimAutoreleasedReturnValue();
    unint64_t v26 = *((void *)a3 + 7);
    v27 = (void *)objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v26, v9, v12, v27, 0);
    id v94 = (id)objc_claimAutoreleasedReturnValue();
    unint64_t v28 = *((void *)a3 + 8);
    v29 = (void *)objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v28, v9, v12, v29, 0);
    id v93 = (id)objc_claimAutoreleasedReturnValue();
    else {
      v30 = 0LL;
    }
    v31 = +[SABinary binaryWithUUID:absolutePath:](&OBJC_CLASS___SABinary, "binaryWithUUID:absolutePath:", v15, v30);
    selfa = v31;
    if (self->_hasTextExecSegment
      && ((-[SABinary segmentWithCleanName:](v31, @"__TEXT_EXEC"),
           (v32 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL)
       || (+[SASegment segmentWithBinary:name:length:]( (uint64_t)&OBJC_CLASS___SASegment,  selfa,  @"__TEXT_EXEC",  self->_textSegmentLength),  v32 = (void *)objc_claimAutoreleasedReturnValue(),  -[SABinary addSegment:](selfa, v32),  v31 = selfa,  v32)))
    {
      v97 = v32;
      if (![v32 length])
      {
        unint64_t textSegmentLength = self->_textSegmentLength;
        if (textSegmentLength) {
          -[SASegment setLength:](v32, textSegmentLength);
        }
      }

      char v101 = 0;
    }

    else
    {
      if (![v31 length])
      {
        unint64_t v83 = self->_textSegmentLength;
        if (v83)
        {
          v34 = selfa;
          -[SABinary setLength:](selfa, v83);
          v97 = 0LL;
          char v101 = 1;
          goto LABEL_20;
        }
      }

      v97 = 0LL;
      char v101 = 1;
    }

    v34 = selfa;
LABEL_20:
    [v34 name];
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v35) {
      -[SABinary setName:](v34, v18);
    }
    [v34 path];
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = v34;
    if (!v36 && v34)
    {
      objc_setProperty_atomic_copy(v34, v37, v21, 80LL);
      v38 = selfa;
    }

    [v38 bundleIdentifier];
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = selfa;
    if (!v39 && selfa)
    {
      objc_setProperty_atomic_copy(selfa, v40, newValue, 88LL);
      v41 = selfa;
    }

    [v41 bundleVersion];
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = selfa;
    if (!v42 && selfa)
    {
      objc_setProperty_atomic_copy(selfa, v43, v95, 96LL);
      v44 = selfa;
    }

    [v44 bundleShortVersion];
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = selfa;
    if (!v45 && selfa)
    {
      objc_setProperty_atomic_copy(selfa, v46, v94, 104LL);
      v47 = selfa;
    }

    v48 = v47;
    [v47 binaryVersion];
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v49 && v48) {
      objc_setProperty_atomic_copy(v48, v50, v93, 112LL);
    }
    uint64_t v51 = *(void *)a3;
    if (*(void *)a3 < 0xFFEEDDCCuLL) {
      goto LABEL_78;
    }
    if (v51 == 4293844428LL)
    {
      uint64_t v52 = 80LL;
    }

    else
    {
      if (v51 != 4293844429LL)
      {
        v84 = @"Bad PASerializedSymbolOwner magic";
        goto LABEL_80;
      }

      uint64_t v52 = 81LL;
    }

    uint64_t v53 = *((void *)a3 + 9);
    if (v53)
    {
      v88 = v21;
      v89 = v18;
      v90 = v15;
      v54 = (char *)a3 + v52;
      v55 = (void *)objc_opt_class();
      v91 = v12;
      id v92 = v9;
      SASerializableNewMutableArrayFromIndexList((uint64_t)v54, v53, v9, v12, v55);
      __int128 v108 = 0u;
      __int128 v109 = 0u;
      __int128 v110 = 0u;
      __int128 v111 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v102 = [obj countByEnumeratingWithState:&v108 objects:v113 count:16];
      if (v102)
      {
        uint64_t v100 = *(void *)v109;
        do
        {
          uint64_t v57 = 0LL;
          do
          {
            if (*(void *)v109 != v100) {
              objc_enumerationMutation(obj);
            }
            v58 = *(void **)(*((void *)&v108 + 1) + 8 * v57);
            if ((v101 & 1) != 0)
            {
              if (v58)
              {
                int64_t v60 = v58[2];
                unint64_t v59 = v58[3];
                id Property = objc_getProperty(*(id *)(*((void *)&v108 + 1) + 8 * v57), v56, 8LL, 1);
              }

              else
              {
                unint64_t v59 = 0LL;
                int64_t v60 = 0LL;
                id Property = 0LL;
              }

              uint64_t v62 = -[SABinary addSymbolWithOffsetIntoBinary:length:name:](selfa, v60, v59, Property);
            }

            else
            {
              if (v58)
              {
                unint64_t v65 = v58[2];
                unint64_t v64 = v58[3];
                id v66 = objc_getProperty(*(id *)(*((void *)&v108 + 1) + 8 * v57), v56, 8LL, 1);
              }

              else
              {
                unint64_t v64 = 0LL;
                unint64_t v65 = 0LL;
                id v66 = 0LL;
              }

              uint64_t v62 = -[SASegment addNonInlineSymbolWithOffsetIntoSegment:length:name:](v97, v65, v64, v66);
            }

            v67 = (void *)v62;
            __int128 v106 = 0u;
            __int128 v107 = 0u;
            __int128 v104 = 0u;
            __int128 v105 = 0u;
            uint64_t v103 = v57;
            if (v58) {
              id v68 = objc_getProperty(v58, v63, 32LL, 1);
            }
            else {
              id v68 = 0LL;
            }
            id v69 = v68;
            uint64_t v70 = [v69 countByEnumeratingWithState:&v104 objects:v112 count:16];
            if (v70)
            {
              uint64_t v72 = v70;
              uint64_t v73 = *(void *)v105;
              do
              {
                for (uint64_t i = 0LL; i != v72; ++i)
                {
                  if (*(void *)v105 != v73) {
                    objc_enumerationMutation(v69);
                  }
                  uint64_t v75 = *(void *)(*((void *)&v104 + 1) + 8 * i);
                  if (v75 && objc_getProperty(*(id *)(*((void *)&v104 + 1) + 8 * i), v71, 32LL, 1))
                  {
                    unint64_t v76 = *(void *)(v75 + 16);
                    uint64_t v77 = *(void *)(v75 + 24);
                    int v79 = *(_DWORD *)(v75 + 8);
                    int v78 = *(_DWORD *)(v75 + 12);
                    id v80 = objc_getProperty((id)v75, v71, 32LL, 1);
                    id v81 =  -[SASymbol addNonInlineSourceInfoWithOffsetIntoSegment:length:lineNum:columnNum:filePath:]( v67,  v76,  v77,  v79,  v78,  v80);
                  }
                }

                uint64_t v72 = [v69 countByEnumeratingWithState:&v104 objects:v112 count:16];
              }

              while (v72);
            }

            uint64_t v57 = v103 + 1;
          }

          while (v103 + 1 != v102);
          uint64_t v82 = [obj countByEnumeratingWithState:&v108 objects:v113 count:16];
          uint64_t v102 = v82;
        }

        while (v82);
      }

      id v12 = v91;
      id v9 = v92;
      v18 = v89;
      v15 = v90;
      v21 = v88;
    }

LABEL_75:
    return;
  }

@end