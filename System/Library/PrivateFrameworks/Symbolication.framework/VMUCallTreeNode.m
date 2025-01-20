@interface VMUCallTreeNode
+ (id)makeFakeRootForNode:(id)a3;
+ (id)nodeWithName:(id)a3 address:(unint64_t)a4 count:(unsigned int)a5 numBytes:(unint64_t)a6;
+ (id)rootForSamples:(id)a3 symbolicator:(_CSTypeRef)a4;
+ (id)rootForSamples:(id)a3 symbolicator:(_CSTypeRef)a4 sampler:(id)a5 options:(unint64_t)a6;
- (BOOL)callTreeHasBranches;
- (BOOL)isMallocBlockContentNode;
- (BOOL)isPseudo;
- (BOOL)symbolNameIsUnknown;
- (VMUCallTreeNode)initWithName:(id)a3 address:(unint64_t)a4 count:(unsigned int)a5 numBytes:(unint64_t)a6;
- (id)allChildren;
- (id)browserName;
- (id)chargeLibrariesInSet:(id)a3 toCaller:(id)a4 parentLibrary:(id)a5;
- (id)chargeLibrariesToCallers:(id)a3 keepBoundaries:(BOOL)a4;
- (id)childAtIndex:(unsigned int)a3;
- (id)description;
- (id)filterOutSymbols:(id)a3;
- (id)filterOutSymbols:(id)a3 required:(id)a4;
- (id)findOrAddChildWithName:(id)a3 address:(unint64_t)a4;
- (id)findOrAddChildWithName:(id)a3 address:(unint64_t)a4 nodeSearchType:(int)a5 isLeafNode:(BOOL)a6;
- (id)fullOutputWithThreshold:(unsigned int)a3;
- (id)fullOutputWithThreshold:(unsigned int)a3 showPseudoNodes:(BOOL)a4;
- (id)invertedNode;
- (id)largestTopOfStackPath;
- (id)name;
- (id)nameWithStringsForSymbol:(id)a3 library:(id)a4 loadAddress:(id)a5 offset:(id)a6 address:(id)a7 suffix:(id)a8;
- (id)nameWithoutOffset;
- (id)parent;
- (id)pruneCount:(unsigned int)a3;
- (id)pruneMallocSize:(unint64_t)a3;
- (id)pseudoName;
- (id)pseudoNodeTopOfStackChild;
- (id)sortedChildrenWithPseudoNode;
- (id)sortedChildrenWithPseudoNode:(id)a3 withCompare:(SEL)a4;
- (id)stringFromCallTreeIndentIfNoBranches:(BOOL)a3;
- (id)stringFromCallTreeIndentIfNoBranches:(BOOL)a3 showPseudoNodes:(BOOL)a4;
- (id)stringFromCallTreeWithOptions:(unint64_t)a3;
- (int64_t)compare:(id)a3;
- (int64_t)comparePuttingMainThreadFirst:(id)a3;
- (int64_t)comparePuttingRetainCycleNodesAtTop:(id)a3;
- (int64_t)compareSizeAndCount:(id)a3;
- (unint64_t)address;
- (unint64_t)numBytes;
- (unsigned)count;
- (unsigned)numChildren;
- (unsigned)sumOfChildCounts;
- (void)_printCallTreeToFile:(__sFILE *)a3 cumulativeOutput:(id)a4 indentString:(id)a5 branchPointCount:(unsigned int)a6 topFunctions:(id)a7 options:(unint64_t)a8;
- (void)addChild:(id)a3;
- (void)countFunctionOccurrencesInTree:(id)a3;
- (void)dealloc;
- (void)getBrowserName:(id)a3;
- (void)parseNameIntoSymbol:(id *)a3 library:(id *)a4 loadAddress:(unint64_t *)a5 offset:(unint64_t *)a6 address:(unint64_t *)a7 suffix:(id *)a8;
- (void)printCallTree;
- (void)printCallTreeToFile:(__sFILE *)a3;
- (void)printCallTreeToFile:(__sFILE *)a3 cumulativeOutput:(id)a4 options:(unint64_t)a5;
- (void)setChildren:(id)a3;
@end

@implementation VMUCallTreeNode

+ (id)rootForSamples:(id)a3 symbolicator:(_CSTypeRef)a4 sampler:(id)a5 options:(unint64_t)a6
{
  unint64_t opaque_2 = a4._opaque_2;
  unint64_t opaque_1 = a4._opaque_1;
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a5;
  v12 = -[VMUCallTreeRoot initWithSymbolicator:sampler:options:]( objc_alloc(&OBJC_CLASS___VMUCallTreeRoot),  "initWithSymbolicator:sampler:options:",  opaque_1,  opaque_2,  v11,  a6);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      uint64_t v17 = 0LL;
      do
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 =  -[VMUCallTreeRoot addBacktrace:]( v12,  "addBacktrace:",  *(void *)(*((void *)&v20 + 1) + 8 * v17++),  (void)v20);
      }

      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v15);
  }

  return v12;
}

+ (id)rootForSamples:(id)a3 symbolicator:(_CSTypeRef)a4
{
  return [a1 rootForSamples:a3 symbolicator:a4._opaque_1 sampler:a4._opaque_2 options:0, 0];
}

+ (id)nodeWithName:(id)a3 address:(unint64_t)a4 count:(unsigned int)a5 numBytes:(unint64_t)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithName:v10 address:a4 count:v7 numBytes:a6];

  return v11;
}

- (VMUCallTreeNode)initWithName:(id)a3 address:(unint64_t)a4 count:(unsigned int)a5 numBytes:(unint64_t)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___VMUCallTreeNode;
  v12 = -[VMUCallTreeNode init](&v15, sel_init);
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    v13->_count = a5;
    v13->_address = a4;
    v13->_numBytes = a6;
  }

  return v13;
}

- (unsigned)numChildren
{
  return self->_numChildren;
}

