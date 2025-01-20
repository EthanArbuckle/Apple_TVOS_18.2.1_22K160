@interface PBTextWriter
- (BOOL)write:(id)a3;
- (PBTextWriter)init;
- (id)string;
- (uint64_t)_printLine:(uint64_t)a3 format:(uint64_t)a4;
- (uint64_t)_write:(uint64_t)a1;
- (uint64_t)_writeResult:(uint64_t)a3 forProperty:(uint64_t)a4 bracePrefix:(uint64_t)a5;
- (void)dealloc;
- (void)reset;
@end

@implementation PBTextWriter

- (PBTextWriter)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBTextWriter;
  v2 = -[PBTextWriter init](&v4, sel_init);
  if (v2)
  {
    v2->_dest = (NSMutableString *)objc_alloc_init(MEMORY[0x189607940]);
    v2->_newlinesPrinted = 1;
    v2->_cachedObjectTypes = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBTextWriter;
  -[PBTextWriter dealloc](&v3, sel_dealloc);
}

- (id)string
{
  return (id)-[NSMutableString copy](self->_dest, "copy");
}

- (void)reset
{
  self->_dest = (NSMutableString *)objc_alloc_init(MEMORY[0x189607940]);
  self->_newlinesPrinted = 1;
}

- (BOOL)write:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (self)
  {
    if (!self->_newlinesPrinted)
    {
      -[NSMutableString appendString:](self->_dest, "appendString:", @"\n");
      self->_newlinesPrinted = 1;
    }
  }

  return -[PBTextWriter _write:]((uint64_t)self, (uint64_t)a3);
}

