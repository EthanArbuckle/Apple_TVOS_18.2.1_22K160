@interface VMUOptionParser
- (BOOL)abortOnError;
- (BOOL)parametersShowAsAssignment;
- (BOOL)singleHyphenLongNames;
- (NSString)customUsageDescription;
- (NSString)discussion;
- (NSString)purposeDescription;
- (NSString)syntaxDescription;
- (VMUOptionParser)init;
- (id)parseArguments:(char *)a3 withBlock:(id)a4;
- (id)parseArgumentsArray:(id)a3 withBlock:(id)a4;
- (int)optind;
- (void)clearOptionDescriptions;
- (void)dealloc;
- (void)printOptionDescriptions:(id)a3;
- (void)registerOptionWithLongName:(id)a3 shortName:(id)a4 argumentKind:(int)a5 argumentName:(id)a6 optionDescription:(id)a7 flags:(unint64_t)a8 handler:(id)a9;
- (void)registerOptionWithLongName:(id)a3 shortName:(id)a4 argumentKind:(int)a5 argumentName:(id)a6 optionDescription:(id)a7 handler:(id)a8;
- (void)setAbortOnError:(BOOL)a3;
- (void)setCustomUsageDescription:(id)a3;
- (void)setDiscussion:(id)a3;
- (void)setParametersShowAsAssignment:(BOOL)a3;
- (void)setPurposeDescription:(id)a3;
- (void)setSingleHyphenLongNames:(BOOL)a3;
- (void)setSyntaxDescription:(id)a3;
- (void)usage:(id)a3;
- (void)usage:(id)a3 shouldExit:(BOOL)a4;
@end

@implementation VMUOptionParser

- (VMUOptionParser)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___VMUOptionParser;
  v2 = -[VMUOptionParser init](&v13, sel_init);
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    optionDescriptions = v2->_optionDescriptions;
    v2->_optionDescriptions = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    appleInternalOptionDescriptions = v2->_appleInternalOptionDescriptions;
    v2->_appleInternalOptionDescriptions = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    optionBlockByString = v2->_optionBlockByString;
    v2->_optionBlockByString = (NSMutableDictionary *)v7;

    callBacks.version = 1LL;
    callBacks.retain = 0LL;
    callBacks.copyDescription = 0LL;
    callBacks.equal = 0LL;
    callBacks.release = (CFArrayReleaseCallBack)_arrayFreeValue;
    v2->_longOptStructs = CFArrayCreateMutable(0LL, 0LL, &callBacks);
    uint64_t v9 = [objc_alloc(MEMORY[0x189607940]) initWithString:@":"];
    shortOpts = v2->_shortOpts;
    v2->_shortOpts = (NSMutableString *)v9;

    v2->_parametersShowAsAssignment = 1;
  }

  return v2;
}