- (id)childAtIndex:(unsigned int)a3
{
  p_children = &self->_children;
  if (self->_numChildren != 1) {
    p_children = (void **)((char *)*p_children + 8 * a3);
  }
  return *p_children;
}

- (id)allChildren
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[VMUCallTreeNode numChildren](self, "numChildren"))
  {
    uint64_t v4 = 0LL;
    do
    {
      v5 = -[VMUCallTreeNode childAtIndex:](self, "childAtIndex:", v4);
      [v3 addObject:v5];

      uint64_t v4 = (v4 + 1);
    }

    while (v4 < -[VMUCallTreeNode numChildren](self, "numChildren"));
  }

  return v3;
}

- (void)setChildren:(id)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  unsigned int numChildren = self->_numChildren;
  p_children = &self->_children;
  if (numChildren >= 2)
  {
    uint64_t v7 = (void **)*p_children;
  }

  else
  {
    uint64_t v7 = &self->_children;
    if (!numChildren) {
      goto LABEL_9;
    }
  }

  unsigned int v8 = numChildren - 1;
  do
  {
    uint64_t v9 = v8;
    id v10 = v7[v8];
    v7[v8] = 0LL;

    --v8;
  }

  while (v9);
  if (self->_numChildren >= 2) {
    free(v7);
  }
LABEL_9:
  unsigned int v11 = [v4 count];
  self->_unsigned int numChildren = v11;
  if (v11 >= 2)
  {
    v12 = calloc(v11, 8uLL);
    *p_children = v12;
    p_children = (void **)v12;
  }

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v13 = v4;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    int v16 = 0;
    uint64_t v17 = *(void *)v21;
    do
    {
      for (uint64_t i = 0LL; i != v15; ++i)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v13);
        }
        v19 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_storeStrong(&p_children[(v16 + i)], v19);
        v19[1] = self;
      }

      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
      v16 += i;
    }

    while (v15);
  }
}

- (void)addChild:(id)a3
{
  v5 = a3;
  if (v5)
  {
    unsigned int numChildren = self->_numChildren;
    int v16 = v5;
    if (numChildren == 1)
    {
      children = self->_children;
      id v10 = (void **)calloc(2uLL, 8uLL);
      self->_children = v10;
      unsigned int v11 = *v10;
      *id v10 = children;
      v12 = v10 + 1;
      id v8 = children;

      objc_storeStrong(v12, a3);
    }

    else if (numChildren)
    {
      id v13 = realloc(self->_children, 8LL * (numChildren + 1));
      self->_children = v13;
      uint64_t v14 = self->_numChildren;
      *((void *)v13 + v14) = 0LL;
      uint64_t v15 = v16;
      id v8 = (id)*((void *)v13 + v14);
      *((void *)v13 + v14) = v15;
    }

    else
    {
      uint64_t v7 = v5;
      id v8 = self->_children;
      self->_children = v7;
    }

    ++self->_numChildren;
    v5 = v16;
    v16[1] = self;
  }
}

- (unsigned)sumOfChildCounts
{
  if (!-[VMUCallTreeNode numChildren](self, "numChildren")) {
    return 0;
  }
  uint64_t v3 = 0LL;
  unsigned int v4 = 0;
  do
  {
    v5 = -[VMUCallTreeNode childAtIndex:](self, "childAtIndex:", v3);
    v4 += [v5 count];

    uint64_t v3 = (v3 + 1);
  }

  while (v3 < -[VMUCallTreeNode numChildren](self, "numChildren"));
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VMUCallTreeNode;
  -[VMUCallTreeNode dealloc](&v3, sel_dealloc);
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___VMUCallTreeNode;
  -[VMUCallTreeNode description](&v7, sel_description);
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMUCallTreeNode browserName](self, "browserName");
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringByAppendingFormat:@"  %@", v4];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)makeFakeRootForNode:(id)a3
{
  id v3 = a3;
  +[VMUCallTreeNode nodeWithName:address:count:numBytes:]( VMUCallTreeNode,  "nodeWithName:address:count:numBytes:",  0,  0,  [v3 count],  [v3 numBytes]);
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603F18] arrayWithObject:v3];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  [v4 setChildren:v5];
  return v4;
}

- (id)parent
{
  return self->_parent;
}

- (unint64_t)address
{
  return self->_address;
}

- (unsigned)count
{
  return self->_count;
}

- (unint64_t)numBytes
{
  return self->_numBytes;
}

- (id)name
{
  return self->_name;
}

- (void)getBrowserName:(id)a3
{
  id v11 = a3;
  [v11 setString:&stru_189E010C8];
  unint64_t numBytes = self->_numBytes;
  if (numBytes)
  {
    float v5 = (float)numBytes;
    if (numBytes < 0x100000)
    {
      if (numBytes < 0x400)
      {
        [v11 appendFormat:@"%u (%qu bytes) %@", self->_count, self->_numBytes, self->_name];
      }

      else
      {
        float v7 = v5 * 0.00097656;
        if ((float)(v5 * 0.00097656) >= 10.0)
        {
          uint64_t count = self->_count;
          if (v7 >= 100.0) {
            [v11 appendFormat:@"%u (%.0fK) %@", count, v7, self->_name];
          }
          else {
            [v11 appendFormat:@"%u (%.1fK) %@", count, v7, self->_name];
          }
        }

        else
        {
          [v11 appendFormat:@"%u (%.2fK) %@", self->_count, v7, self->_name];
        }
      }
    }

    else
    {
      float v6 = v5 * 0.00000095367;
      if ((float)(v5 * 0.00000095367) >= 10.0)
      {
        uint64_t v8 = self->_count;
        if (v6 >= 100.0) {
          [v11 appendFormat:@"%u (%.0fM) %@", v8, v6, self->_name];
        }
        else {
          [v11 appendFormat:@"%u (%.1fM) %@", v8, v6, self->_name];
        }
      }

      else
      {
        [v11 appendFormat:@"%u (%.2fM) %@", self->_count, v6, self->_name];
      }
    }
  }

  else
  {
    [v11 appendFormat:@"%d %@", self->_count, self->_name, v10];
  }
}