- (uint64_t)_write:(uint64_t)a1
{
  uint64_t v77 = *MEMORY[0x1895F89C0];
  if (a1) {
    BOOL v2 = a2 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  int v3 = !v2;
  unsigned int v68 = v3;
  if (!v2)
  {
    v6 = (objc_class *)objc_opt_class();
    id v7 = +[_PBProperty getValidPropertiesForType:withCache:]( (uint64_t)&OBJC_CLASS____PBProperty,  v6,  *(void **)(a1 + 32));
    __int128 v70 = 0u;
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    __int128 v73 = 0u;
    obuint64_t j = v7;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v70 objects:v76 count:16];
    if (v8)
    {
      uint64_t v13 = v8;
      uint64_t v14 = *(void *)v71;
      do
      {
        for (uint64_t i = 0LL; i != v13; ++i)
        {
          if (*(void *)v71 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v70 + 1) + 8 * i);
          if (v16)
          {
            v17 = *(void **)(v16 + 56);
            if (v17)
            {
              v18 = (char *)objc_msgSend((id)objc_msgSend(*(id *)(v16 + 56), "methodSignature"), "methodReturnType");
              v19 = 0LL;
              int v20 = *v18;
              if (v20 <= 80)
              {
                if (v20 > 72)
                {
                  if (v20 == 73)
                  {
                    [v17 invokeWithTarget:a2];
                    [v17 getReturnValue:&v75];
                    v19 = (void *)[MEMORY[0x189607968] numberWithUnsignedInt:LODWORD(v75)];
                  }

                  else if (v20 == 76)
                  {
                    [v17 invokeWithTarget:a2];
                    [v17 getReturnValue:&v75];
                    v19 = (void *)[MEMORY[0x189607968] numberWithUnsignedLong:*(void *)&v75];
                  }
                }

                else if (v20 == 66)
                {
                  [v17 invokeWithTarget:a2];
                  [v17 getReturnValue:&v75];
                  v19 = (void *)[MEMORY[0x189607968] numberWithBool:LOBYTE(v75)];
                }

                else if (v20 == 67)
                {
                  [v17 invokeWithTarget:a2];
                  [v17 getReturnValue:&v75];
                  v19 = (void *)[MEMORY[0x189607968] numberWithUnsignedChar:LOBYTE(v75)];
                }
              }

              else
              {
                switch(v20)
                {
                  case 'c':
                    [v17 invokeWithTarget:a2];
                    [v17 getReturnValue:&v75];
                    v19 = (void *)[MEMORY[0x189607968] numberWithChar:SLOBYTE(v75)];
                    break;
                  case 'd':
                    [v17 invokeWithTarget:a2];
                    [v17 getReturnValue:&v75];
                    v19 = (void *)[MEMORY[0x189607968] numberWithDouble:v75];
                    break;
                  case 'e':
                  case 'g':
                  case 'h':
                  case 'j':
                  case 'k':
                  case 'm':
                  case 'n':
                  case 'o':
                  case 'p':
                  case 'r':
                    break;
                  case 'f':
                    [v17 invokeWithTarget:a2];
                    [v17 getReturnValue:&v75];
                    LODWORD(v21) = LODWORD(v75);
                    v19 = (void *)[MEMORY[0x189607968] numberWithFloat:v21];
                    break;
                  case 'i':
                    [v17 invokeWithTarget:a2];
                    [v17 getReturnValue:&v75];
                    v19 = (void *)[MEMORY[0x189607968] numberWithInt:LODWORD(v75)];
                    break;
                  case 'l':
                    [v17 invokeWithTarget:a2];
                    [v17 getReturnValue:&v75];
                    v19 = (void *)[MEMORY[0x189607968] numberWithLong:*(void *)&v75];
                    break;
                  case 'q':
                    [v17 invokeWithTarget:a2];
                    [v17 getReturnValue:&v75];
                    v19 = (void *)[MEMORY[0x189607968] numberWithLongLong:*(void *)&v75];
                    break;
                  case 's':
                    [v17 invokeWithTarget:a2];
                    [v17 getReturnValue:&v75];
                    v19 = (void *)[MEMORY[0x189607968] numberWithShort:SLOWORD(v75)];
                    break;
                  default:
                    if (v20 == 81)
                    {
                      [v17 invokeWithTarget:a2];
                      [v17 getReturnValue:&v75];
                      v19 = (void *)[MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)&v75];
                    }

                    else if (v20 == 83)
                    {
                      [v17 invokeWithTarget:a2];
                      [v17 getReturnValue:&v75];
                      v19 = (void *)[MEMORY[0x189607968] numberWithUnsignedShort:LOWORD(v75)];
                    }

                    break;
                }
              }

              if ([v19 BOOLValue])
              {
LABEL_41:
                int v22 = *(unsigned __int8 *)(v16 + 32);
                if (v22 == 64)
                {
                  if ([*(id *)(v16 + 16) isSubclassOfClass:objc_opt_class()])
                  {
                    -[PBTextWriter _printLine:format:]( a1,  0LL,  (uint64_t)@"%@: {",  v23,  v9,  v10,  v11,  v12,  *(void *)(v16 + 8));
                    ++*(void *)(a1 + 16);
                    double v75 = 0.0;
                    [*(id *)(v16 + 48) invokeWithTarget:a2];
                    [*(id *)(v16 + 48) getReturnValue:&v75];
                    -[PBTextWriter _write:](a1, *(void *)&v75);
                    --*(void *)(a1 + 16);
                    -[PBTextWriter _printLine:format:](a1, 0LL, (uint64_t)@"}", v24, v25, v26, v27, v28, v67);
                    continue;
                  }

                  int v22 = *(unsigned __int8 *)(v16 + 32);
                }

                if (v22 != 123)
                {
                  if (v22 == 94)
                  {
                    if (*(_BYTE *)(v16 + 33) == 123) {
                      goto LABEL_48;
                    }
                    uint64_t v41 = -[_PBProperty getCountOfRepeatedValuesFromInstance:](v16, a2);
                    if (v41)
                    {
                      uint64_t v42 = v41;
                      double v37 = 0.0;
                      int v43 = *(char *)(v16 + 33);
                      if (v43 <= 80)
                      {
                        if (v43 > 72)
                        {
                          if (v43 == 73)
                          {
                            double v75 = 0.0;
                            [*(id *)(v16 + 48) invokeWithTarget:a2];
                            [*(id *)(v16 + 48) getReturnValue:&v75];
                            double v37 = COERCE_DOUBLE((id)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:v42]);
                            for (uint64_t j = 0LL; j != v42; ++j)
                              objc_msgSend( *(id *)&v37,  "addObject:",  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  *(unsigned int *)(*(void *)&v75 + 4 * j)));
                          }

                          else if (v43 == 76)
                          {
                            double v75 = 0.0;
                            [*(id *)(v16 + 48) invokeWithTarget:a2];
                            [*(id *)(v16 + 48) getReturnValue:&v75];
                            double v37 = COERCE_DOUBLE((id)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:v42]);
                            for (uint64_t k = 0LL; k != v42; ++k)
                              objc_msgSend( *(id *)&v37,  "addObject:",  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLong:",  *(void *)(*(void *)&v75 + 8 * k)));
                          }
                        }

                        else if (v43 == 66)
                        {
                          double v75 = 0.0;
                          [*(id *)(v16 + 48) invokeWithTarget:a2];
                          [*(id *)(v16 + 48) getReturnValue:&v75];
                          double v37 = COERCE_DOUBLE((id)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:v42]);
                          for (uint64_t m = 0LL; m != v42; ++m)
                            objc_msgSend( *(id *)&v37,  "addObject:",  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  *(unsigned __int8 *)(*(void *)&v75 + m)));
                        }

                        else if (v43 == 67)
                        {
                          double v75 = 0.0;
                          [*(id *)(v16 + 48) invokeWithTarget:a2];
                          [*(id *)(v16 + 48) getReturnValue:&v75];
                          double v37 = COERCE_DOUBLE((id)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:v42]);
                          for (uint64_t n = 0LL; n != v42; ++n)
                            objc_msgSend( *(id *)&v37,  "addObject:",  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedChar:",  *(unsigned __int8 *)(*(void *)&v75 + n)));
                        }
                      }

                      else
                      {
                        switch(*(_BYTE *)(v16 + 33))
                        {
                          case 'c':
                            double v75 = 0.0;
                            [*(id *)(v16 + 48) invokeWithTarget:a2];
                            [*(id *)(v16 + 48) getReturnValue:&v75];
                            double v37 = COERCE_DOUBLE((id)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:v42]);
                            for (iuint64_t i = 0LL; ii != v42; ++ii)
                              objc_msgSend( *(id *)&v37,  "addObject:",  objc_msgSend( MEMORY[0x189607968],  "numberWithChar:",  *(char *)(*(void *)&v75 + ii)));
                            break;
                          case 'd':
                            double v75 = 0.0;
                            [*(id *)(v16 + 48) invokeWithTarget:a2];
                            [*(id *)(v16 + 48) getReturnValue:&v75];
                            double v37 = COERCE_DOUBLE((id)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:v42]);
                            for (juint64_t j = 0LL; jj != v42; ++jj)
                              objc_msgSend( *(id *)&v37,  "addObject:",  objc_msgSend( MEMORY[0x189607968],  "numberWithDouble:",  *(double *)(*(void *)&v75 + 8 * jj)));
                            break;
                          case 'e':
                          case 'g':
                          case 'h':
                          case 'j':
                          case 'k':
                          case 'm':
                          case 'n':
                          case 'o':
                          case 'p':
                          case 'r':
                            break;
                          case 'f':
                            double v75 = 0.0;
                            [*(id *)(v16 + 48) invokeWithTarget:a2];
                            [*(id *)(v16 + 48) getReturnValue:&v75];
                            double v37 = COERCE_DOUBLE((id)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:v42]);
                            for (kuint64_t k = 0LL; kk != v42; ++kk)
                            {
                              LODWORD(v58) = *(_DWORD *)(*(void *)&v75 + 4 * kk);
                              objc_msgSend( *(id *)&v37,  "addObject:",  objc_msgSend(MEMORY[0x189607968], "numberWithFloat:", v58));
                            }

                            break;
                          case 'i':
                            double v75 = 0.0;
                            [*(id *)(v16 + 48) invokeWithTarget:a2];
                            [*(id *)(v16 + 48) getReturnValue:&v75];
                            double v37 = COERCE_DOUBLE((id)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:v42]);
                            for (muint64_t m = 0LL; mm != v42; ++mm)
                              objc_msgSend( *(id *)&v37,  "addObject:",  objc_msgSend( MEMORY[0x189607968],  "numberWithInt:",  *(unsigned int *)(*(void *)&v75 + 4 * mm)));
                            break;
                          case 'l':
                            double v75 = 0.0;
                            [*(id *)(v16 + 48) invokeWithTarget:a2];
                            [*(id *)(v16 + 48) getReturnValue:&v75];
                            double v37 = COERCE_DOUBLE((id)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:v42]);
                            for (nuint64_t n = 0LL; nn != v42; ++nn)
                              objc_msgSend( *(id *)&v37,  "addObject:",  objc_msgSend( MEMORY[0x189607968],  "numberWithLong:",  *(void *)(*(void *)&v75 + 8 * nn)));
                            break;
                          case 'q':
                            double v75 = 0.0;
                            [*(id *)(v16 + 48) invokeWithTarget:a2];
                            [*(id *)(v16 + 48) getReturnValue:&v75];
                            double v37 = COERCE_DOUBLE((id)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:v42]);
                            for (uint64_t i1 = 0LL; i1 != v42; ++i1)
                              objc_msgSend( *(id *)&v37,  "addObject:",  objc_msgSend( MEMORY[0x189607968],  "numberWithLongLong:",  *(void *)(*(void *)&v75 + 8 * i1)));
                            break;
                          case 's':
                            double v75 = 0.0;
                            [*(id *)(v16 + 48) invokeWithTarget:a2];
                            [*(id *)(v16 + 48) getReturnValue:&v75];
                            double v37 = COERCE_DOUBLE((id)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:v42]);
                            for (uint64_t i2 = 0LL; i2 != v42; ++i2)
                              objc_msgSend( *(id *)&v37,  "addObject:",  objc_msgSend( MEMORY[0x189607968],  "numberWithShort:",  *(__int16 *)(*(void *)&v75 + 2 * i2)));
                            break;
                          default:
                            if (v43 == 81)
                            {
                              double v75 = 0.0;
                              [*(id *)(v16 + 48) invokeWithTarget:a2];
                              [*(id *)(v16 + 48) getReturnValue:&v75];
                              double v37 = COERCE_DOUBLE((id)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:v42]);
                              for (uint64_t i3 = 0LL; i3 != v42; ++i3)
                                objc_msgSend( *(id *)&v37,  "addObject:",  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  *(void *)(*(void *)&v75 + 8 * i3)));
                            }

                            else if (v43 == 83)
                            {
                              double v75 = 0.0;
                              [*(id *)(v16 + 48) invokeWithTarget:a2];
                              [*(id *)(v16 + 48) getReturnValue:&v75];
                              double v37 = COERCE_DOUBLE((id)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:v42]);
                              for (uint64_t i4 = 0LL; i4 != v42; ++i4)
                                objc_msgSend( *(id *)&v37,  "addObject:",  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedShort:",  *(unsigned __int16 *)(*(void *)&v75 + 2 * i4)));
                            }

                            break;
                        }
                      }