- (void)dealloc
{
  longOptStructs = self->_longOptStructs;
  if (longOptStructs)
  {
    CFRelease(longOptStructs);
    self->_longOptStructs = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___VMUOptionParser;
  -[VMUOptionParser dealloc](&v4, sel_dealloc);
}

- (void)registerOptionWithLongName:(id)a3 shortName:(id)a4 argumentKind:(int)a5 argumentName:(id)a6 optionDescription:(id)a7 handler:(id)a8
{
}

- (void)registerOptionWithLongName:(id)a3 shortName:(id)a4 argumentKind:(int)a5 argumentName:(id)a6 optionDescription:(id)a7 flags:(unint64_t)a8 handler:(id)a9
{
  char v9 = a8;
  id v45 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a9;
  context = (void *)MEMORY[0x186E32E40]();
  if (v45)
  {
    size_t v19 = [v45 length] + 33;
    id v43 = v17;
    id v20 = v18;
    id v21 = v16;
    char v22 = v9;
    v23 = (char *)malloc(v19);
    id v24 = v45;
    strlcpy(v23 + 32, (const char *)[v24 UTF8String], v19);
    *(void *)v23 = v23 + 32;
    *((_DWORD *)v23 + 2) = a5;
    *((void *)v23 + 2) = 0LL;
    *((_DWORD *)v23 + 6) = 1;
    v25 = v23;
    char v9 = v22;
    id v16 = v21;
    id v18 = v20;
    id v17 = v43;
    CFArrayAppendValue(self->_longOptStructs, v25);
    optionBlockByString = self->_optionBlockByString;
    v27 = (void *)MEMORY[0x186E33044](v18);
    -[NSMutableDictionary setObject:forKey:](optionBlockByString, "setObject:forKey:", v27, v24);
  }

  if (v15)
  {
    -[NSMutableString appendString:](self->_shortOpts, "appendString:", v15);
    if (a5 == 1) {
      -[NSMutableString appendString:](self->_shortOpts, "appendString:", @":");
    }
    v28 = self->_optionBlockByString;
    v29 = (void *)MEMORY[0x186E33044](v18);
    -[NSMutableDictionary setObject:forKey:](v28, "setObject:forKey:", v29, v15);
  }

  if (v17)
  {
    [MEMORY[0x189607940] stringWithString:@"        "];
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v15)
    {
      [v30 appendFormat:@"-%@", v15];
      if (!v45)
      {
        if (!a5 || !v16) {
          goto LABEL_34;
        }
        BOOL v34 = a5 == 1;
        goto LABEL_22;
      }

      [v31 appendString:@"/"];
      id v32 = v45;
    }

    else
    {
      id v32 = v45;
      if (!v45)
      {
        if (!a5 || !v16) {
          goto LABEL_34;
        }
        BOOL v34 = a5 == 1;
LABEL_26:
        if (self->_parametersShowAsAssignment) {
          uint64_t v35 = 61LL;
        }
        else {
          uint64_t v35 = 32LL;
        }
        goto LABEL_29;
      }
    }

    if (self->_singleHyphenLongNames) {
      v33 = "-";
    }
    else {
      v33 = "--";
    }
    [v31 appendFormat:@"%s%@", v33, v32];
    if (!a5 || !v16) {
      goto LABEL_34;
    }
    BOOL v34 = a5 == 1;
    if (!v15) {
      goto LABEL_26;
    }
LABEL_22:
    uint64_t v35 = 32LL;
LABEL_29:
    BOOL v36 = !v34;
    uint64_t v37 = 93LL;
    if (!v36) {
      uint64_t v37 = 62LL;
    }
    uint64_t v42 = v37;
    uint64_t v38 = 91LL;
    if (!v36) {
      uint64_t v38 = 60LL;
    }
    [v31 appendFormat:@"%c%c%@%c", v35, v38, v16, v42];
LABEL_34:
    uint64_t v39 = [v31 length];
    [v31 appendFormat:@"[@@@spacing@@@]%@", v17];
    if ((v9 & 1) != 0)
    {
      if (!os_variant_has_internal_content())
      {
LABEL_41:

        goto LABEL_42;
      }

      uint64_t v40 = 5LL;
    }

    else
    {
      uint64_t v40 = 4LL;
    }

    -[objc_class addObject:]((&self->super.isa)[v40], "addObject:", v31);
    unint64_t spacing = self->_spacing;
    if (spacing <= v39 + 2) {
      unint64_t spacing = v39 + 2;
    }
    self->_unint64_t spacing = spacing;
    goto LABEL_41;
  }

- (int)optind
{
  return *MEMORY[0x1895FC2A0];
}

- (id)parseArgumentsArray:(id)a3 withBlock:(id)a4
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  v8 = malloc(8 * [v6 count] + 8);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  v11 = v8;
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v19;
    v11 = v8;
    do
    {
      uint64_t v14 = 0LL;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v9);
        }
        id v15 = *(id *)(*((void *)&v18 + 1) + 8 * v14);
        *v11++ = [v15 UTF8String];
        ++v14;
      }

      while (v12 != v14);
      uint64_t v12 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v12);
  }

  void *v11 = 0LL;
  -[VMUOptionParser parseArguments:withBlock:](self, "parseArguments:withBlock:", v8, v7);
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  free(v8);

  return v16;
}