- (id)browserName
{
  id v3 = (void *)objc_opt_new();
  -[VMUCallTreeNode getBrowserName:](self, "getBrowserName:", v3);
  return v3;
}

- (BOOL)isPseudo
{
  return 0;
}

- (id)pseudoName
{
  return self->_name;
}

- (BOOL)symbolNameIsUnknown
{
  return -[NSString hasPrefix:](self->_name, "hasPrefix:", kVMUUnknownSymbolName[0]);
}

- (BOOL)isMallocBlockContentNode
{
  return !self->_address && -[NSString hasPrefix:](self->_name, "hasPrefix:", @"CONTENT:");
}

- (id)nameWithoutOffset
{
  uint64_t v3 = -[NSString rangeOfString:](self->_name, "rangeOfString:", @" + ");
  name = self->_name;
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    float v5 = name;
  }

  else
  {
    -[NSString substringToIndex:](name, "substringToIndex:");
    float v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)nameWithStringsForSymbol:(id)a3 library:(id)a4 loadAddress:(id)a5 offset:(id)a6 address:(id)a7 suffix:(id)a8
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  [MEMORY[0x189607940] stringWithString:a3];
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v13) {
    [v18 appendFormat:@"%@%@%@", @"  (in "), v13, @""];
  }
  if (v14) {
    [v19 appendFormat:@"%@%@", @"  load address ", v14];
  }
  if (v15) {
    [v19 appendFormat:@"%@%@", @" + ", v15];
  }
  if (v16) {
    [v19 appendFormat:@"%@%@%@", @"  [", v16, @"]"];
  }
  if (v17) {
    [v19 appendString:v17];
  }

  return v19;
}

- (void)parseNameIntoSymbol:(id *)a3 library:(id *)a4 loadAddress:(unint64_t *)a5 offset:(unint64_t *)a6 address:(unint64_t *)a7 suffix:(id *)a8
{
  if (a3) {
    *a3 = 0LL;
  }
  if (a4) {
    *a4 = 0LL;
  }
  if (a5) {
    *a5 = 0LL;
  }
  if (a6) {
    *a6 = 0LL;
  }
  if (a7) {
    *a7 = 0LL;
  }
  if (a8) {
    *a8 = 0LL;
  }
  id v16 = (id)[objc_alloc(MEMORY[0x189607A08]) initWithString:self->_name];
  [v16 setCharactersToBeSkipped:0];
  [v16 scanUpToString:@"  (in " intoString:a3];
  [v16 scanString:@"  (in " intoString:0];
  [v16 scanUpToString:@"" intoString:a4];
  [v16 scanString:@"" inToString:0];
  if ([v16 scanString:@" + " intoString:0]
    && ([v16 scanHexLongLong:a6] & 1) == 0)
  {
    [v16 scanLongLong:a6];
  }

  if ([v16 scanString:@"  [" intoString:0])
  {
    [v16 scanHexLongLong:a7];
    [v16 scanString:@"]" intoString:0];
  }

  id v14 = v16;
  if (a8)
  {
    [v16 string];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 substringFromIndex:[v16 scanLocation]];
    *a8 = (id)objc_claimAutoreleasedReturnValue();

    id v14 = v16;
  }
}

