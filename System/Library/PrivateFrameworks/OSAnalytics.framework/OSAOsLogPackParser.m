@interface OSAOsLogPackParser
- (BOOL)formatStringIsImmutable;
- (NSString)formatString;
- (NSString)formatStringOriginatingModulePath;
- (id)compose:(id)a3;
- (id)extractArguments:(id)a3;
- (id)filterOutSensitiveStrings:(id)a3;
- (id)modulePathForImmutableMemoryPointer;
- (id)parse:(id)a3;
- (id)pointerPointsToImmutableMemory;
- (id)readCStringFromTarget;
- (void)setFormatString:(id)a3;
- (void)setFormatStringIsImmutable:(BOOL)a3;
- (void)setFormatStringOriginatingModulePath:(id)a3;
- (void)setModulePathForImmutableMemoryPointer:(id)a3;
- (void)setPointerPointsToImmutableMemory:(id)a3;
- (void)setReadCStringFromTarget:(id)a3;
@end

@implementation OSAOsLogPackParser

- (id)parse:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_opt_new();
  id v6 = v4;
  uint64_t v7 = [v6 bytes];
  __int16 v8 = *(unsigned __int8 *)(v7 + 69);
  uint64_t v55 = 0LL;
  v56 = &v55;
  uint64_t v57 = 0x3032000000LL;
  v58 = __Block_byref_object_copy__1;
  v59 = __Block_byref_object_dispose__1;
  (*((void (**)(void))self->_readCStringFromTarget + 2))();
  id v60 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (void *)v56[5];
  if (!v9 || ![v9 length] || (unint64_t)objc_msgSend((id)v56[5], "length") >= 0x401)
  {
    id v10 = v5;
    goto LABEL_5;
  }

  objc_storeStrong((id *)&self->_formatString, (id)v56[5]);
  v54[0] = MEMORY[0x1895F87A8];
  v54[1] = 3221225472LL;
  v54[2] = __28__OSAOsLogPackParser_parse___block_invoke;
  v54[3] = &unk_189E20630;
  v54[4] = &v55;
  v12 = (void (**)(void, void))MEMORY[0x186E34260](v54);
  char v13 = (*((uint64_t (**)(void))self->_pointerPointsToImmutableMemory + 2))();
  self->_formatStringIsImmutable = v13;
  if ((v13 & 1) == 0)
  {
    v51 = -[OSAParsedOsLogPart initWithLiteral:isImmutable:]( objc_alloc(&OBJC_CLASS___OSAParsedOsLogPart),  "initWithLiteral:isImmutable:",  @"%s",  1LL);
    [v5 addObject:v51];

    id v50 = v5;
    goto LABEL_77;
  }

  (*((void (**)(void))self->_modulePathForImmutableMemoryPointer + 2))();
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  v15 = (unsigned __int8 *)(v7 + 70);
  formatStringOriginatingModulePath = self->_formatStringOriginatingModulePath;
  self->_formatStringOriginatingModulePath = v14;

  int v17 = 0;
  do
  {
    if (![(id)v56[5] length] || v17 > 7) {
      break;
    }
    unint64_t v19 = [(id)v56[5] rangeOfString:@"%"];
    if (!v20) {
      break;
    }
    unint64_t v21 = v19;
    if ([(id)v56[5] length] < v19) {
      break;
    }
    if ([(id)v56[5] characterAtIndex:v21 + 1] != 37)
    {
      if (!v8) {
        break;
      }
      int v53 = v17;
      uint64_t v52 = v15[1];
      v27 = objc_alloc(&OBJC_CLASS___OSAParsedOsLogPart);
      [(id)v56[5] substringToIndex:v21];
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[OSAParsedOsLogPart initWithLiteral:isImmutable:]( v27,  "initWithLiteral:isImmutable:",  v28,  self->_formatStringIsImmutable);
      [v5 addObject:v29];

      [(id)v56[5] substringFromIndex:v21 + 1];
      int v17 = v53;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, v21);
      v12[2](v12, 1LL);
      if ([v30 hasPrefix:@"s"])
      {
        v12[2](v12, 1LL);
        if ((*v15 & 0xF0) == 0x20 && v15[1] == 8)
        {
          __memcpy_chk();
          v31 = objc_alloc(&OBJC_CLASS___OSAParsedOsLogPart);
          (*((void (**)(void))self->_readCStringFromTarget + 2))();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = -[OSAParsedOsLogPart initWithStringArgument:isImmutable:]( v31,  "initWithStringArgument:isImmutable:",  v32,  (*((uint64_t (**)(void))self->_pointerPointsToImmutableMemory + 2))());
          [v5 addObject:v33];

          int v17 = v53 + 1;
          int v26 = 2;
          goto LABEL_70;
        }

void __28__OSAOsLogPackParser_parse___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) substringFromIndex:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)filterOutSensitiveStrings:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  uint64_t v4 = (void *)objc_opt_new();
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "isImmutable", (void)v14))
        {
          [v4 addObject:v10];
        }

        else
        {
          v11 = -[OSAParsedOsLogPart initWithStringArgument:isImmutable:]( objc_alloc(&OBJC_CLASS___OSAParsedOsLogPart),  "initWithStringArgument:isImmutable:",  @"%s",  1LL);
          [v4 addObject:v11];
        }
      }

      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  v12 = (void *)[v4 copy];
  return v12;
}

- (id)compose:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  uint64_t v4 = (void *)objc_opt_new();
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v9), "stringValue", (void)v13);
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 appendString:v10];

        ++v9;
      }

      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  v11 = (void *)[v4 copy];
  return v11;
}

- (id)extractArguments:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  uint64_t v4 = (void *)objc_opt_new();
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "isArgument", (void)v14))
        {
          [v10 stringValue];
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          [v4 addObject:v11];
        }
      }

      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  v12 = (void *)[v4 copy];
  return v12;
}

- (id)pointerPointsToImmutableMemory
{
  return objc_getProperty(self, a2, 16LL, 1);
}

- (void)setPointerPointsToImmutableMemory:(id)a3
{
}

- (id)modulePathForImmutableMemoryPointer
{
  return objc_getProperty(self, a2, 24LL, 1);
}

- (void)setModulePathForImmutableMemoryPointer:(id)a3
{
}

- (id)readCStringFromTarget
{
  return objc_getProperty(self, a2, 32LL, 1);
}

- (void)setReadCStringFromTarget:(id)a3
{
}

- (NSString)formatString
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setFormatString:(id)a3
{
}

- (BOOL)formatStringIsImmutable
{
  return self->_formatStringIsImmutable;
}

- (void)setFormatStringIsImmutable:(BOOL)a3
{
  self->_formatStringIsImmutable = a3;
}

- (NSString)formatStringOriginatingModulePath
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setFormatStringOriginatingModulePath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end