- (id)parseArguments:(char *)a3 withBlock:(id)a4
{
  v55 = (void (**)(id, void *, id *))a4;
  id v6 = (void *)MEMORY[0x186E32E40]();
  v56 = (char *)-[NSMutableString UTF8String](self->_shortOpts, "UTF8String");
  if (a3 && *a3)
  {
    uint64_t v7 = 0LL;
    while (a3[++v7])
      ;
    CFIndex Count = CFArrayGetCount(self->_longOptStructs);
    v52 = (option *)calloc(Count + 1, 0x20uLL);
    if (Count >= 1)
    {
      CFIndex v10 = 0LL;
      v11 = v52;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(self->_longOptStructs, v10);
        __int128 v13 = ValueAtIndex[1];
        *(_OWORD *)&v11->name = *ValueAtIndex;
        *(_OWORD *)&v11->flag = v13;
        ++v11;
        ++v10;
      }

      while (Count != v10);
    }

    uint64_t v14 = getopt_long_only(v7, a3, v56, v52, &v60);
    context = v6;
    v53 = self;
    if ((_DWORD)v14 != -1)
    {
      uint64_t v20 = v14;
      __int128 v21 = 0LL;
      id v22 = 0LL;
      v54 = 0LL;
      uint64_t v23 = (uint64_t *)MEMORY[0x1895FC290];
      unint64_t v24 = 0x189607000uLL;
      v25 = v52;
      while (1)
      {
        uint64_t v26 = *v23;
        if (*v23)
        {
          [*(id *)(v24 + 2600) stringWithUTF8String:];
          v27 = (void *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          v27 = 0LL;
        }

        if ((_DWORD)v20 == 63)
        {
          VMUOptionParserError( -1,  @"unrecognized option '%s'",  v26,  v15,  v16,  v17,  v18,  v19,  (uint64_t)a3[*MEMORY[0x1895FC2A0] - 1]);
        }

        else
        {
          if ((_DWORD)v20 != 58)
          {
            if ((_DWORD)v20 == 1)
            {
              optionBlockByString = v53->_optionBlockByString;
              if (v25[v60].name) {
                name = v25[v60].name;
              }
              else {
                name = "";
              }
              [*(id *)(v24 + 2600) stringWithUTF8String:name];
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary objectForKey:](optionBlockByString, "objectForKey:", v30);
              v31 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();

              if (v31)
              {
                id v32 = v54;
                if (v22) {
                  v33 = v54;
                }
                else {
                  v33 = 0LL;
                }
                id v59 = v33;
                ((void (**)(void, void *, id *))v31)[2](v31, v27, &v59);
                id v34 = v59;
                if (v22) {
                  id v32 = v34;
                }
                v54 = v32;
                unint64_t v24 = 0x189607000LL;
                if (!v22) {
                  id v22 = v34;
                }
              }
            }

            else
            {
              uint64_t v35 = v53->_optionBlockByString;
              [*(id *)(v24 + 2600) stringWithFormat:@"%c", v20, context];
              BOOL v36 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary objectForKey:](v35, "objectForKey:", v36);
              v31 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();

              if (v31)
              {
                id v37 = v54;
                if (v22) {
                  uint64_t v38 = v54;
                }
                else {
                  uint64_t v38 = 0LL;
                }
                id v58 = v38;
                ((void (**)(void, void *, id *))v31)[2](v31, v27, &v58);
                id v39 = v58;
                if (v22) {
                  id v37 = v39;
                }
                v54 = v37;
                if (!v22) {
                  id v22 = v39;
                }
              }

              v25 = v52;
              unint64_t v24 = 0x189607000LL;
            }

            goto LABEL_41;
          }

          VMUOptionParserError( -1,  @"%s flag supplied with no argument",  v26,  v15,  v16,  v17,  v18,  v19,  (uint64_t)a3[*MEMORY[0x1895FC2A0] - 1]);
        }

        v31 = v21;
        __int128 v21 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
LABEL_41:

        uint64_t v20 = getopt_long_only(v7, a3, v56, v25, &v60);
        if ((_DWORD)v20 == -1) {
          goto LABEL_45;
        }
      }
    }

    v54 = 0LL;
    id v22 = 0LL;
    __int128 v21 = 0LL;
    v25 = v52;
LABEL_45:
    int v41 = *MEMORY[0x1895FC2A0];
    int v42 = v7 - 1;
    if (*MEMORY[0x1895FC2A0] <= (int)v7 - 1)
    {
      v44 = v54;
      while (1)
      {
        if (v55)
        {
          [NSString stringWithUTF8String:a3[v41]];
          id v45 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22) {
            v46 = v44;
          }
          else {
            v46 = 0LL;
          }
          id v57 = v46;
          v55[2](v55, v45, &v57);
          id v47 = v57;
          if (v22) {
            v44 = v47;
          }
          else {
            id v22 = v47;
          }

          int v42 = v7 - 1;
        }

        if (v22) {
          break;
        }
        id v43 = 0LL;
        int v48 = *MEMORY[0x1895FC2A0];
        int v41 = *MEMORY[0x1895FC2A0] + 1;
        *MEMORY[0x1895FC2A0] = v41;
        if (v48 >= v42) {
          goto LABEL_60;
        }
      }

      id v43 = v22;
    }

    else
    {
      id v43 = v22;
      v44 = v54;
    }