- (id)findOrAddChildWithName:(id)a3 address:(unint64_t)a4 nodeSearchType:(int)a5 isLeafNode:(BOOL)a6
{
  id v9 = a3;
  uint64_t v10 = v9;
  uint64_t numChildren = self->_numChildren;
  p_children = &self->_children;
  if (a5 == 2)
  {
    if ((_DWORD)numChildren)
    {
      uint64_t v13 = 0LL;
      while (![*((id *)p_children[v13] + 2) isEqualToString:v10])
      {
      }

      id v15 = p_children[v13];
      goto LABEL_16;
    }
  }

  else if (a5 == 1 && (_DWORD)numChildren)
  {
    while (*((id *)*p_children + 2) != v9)
    {
      ++p_children;
      if (!--numChildren) {
        goto LABEL_13;
      }
    }

    id v15 = *p_children;
LABEL_16:
    id v14 = v15;
    goto LABEL_17;
  }

- (id)findOrAddChildWithName:(id)a3 address:(unint64_t)a4
{
  return -[VMUCallTreeNode findOrAddChildWithName:address:nodeSearchType:isLeafNode:]( self,  "findOrAddChildWithName:address:nodeSearchType:isLeafNode:",  a3,  a4,  2LL,  0LL);
}

- (int64_t)compareSizeAndCount:(id)a3
{
  int64_t v3 = *((void *)a3 + 4) - self->_numBytes;
  if (!v3) {
    int64_t v3 = *((unsigned int *)a3 + 10) - (unint64_t)self->_count;
  }
  BOOL v4 = v3 < 0;
  int64_t v5 = v3 != 0;
  if (v4) {
    return -1LL;
  }
  else {
    return v5;
  }
}

- (int64_t)compare:(id)a3
{
  BOOL v4 = a3;
  NSComparisonResult v5 = -[VMUCallTreeNode compareSizeAndCount:](self, "compareSizeAndCount:", v4);
  if (v5 == NSOrderedSame)
  {
    if (self->_address && -[NSString containsString:](self->_name, "containsString:", @"  (in "))
    {
      float v6 = (void *)MEMORY[0x186E32E40]();
      id v20 = 0LL;
      id v21 = 0LL;
      id v19 = 0LL;
      -[VMUCallTreeNode parseNameIntoSymbol:library:loadAddress:offset:address:suffix:]( self,  "parseNameIntoSymbol:library:loadAddress:offset:address:suffix:",  &v21,  &v20,  0LL,  0LL,  0LL,  &v19);
      id v7 = v21;
      id v8 = v20;
      id v9 = v19;
      id v17 = 0LL;
      id v18 = 0LL;
      id v16 = 0LL;
      [v4 parseNameIntoSymbol:&v18 library:&v17 loadAddress:0 offset:0 address:0 suffix:&v16];
      id v10 = v18;
      id v11 = v17;
      id v12 = v16;
      if (v7)
      {
        if (v10)
        {
          NSComparisonResult v5 = [v7 compare:v10];
          if (v5) {
            goto LABEL_22;
          }
        }
      }

      if (v8)
      {
        if (v11)
        {
          NSComparisonResult v5 = [v8 compare:v11];
          if (v5) {
            goto LABEL_22;
          }
        }
      }

      if (v9)
      {
        if (v12)
        {
          NSComparisonResult v5 = [v9 compare:v12];
          if (v5) {
            goto LABEL_22;
          }
        }
      }

      if (!-[VMUCallTreeNode numChildren](self, "numChildren") && [v4 numChildren])
      {
        NSComparisonResult v5 = NSOrderedDescending;
        goto LABEL_22;
      }

      unint64_t address = self->_address;
      unint64_t v14 = v4[3];
      if (address >= v14) {
        NSComparisonResult v5 = (unint64_t)(address > v14);
      }
      else {
LABEL_17:
      }
        NSComparisonResult v5 = NSOrderedAscending;
LABEL_22:

      objc_autoreleasePoolPop(v6);
      goto LABEL_23;
    }

    NSComparisonResult v5 = -[NSString compare:](self->_name, "compare:", v4[2]);
  }

- (int64_t)comparePuttingRetainCycleNodesAtTop:(id)a3
{
  BOOL v4 = (id *)a3;
  -[VMUCallTreeNode parent](self, "parent");
  NSComparisonResult v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 parent];
  float v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
  }

  else
  {
    [v4 parent];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 parent];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8) {
      goto LABEL_12;
    }
  }

  id v9 = v4[4];
  if (!self->_numBytes)
  {
    if (!v9) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }

  if (v9)
  {
    BOOL v10 = -[NSString containsString:](self->_name, "containsString:", kVMURootRetainCycle[0]);
    int v11 = [v4[2] containsString:kVMURootRetainCycle[0]];
    if (!v10 || v11)
    {
      if ((v10 | v11 ^ 1) != 1) {
        goto LABEL_9;
      }
LABEL_12:
      int64_t v12 = -[VMUCallTreeNode compare:](self, "compare:", v4);
      goto LABEL_13;
    }

- (int64_t)comparePuttingMainThreadFirst:(id)a3
{
  BOOL v4 = (id *)a3;
  -[VMUCallTreeNode name](self, "name");
  NSComparisonResult v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 name];
  float v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v5 hasPrefix:kVMUThreadNamePrefix]
    && (([v5 rangeOfString:kVMUMainThreadName[0]], v7)
     || ([v5 rangeOfString:kVMUMainThreadDispatchQueueName], v8)))
  {
    int64_t v9 = -1LL;
  }

  else if ([v6 hasPrefix:kVMUThreadNamePrefix] {
         && (([v6 rangeOfString:kVMUMainThreadName[0]], v10)
  }
          || ([v6 rangeOfString:kVMUMainThreadDispatchQueueName], v11)))
  {
    int64_t v9 = 1LL;
  }

  else
  {
    int64_t v9 = -[VMUCallTreeNode compareSizeAndCount:](self, "compareSizeAndCount:", v4);
    if (!v9)
    {
      unint64_t v12 = [(id)kVMUThreadNamePrefix length];
      if (-[NSString length](self->_name, "length") <= v12)
      {
        unint64_t v14 = 0LL;
      }

      else
      {
        -[NSString substringFromIndex:](self->_name, "substringFromIndex:", v12);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        unint64_t v14 = [v13 longLongValue];
      }

      if ([v4[2] length] <= v12)
      {
        unint64_t v16 = 0LL;
      }

      else
      {
        [v4[2] substringFromIndex:v12];
        id v15 = (void *)objc_claimAutoreleasedReturnValue();
        unint64_t v16 = [v15 longLongValue];
      }

      if (v14 < v16) {
        int64_t v9 = -1LL;
      }
      else {
        int64_t v9 = 1LL;
      }
    }
  }

  return v9;
}

- (id)pseudoNodeTopOfStackChild
{
  unsigned int v3 = -[VMUCallTreeNode numChildren](self, "numChildren");
  if (v3)
  {
    unsigned int v4 = v3;
    int v5 = 0;
    uint64_t v6 = 0LL;
    uint64_t v7 = 0LL;
    do
    {
      uint64_t v8 = -[VMUCallTreeNode childAtIndex:](self, "childAtIndex:", v7);
      v5 += *(_DWORD *)(v8 + 40);
      v6 += *(void *)(v8 + 32);

      uint64_t v7 = (v7 + 1);
    }

    while (v4 != (_DWORD)v7);
  }

  else
  {
    uint64_t v6 = 0LL;
    int v5 = 0;
  }

  unsigned int count = self->_count;
  uint64_t v10 = count - v5;
  if (count == v5)
  {
    uint64_t v11 = 0LL;
  }

  else
  {
    uint64_t v12 = self->_numBytes - v6;
    -[VMUCallTreeNode pseudoName](self, "pseudoName");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[VMUCallTreeNode nodeWithName:address:count:numBytes:]( &OBJC_CLASS___VMUCallTreePseudoNode,  "nodeWithName:address:count:numBytes:",  v13,  self->_address,  v10,  v12);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)sortedChildrenWithPseudoNode:(id)a3 withCompare:(SEL)a4
{
  v15[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  unsigned int numChildren = self->_numChildren;
  if (!v6)
  {
    if (numChildren == 1)
    {
      v15[0] = self->_children;
      uint64_t v12 = [MEMORY[0x189603F18] arrayWithObjects:v15 count:1];
    }

    else
    {
      if (numChildren)
      {
        [MEMORY[0x189603F18] arrayWithObjects:self->_children];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 sortedArrayUsingSelector:a4];
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_14;
      }

      uint64_t v12 = [MEMORY[0x189603F18] array];
    }

    goto LABEL_12;
  }

  if (!numChildren)
  {
    uint64_t v12 = [MEMORY[0x189603F18] arrayWithObject:v6];
LABEL_12:
    uint64_t v11 = (void *)v12;
    goto LABEL_14;
  }

  [MEMORY[0x189603FA8] arrayWithObject:v6];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_numChildren)
  {
    uint64_t v9 = 0LL;
    do
    {
      -[VMUCallTreeNode childAtIndex:](self, "childAtIndex:", v9);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 addObject:v10];

      uint64_t v9 = (v9 + 1);
    }

    while (v9 < self->_numChildren);
  }

  [v8 sortedArrayUsingSelector:a4];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v11;
}