- (uint64_t)_printLine:(uint64_t)a3 format:(uint64_t)a4
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v9 = result;
    *(_BYTE *)(result + 8) = 0;
    int v22 = &a9;
    id v10 = (id)[objc_alloc(NSString) initWithFormat:a3 arguments:&a9];
    id v11 = objc_alloc_init(MEMORY[0x189607940]);
    if (*(uint64_t *)(v9 + 16) >= 1)
    {
      uint64_t v12 = 0LL;
      do
      {
        [v11 appendString:@"    "];
        ++v12;
      }

      while (*(void *)(v9 + 16) > v12);
    }

    uint64_t v13 = (void *)objc_msgSend( v10,  "componentsSeparatedByCharactersInSet:",  objc_msgSend(MEMORY[0x189607810], "newlineCharacterSet"));
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    result = [v13 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (result)
    {
      uint64_t v14 = result;
      uint64_t v15 = *(void *)v19;
      do
      {
        uint64_t v16 = 0LL;
        do
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = *(void *)(*((void *)&v18 + 1) + 8 * v16);
          [*(id *)(v9 + 24) appendString:v11];
          [*(id *)(v9 + 24) appendString:v17];
          [*(id *)(v9 + 24) appendString:@"\n"];
          ++v16;
        }

        while (v14 != v16);
        result = [v13 countByEnumeratingWithState:&v18 objects:v23 count:16];
        uint64_t v14 = result;
      }

      while (result);
    }
  }

  return result;
}