- (void)usage:(id)a3 shouldExit:(BOOL)a4
{
  BOOL v4 = a4;
  id v15 = a3;
  [v15 userInfo];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKey:*MEMORY[0x1896075E0]];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (FILE **)MEMORY[0x1895F89D0];
  if (v7 && [v15 code]) {
    fprintf(*v8, "[invalid usage]: %s\n\n", (const char *)[v7 UTF8String]);
  }
  customUsageDescription = self->_customUsageDescription;
  if (customUsageDescription)
  {
    fprintf(*v8, "%s\n", -[NSString UTF8String](customUsageDescription, "UTF8String"));
  }

  else
  {
    if (self->_purposeDescription)
    {
      CFIndex v10 = *v8;
      v11 = getprogname();
      fprintf(v10, "%s: %s\n\n", v11, -[NSString UTF8String](self->_purposeDescription, "UTF8String"));
    }

    if (self->_syntaxDescription)
    {
      uint64_t v12 = *v8;
      __int128 v13 = getprogname();
      fprintf(v12, "Usage: %s %s\n\n", v13, -[NSString UTF8String](self->_syntaxDescription, "UTF8String"));
    }

    discussionDescription = self->_discussionDescription;
    if (discussionDescription) {
      fprintf(*v8, "%s\n\n", -[NSString UTF8String](discussionDescription, "UTF8String"));
    }
    -[VMUOptionParser printOptionDescriptions:](self, "printOptionDescriptions:", self->_optionDescriptions);
    if (-[NSMutableArray count](self->_appleInternalOptionDescriptions, "count"))
    {
      fwrite("\nApple-internal options:\n", 0x19uLL, 1uLL, *v8);
      -[VMUOptionParser printOptionDescriptions:]( self,  "printOptionDescriptions:",  self->_appleInternalOptionDescriptions);
    }
  }

  if (v4)
  {
    if (!self->_abortOnError) {
      exit([v15 code]);
    }
    abort();
  }
}

- (void)usage:(id)a3
{
}

- (void)clearOptionDescriptions
{
}

- (void)printOptionDescriptions:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v14 = *(void *)v16;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v16 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v8 = [v7 rangeOfString:@"[@@@spacing@@@]"];
        [MEMORY[0x189NSStringormat:@"%*s", self->_spacing - v8, ""];
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v7 stringByReplacingOccurrencesOfString:@"[@@@spacing@@@]" withString:v9];
        CFIndex v10 = (void *)objc_claimAutoreleasedReturnValue();
        [MEMORY[0x1896NSStringrmat:@"\n%*s", (LODWORD(self->_spacing) + 3), ""];
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 stringByReplacingOccurrencesOfString:@"\n" withString:v11];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7) {
          fprintf( (FILE *)*MEMORY[0x1895F89D0], "%s\n", (const char *)[v12 UTF8String]);
        }
      }

      uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v5);
  }
}

- (NSString)purposeDescription
{
  return self->_purposeDescription;
}

- (void)setPurposeDescription:(id)a3
{
}

- (NSString)syntaxDescription
{
  return self->_syntaxDescription;
}

- (void)setSyntaxDescription:(id)a3
{
}

- (NSString)discussion
{
  return self->_discussionDescription;
}

- (void)setDiscussion:(id)a3
{
}

- (BOOL)singleHyphenLongNames
{
  return self->_singleHyphenLongNames;
}

- (void)setSingleHyphenLongNames:(BOOL)a3
{
  self->_singleHyphenLongNames = a3;
}

- (BOOL)parametersShowAsAssignment
{
  return self->_parametersShowAsAssignment;
}

- (void)setParametersShowAsAssignment:(BOOL)a3
{
  self->_parametersShowAsAssignment = a3;
}

- (NSString)customUsageDescription
{
  return self->_customUsageDescription;
}

- (void)setCustomUsageDescription:(id)a3
{
}

- (BOOL)abortOnError
{
  return self->_abortOnError;
}

- (void)setAbortOnError:(BOOL)a3
{
  self->_abortOnError = a3;
}

- (void).cxx_destruct
{
}

@end