- (id)sortedChildrenWithPseudoNode
{
  unsigned int numChildren = self->_numChildren;
  if (numChildren == 1)
  {
    int v5 = self->_children;
    id v6 = v5;
    if (v5 && v5[10] == self->_count)
    {
      [MEMORY[0x189603F18] arrayWithObject:v5];
      unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

      return v4;
    }

- (id)largestTopOfStackPath
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FA8] arrayWithObject:self];
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v18 = self;
  -[VMUCallTreeNode sortedChildrenWithPseudoNode](self, "sortedChildrenWithPseudoNode");
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unsigned int v7 = 0;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        [v10 largestTopOfStackPath];
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v11 count])
        {
          [v11 lastObject];
          id v12 = (id)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          id v12 = v10;
        }

        uint64_t v13 = v12;
        unsigned int v14 = [v12 count];
        if (v14 > v7)
        {
          unsigned int v15 = v14;
          [MEMORY[0x189603FA8] arrayWithCapacity:[v11 count] + 1];
          unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

          [v16 addObject:v18];
          [v16 addObjectsFromArray:v11];
          unsigned int v7 = v15;
          unsigned int v3 = v16;
        }
      }

      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v6);
  }

  return v3;
}

- (void)_printCallTreeToFile:(__sFILE *)a3 cumulativeOutput:(id)a4 indentString:(id)a5 branchPointCount:(unsigned int)a6 topFunctions:(id)a7 options:(unint64_t)a8
{
  id v51 = a4;
  id v12 = a5;
  uint64_t v13 = (NSMapTable *)a7;
  unsigned int v14 = (void *)MEMORY[0x186E32E40]();
  table = v13;
  if (v13 || (a8 & 1) != 0)
  {
    -[VMUCallTreeNode pseudoNodeTopOfStackChild](self, "pseudoNodeTopOfStackChild");
    unint64_t v16 = (id *)objc_claimAutoreleasedReturnValue();
    unsigned int v15 = v16;
    if (v16)
    {
      if (v13)
      {
        if ([v16 symbolNameIsUnknown])
        {
          id v17 = v15[2];
        }

        else
        {
          [v15 nameWithoutOffset];
          id v17 = (id)objc_claimAutoreleasedReturnValue();
        }

        id v18 = v17;
        __int128 v19 = NSMapGet(table, v17);
        if (!v19)
        {
          __int128 v19 = malloc(0x10uLL);
          void *v19 = 0LL;
          v19[1] = 0LL;
          NSMapInsertKnownAbsent(table, v18, v19);
        }

        uint64_t v20 = (uint64_t)v15[4] + v19[1];
        *v19 += *((unsigned int *)v15 + 10);
        v19[1] = v20;
      }

      if (!-[VMUCallTreeNode numChildren](self, "numChildren")) {
        goto LABEL_76;
      }
    }
  }

  else
  {
    unsigned int v15 = 0LL;
  }

  __int128 v21 = sel_compare_;
  if ((a8 & 0x80) == 0)
  {
    if ((a8 & 0x40) != 0)
    {
      __int128 v21 = sel_comparePuttingRetainCycleNodesAtTop_;
    }

    else if (!self->_parent {
           || !self->_numChildren && -[NSString hasPrefix:](self->_name, "hasPrefix:", kVMUThreadNamePrefix))
    }
    {
      __int128 v21 = sel_comparePuttingMainThreadFirst_;
    }
  }

  if ((a8 & 1) == 0)
  {

    unsigned int v15 = 0LL;
  }
  v45 = -[VMUCallTreeNode sortedChildrenWithPseudoNode:withCompare:]( self,  "sortedChildrenWithPseudoNode:withCompare:",  v15,  v21);
  unint64_t v22 = [v45 count];
  v50 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:1024];
  if (v22 <= 1) {
    unsigned int v23 = a6;
  }
  else {
    unsigned int v23 = a6 + 1;
  }
  unsigned int v44 = v23;
  -[VMUCallTreeNode parent](self, "parent");
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  v42 = v14;
  if (v24)
  {
    uint64_t v25 = self;
  }

  else
  {
    uint64_t v25 = self;
    if (-[VMUCallTreeNode numBytes](self, "numBytes"))
    {
      if (-[VMUCallTreeNode numChildren](self, "numChildren") < 2) {
        goto LABEL_28;
      }
      if (v51) {
        id v40 = v51;
      }
      else {
        id v40 = (id)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:256];
      }
      id v24 = v40;
      if (v12) {
        [v40 appendString:v12];
      }
      -[VMUCallTreeNode getBrowserName:](self, "getBrowserName:", v50);
      [v24 appendFormat:@"%@%@\n", v50, kVMURootNodeNameForMallocCallTrees[0]];
      [v12 appendString:@"  "];
      if (!v51)
      {
        id v24 = v24;
        fputs((const char *)[v24 UTF8String], a3);
      }
    }
  }