- (uint64_t)_writeResult:(uint64_t)a3 forProperty:(uint64_t)a4 bracePrefix:(uint64_t)a5
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  if (!a2) {
    return result;
  }
  uint64_t v12 = result;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (a3)
    {
      uint64_t v18 = *(void *)(a3 + 8);
      if (*(_BYTE *)(a3 + 32) == 64) {
        return -[PBTextWriter _printLine:format:]( v12,  0LL,  (uint64_t)@"%@: \"%@\"",  v13,  v14,  v15,  v16,  v17,  *(void *)(a3 + 8));
      }
    }

    else
    {
      uint64_t v18 = 0LL;
    }

    goto LABEL_28;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!a4)
      {
        uint64_t v35 = MEMORY[0x1895F87A8];
        uint64_t v36 = 3221225472LL;
        double v37 = __53__PBTextWriter__writeResult_forProperty_bracePrefix___block_invoke;
        v38 = &unk_189D323B8;
        uint64_t v39 = v12;
        return [a2 enumerateKeysAndObjectsUsingBlock:&v35];
      }

      -[PBTextWriter _printLine:format:](v12, 0LL, (uint64_t)@"%@ {", v22, v23, v24, v25, v26, a4);
      uint64_t v27 = MEMORY[0x1895F87A8];
      ++*(void *)(v12 + 16);
      uint64_t v35 = v27;
      uint64_t v36 = 3221225472LL;
      double v37 = __53__PBTextWriter__writeResult_forProperty_bracePrefix___block_invoke;
      v38 = &unk_189D323B8;
      uint64_t v39 = v12;
      [a2 enumerateKeysAndObjectsUsingBlock:&v35];