LABEL_28:
  v41 = v15;
  if ((a8 & 8) != 0) {
    v26 = "   ";
  }
  else {
    v26 = "  ";
  }
  v27 = v50;
  if (v22)
  {
    unint64_t v28 = 0LL;
    BOOL v48 = 0;
    uint64_t v29 = 2LL;
    if ((a8 & 8) != 0) {
      uint64_t v29 = 3LL;
    }
    uint64_t v43 = v29;
    do
    {
      [v45 objectAtIndex:v28];
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)MEMORY[0x186E32E40]();
      if (v51) {
        id v32 = v51;
      }
      else {
        id v32 = (id)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:256];
      }
      v33 = v32;
      v34 = -[VMUCallTreeNode parent](v25, "parent");
      if (v34 || -[VMUCallTreeNode numChildren](v25, "numChildren") < 2)
      {
      }

      else if ([v30 numChildren] != 0 || v48)
      {
        if ((a8 & 2) != 0)
        {
          [v33 appendString:@"\n"];
        }

        else if ((a8 & 4) != 0)
        {
          [v33 appendFormat:@"%@----\n", v12];
        }
      }

      BOOL v48 = [v30 numChildren] != 0;
      if (v12) {
        [v33 appendString:v12];
      }
      uint64_t v35 = -[VMUCallTreeNode parent](v25, "parent");
      v36 = (void *)v35;
      if (v28 == 10 && v35 && v22 >= 0xC && [v30 numChildren] <= 1)
      {
        char v37 = [v30 isMallocBlockContentNode];

        if ((v37 & 1) != 0)
        {
          [v33 appendFormat:@"%lu ADDITIONAL CHILDREN\n", v22 - 10];

          objc_autoreleasePoolPop(v31);
          v27 = v50;
          break;
        }
      }

      else
      {
      }

      v27 = v50;
      if ((a8 & 0x40) != 0 && ![v30 count])
      {
        [v30 name];
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        [v50 setString:v39];

        v27 = v50;
      }

      else
      {
        [v30 getBrowserName:v50];
      }

      uint64_t v25 = self;
      [v33 appendFormat:@"%@\n", v27];
      if (v12)
      {
        v38 = (char *)v26;
        if ((a8 & 8) == 0)
        {
          v38 = (char *)v26;
          if (v22 >= 2)
          {
            v38 = (char *)v26;
            if (v28 < v22 - 1) {
              v38 = off_189DFE500[v44 & 3];
            }
          }
        }

        [v12 appendFormat:@"%s", v38];
      }

      if (!v51) {
        fputs((const char *)[v33 UTF8String], a3);
      }

      objc_autoreleasePoolPop(v31);
      [v30 _printCallTreeToFile:a3 cumulativeOutput:v51 indentString:v12 branchPointCount:v44 topFunctions:table options:a8];
      if (v12) {
        [v12 deleteCharactersInRange:[v12 length] - v43];
      }

      ++v28;
    }

    while (v22 != v28);
  }

  unsigned int v15 = v41;
  unsigned int v14 = v42;
LABEL_76:

  objc_autoreleasePoolPop(v14);
}

- (void)countFunctionOccurrencesInTree:(id)a3
{
  id v8 = a3;
  [v8 addObject:self->_name];
  unsigned int v4 = -[VMUCallTreeNode numChildren](self, "numChildren");
  if (v4)
  {
    unsigned int v5 = v4;
    uint64_t v6 = 0LL;
    do
    {
      -[VMUCallTreeNode childAtIndex:](self, "childAtIndex:", v6);
      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 countFunctionOccurrencesInTree:v8];

      uint64_t v6 = (v6 + 1);
    }

    while (v5 != (_DWORD)v6);
  }
}

- (id)fullOutputWithThreshold:(unsigned int)a3 showPseudoNodes:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v49 = *MEMORY[0x1895F89C0];
  unsigned int v7 = (void *)objc_opt_new();
  uint64_t v8 = [MEMORY[0x189607920] mapTableWithKeyOptions:0 valueOptions:259];
  [v7 appendString:@"Call graph:\n"];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:128];
  [v9 setString:kVMUCallTreeInitialIndentation];
  char v37 = (void *)v8;
  v38 = v9;
  -[VMUCallTreeNode _printCallTreeToFile:cumulativeOutput:indentString:branchPointCount:topFunctions:options:]( self,  "_printCallTreeToFile:cumulativeOutput:indentString:branchPointCount:topFunctions:options:",  0LL,  v7,  v9,  0LL,  v8,  v4);
  [v7 appendString:@"\n"];
  [v7 appendFormat:@"Total number in stack (recursive counted multiple, when >=%d):\n", v5];
  id v10 = v7;
  uint64_t v11 = self;
  context = (void *)MEMORY[0x186E32E40]();
  id v12 = objc_alloc_init(MEMORY[0x189607838]);
  -[VMUCallTreeNode countFunctionOccurrencesInTree:](v11, "countFunctionOccurrencesInTree:", v12);
  [v12 allObjects];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v43 = MEMORY[0x1895F87A8];
  uint64_t v44 = 3221225472LL;
  v45 = __printTotalNumberInStack_block_invoke;
  v46 = &unk_189DFE528;
  unsigned int v14 = (NSMapTable *)v12;
  v47 = v14;
  [v13 sortedArrayUsingComparator:&v43];
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v16 = v15;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v40;
    do
    {
      for (uint64_t i = 0LL; i != v18; ++i)
      {
        if (*(void *)v40 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        unint64_t v22 = -[NSMapTable countForObject:](v14, "countForObject:", v21);
      }

      uint64_t v18 = [v16 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }

    while (v18);
  }

  [v10 appendFormat:@"\n"];
  objc_autoreleasePoolPop(context);

  [v10 appendString:@"Sort by top of stack, same collapsed (when >= 5):\n"];
  id v23 = v10;
  id v24 = v37;
  NSAllMapTableKeys(v24);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v43 = MEMORY[0x1895F87A8];
  uint64_t v44 = 3221225472LL;
  v45 = __printCollapsedTops_block_invoke;
  v46 = &unk_189DFE528;
  v26 = v24;
  v47 = v26;
  [v25 sortedArrayUsingComparator:&v43];
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v28 = v27;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v40;
    do
    {
      for (uint64_t j = 0LL; j != v30; ++j)
      {
        if (*(void *)v40 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = *(const void **)(*((void *)&v39 + 1) + 8 * j);
        unint64_t v34 = *(void *)NSMapGet(v26, v33);
        if (v34 >= 5) {
          [v23 appendFormat:@"        %@        %lu\n", v33, v34];
        }
      }

      uint64_t v30 = [v28 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }

    while (v30);
  }

  return v23;
}

- (id)fullOutputWithThreshold:(unsigned int)a3
{
  return -[VMUCallTreeNode fullOutputWithThreshold:showPseudoNodes:]( self,  "fullOutputWithThreshold:showPseudoNodes:",  *(void *)&a3,  1LL);
}

- (BOOL)callTreeHasBranches
{
  v2 = self;
  if (!v2) {
    return 0;
  }
  p_isa = (id *)&v2->super.isa;
  do
  {
    unsigned int v4 = [p_isa numChildren];
    if (v4 != 1) {
      break;
    }
    uint64_t v5 = (id *)p_isa[6];

    p_isa = v5;
  }

  while (v5);
  BOOL v6 = v4 > 1;

  return v6;
}

- (id)stringFromCallTreeWithOptions:(unint64_t)a3
{
  uint64_t v5 = (void *)objc_opt_new();
  if ((a3 & 0x10) != 0 || -[VMUCallTreeNode callTreeHasBranches](self, "callTreeHasBranches"))
  {
    BOOL v6 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:128];
    unsigned int v7 = v6;
    if ((a3 & 0x20) == 0) {
      [v6 setString:kVMUCallTreeInitialIndentation];
    }
  }

  else
  {
    unsigned int v7 = 0LL;
  }

  -[VMUCallTreeNode _printCallTreeToFile:cumulativeOutput:indentString:branchPointCount:topFunctions:options:]( self,  "_printCallTreeToFile:cumulativeOutput:indentString:branchPointCount:topFunctions:options:",  0LL,  v5,  v7,  0LL,  0LL,  a3);

  return v5;
}

- (id)stringFromCallTreeIndentIfNoBranches:(BOOL)a3 showPseudoNodes:(BOOL)a4
{
  uint64_t v4 = 16LL;
  if (!a3) {
    uint64_t v4 = 0LL;
  }
  return -[VMUCallTreeNode stringFromCallTreeWithOptions:](self, "stringFromCallTreeWithOptions:", v4 | a4);
}

- (id)stringFromCallTreeIndentIfNoBranches:(BOOL)a3
{
  return -[VMUCallTreeNode stringFromCallTreeIndentIfNoBranches:showPseudoNodes:]( self,  "stringFromCallTreeIndentIfNoBranches:showPseudoNodes:",  a3,  1LL);
}

- (void)printCallTreeToFile:(__sFILE *)a3 cumulativeOutput:(id)a4 options:(unint64_t)a5
{
  uint64_t v8 = (objc_class *)MEMORY[0x189607940];
  id v9 = a4;
  id v10 = (id)[[v8 alloc] initWithCapacity:128];
  [v10 setString:kVMUCallTreeInitialIndentation];
  -[VMUCallTreeNode _printCallTreeToFile:cumulativeOutput:indentString:branchPointCount:topFunctions:options:]( self,  "_printCallTreeToFile:cumulativeOutput:indentString:branchPointCount:topFunctions:options:",  a3,  v9,  v10,  0LL,  0LL,  a5);
}

- (void)printCallTreeToFile:(__sFILE *)a3
{
}

- (void)printCallTree
{
}

- (id)invertedNode
{
  unsigned int v3 = objc_alloc_init(&OBJC_CLASS___VMUCallTreeNode);
  name = v3->_name;
  v3->_name = (NSString *)&stru_189E010C8;

  uint64_t v5 = (void *)MEMORY[0x186E32E40]();
  [MEMORY[0x189603FA8] array];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v7 = -[VMUCallTreeNode numChildren](self, "numChildren");
  if (v7)
  {
    unsigned int v8 = v7;
    uint64_t v9 = 0LL;
    do
    {
      -[VMUCallTreeNode childAtIndex:](self, "childAtIndex:", v9);
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      invertRecursiveWithNewInvertedRoot(v10, v3, v6);

      uint64_t v9 = (v9 + 1);
    }

    while (v8 != (_DWORD)v9);
  }

  objc_autoreleasePoolPop(v5);
  return v3;
}

- (id)filterOutSymbols:(id)a3 required:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[NSString length](self->_name, "length") && ([v6 containsObject:self->_name] & 1) != 0)
  {
    unsigned int v8 = 0LL;
  }

  else
  {
    id v26 = 0LL;
    -[VMUCallTreeNode parseNameIntoSymbol:library:loadAddress:offset:address:suffix:]( self,  "parseNameIntoSymbol:library:loadAddress:offset:address:suffix:",  &v26,  0LL,  0LL,  0LL,  0LL,  0LL);
    id v9 = v26;
    if ([v9 length] && (objc_msgSend(v6, "containsObject:", v9) & 1) != 0)
    {
      unsigned int v8 = 0LL;
    }

    else
    {
      if (v7 && [v7 containsObject:v9])
      {

        id v7 = 0LL;
      }

      unsigned int v10 = -[VMUCallTreeNode numChildren](self, "numChildren");
      if (v10)
      {
        unsigned int v11 = v10;
        uint64_t v12 = 0LL;
        int v13 = 0;
        do
        {
          -[VMUCallTreeNode childAtIndex:](self, "childAtIndex:", v12);
          unsigned int v14 = (_DWORD *)objc_claimAutoreleasedReturnValue();
          v13 += v14[10];

          uint64_t v12 = (v12 + 1);
        }

        while (v11 != (_DWORD)v12);
        id v25 = v9;
        if (v13 == self->_count
          || (-[VMUCallTreeNode pseudoName](self, "pseudoName"),
              unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(),
              char v16 = [v6 containsObject:v15],
              v15,
              (v16 & 1) != 0))
        {
          uint64_t v17 = 0LL;
        }

        else
        {
          uint64_t v17 = self->_count - v13;
        }

        uint64_t v18 = 0LL;
        id v19 = 0LL;
        uint64_t v20 = 0LL;
        if (v11 <= 1) {
          int v21 = 1;
        }
        else {
          int v21 = v11;
        }
        do
        {
          -[VMUCallTreeNode childAtIndex:](self, "childAtIndex:", v18, v25);
          unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
          [v22 filterOutSymbols:v6 required:v7];
          id v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            if (!v19) {
              id v19 = objc_alloc_init(MEMORY[0x189603FA8]);
            }
            [v19 addObject:v23];
            uint64_t v17 = [v23 count] + v17;
            v20 += v23[4];
          }

          uint64_t v18 = (v18 + 1);
        }

        while (v21 != (_DWORD)v18);
        if (!-[NSString length](self->_name, "length") || (_DWORD)v17)
        {
          [(id)objc_opt_class() nodeWithName:self->_name address:self->_address count:v17 numBytes:v20];
          unsigned int v8 = (VMUCallTreeNode *)objc_claimAutoreleasedReturnValue();
          -[VMUCallTreeNode setChildren:](v8, "setChildren:", v19);
        }

        else
        {
          unsigned int v8 = 0LL;
        }

        id v9 = v25;
      }

      else
      {
        unsigned int v8 = self;
      }
    }
  }

  return v8;
}