LABEL_25:
      --*(void *)(v12 + 16);
      return -[PBTextWriter _printLine:format:](v12, 0LL, (uint64_t)@"}", v28, v29, v30, v31, v32, a9);
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (a3) {
        a3 = *(void *)(a3 + 8);
      }
      uint64_t v34 = a3;
      [a2 base64EncodedStringWithOptions:0];
      return -[PBTextWriter _printLine:format:](v12, 0LL, (uint64_t)@"%@: %@", v13, v14, v15, v16, v17, v34);
    }

    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (a3)
    {
      uint64_t v18 = *(void *)(a3 + 8);
      if ((isKindOfClass & 1) != 0)
      {
LABEL_24:
        -[PBTextWriter _printLine:format:](v12, 0LL, (uint64_t)@"%@: {", v13, v14, v15, v16, v17, v18);
        ++*(void *)(v12 + 16);
        -[PBTextWriter _write:](v12, a2);
        goto LABEL_25;
      }
    }

    else
    {
      uint64_t v18 = 0LL;
      if ((isKindOfClass & 1) != 0) {
        goto LABEL_24;
      }
    }

uint64_t __53__PBTextWriter__writeResult_forProperty_bracePrefix___block_invoke(uint64_t a1, uint64_t a2)
{
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    uint64_t v9 = @"%@: \"%@\"";
  }
  else {
    uint64_t v9 = @"%@: %@";
  }
  return -[PBTextWriter _printLine:format:](*(void *)(a1 + 32), 0LL, (uint64_t)v9, v4, v5, v6, v7, v8, a2);
}

@end