- (id)filterOutSymbols:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x189604010];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithArray:v5];

  -[VMUCallTreeNode filterOutSymbols:required:](self, "filterOutSymbols:required:", v6, 0LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)chargeLibrariesInSet:(id)a3 toCaller:(id)a4 parentLibrary:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = (void *)MEMORY[0x186E32E40]();
  id v22 = 0LL;
  -[VMUCallTreeNode parseNameIntoSymbol:library:loadAddress:offset:address:suffix:]( self,  "parseNameIntoSymbol:library:loadAddress:offset:address:suffix:",  0LL,  &v22,  0LL,  0LL,  0LL,  0LL);
  id v12 = v22;
  if (![v12 length]) {
    goto LABEL_9;
  }
  if (v8)
  {
    if ([v8 containsObject:v12]) {
      goto LABEL_4;
    }
LABEL_9:
    id v14 = v10;
    if (v9)
    {
LABEL_7:
      uint64_t v15 = [v9 findOrAddChildWithName:self->_name address:self->_address nodeSearchType:1 isLeafNode:0];
      *(_DWORD *)(v15 + 40) += self->_count;
      *(void *)(v15 + 32) += self->_numBytes;

      id v9 = (id)v15;
      goto LABEL_12;
    }

    goto LABEL_10;
  }

- (id)chargeLibrariesToCallers:(id)a3 keepBoundaries:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (objc_class *)MEMORY[0x189604010];
  id v7 = a3;
  id v8 = (void *)[[v6 alloc] initWithArray:v7];

  if (v4) {
    id v9 = @"KEEP-BOUNDARIES PLACEHOLDER";
  }
  else {
    id v9 = 0LL;
  }
  -[VMUCallTreeNode chargeLibrariesInSet:toCaller:parentLibrary:]( self,  "chargeLibrariesInSet:toCaller:parentLibrary:",  v8,  0LL,  v9);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)pruneCount:(unsigned int)a3
{
  if (self->_count >= a3)
  {
    uint64_t v4 = *(void *)&a3;
    unsigned int v6 = -[VMUCallTreeNode numChildren](self, "numChildren");
    if (v6)
    {
      unsigned int v7 = v6;
      [(id)objc_opt_class() nodeWithName:self->_name address:self->_address count:self->_count numBytes:self->_numBytes];
      unsigned int v3 = (VMUCallTreeNode *)objc_claimAutoreleasedReturnValue();
      id v8 = objc_alloc_init(MEMORY[0x189603FA8]);
      uint64_t v9 = 0LL;
      do
      {
        -[VMUCallTreeNode childAtIndex:](self, "childAtIndex:", v9);
        id v10 = (_DWORD *)objc_claimAutoreleasedReturnValue();
        unsigned int v11 = v10;
        if (v10[10] >= v4)
        {
          [v10 pruneCount:v4];
          id v12 = (void *)objc_claimAutoreleasedReturnValue();
          [v8 addObject:v12];
        }

        uint64_t v9 = (v9 + 1);
      }

      while (v7 != (_DWORD)v9);
      -[VMUCallTreeNode setChildren:](v3, "setChildren:", v8);
    }

    else
    {
      unsigned int v3 = self;
    }
  }

  else
  {
    unsigned int v3 = 0LL;
  }

  return v3;
}

- (id)pruneMallocSize:(unint64_t)a3
{
  if (self->_numBytes >= a3)
  {
    unsigned int v6 = -[VMUCallTreeNode numChildren](self, "numChildren");
    if (v6)
    {
      unsigned int v7 = v6;
      [(id)objc_opt_class() nodeWithName:self->_name address:self->_address count:self->_count numBytes:self->_numBytes];
      unsigned int v3 = (VMUCallTreeNode *)objc_claimAutoreleasedReturnValue();
      id v8 = objc_alloc_init(MEMORY[0x189603FA8]);
      uint64_t v9 = 0LL;
      do
      {
        -[VMUCallTreeNode childAtIndex:](self, "childAtIndex:", v9);
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        unsigned int v11 = v10;
        if (v10[4] >= a3)
        {
          [v10 pruneMallocSize:a3];
          id v12 = (void *)objc_claimAutoreleasedReturnValue();
          [v8 addObject:v12];
        }

        uint64_t v9 = (v9 + 1);
      }

      while (v7 != (_DWORD)v9);
      -[VMUCallTreeNode setChildren:](v3, "setChildren:", v8);
    }

    else
    {
      unsigned int v3 = self;
    }
  }

  else
  {
    unsigned int v3 = 0LL;
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end