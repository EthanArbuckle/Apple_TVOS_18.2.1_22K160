@interface VMUDirectedGraph
+ (BOOL)encapsulateData:(id)a3 to:(id)a4 withSupplementalDataTag:(const char *)a5 error:(id *)a6 dataGeneratorBlock:(id)a7;
+ (id)_archivedBytes:(const void *)a3 length:(unint64_t)a4 options:(unint64_t)a5;
+ (id)_archivedObject:(id)a3 options:(unint64_t)a4;
+ (id)_unarchivedObject:(id)a3 ofClass:(Class)a4 options:(unint64_t)a5;
+ (id)_unarchivedObject:(id)a3 ofClasses:(id)a4 options:(unint64_t)a5;
+ (id)directedGraphWithData:(id)a3 error:(id *)a4;
+ (void)_copyUnarchived:(id)a3 length:(unint64_t *)a4 options:(unint64_t)a5;
- (BOOL)_adjustAdjacencyMap;
- (BOOL)graphIs64bit;
- (BOOL)inverted;
- (BOOL)isNodePresent:(unsigned int)a3;
- (NSDictionary)additionalProperties;
- (VMUDirectedGraph)initWithArchived:(id)a3 version:(int64_t)a4 options:(unint64_t)a5 diskLogs:(id)a6 error:(id *)a7;
- (VMUDirectedGraph)initWithNodes:(unsigned int)a3;
- (VMUDirectedGraph)initWithPlistRepresentation:(id)a3;
- (VMUDirectedGraph)initWithPlistRepresentation:(id)a3 error:(id *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decapsulateIPSheaderInData:(id)a3 error:(id *)a4;
- (id)decapsulatePlistData:(id)a3 error:(id *)a4;
- (id)decapsulateSupplementalData:(id)a3 forTag:(const char *)a4;
- (id)invertedGraph;
- (id)plistRepresentationWithOptions:(unint64_t)a3;
- (id)plistRepresentationWithOptions:(unint64_t)a3 fromOriginalMemgraph:(id)a4;
- (id)renormalizedGraph;
- (id)subgraphWithMarkedNodes:(void *)a3;
- (unsigned)_internalEnumerateEdgesOfNode:(unsigned int)a3 withBlock:(id)a4;
- (unsigned)addEdgeFromNode:(unsigned int)a3 toNode:(unsigned int)a4;
- (unsigned)addGroupNodeForNodes:(const unsigned int *)a3 count:(unsigned int)a4;
- (unsigned)addNode;
- (unsigned)edgeCount;
- (unsigned)edgeNamespaceSize;
- (unsigned)enumerateEdgesOfNode:(unsigned int)a3 withBlock:(id)a4;
- (unsigned)enumerateEdgesWithBlock:(id)a3;
- (unsigned)enumerateMembersOfGroupNode:(unsigned int)a3 withBlock:(id)a4;
- (unsigned)enumerateNodesWithBlock:(id)a3;
- (unsigned)nodeCount;
- (unsigned)nodeNamespaceSize;
- (unsigned)parentGroupForNode:(unsigned int)a3;
- (unsigned)pointerSize;
- (unsigned)reverseEnumerateNodesWithBlock:(id)a3;
- (void)_adjustAdjacencyMap;
- (void)_bfsCore:(unsigned int)a3 colors:(char *)a4 visitBlock:(id)a5 examineBlock:(id)a6;
- (void)_dfsCore:(unsigned int)a3 colors:(char *)a4 visitBlock:(id)a5 examineBlock:(id)a6;
- (void)_dumpAdjacencyList;
- (void)_faultDeadNodeMap;
- (void)_internalAccessRawEdgesWithBlock:(id)a3;
- (void)_internalAddEdgeFromNode:(unsigned int)a3 toNode:(unsigned int)a4 withName:;
- (void)_removeEdges:(id)a3;
- (void)_renameWithNodeMap:(unsigned int *)a3 nodeNamespace:(unsigned int)a4 edgeMap:(unsigned int *)a5 edgeNamespace:(unsigned int)a6;
- (void)_renormalize;
- (void)_reorderEdgesNaturally;
- (void)_searchMainLoop:(unsigned int)a3 action:(id)a4;
- (void)archiveDictionaryRepresentation:(id)a3 options:(unint64_t)a4;
- (void)breadthFirstSearch:(unsigned int)a3 nodeVisitBlock:(id)a4 edgeVisitBlock:(id)a5;
- (void)deadNodeMap;
- (void)dealloc;
- (void)depthFirstSearch:(unsigned int)a3 nodeVisitBlock:(id)a4 edgeVisitBlock:(id)a5;
- (void)invertEdges;
- (void)removeMarkedEdges:(void *)a3;
- (void)removeMarkedNodes:(void *)a3;
- (void)setAdditionalProperties:(id)a3;
- (void)setGraphCompatibilityVersion:(int64_t)a3;
- (void)setGraphVersion:(int64_t)a3;
- (void)setInverted:(BOOL)a3;
- (void)ungroupNode:(unsigned int)a3;
- (void)withEdgeMarkingMap:(id)a3;
- (void)withNodeMarkingMap:(id)a3;
@end

@implementation VMUDirectedGraph

+ (id)_archivedBytes:(const void *)a3 length:(unint64_t)a4 options:(unint64_t)a5
{
  id v5 = (id)a4;
  if (a4)
  {
    int v7 = a5 & 1;
    if ((a5 & 4) != 0) {
      int v7 = 2;
    }
    uint64_t v37 = 0LL;
    v38 = &v37;
    uint64_t v39 = 0x3032000000LL;
    v40 = __Block_byref_object_copy__9;
    v41 = __Block_byref_object_dispose__9;
    id v42 = 0LL;
    uint64_t v33 = 0LL;
    v34 = &v33;
    uint64_t v35 = 0x2020000000LL;
    int v36 = v7;
    [MEMORY[0x189603F50] timeIntervalSinceReferenceDate];
    double v9 = v8;
    uint64_t v10 = MEMORY[0x1895F87A8];
    v32[0] = MEMORY[0x1895F87A8];
    v32[1] = 3221225472LL;
    v32[2] = __VMUCompressedBuffer_block_invoke;
    v32[3] = &unk_189E00628;
    v32[5] = &v37;
    v32[6] = v5;
    v32[4] = &v33;
    uint64_t v11 = MEMORY[0x186E33044](v32);
    v12 = (void (**)(void))v11;
    int v13 = *((_DWORD *)v34 + 6);
    if (v13 == 1)
    {
      uint64_t v27 = 0LL;
      uint64_t v28 = (uint64_t)&v27;
      uint64_t v29 = 0x9010000000LL;
      memset(&v31.avail_in, 0, 104);
      v30 = &unk_1861837AD;
      v31.next_in = (Bytef *)a3;
      v31.avail_in = v5;
      uint64_t v14 = deflateInit2_(&v31, 1, 8, 31, 9, 0, "1.2.12", 112);
      if ((_DWORD)v14)
      {
        NSLog(@"Unable to initialize deflate: %d (%s)", v14, *(void *)(v28 + 80));
        _Block_object_dispose(&v27, 8);
        id v5 = 0LL;
LABEL_21:

        _Block_object_dispose(&v33, 8);
        _Block_object_dispose(&v37, 8);

        return v5;
      }

      v26[6] = v10;
      v26[7] = 3221225472LL;
      v26[8] = __VMUCompressedBuffer_block_invoke_2;
      v26[9] = &unk_189E00650;
      v26[10] = &v27;
      v26[11] = deflateBound((z_streamp)(v28 + 32), (uLong)v5);
      v12[2](v12);
      _Block_object_dispose(&v27, 8);
    }

    else if (v13 == 2)
    {
      uint64_t v27 = v10;
      uint64_t v28 = 3221225472LL;
      uint64_t v29 = (uint64_t)__VMUCompressedBuffer_block_invoke_3;
      v30 = &__block_descriptor_56_e9_Q16__0_v8l;
      v31.next_in = (Bytef *)a3;
      *(void *)&v31.avail_in = v5;
      v31.total_in = (unint64_t)((double)(unint64_t)v5 * 1.2);
      (*(void (**)(uint64_t))(v11 + 16))(v11);
    }

    v15 = v38;
    if (!v38[5])
    {
      *((_DWORD *)v34 + 6) = 0;
      v26[0] = v10;
      v26[1] = 3221225472LL;
      v26[2] = __VMUCompressedBuffer_block_invoke_4;
      v26[3] = &__block_descriptor_48_e9_Q16__0_v8l;
      v26[4] = a3;
      v26[5] = v5;
      ((void (*)(void (**)(void), id, void, void *))v12[2])(v12, v5, 0LL, v26);
      v15 = v38;
    }

    if (kVMUPrintArchivingTiming)
    {
      id v16 = (id)v15[5];
      [MEMORY[0x189603F50] timeIntervalSinceReferenceDate];
      double v18 = v17;
      unint64_t v19 = [v16 length];
      unint64_t v20 = v19;
      else {
        unint64_t v21 = v19;
      }
      double v22 = v18 - v9;
      if (v22 <= 0.0)
      {
        v24 = (FILE *)*MEMORY[0x1895F89D0];
        VMUMemorySizeString(v5);
        VMUMemorySizeString(v20);
        fprintf(v24, "Compressed %s to %s (%2.1f%% reduction) in %3.6fs\n");
      }

      else
      {
        VMUMemorySizeString((unint64_t)((double)(v21 - v19) / v22));
        v23 = (FILE *)*MEMORY[0x1895F89D0];
        VMUMemorySizeString(v5);
        VMUMemorySizeString(v20);
        fprintf(v23, "Compressed %s to %s (%2.1f%% reduction @ %s saved/s) in %3.6fs\n");
      }

      v15 = v38;
    }

    id v5 = (id)v15[5];
    goto LABEL_21;
  }

  return v5;
}

+ (void)_copyUnarchived:(id)a3 length:(unint64_t *)a4 options:(unint64_t)a5
{
  id v6 = a3;
  [MEMORY[0x189603F50] timeIntervalSinceReferenceDate];
  double v8 = v7;
  id v9 = v6;
  uint64_t v10 = (unsigned int *)[v9 bytes];
  v12 = (Bytef *)v10[1];
  size_t v11 = v10[2];
  BOOL v13 = !(_DWORD)v11 || (_DWORD)v12 == 0;
  if (v13
    || (unint64_t v14 = *v10, v15 = v10[3], [v9 length] < (unint64_t)((_DWORD)v12 + v14)))
  {
LABEL_7:
    if (a4)
    {
      id v16 = 0LL;
      *a4 = 0LL;
      goto LABEL_45;
    }

+ (id)_archivedObject:(id)a3 options:(unint64_t)a4
{
  char v4 = a4;
  id v5 = a3;
  id v6 = [MEMORY[0x1896078F8] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:0];
  double v7 = (Bytef *)[v6 bytes];
  id v8 = (id)[v6 length];
  if (v8)
  {
    int v9 = v4 & 1;
    if ((v4 & 4) != 0) {
      int v9 = 2;
    }
    uint64_t v39 = 0LL;
    v40 = &v39;
    uint64_t v41 = 0x3032000000LL;
    id v42 = __Block_byref_object_copy__9;
    v43 = __Block_byref_object_dispose__9;
    id v44 = 0LL;
    uint64_t v35 = 0LL;
    int v36 = &v35;
    uint64_t v37 = 0x2020000000LL;
    int v38 = v9;
    [MEMORY[0x189603F50] timeIntervalSinceReferenceDate];
    double v11 = v10;
    uint64_t v12 = MEMORY[0x1895F87A8];
    v34[0] = MEMORY[0x1895F87A8];
    v34[1] = 3221225472LL;
    v34[2] = __VMUCompressedBuffer_block_invoke;
    v34[3] = &unk_189E00628;
    v34[5] = &v39;
    v34[6] = v8;
    v34[4] = &v35;
    uint64_t v13 = MEMORY[0x186E33044](v34);
    unint64_t v14 = (void (**)(void))v13;
    int v15 = *((_DWORD *)v36 + 6);
    if (v15 == 1)
    {
      uint64_t v29 = 0LL;
      uint64_t v30 = (uint64_t)&v29;
      uint64_t v31 = 0x9010000000LL;
      memset(&v33.avail_in, 0, 104);
      unint64_t v32 = &unk_1861837AD;
      v33.next_in = v7;
      v33.avail_in = v8;
      uint64_t v16 = deflateInit2_(&v33, 1, 8, 31, 9, 0, "1.2.12", 112);
      if ((_DWORD)v16)
      {
        NSLog(@"Unable to initialize deflate: %d (%s)", v16, *(void *)(v30 + 80));
        _Block_object_dispose(&v29, 8);
        id v8 = 0LL;
LABEL_21:

        _Block_object_dispose(&v35, 8);
        _Block_object_dispose(&v39, 8);

        goto LABEL_22;
      }

      v28[6] = v12;
      v28[7] = 3221225472LL;
      v28[8] = __VMUCompressedBuffer_block_invoke_2;
      v28[9] = &unk_189E00650;
      v28[10] = &v29;
      v28[11] = deflateBound((z_streamp)(v30 + 32), (uLong)v8);
      v14[2](v14);
      _Block_object_dispose(&v29, 8);
    }

    else if (v15 == 2)
    {
      uint64_t v29 = v12;
      uint64_t v30 = 3221225472LL;
      uint64_t v31 = (uint64_t)__VMUCompressedBuffer_block_invoke_3;
      unint64_t v32 = &__block_descriptor_56_e9_Q16__0_v8l;
      v33.next_in = v7;
      *(void *)&v33.avail_in = v8;
      v33.total_in = (unint64_t)((double)(unint64_t)v8 * 1.2);
      (*(void (**)(uint64_t))(v13 + 16))(v13);
    }

    unsigned int v17 = v40;
    if (!v40[5])
    {
      *((_DWORD *)v36 + 6) = 0;
      v28[0] = v12;
      v28[1] = 3221225472LL;
      v28[2] = __VMUCompressedBuffer_block_invoke_4;
      v28[3] = &__block_descriptor_48_e9_Q16__0_v8l;
      v28[4] = v7;
      v28[5] = v8;
      ((void (*)(void (**)(void), id, void, void *))v14[2])(v14, v8, 0LL, v28);
      unsigned int v17 = v40;
    }

    if (kVMUPrintArchivingTiming)
    {
      id v18 = (id)v17[5];
      [MEMORY[0x189603F50] timeIntervalSinceReferenceDate];
      double v20 = v19;
      unint64_t v21 = [v18 length];
      unint64_t v22 = v21;
      else {
        unint64_t v23 = v21;
      }
      double v24 = v20 - v11;
      if (v24 <= 0.0)
      {
        compression_status v26 = (FILE *)*MEMORY[0x1895F89D0];
        VMUMemorySizeString(v8);
        VMUMemorySizeString(v22);
        fprintf(v26, "Compressed %s to %s (%2.1f%% reduction) in %3.6fs\n");
      }

      else
      {
        VMUMemorySizeString((unint64_t)((double)(v23 - v21) / v24));
        uint64_t v25 = (FILE *)*MEMORY[0x1895F89D0];
        VMUMemorySizeString(v8);
        VMUMemorySizeString(v22);
        fprintf(v25, "Compressed %s to %s (%2.1f%% reduction @ %s saved/s) in %3.6fs\n");
      }

      unsigned int v17 = v40;
    }

    id v8 = (id)v17[5];
    goto LABEL_21;
  }

+ (id)_unarchivedObject:(id)a3 ofClass:(Class)a4 options:(unint64_t)a5
{
  id v8 = (void *)MEMORY[0x189604010];
  id v9 = a3;
  [v8 setWithObject:a4];
  double v10 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 _unarchivedObject:v9 ofClasses:v10 options:a5];
  double v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_unarchivedObject:(id)a3 ofClasses:(id)a4 options:(unint64_t)a5
{
  uint64_t v61 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  [MEMORY[0x189603F50] timeIntervalSinceReferenceDate];
  double v10 = v9;
  id v11 = v8;
  uint64_t v12 = (unsigned int *)[v11 bytes];
  unint64_t v14 = (Bytef *)v12[1];
  size_t v13 = v12[2];
  if (!(_DWORD)v13 || (_DWORD)v14 == 0) {
    goto LABEL_42;
  }
  unint64_t v16 = *v12;
  unsigned int v17 = v12[3];
  id v18 = (Bytef *)malloc(v13);
  unsigned int v19 = HIWORD(v17);
  if (!HIWORD(v17))
  {
    unint64_t v27 = [v11 length];
    id v20 = v7;
    if (v27 >= v16 && (_DWORD)v14 == (_DWORD)v13 && v27 - v16 >= v13)
    {
      memcpy(v18, (const void *)([v11 bytes] + v16), v13);
      unint64_t v21 = (Bytef *)v13;
      goto LABEL_32;
    }

    NSLog(@"Malformed non-compressed header");
    goto LABEL_31;
  }

  if (v19 != 2)
  {
    id v20 = v7;
    unint64_t v21 = (Bytef *)v13;
    if (v19 != 1) {
      goto LABEL_32;
    }
    id v22 = v11;
    uint64_t v23 = [v22 bytes];
    unsigned int v24 = [v22 length];
    memset(&strm.avail_in, 0, 104);
    strm.next_in = (Bytef *)(v23 + v16);
    uInt v25 = v24 - v16;
    strm.avail_in = v25;
    uint64_t v26 = inflateInit2_(&strm, 31, "1.2.12", 112);
    if ((_DWORD)v26)
    {
      NSLog(@"Unable to initialize inflate: %d (%s)", v26, strm.msg);
    }

    else
    {
      strm.next_out = v18;
      strm.avail_out = v13;
      uint64_t v30 = inflate(&strm, 4);
      inflateEnd(&strm);
      unint64_t v21 = (Bytef *)v13;
      if ((_DWORD)v30 == 1) {
        goto LABEL_32;
      }
      NSLog(@"Unable to decompress data: %d (%s)", v30, strm.msg);
    }

    goto LABEL_31;
  }

  uint64_t v28 = [v11 bytes];
  if (compression_stream_init((compression_stream *)&strm, COMPRESSION_STREAM_DECODE, COMPRESSION_LZFSE) == COMPRESSION_STATUS_ERROR)
  {
    id v20 = v7;
    NSLog(@"Unable to initialize compression stream.");
LABEL_31:
    unint64_t v21 = 0LL;
    goto LABEL_32;
  }

  strm.total_in = v28 + v16;
  strm.next_out = v14;
  strm.next_in = v18;
  *(void *)&strm.avail_in = v13;
  compression_status v29 = compression_stream_process((compression_stream *)&strm, 0);
  id v20 = v7;
  if (v29 == COMPRESSION_STATUS_ERROR)
  {
    NSLog(@"Error. Compression failed.");
    goto LABEL_31;
  }

  if (v29 == COMPRESSION_STATUS_OK)
  {
    NSLog(@"Error. Compression output buffer full.");
    goto LABEL_31;
  }

  if (v29 != COMPRESSION_STATUS_END || (unint64_t v21 = (Bytef *)(strm.next_in - v18), strm.next_in <= v18)) {
    unint64_t v21 = 0LL;
  }
  compression_stream_destroy((compression_stream *)&strm);
LABEL_32:
  if (kVMUPrintArchivingTiming)
  {
    uint64_t v31 = (void *)MEMORY[0x189603F50];
    id v32 = v11;
    [v31 timeIntervalSinceReferenceDate];
    double v34 = v33;
    unint64_t v35 = [v32 length];

    if (v35 <= v13) {
      unint64_t v36 = v13;
    }
    else {
      unint64_t v36 = v35;
    }
    double v37 = 100.0 - (double)v35 * 100.0 / (double)v36;
    int v38 = (FILE *)*MEMORY[0x1895F89D0];
    uint64_t v39 = (const char *)VMUMemorySizeString(v35);
    v40 = (const char *)VMUMemorySizeString(v13);
    fprintf(v38, "Decompressed %s to %s (reversed %2.1f%% reduction) in %3.6fs\n", v39, v40, v37, v34 - v10);
  }

  if (v21 != (Bytef *)v13 || !v21)
  {
    free(v18);
    id v7 = v20;
LABEL_42:

    uint64_t v41 = 0LL;
    goto LABEL_43;
  }

  if (v18)
  {
    [MEMORY[0x189603F48] dataWithBytesNoCopy:v18 length:v13 freeWhenDone:1];
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v41 = 0LL;
  }

  id v7 = v20;
LABEL_43:

  if ([v41 length])
  {
    v53 = v41;
    id v42 = (void *)[objc_alloc(MEMORY[0x189607908]) initForReadingFromData:v41 error:0];
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    id v54 = v7;
    id v43 = v7;
    uint64_t v44 = [v43 countByEnumeratingWithState:&v55 objects:v60 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v56;
      do
      {
        for (uint64_t i = 0LL; i != v45; ++i)
        {
          if (*(void *)v56 != v46) {
            objc_enumerationMutation(v43);
          }
          v48 = *(objc_class **)(*((void *)&v55 + 1) + 8 * i);
          [NSString stringWithUTF8String:class_getName(v48)];
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          if ([v49 containsString:@"VMU"])
          {
            else {
              [@"DVT_" stringByAppendingString:v49];
            }
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            [v42 setClass:v48 forClassName:v49];
            [v42 setClass:v48 forClassName:v50];
          }
        }

        uint64_t v45 = [v43 countByEnumeratingWithState:&v55 objects:v60 count:16];
      }

      while (v45);
    }

    [v42 decodeObjectOfClasses:v43 forKey:*MEMORY[0x1896075C8]];
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v41 = v53;
    id v7 = v54;
  }

  else
  {
    v51 = 0LL;
  }

  return v51;
}

- (VMUDirectedGraph)initWithNodes:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___VMUDirectedGraph;
  result = -[VMUDirectedGraph init](&v5, sel_init);
  if (result)
  {
    if (a3)
    {
      result->_nodeCount = a3;
      result->_nextNodeName = a3;
      result->_graphIs64bit = 1;
      *(int64x2_t *)&result->_graphCompatibilityVersion = vdupq_n_s64(2uLL);
    }

    else
    {

      return 0LL;
    }
  }

  return result;
}

- (void)setGraphCompatibilityVersion:(int64_t)a3
{
  self->_graphCompatibilityVersion = a3;
}

- (void)setGraphVersion:(int64_t)a3
{
  self->_graphVersion = a3;
}

+ (id)directedGraphWithData:(id)a3 error:(id *)a4
{
  id v11 = a3;
  if (v11)
  {
    uint64_t v12 = (void *)[objc_alloc((Class)a1) initWithPlistRepresentation:v11 error:a4];
  }

  else if (a4)
  {
    VMUDirectedGraphErrorWithExtraUserInfo(1u, 0LL, @"Data parameter cannot be nil.", v6, v7, v8, v9, v10, v14);
    uint64_t v12 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  return v12;
}

- (id)decapsulatePlistData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ((unint64_t)[v5 length] > 0x30)
  {
    id v7 = v5;
    if (*(void *)[v7 bytes] != 0x48504152474D454DLL)
    {
      id v6 = v7;
      goto LABEL_5;
    }

    id v10 = v7;
    id v11 = (uint64_t *)[v10 bytes];
    if (v11[1])
    {
      if (a4)
      {
        VMUDirectedGraphErrorWithExtraUserInfo( 1u,  0LL,  @"Version %llu of memory graph is not supported by the currently installed tools",  v12,  v13,  v14,  v15,  v16,  v11[1]);
LABEL_18:
        uint64_t v8 = 0LL;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_6;
      }
    }

    else
    {
      uint64_t v17 = v11[2];
      if (v17 != -1)
      {
        uint64_t v12 = v11[3];
        if (v12 != -1 && v12 + v17 != -1)
        {
          [v10 subdataWithRange:];
          id v6 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_5;
        }
      }

      if (a4)
      {
        VMUDirectedGraphErrorWithExtraUserInfo( 1u,  0LL,  @"This platform cannot map in the memory graph plist at offset %llu of size %llu",  v12,  v13,  v14,  v15,  v16,  v11[2]);
        goto LABEL_18;
      }
    }

    uint64_t v8 = 0LL;
    goto LABEL_6;
  }

  id v6 = v5;
LABEL_5:
  uint64_t v8 = v6;
LABEL_6:

  return v8;
}

- (id)decapsulateSupplementalData:(id)a3 forTag:(const char *)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = v5;
  if (*(void *)[v6 bytes] != 0x48504152474D454DLL) {
    goto LABEL_3;
  }
  id v9 = v6;
  uint64_t v10 = [v9 bytes];
  if (!*(_DWORD *)(v10 + 40)) {
    goto LABEL_3;
  }
  uint64_t v11 = v10;
  int v12 = 0;
  while (1)
  {
    uint64_t v13 = *(void *)(v11 + 32) + v12 * *(unsigned __int16 *)(v11 + 44);
    if (v13 + 32 < (unint64_t)[v9 length])
    {
      id v14 = v9;
      uint64_t v15 = [v14 bytes];
      if (strlen(a4) >= 9) {
        -[VMUDirectedGraph decapsulateSupplementalData:forTag:].cold.1();
      }
      uint64_t v16 = (void *)(v15 + v13);
      strncpy(__dst, a4, 8uLL);
      if (*(void *)__dst == *v16) {
        break;
      }
    }
  }

  uint64_t v17 = v16[2];
  if (v17 == -1 || ((uint64_t v18 = v16[3], v18 != -1) ? (v19 = v18 + v17 == -1) : (v19 = 1), v19))
  {
LABEL_3:
    id v7 = 0LL;
  }

  else
  {
    [v14 subdataWithRange:];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (kVMUPrintArchivingTiming)
    {
      id v20 = "";
      if (!v16[3]) {
        id v20 = "STACK LOGS FAILED TO SAVE";
      }
      fprintf( (FILE *)*MEMORY[0x1895F89D0],  "[Full Stack Log History] dataOffset: %llu  dataSize: %llu  %s\n\n",  v16[2],  v16[3],  v20);
    }
  }

  return v7;
}

+ (BOOL)encapsulateData:(id)a3 to:(id)a4 withSupplementalDataTag:(const char *)a5 error:(id *)a6 dataGeneratorBlock:(id)a7
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = (unsigned int (**)(id, void *))a7;
  uint64_t v14 = [v11 length];
  uint64_t v15 = v14 + 48;
  __int128 v42 = xmmword_18616BED0;
  uint64_t v43 = 48LL;
  uint64_t v44 = [v11 length];
  uint64_t v45 = v14 + 48;
  uint64_t v46 = 0x30002000000001LL;
  if (nsfilehandle_write(v12, (uint64_t)&v42, 48LL, (uint64_t)a6)
    && [v12 writeData:v11 error:a6])
  {
    uint64_t v16 = -(int)v14 & 0xFLL;
    uint64_t v37 = 0LL;
    int v38 = &v37;
    uint64_t v39 = 0x4010000000LL;
    uint64_t v17 = v14 + v16 + 80;
    v40 = &unk_1861837AD;
    v41[0] = 0LL;
    v41[1] = 0LL;
    v41[2] = v17;
    v41[3] = 0LL;
    if (strlen(a5) > 8)
    {
      uint64_t v22 = "strlen(tag) <= 8";
      int v23 = 310;
    }

    else
    {
      strncpy((char *)v41, a5, 8uLL);
      if ([v12 offsetInFile] == v15)
      {
        if (!nsfilehandle_write(v12, (uint64_t)(v38 + 4), 32LL, (uint64_t)a6)
          || (*(void *)((char *)v36 + 7) = 0LL,
              v36[0] = 0LL,
              (nsfilehandle_write(v12, (uint64_t)v36, v16, (uint64_t)a6) & 1) == 0))
        {
          BOOL v20 = 0;
LABEL_19:
          _Block_object_dispose(&v37, 8);
          goto LABEL_20;
        }

        if ([v12 offsetInFile] == v17)
        {
          if (([v12 offsetInFile] & 0xF) == 0)
          {
            uint64_t v30 = 0LL;
            uint64_t v31 = &v30;
            uint64_t v32 = 0x3032000000LL;
            double v33 = __Block_byref_object_copy__9;
            double v34 = __Block_byref_object_dispose__9;
            id v35 = 0LL;
            v26[0] = MEMORY[0x1895F87A8];
            v26[1] = 3221225472LL;
            v26[2] = __88__VMUDirectedGraph_encapsulateData_to_withSupplementalDataTag_error_dataGeneratorBlock___block_invoke;
            v26[3] = &unk_189E00540;
            id v18 = v12;
            id v27 = v18;
            uint64_t v28 = &v30;
            compression_status v29 = &v37;
            if (v13[2](v13, v26))
            {
              if (a6)
              {
                BOOL v19 = (void *)v31[5];
                if (v19)
                {
                  BOOL v20 = 0;
                  *a6 = v19;
LABEL_18:

                  _Block_object_dispose(&v30, 8);
                  goto LABEL_19;
                }
              }
            }

            else
            {
              [v18 seekToFileOffset:v15];
              if (nsfilehandle_write(v18, (uint64_t)(v38 + 4), 32LL, (uint64_t)a6))
              {
                [v18 seekToEndOfFile];
                BOOL v20 = 1;
                goto LABEL_18;
              }
            }

            BOOL v20 = 0;
            goto LABEL_18;
          }

          unsigned int v24 = "([fh offsetInFile] % 16) == 0";
          int v25 = 323;
        }

        else
        {
          unsigned int v24 = "[fh offsetInFile] == supplementalDataOffset";
          int v25 = 322;
        }

        __assert_rtn( "+[VMUDirectedGraph encapsulateData:to:withSupplementalDataTag:error:dataGeneratorBlock:]",  "VMUDirectedGraph.m",  v25,  v24);
      }

      uint64_t v22 = "[fh offsetInFile] == supplementalHeaderOffset";
      int v23 = 312;
    }

    __assert_rtn( "+[VMUDirectedGraph encapsulateData:to:withSupplementalDataTag:error:dataGeneratorBlock:]",  "VMUDirectedGraph.m",  v23,  v22);
  }

  BOOL v20 = 0;
LABEL_20:

  return v20;
}

uint64_t __88__VMUDirectedGraph_encapsulateData_to_withSupplementalDataTag_error_dataGeneratorBlock___block_invoke( void *a1,  uint64_t a2,  uint64_t a3)
{
  id v5 = (void *)a1[4];
  uint64_t v6 = *(void *)(a1[5] + 8LL);
  id obj = *(id *)(v6 + 40);
  int v7 = nsfilehandle_write(v5, a2, a3, (uint64_t)&obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!v7) {
    return 5LL;
  }
  uint64_t result = 0LL;
  *(void *)(*(void *)(a1[6] + 8LL) + 56LL) += a3;
  return result;
}

- (id)decapsulateIPSheaderInData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (![v5 bytes]) {
    goto LABEL_25;
  }
  id v5 = v5;
  if (*(_BYTE *)[v5 bytes] != 123) {
    goto LABEL_25;
  }
  id v5 = v5;
  uint64_t v6 = [v5 bytes];
  if (*(_BYTE *)([v5 length] + v6 - 1) != 10) {
    goto LABEL_25;
  }
  id v5 = v5;
  int v7 = (char *)memchr((const void *)[v5 bytes], 10, [v5 length]);
  if (!v7) {
    goto LABEL_25;
  }
  uint64_t v8 = v7;
  id v5 = v5;
  id v9 = &v8[-[v5 bytes]];
  [v5 subdataWithRange:0, v9];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v34 = 0LL;
  [MEMORY[0x1896078D8] JSONObjectWithData:v10 options:1 error:&v34];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = v34;
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v13 = v11;
    uint64_t v14 = [v5 length];
    [v13 objectForKey:@"length"];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = &v9[(int)([v15 intValue] + 2)];

    if ((char *)v14 == v16)
    {
      [v13 objectForKey:@"bug_type"];
      id v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && ([v27 isEqualToString:@"154"] & 1) != 0)
      {
        uint64_t v28 = [v5 subdataWithRange:v9 + 1, [v5 length] - [v9 length] - 2];

        int v29 = 0;
        id v5 = (id)v28;
      }

      else
      {
        int v29 = 1;
        if (a4)
        {
          VMUDirectedGraphErrorWithExtraUserInfo( 1u,  0LL,  @"Invalid bug type in IPS header.",  v22,  v23,  v24,  v25,  v26,  v33);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
      }

      goto LABEL_22;
    }

    if (!a4)
    {
      int v29 = 1;
      goto LABEL_22;
    }

    uint64_t v30 = @"IPS length is invalid.";
  }

  else
  {
    if (!a4)
    {
      int v29 = 1;
      goto LABEL_23;
    }

    [v12 localizedDescription];
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v33 = (uint64_t)v13;
    uint64_t v30 = @"Invalid IPS header: %@";
  }

  int v29 = 1;
  VMUDirectedGraphErrorWithExtraUserInfo(1u, 0LL, v30, v17, v18, v19, v20, v21, v33);
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

LABEL_23:
  if (!v29)
  {
LABEL_25:
    id v5 = v5;
    uint64_t v31 = v5;
    goto LABEL_26;
  }

  uint64_t v31 = 0LL;
LABEL_26:

  return v31;
}

- (VMUDirectedGraph)initWithPlistRepresentation:(id)a3
{
  return -[VMUDirectedGraph initWithPlistRepresentation:error:](self, "initWithPlistRepresentation:error:", a3, 0LL);
}

- (VMUDirectedGraph)initWithPlistRepresentation:(id)a3 error:(id *)a4
{
  uint64_t v6 = self;
  v73[2] = *MEMORY[0x1895F89C0];
  int v7 = (void *)MEMORY[0x186E32E40](self, a2);
  id v71 = 0LL;
  -[VMUDirectedGraph decapsulateIPSheaderInData:error:](v6, "decapsulateIPSheaderInData:error:", a3, &v71);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v71;
  if (!v8)
  {
    uint64_t v17 = 0LL;
    uint64_t v18 = 0LL;
LABEL_34:
    objc_autoreleasePoolPop(v7);
    goto LABEL_35;
  }

  -[VMUDirectedGraph decapsulateSupplementalData:forTag:](v6, "decapsulateSupplementalData:forTag:", v8, "DISKLOGS");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = v10;
  if (v10 && ![v10 length])
  {
    VMUDirectedGraphErrorWithExtraUserInfo( 4u,  0LL,  @"Memgraph file contained full stack log history header, but failed to store the actual stack log data.",  v12,  v13,  v14,  v15,  v16,  v62);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

    id v11 = 0LL;
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  id v70 = v9;
  -[VMUDirectedGraph decapsulatePlistData:error:](v6, "decapsulatePlistData:error:", v8, &v70);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  id v19 = v70;

  if (!v18)
  {
LABEL_33:

    id v9 = v19;
    goto LABEL_34;
  }

  id v68 = 0LL;
  [MEMORY[0x1896079E8] propertyListWithData:v18 options:0 format:v69 error:&v68];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  id v21 = v68;

  if (!v20)
  {
LABEL_32:

    id v19 = v21;
    goto LABEL_33;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v43 = VMUDirectedGraphErrorWithExtraUserInfo( 1u,  0LL,  @"File does not contain a memory graph in the correct format",  v22,  v23,  v24,  v25,  v26,  v62);
    uint64_t v44 = v21;
LABEL_31:

    id v21 = (id)v43;
    goto LABEL_32;
  }

  [v20 objectForKeyedSubscript:@"graphCompatibilityVersion"];
  id v27 = (void *)objc_claimAutoreleasedReturnValue();
  v6->_uint64_t graphCompatibilityVersion = [v27 integerValue];

  [v20 objectForKeyedSubscript:@"graphEncodingVersion"];
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  v6->_int64_t graphVersion = [v28 integerValue];

  uint64_t graphCompatibilityVersion = v6->_graphCompatibilityVersion;
  if (!graphCompatibilityVersion || graphCompatibilityVersion >= 3)
  {
    v72[0] = @"VMUDirectedGraphCompatibilityVersionNumberInGraphKey";
    [MEMORY[0x189607968] numberWithInteger:];
    uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
    v72[1] = @"VMUDirectedGraphToolCompatibilityVersionKey";
    v73[0] = v45;
    v73[1] = &unk_189E1D148;
    [MEMORY[0x189603F68] dictionaryWithObjects:v73 forKeys:v72 count:2];
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6->_graphCompatibilityVersion) {
      VMUDirectedGraphErrorWithExtraUserInfo( 3u,  v44,  @"The graph version (%ld) is too new.  The latest graph version this tool supports is %d.",  v46,  v47,  v48,  v49,  v50,  v6->_graphCompatibilityVersion);
    }
    else {
    uint64_t v43 = VMUDirectedGraphErrorWithExtraUserInfo( 2u,  v44,  @"File does not contain memory graph version information (not in correct format)",  v46,  v47,  v48,  v49,  v50,  v62);
    }

    goto LABEL_31;
  }

  [v20 objectForKeyedSubscript:@"nodes"];
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  v6->_unsigned int nodeCount = [v30 unsignedIntValue];

  [v20 objectForKeyedSubscript:@"nodeNamespaceSize"];
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
  v6->_nextNodeName = [v31 unsignedIntValue];

  [v20 objectForKeyedSubscript:@"edges"];
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
  v6->_externalEdges = [v32 unsignedIntValue];

  [v20 objectForKeyedSubscript:@"edgeNamespaceSize"];
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  v6->_nextEdgeName = [v33 unsignedIntValue];

  [v20 objectForKeyedSubscript:@"additionalProperties"];
  id v34 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v35 = [v34 copy];
  additionalProperties = v6->_additionalProperties;
  v6->_additionalProperties = (NSDictionary *)v35;

  [v20 objectForKey:@"graphIs64bit"];
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v37;
  if (v37)
  {
    int v38 = [v37 BOOLValue];
    v6->_graphIs64bit = v38;
    if ((v38 & 1) == 0 && (unsigned int nodeCount = v6->_nodeCount, nodeCount > 0x3FFFFFFE)
      || ((unsigned int nodeCount = v6->_nextNodeName, nodeCount < 0x3FFFFFFF) ? (v40 = 1) : (v40 = v38), v40 != 1))
    {
      __int128 v42 = "node";
      goto LABEL_28;
    }

    unsigned int nodeCount = v6->_nextEdgeName;
    if (nodeCount < 0x15555555) {
      char v41 = 1;
    }
    else {
      char v41 = v38;
    }
    if ((v41 & 1) == 0)
    {
      __int128 v42 = "reference";
LABEL_28:
      NSLog(@"Memory graph has bizarrely high %s count %zu\n", v42, nodeCount);
      VMUDirectedGraphErrorWithExtraUserInfo( 1u,  0LL,  @"Memory graph is too large to open",  v51,  v52,  v53,  v54,  v55,  v63);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      __int128 v56 = 0LL;
      goto LABEL_41;
    }
  }

  else
  {
    v6->_graphIs64bit = 1;
  }

  uint64_t v64 = [v20 objectForKeyedSubscript:@"details"];
  int64_t graphVersion = v6->_graphVersion;
  [v20 objectForKeyedSubscript:@"options"];
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  id v67 = v21;
  uint64_t v61 = -[VMUDirectedGraph initWithArchived:version:options:diskLogs:error:]( v6,  "initWithArchived:version:options:diskLogs:error:",  v64,  graphVersion,  [v65 unsignedIntValue],  v11,  &v67);
  id v9 = v67;

  __int128 v56 = v61;
  id v21 = (id)v64;
  uint64_t v6 = v56;
LABEL_41:

  objc_autoreleasePoolPop(v7);
  if (v56)
  {
    __int128 v58 = v56;

    if (!a4)
    {
      __int128 v57 = v17;
      goto LABEL_38;
    }

    __int128 v57 = v17;
    if (!v17) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }

- (VMUDirectedGraph)initWithArchived:(id)a3 version:(int64_t)a4 options:(unint64_t)a5 diskLogs:(id)a6 error:(id *)a7
{
  v57[1] = *MEMORY[0x1895F89C0];
  id v11 = a3;
  v55.receiver = self;
  v55.super_class = (Class)&OBJC_CLASS___VMUDirectedGraph;
  uint64_t v12 = -[VMUDirectedGraph init](&v55, sel_init);
  if (!v12)
  {
LABEL_51:
    uint64_t v43 = v12;
    goto LABEL_52;
  }

  [v11 objectForKeyedSubscript:@"directedGraphInfo"];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 objectForKeyedSubscript:@"compactEdgeList"];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    unint64_t v54 = 0LL;
    [v13 objectForKeyedSubscript:@"sparseEdgeList"];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_edges = (_VMUDirectedGraphEdge *)+[VMUDirectedGraph _copyUnarchived:length:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_copyUnarchived:length:options:",  v18,  &v54,  a5);

    unint64_t v19 = v54 / 0xC;
    v12->_uint64_t edgeCount = v54 / 0xC;
    v12->_edgeCapacity = v19;
    goto LABEL_42;
  }

  unsigned int v15 = -[VMUDirectedGraph edgeNamespaceSize](v12, "edgeNamespaceSize");
  v12->_uint64_t edgeCount = v15;
  v12->_edgeCapacity = v15;
  BOOL v16 = -[VMUDirectedGraph graphIs64bit](v12, "graphIs64bit");
  uint64_t edgeCount = v12->_edgeCount;
  if (v16 || edgeCount < 0x15555555)
  {
    if ((_DWORD)edgeCount) {
      uint64_t v20 = (_VMUDirectedGraphEdge *)malloc(12 * edgeCount);
    }
    else {
      uint64_t v20 = 0LL;
    }
    v12->_edges = v20;
    unint64_t v54 = 0LL;
    id v21 = +[VMUDirectedGraph _copyUnarchived:length:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_copyUnarchived:length:options:",  v14,  &v54,  a5);
    uint64_t v22 = v21;
    uint64_t v23 = v12->_edgeCount;
    if (v54 < 4 * v23)
    {
      free(v21);
      if (a7)
      {
        uint64_t v24 = (void *)MEMORY[0x189607870];
        uint64_t v56 = *MEMORY[0x1896075E0];
        [MEMORY[0x189603F68] dictionaryWithObjects:v57 forKeys:&v56 count:1];
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
        [v24 errorWithDomain:@"com.apple.dt.Symbolication.VMUDirectedGraph" code:1 userInfo:v25];
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }

      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        -[VMUDirectedGraph initWithArchived:version:options:diskLogs:error:].cold.1();
      }
      goto LABEL_39;
    }

    unsigned int nextNodeName = v12->_nextNodeName;
    if (nextNodeName)
    {
      char v27 = 0;
      unsigned int v28 = v12->_nextNodeName;
      do
      {
        ++v27;
        BOOL v29 = v28 > 1;
        v28 >>= 1;
      }

      while (v29);
      if (a4 >= 2)
      {
LABEL_30:
        if ((_DWORD)v23)
        {
          unint64_t v35 = 0LL;
          int v36 = 0;
          unsigned int v37 = 0;
          int v38 = 0;
          p_var2 = &v12->_edges->var2;
          do
          {
            unsigned int v40 = *((_DWORD *)v21 + v37);
            if ((v40 & 0x80000000) != 0)
            {
              ++v38;
              int v36 = v40 & 0x7FFFFFFF;
              int v41 = *((_DWORD *)v21 + v37 + 1) & 0x7FFFFFFF;
              int v42 = 2;
            }

            else
            {
              v36 += v40 >> v27;
              int v41 = v40 & ~(-1 << v27);
              int v42 = 1;
            }

            *(p_var2 - 2) = v35;
            *(p_var2 - 1) = v36;
            _DWORD *p_var2 = v41;
            p_var2 += 3;
            v37 += v42;
            ++v35;
          }

          while (v35 < v12->_edgeCount);
        }

        goto LABEL_40;
      }

      unsigned int v30 = 0;
      do
      {
        ++v30;
        BOOL v31 = nextNodeName >= 2;
        nextNodeName >>= 1;
      }

      while (v31);
    }

    else
    {
      unsigned int v30 = 0;
      char v27 = 0;
      if (a4 >= 2) {
        goto LABEL_30;
      }
    }

    if ((_DWORD)v23)
    {
      unsigned int v32 = 0;
      unsigned int v33 = v12->_edgeCount;
      do
      {
        ++v32;
        BOOL v29 = v33 > 1;
        v33 >>= 1;
      }

      while (v29);
      if (v30 <= v32)
      {
        char v27 = 0;
        unsigned int v34 = v12->_edgeCount;
        do
        {
          ++v27;
          BOOL v29 = v34 > 1;
          v34 >>= 1;
        }

        while (v29);
        goto LABEL_30;
      }
    }

    else if (!v30)
    {
LABEL_40:
      free(v21);
LABEL_42:
      [v13 objectForKeyedSubscript:@"inverted"];
      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
      v12->_inverted = [v44 BOOLValue];

      [v13 objectForKeyedSubscript:@"deadNodes"];
      uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
      v12->_deadNodes = +[VMUDirectedGraph _copyUnarchived:length:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_copyUnarchived:length:options:",  v45,  0LL,  a5);

      deadNodes = (unsigned int *)v12->_deadNodes;
      if (deadNodes && kVMUPrintArchivingTiming)
      {
        unint64_t v47 = *deadNodes;
        if ((_DWORD)v47)
        {
          unint64_t v48 = 0LL;
          int v49 = 0;
          uint64_t v50 = (unsigned __int8 *)(deadNodes + 1);
          do
          {
            unsigned int v51 = *v50++;
            uint8x8_t v52 = (uint8x8_t)vcnt_s8((int8x8_t)v51);
            v52.i16[0] = vaddlv_u8(v52);
            v49 += v52.i32[0];
            v48 += 8LL;
          }

          while (v48 < v47);
        }

        else
        {
          int v49 = 0;
        }

        fprintf((FILE *)*MEMORY[0x1895F89D0], "[Dead Nodes Marking Map] Count: %u\n\n", v49);
      }

      v12->_indexedEdges = -1;

      goto LABEL_51;
    }

    NSLog(@"memgraph file is malformed - unable to deserialize.");
    free(v22);
    goto LABEL_39;
  }

  NSLog(@"Memory graph has bizarrely high %s count %zu\n", "reference", edgeCount);
LABEL_39:

  uint64_t v43 = 0LL;
LABEL_52:

  return v43;
}

- (void)archiveDictionaryRepresentation:(id)a3 options:(unint64_t)a4
{
  id v34 = a3;
  [MEMORY[0x189603FC8] dictionary];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a4 & 2) == 0)
  {
    uint64_t edgeCount = self->_edgeCount;
    if ((_DWORD)edgeCount != self->_nextEdgeName || (self->_nextNodeName & 0x80000000) != 0)
    {
      +[VMUDirectedGraph _archivedBytes:length:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_archivedBytes:length:options:",  self->_edges,  12 * edgeCount,  a4);
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 setObject:v11 forKeyedSubscript:@"sparseEdgeList"];
    }

    else
    {
      -[VMUDirectedGraph _reorderEdgesNaturally](self, "_reorderEdgesNaturally");
      unsigned int nextNodeName = self->_nextNodeName;
      if (nextNodeName)
      {
        char v9 = 0;
        do
        {
          ++v9;
          BOOL v10 = nextNodeName > 1;
          nextNodeName >>= 1;
        }

        while (v10);
      }

      else
      {
        char v9 = 0;
      }

      uint64_t v12 = self->_edgeCount;
      if ((_DWORD)v12)
      {
        uint64_t v13 = malloc(8 * v12);
        uint64_t v14 = v13;
        uint64_t v15 = 0LL;
        unsigned int v16 = 0;
        int v17 = 0;
        do
        {
          if (v15 * 12)
          {
            uint64_t v18 = &self->_edges[v15];
            unsigned int var1 = v18[-1].var1;
            LODWORD(v18) = v18->var1;
            BOOL v20 = v18 >= var1;
            unsigned int v21 = (_DWORD)v18 - var1;
            if (!v20) {
              unsigned int v21 = -1;
            }
          }

          else
          {
            unsigned int v21 = -1;
          }

          if (v21 <= (0x80000000 >> v9) - 1)
          {
            *((_DWORD *)v13 + v16) = (self->_edges[v15].var2 | (v21 << v9)) & 0x7FFFFFFF;
          }

          else
          {
            ++v17;
            uint64_t v22 = &self->_edges[v15];
            *((_DWORD *)v13 + v16++) = v22->var1 | 0x80000000;
            *((_DWORD *)v13 + v16) = v22->var2 | 0x80000000;
          }

          ++v16;
          ++v15;
        }

        while (v12 != v15);
        uint64_t v23 = 4LL * v16;
      }

      else
      {
        uint64_t v14 = 0LL;
        uint64_t v23 = 0LL;
      }

      +[VMUDirectedGraph _archivedBytes:length:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_archivedBytes:length:options:",  v14,  v23,  a4);
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 setObject:v24 forKeyedSubscript:@"compactEdgeList"];

      if (v14) {
        free(v14);
      }
    }
  }

  if (self->_nodeCount != self->_nextNodeName)
  {
    +[VMUDirectedGraph _archivedBytes:length:options:](&OBJC_CLASS___VMUDirectedGraph, "_archivedBytes:length:options:");
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v25 forKeyedSubscript:@"deadNodes"];

    if (kVMUPrintArchivingTiming)
    {
      deadNodes = (unsigned int *)self->_deadNodes;
      unint64_t v27 = *deadNodes;
      if ((_DWORD)v27)
      {
        unint64_t v28 = 0LL;
        int v29 = 0;
        unsigned int v30 = (unsigned __int8 *)(deadNodes + 1);
        do
        {
          unsigned int v31 = *v30++;
          uint8x8_t v32 = (uint8x8_t)vcnt_s8((int8x8_t)v31);
          v32.i16[0] = vaddlv_u8(v32);
          v29 += v32.i32[0];
          v28 += 8LL;
        }

        while (v28 < v27);
      }

      else
      {
        int v29 = 0;
      }

      fprintf((FILE *)*MEMORY[0x1895F89D0], "[Dead Nodes Marking Map] Count: %u\n\n", v29);
    }
  }

  [MEMORY[0x189607968] numberWithBool:self->_inverted];
  unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v33 forKeyedSubscript:@"inverted"];

  [v34 setObject:v6 forKeyedSubscript:@"directedGraphInfo"];
}

- (id)plistRepresentationWithOptions:(unint64_t)a3
{
  return -[VMUDirectedGraph plistRepresentationWithOptions:fromOriginalMemgraph:]( self,  "plistRepresentationWithOptions:fromOriginalMemgraph:",  a3,  0LL);
}

- (id)plistRepresentationWithOptions:(unint64_t)a3 fromOriginalMemgraph:(id)a4
{
  id v6 = a4;
  int v7 = (void *)MEMORY[0x186E32E40]();
  [MEMORY[0x189603FC8] dictionary];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInteger:self->_graphVersion];
  char v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setObject:v9 forKeyedSubscript:@"graphEncodingVersion"];

  [MEMORY[0x189607968] numberWithInteger:self->_graphCompatibilityVersion];
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setObject:v10 forKeyedSubscript:@"graphCompatibilityVersion"];

  [MEMORY[0x189607968] numberWithBool:self->_graphIs64bit];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setObject:v11 forKeyedSubscript:@"graphIs64bit"];

  [MEMORY[0x189607968] numberWithUnsignedInt:self->_nodeCount];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setObject:v12 forKeyedSubscript:@"nodes"];

  [MEMORY[0x189607968] numberWithUnsignedInt:self->_nextNodeName];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setObject:v13 forKeyedSubscript:@"nodeNamespaceSize"];

  if ((a3 & 2) == 0)
  {
    [MEMORY[0x189607968] numberWithUnsignedInt:self->_externalEdges];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setObject:v14 forKeyedSubscript:@"edges"];
  }

  [MEMORY[0x189607968] numberWithUnsignedInt:self->_nextEdgeName];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setObject:v15 forKeyedSubscript:@"edgeNamespaceSize"];

  [MEMORY[0x189607968] numberWithUnsignedInteger:a3];
  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setObject:v16 forKeyedSubscript:@"options"];

  [MEMORY[0x189603FC8] dictionary];
  int v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMUDirectedGraph archiveDictionaryRepresentation:options:]( self,  "archiveDictionaryRepresentation:options:",  v17,  a3);
  [v8 setObject:v17 forKeyedSubscript:@"details"];
  additionalProperties = self->_additionalProperties;
  if (additionalProperties) {
    [v8 setObject:additionalProperties forKeyedSubscript:@"additionalProperties"];
  }
  if (!v6) {
    goto LABEL_9;
  }
  unint64_t v19 = (void *)MEMORY[0x1896079E8];
  -[VMUDirectedGraph decapsulatePlistData:error:](self, "decapsulatePlistData:error:", v6, 0LL);
  BOOL v20 = (void *)objc_claimAutoreleasedReturnValue();
  id v41 = 0LL;
  [v19 propertyListWithData:v20 options:0 format:0 error:&v41];
  unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue();
  id v22 = v41;

  if (!v21)
  {
    [v22 localizedFailureReason];
    int v29 = (void *)objc_claimAutoreleasedReturnValue();
    id v35 =  VMUDirectedGraphErrorWithExtraUserInfo( 1u,  0LL,  @"Unable to deserialize the memgraph %@",  v30,  v31,  v32,  v33,  v34,  (uint64_t)v29);

LABEL_12:
    unint64_t v28 = 0LL;
    goto LABEL_13;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v36 =  VMUDirectedGraphErrorWithExtraUserInfo( 1u,  0LL,  @"File does not contain a memory graph in the correct format",  v23,  v24,  v25,  v26,  v27,  v38);
    goto LABEL_12;
  }

  v39[0] = MEMORY[0x1895F87A8];
  v39[1] = 3221225472LL;
  v39[2] = __72__VMUDirectedGraph_plistRepresentationWithOptions_fromOriginalMemgraph___block_invoke;
  v39[3] = &unk_189DFF278;
  id v40 = v8;
  [v21 enumerateKeysAndObjectsUsingBlock:v39];

LABEL_9:
  [MEMORY[0x1896079E8] dataWithPropertyList:v8 format:200 options:0 error:0];
  unint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  objc_autoreleasePoolPop(v7);
  return v28;
}

void __72__VMUDirectedGraph_plistRepresentationWithOptions_fromOriginalMemgraph___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v7 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v7];
  }
}

- (void)dealloc
{
  deadNodes = self->_deadNodes;
  if (deadNodes)
  {
    free(deadNodes);
    self->_deadNodes = 0LL;
  }

  nodeAdjIndex = self->_nodeAdjIndex;
  if (nodeAdjIndex)
  {
    free(nodeAdjIndex);
    self->_nodeAdjIndex = 0LL;
  }

  edges = self->_edges;
  if (edges)
  {
    free(edges);
    self->_edges = 0LL;
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___VMUDirectedGraph;
  -[VMUDirectedGraph dealloc](&v6, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [objc_alloc((Class)objc_opt_class()) initWithNodes:self->_nextNodeName];
  *(_DWORD *)(v4 + 24) = self->_nodeCount;
  deadNodes = (unsigned int *)self->_deadNodes;
  if (deadNodes)
  {
    unsigned int v6 = *deadNodes;
    id v7 = calloc(1uLL, ((*deadNodes + 7) >> 3) + 4);
    *id v7 = v6;
    *(void *)(v4 + 40) = v7;
    uint64_t v8 = (unsigned int *)self->_deadNodes;
    unsigned int v9 = *v8;
    if (v6 < *v8) {
      unsigned int v9 = v6;
    }
    unint64_t v10 = v9 + 7;
    if (v10 >= 8)
    {
      id v11 = (char *)(v8 + 1);
      uint64_t v12 = v7 + 1;
      unint64_t v13 = v10 >> 3;
      do
      {
        char v14 = *v11++;
        *v12++ |= v14;
        --v13;
      }

      while (v13);
    }
  }

  unsigned int edgeCount = self->_edgeCount;
  *(_DWORD *)(v4 + 28) = edgeCount;
  *(_DWORD *)(v4 + 32) = edgeCount;
  *(_DWORD *)(v4 + 36) = self->_externalEdges;
  *(_DWORD *)(v4 + 52) = self->_nextEdgeName;
  size_t v16 = 12LL * self->_edgeCount;
  int v17 = malloc(v16);
  *(void *)(v4 + 64) = v17;
  memcpy(v17, self->_edges, v16);
  *(void *)(v4 + 80) = -1LL;
  uint64_t v18 = -[NSDictionary copy](self->_additionalProperties, "copy");
  unint64_t v19 = *(void **)(v4 + 72);
  *(void *)(v4 + 72) = v18;

  *(_BYTE *)(v4 + 92) = self->_inverted;
  *(_BYTE *)(v4 + 93) = self->_graphIs64bit;
  return (id)v4;
}

- (unsigned)addNode
{
  unsigned int nextNodeName = self->_nextNodeName;
  self->_unsigned int nextNodeName = nextNodeName + 1;
  return nextNodeName;
}

- (void)_internalAddEdgeFromNode:(unsigned int)a3 toNode:(unsigned int)a4 withName:
{
  if (result)
  {
    id v7 = result;
    unsigned int v8 = *((_DWORD *)result + 7);
    uint64_t v9 = *((unsigned int *)result + 8);
    if (v8 >= v9)
    {
      LODWORD(v10) = 2 * v9;
      else {
        unint64_t v10 = v10;
      }
      unint64_t v11 = v9 + 174762;
      if (v11 >= v10) {
        unint64_t v12 = v10;
      }
      else {
        unint64_t v12 = v11;
      }
      uint64_t result = (void **)realloc(result[8], 12 * v12);
      v7[8] = result;
      if (!result)
      {
        NSLog( @"Out of memory: failed to expand references array from %u to %u edges",  *((unsigned int *)v7 + 8),  v12);
        abort();
      }

      *((_DWORD *)v7 + 8) = v12;
      unsigned int v8 = *((_DWORD *)v7 + 7);
    }

    else
    {
      uint64_t result = (void **)result[8];
    }

    if (*((_BYTE *)v7 + 92)) {
      unsigned int v13 = a2;
    }
    else {
      unsigned int v13 = a3;
    }
    if (*((_BYTE *)v7 + 92)) {
      unsigned int v14 = a3;
    }
    else {
      unsigned int v14 = a2;
    }
    uint64_t v15 = (unsigned int *)result + 3 * v8;
    unsigned int *v15 = a4;
    v15[1] = v14;
    v15[2] = v13;
    ++*((_DWORD *)v7 + 7);
    if (a4 <= 0xFFFFFFFA) {
      ++*((_DWORD *)v7 + 9);
    }
  }

  return result;
}

- (unsigned)addEdgeFromNode:(unsigned int)a3 toNode:(unsigned int)a4
{
  unsigned int nextNodeName = self->_nextNodeName;
  if (nextNodeName <= a3 || nextNodeName <= a4) {
    return -1;
  }
  deadNodes = (unsigned int *)self->_deadNodes;
  if (deadNodes)
  {
    if (*deadNodes > a3 && ((*((unsigned __int8 *)deadNodes + (a3 >> 3) + 4) >> (a3 & 7)) & 1) != 0
      || *deadNodes > a4 && ((*((unsigned __int8 *)deadNodes + (a4 >> 3) + 4) >> (a4 & 7)) & 1) != 0)
    {
      return -1;
    }
  }

  if (self->_inverted) {
    unsigned int v9 = a4;
  }
  else {
    unsigned int v9 = a3;
  }
  if (!self->_inverted) {
    a3 = a4;
  }
  -[VMUDirectedGraph _internalAddEdgeFromNode:toNode:withName:]((void **)&self->super.isa, v9, a3, self->_nextEdgeName);
  unsigned int result = self->_nextEdgeName;
  self->_nextEdgeName = result + 1;
  return result;
}

- (void)_removeEdges:(id)a3
{
  int v17 = (unsigned int (**)(id, void, unint64_t))a3;
  if (v17)
  {
    unsigned int edgeCount = self->_edgeCount;
    if (edgeCount)
    {
      for (unsigned int i = 0; i < edgeCount; ++i)
      {
        id v7 = &self->_edges[i];
        unint64_t v3 = v3 & 0xFFFFFFFF00000000LL | v7->var2;
        if (v17[2](v17, *(void *)&v7->var0, v3))
        {
          edges = self->_edges;
          unsigned int v9 = &edges[i];
          if (v9->var0 <= 0xFFFFFFFA) {
            --self->_externalEdges;
          }
          unsigned int v10 = self->_edgeCount - 1;
          self->_unsigned int edgeCount = v10;
          uint64_t v11 = *(void *)&v9->var0;
          unsigned int var2 = v9->var2;
          unsigned int v13 = &edges[v10];
          unsigned int v14 = v13->var2;
          *(void *)&v9->var0 = *(void *)&v13->var0;
          v9->unsigned int var2 = v14;
          uint64_t v15 = &self->_edges[self->_edgeCount];
          v15->unsigned int var2 = var2;
          *(void *)&v15->var0 = v11;
          --i;
        }

        unsigned int edgeCount = self->_edgeCount;
      }
    }

    if (edgeCount < self->_edgeCapacity >> 1)
    {
      unsigned int v16 = ((double)edgeCount * 1.05);
      self->_edgeCapacity = v16;
      self->_edges = (_VMUDirectedGraphEdge *)realloc(self->_edges, 12LL * v16);
    }
  }
}

- (void)_faultDeadNodeMap
{
  deadNodes = (unsigned int *)self->_deadNodes;
  if (deadNodes)
  {
    unsigned int v5 = *deadNodes;
    unsigned int nextNodeName = self->_nextNodeName;
    if (v5 >= nextNodeName) {
      return;
    }
    unsigned int v7 = ((double)nextNodeName * 1.25);
    unsigned int v8 = calloc(1uLL, ((v7 + 7) >> 3) + 4);
    *unsigned int v8 = v7;
    unsigned int v9 = (unsigned int *)self->_deadNodes;
    unsigned int v10 = *v9;
    if (v7 < *v9) {
      unsigned int v10 = v7;
    }
    unint64_t v11 = v10 + 7;
    if (v11 >= 8)
    {
      unint64_t v12 = (char *)(v9 + 1);
      unsigned int v13 = v8 + 1;
      unint64_t v14 = v11 >> 3;
      do
      {
        char v15 = *v12++;
        *v13++ |= v15;
        --v14;
      }

      while (v14);
      unsigned int v9 = (unsigned int *)self->_deadNodes;
    }

    free(v9);
  }

  else
  {
    LODWORD(v2) = self->_nextNodeName;
    unsigned int v16 = ((double)v2 * 1.05);
    unsigned int v8 = calloc(1uLL, ((v16 + 7) >> 3) + 4);
    *unsigned int v8 = v16;
  }

  self->_deadNodes = v8;
}

- (void)deadNodeMap
{
  return self->_deadNodes;
}

- (void)removeMarkedNodes:(void *)a3
{
  if (a3)
  {
    -[VMUDirectedGraph _faultDeadNodeMap](self, "_faultDeadNodeMap");
    unsigned int nextNodeName = self->_nextNodeName;
    unsigned int v6 = (unsigned __int8 *)calloc(1uLL, ((nextNodeName + 7) >> 3) + 4);
    unsigned int v7 = v6;
    *(_DWORD *)unsigned int v6 = nextNodeName;
    unsigned int v8 = *(_DWORD *)a3;
    if (nextNodeName < *(_DWORD *)a3) {
      unsigned int v8 = nextNodeName;
    }
    unint64_t v9 = v8 + 7;
    if (v9 >= 8)
    {
      unsigned int v10 = (char *)a3 + 4;
      unint64_t v11 = v6 + 4;
      unint64_t v12 = v9 >> 3;
      do
      {
        char v13 = *v10++;
        *v11++ |= v13;
        --v12;
      }

      while (v12);
    }

    deadNodes = self->_deadNodes;
    int v15 = *deadNodes;
    unint64_t v16 = (*deadNodes + 7);
    if (v16 >= 8)
    {
      int v17 = deadNodes + 1;
      uint64_t v18 = v16 >> 3;
      if (v16 >> 3 <= 1) {
        uint64_t v18 = 1LL;
      }
      do
      {
        *int v17 = ~*v17;
        ++v17;
        --v18;
      }

      while (v18);
    }

    int v19 = v15 & 7;
    if (v19) {
      *((_BYTE *)deadNodes + (v16 >> 3) + 3) ^= -1 << v19;
    }
    BOOL v20 = self->_deadNodes;
    int v21 = *(_DWORD *)v6;
    int v22 = *v20;
    if (*(_DWORD *)v6 >= *v20) {
      int v21 = *v20;
    }
    unint64_t v23 = (v21 + 7);
    if (v23 >= 8)
    {
      uint64_t v24 = v6 + 4;
      uint64_t v25 = (char *)(v20 + 1);
      unint64_t v26 = v23 >> 3;
      do
      {
        char v27 = *v25++;
        *v24++ &= v27;
        --v26;
      }

      while (v26);
      BOOL v20 = self->_deadNodes;
      int v22 = *v20;
    }

    unint64_t v28 = (v22 + 7);
    if (v28 >= 8)
    {
      int v29 = v20 + 1;
      uint64_t v30 = v28 >> 3;
      if (v28 >> 3 <= 1) {
        uint64_t v30 = 1LL;
      }
      do
      {
        *int v29 = ~*v29;
        ++v29;
        --v30;
      }

      while (v30);
    }

    int v31 = v22 & 7;
    if (v31) {
      *((_BYTE *)v20 + (v28 >> 3) + 3) ^= -1 << v31;
    }
    unint64_t edgeCount = self->_edgeCount;
    if ((_DWORD)edgeCount)
    {
      uint64_t v33 = 0LL;
      for (unint64_t i = 0LL; i < edgeCount; ++i)
      {
        edges = self->_edges;
        if (edges[v33].var0 == -3)
        {
          unint64_t var2 = edges[v33].var2;
          if (*(_DWORD *)v6 > var2 && ((v6[(var2 >> 3) + 4] >> (var2 & 7)) & 1) != 0)
          {
            unint64_t var1 = edges[v33].var1;
            if (*(_DWORD *)v6 > var1)
            {
              v6[(var1 >> 3) + 4] |= 1 << (var1 & 7);
              unint64_t edgeCount = self->_edgeCount;
            }
          }
        }

        ++v33;
      }
    }

    v48[0] = MEMORY[0x1895F87A8];
    v48[1] = 3221225472LL;
    v48[2] = __38__VMUDirectedGraph_removeMarkedNodes___block_invoke;
    v48[3] = &__block_descriptor_40_e34_B20__0__VMUDirectedGraphEdge_III_8l;
    v48[4] = v6;
    -[VMUDirectedGraph _removeEdges:](self, "_removeEdges:", v48);
    uint64_t v39 = self->_deadNodes;
    int v40 = *v39;
    if (*v39 >= *(_DWORD *)v7) {
      int v40 = *(_DWORD *)v7;
    }
    unint64_t v41 = (v40 + 7);
    if (v41 >= 8)
    {
      int v42 = 0;
      uint64_t v43 = v7 + 4;
      uint64_t v44 = (unsigned __int8 *)(v39 + 1);
      unint64_t v45 = v41 >> 3;
      do
      {
        int v46 = *v43++;
        int v47 = *v44;
        v38.i32[0] = v46 & ~v47;
        int8x8_t v38 = vcnt_s8(v38);
        v38.i16[0] = vaddlv_u8((uint8x8_t)v38);
        v42 += v38.i32[0];
        *v44++ = v47 | v46;
        --v45;
      }

      while (v45);
    }

    else
    {
      int v42 = 0;
    }

    self->_nodeCount -= v42;
    free(v7);
    if (self->_insideSearch) {
      [MEMORY[0x189603F70] raise:@"VMUDestructiveMutationWhileEnumeratingException" format:@"Destructive mutation attempted while traversing graph!"];
    }
    else {
      self->_indexedEdges = -1;
    }
  }

uint64_t __38__VMUDirectedGraph_removeMarkedNodes___block_invoke(uint64_t a1, uint64_t a2, unsigned int a3)
{
  unint64_t v3 = *(unsigned int **)(a1 + 32);
  if (*v3 <= a3) {
    return 0LL;
  }
  return (*((unsigned __int8 *)v3 + (a3 >> 3) + 4) >> (a3 & 7)) & 1;
}

- (void)removeMarkedEdges:(void *)a3
{
  if (a3)
  {
    v4[0] = MEMORY[0x1895F87A8];
    v4[1] = 3221225472LL;
    v4[2] = __38__VMUDirectedGraph_removeMarkedEdges___block_invoke;
    v4[3] = &__block_descriptor_40_e34_B20__0__VMUDirectedGraphEdge_III_8l;
    v4[4] = a3;
    -[VMUDirectedGraph _removeEdges:](self, "_removeEdges:", v4);
    if (self->_insideSearch) {
      [MEMORY[0x189603F70] raise:@"VMUDestructiveMutationWhileEnumeratingException" format:@"Destructive mutation attempted while traversing graph!"];
    }
    else {
      self->_indexedEdges = -1;
    }
  }

uint64_t __38__VMUDirectedGraph_removeMarkedEdges___block_invoke(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = *(unsigned int **)(a1 + 32);
  if (*v2 <= a2) {
    return 0LL;
  }
  else {
    return (*((unsigned __int8 *)v2 + (a2 >> 3) + 4) >> (a2 & 7)) & 1;
  }
}

- (BOOL)isNodePresent:(unsigned int)a3
{
  if (self->_nextNodeName <= a3) {
    return 0;
  }
  deadNodes = (unsigned int *)self->_deadNodes;
  return !deadNodes
      || *deadNodes <= a3
      || ((*((unsigned __int8 *)deadNodes + (a3 >> 3) + 4) >> (a3 & 7)) & 1) == 0
      || -[VMUDirectedGraph parentGroupForNode:](self, "parentGroupForNode:") != -1;
}

- (unsigned)addGroupNodeForNodes:(const unsigned int *)a3 count:(unsigned int)a4
{
  unsigned int nextNodeName = -1;
  if (a3 && a4 >= 2)
  {
    unsigned int v5 = (unsigned int *)a3;
    uint64_t v7 = 0LL;
    unsigned int nextNodeName = self->_nextNodeName;
    uint64_t v8 = a4;
    uint64_t v9 = a4;
    unsigned int v10 = a3;
    while (1)
    {
      unsigned int v12 = *v10++;
      unint64_t v11 = v12;
      if (v12 < nextNodeName)
      {
        deadNodes = self->_deadNodes;
        if (!deadNodes
          || *deadNodes <= v11
          || ((*((unsigned __int8 *)deadNodes + (v11 >> 3) + 4) >> (v11 & 7)) & 1) == 0)
        {
          break;
        }
      }

      uint64_t v14 = v7;
LABEL_10:
      uint64_t v7 = v14;
      if (!--v9) {
        return -1;
      }
    }

    uint64_t v14 = 1LL;
    if (!(_DWORD)v7) {
      goto LABEL_10;
    }
    ++self->_nodeCount;
    self->_unsigned int nextNodeName = nextNodeName + 1;
    -[VMUDirectedGraph _faultDeadNodeMap](self, "_faultDeadNodeMap");
    while (1)
    {
      unint64_t v15 = *v5;
      if (v15 < self->_nextNodeName)
      {
        unint64_t v16 = self->_deadNodes;
        uint64_t v17 = (v15 >> 3) + 4;
        int v18 = *((unsigned __int8 *)v16 + v17);
        int v19 = 1 << (v15 & 7);
        if ((v19 & v18) == 0) {
          break;
        }
      }

- (void)ungroupNode:(unsigned int)a3
{
  deadNodes = (unsigned int *)self->_deadNodes;
  if (deadNodes
    && self->_nextNodeName > a3
    && (*deadNodes <= a3 || ((*((unsigned __int8 *)deadNodes + (a3 >> 3) + 4) >> (a3 & 7)) & 1) == 0))
  {
    uint64_t v9 = 0LL;
    unsigned int v10 = &v9;
    uint64_t v11 = 0x2020000000LL;
    char v12 = 0;
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __32__VMUDirectedGraph_ungroupNode___block_invoke;
    v7[3] = &unk_189E00588;
    unsigned int v8 = a3;
    v7[4] = self;
    v7[5] = &v9;
    -[VMUDirectedGraph _removeEdges:](self, "_removeEdges:", v7);
    if (*((_BYTE *)v10 + 24))
    {
      unsigned int v6 = (unsigned int *)self->_deadNodes;
      if (*v6 > a3) {
        *((_BYTE *)v6 + (a3 >> 3) + 4) |= 1 << (a3 & 7);
      }
      --self->_nodeCount;
      if (self->_insideSearch) {
        [MEMORY[0x189603F70] raise:@"VMUDestructiveMutationWhileEnumeratingException" format:@"Destructive mutation attempted while traversing graph!"];
      }
      else {
        self->_indexedEdges = -1;
      }
    }

    _Block_object_dispose(&v9, 8);
  }

uint64_t __32__VMUDirectedGraph_ungroupNode___block_invoke(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (__PAIR64__(*(_DWORD *)(a1 + 48), -2) != a2) {
    return 0LL;
  }
  unint64_t v3 = *(unsigned int **)(*(void *)(a1 + 32) + 40LL);
  if (*v3 > a3) {
    *((_BYTE *)v3 + (a3 >> 3) + 4) &= ~(1 << (a3 & 7));
  }
  uint64_t v4 = 1LL;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  ++*(_DWORD *)(*(void *)(a1 + 32) + 24LL);
  return v4;
}

- (void)setInverted:(BOOL)a3
{
  self->_inverted = a3;
  if (self->_insideSearch) {
    [MEMORY[0x189603F70] raise:@"VMUDestructiveMutationWhileEnumeratingException" format:@"Destructive mutation attempted while traversing graph!"];
  }
  else {
    self->_indexedEdges = -1;
  }
}

- (BOOL)inverted
{
  return self->_inverted;
}

- (unsigned)pointerSize
{
  if (self->_graphIs64bit) {
    return 8;
  }
  else {
    return 4;
  }
}

- (BOOL)_adjustAdjacencyMap
{
  unsigned int nextNodeName = self->_nextNodeName;
  if (nextNodeName)
  {
    unsigned int indexedNodeSpace = self->_indexedNodeSpace;
    if (indexedNodeSpace < nextNodeName || indexedNodeSpace == -1)
    {
      self->_unsigned int indexedNodeSpace = nextNodeName;
      BOOL v6 = -[VMUDirectedGraph graphIs64bit](self, "graphIs64bit");
      uint64_t v7 = self->_indexedNodeSpace;
      if (!v6 && v7 >= 0x3FFFFFFF)
      {
        NSLog(@"Memory graph has bizarrely high %s count %zu\n", "node", v7);
        return 0;
      }

      nodeAdjIndex = (unsigned int *)realloc(self->_nodeAdjIndex, 4 * v7);
      self->_nodeAdjIndex = nodeAdjIndex;
      unsigned int indexedNodeSpace = self->_indexedNodeSpace;
    }

    else
    {
      nodeAdjIndex = self->_nodeAdjIndex;
    }

    bzero(nodeAdjIndex, 4LL * indexedNodeSpace);
    if (self->_edgeCount)
    {
      unint64_t v10 = 0LL;
      int v11 = 0;
      p_uint64_t var1 = &self->_edges->var1;
      do
      {
        int v13 = *(p_var1 - 1);
        if (v13 != -3)
        {
          if (v13 == -2)
          {
            v11 += 3;
            uint64_t v14 = self->_nodeAdjIndex;
            unint64_t v15 = p_var1 + 1;
            ++v14[*p_var1];
            int v16 = 2;
          }

          else
          {
            uint64_t v14 = self->_nodeAdjIndex;
            if (self->_inverted) {
              unint64_t v15 = p_var1 + 1;
            }
            else {
              unint64_t v15 = p_var1;
            }
            int v16 = 1;
          }

          v14[*v15] += v16;
        }

        p_var1 += 3;
        ++v10;
        unint64_t edgeCount = self->_edgeCount;
      }

      while (v10 < edgeCount);
    }

    else
    {
      int v11 = 0;
      LODWORD(edgeCount) = 0;
    }

    uint64_t v18 = self->_externalEdges + v11;
    else {
      unsigned int edgeCapacity = self->_edgeCapacity;
    }
    self->_unsigned int edgeCapacity = edgeCapacity;
    if (edgeCapacity) {
      BOOL v20 = 1;
    }
    else {
      BOOL v20 = (edgeCount | v11) == 0;
    }
    if (!v20) {
      -[VMUDirectedGraph _adjustAdjacencyMap].cold.1();
    }
    if (self->_indexedNodeSpace)
    {
      unint64_t v21 = 0LL;
      unsigned int v22 = 0;
      unint64_t v23 = self->_nodeAdjIndex;
      do
      {
        v22 += v23[v21];
        v23[v21++] = v22;
      }

      while (v21 < self->_indexedNodeSpace);
      unsigned int edgeCapacity = self->_edgeCapacity;
    }

    if (edgeCapacity) {
      uint64_t v24 = (_VMUDirectedGraphEdge *)malloc(12LL * edgeCapacity);
    }
    else {
      uint64_t v24 = 0LL;
    }
    unsigned int v25 = self->_edgeCount;
    if (v25)
    {
      unsigned int v26 = 0;
      edges = self->_edges;
      int v28 = -1;
      do
      {
        unsigned int v29 = v25 + v28;
        uint64_t v30 = &edges[v25 + v28];
        if (v30->var0 != -3)
        {
          if (v30->var0 == -2)
          {
            int v31 = self->_nodeAdjIndex;
            uint64_t v32 = &edges[v29];
            uint64_t var1 = v32->var1;
            unsigned int v34 = v31[var1] - 1;
            v31[var1] = v34;
            id v35 = &v24[v34];
            uint64_t v36 = *(void *)&v30->var0;
            v35->uint64_t var2 = v30->var2;
            *(void *)&v35->var0 = v36;
            LODWORD(v35) = v32->var1;
            uint64_t var2 = v32->var2;
            LODWORD(v36) = v31[var2] - 1;
            v31[var2] = v36;
            int8x8_t v38 = &v24[v36];
            v38->var0 = -3;
            v38->uint64_t var1 = var2;
            v38->uint64_t var2 = v35;
            uint64_t v39 = v32->var2;
            LODWORD(v38) = v31[v39] - 1;
            v31[v39] = v38;
            int v40 = &v24[v38];
            v40->var0 = -3;
            v40->uint64_t var1 = var2;
            v40->uint64_t var2 = v35;
          }

          else
          {
            unint64_t v41 = self->_nodeAdjIndex;
            int v42 = &edges[v29];
            p_uint64_t var2 = &v42->var2;
            uint64_t v44 = &v42->var1;
            if (self->_inverted) {
              uint64_t v44 = p_var2;
            }
            uint64_t v45 = *v44;
            unsigned int v46 = v41[v45] - 1;
            v41[v45] = v46;
            int v47 = &v24[v46];
            uint64_t v48 = *(void *)&v30->var0;
            v47->uint64_t var2 = v30->var2;
            *(void *)&v47->var0 = v48;
          }
        }

        ++v26;
        unsigned int v25 = self->_edgeCount;
        --v28;
      }

      while (v26 < v25);
    }

    self->_unint64_t edgeCount = v18;
    if (v11 && (_DWORD)v18)
    {
      uint64_t v49 = 0LL;
      int v50 = 0;
      unsigned int v51 = 0;
      BOOL inverted = self->_inverted;
      uint64_t v53 = &v24->var1;
      do
      {
        unint64_t v54 = v53;
        if (inverted)
        {
          unint64_t v54 = &v24[v49].var2;
          if (*(v53 - 1) > 0xFFFFFFFA) {
            unint64_t v54 = v53;
          }
        }

        unsigned int v55 = *v54;
        if (v51 == v55)
        {
          uint64_t v56 = v53 - 1;
          if (*(v53 - 1) == -3)
          {
            unsigned int v72 = v53[1];
            uint64_t v71 = *(void *)v56;
            __int128 v57 = &v24[v50];
            uint64_t v58 = *(void *)&v57->var0;
            v53[1] = v57->var2;
            *(void *)uint64_t v56 = v58;
            *(void *)&v57->var0 = v71;
            v57->uint64_t var2 = v72;
            ++v50;
          }
        }

        else
        {
          unsigned int v51 = v55;
          int v50 = v49;
        }

        ++v49;
        v53 += 3;
      }

      while (v18 != v49);
      for (uint64_t i = 0LL; i != v18; ++i)
      {
        if (v24[i].var0 == -3 && v24[i].var1 != -1)
        {
          deadNodes = (unsigned int *)self->_deadNodes;
          unint64_t v61 = *deadNodes;
          uint64_t v62 = &v24[i];
          unsigned int v65 = v62->var2;
          uint64_t v63 = &v62->var2;
          unint64_t v64 = v65;
          if (v61 > v65)
          {
            unint64_t v66 = v64;
            do
            {
              unint64_t v66 = v24[self->_nodeAdjIndex[v66]].var2;
            }

            while (v61 > v66);
            while (v61 > v64 && ((*((unsigned __int8 *)deadNodes + (v64 >> 3) + 4) >> (v64 & 7)) & 1) != 0)
            {
              unsigned int v67 = self->_nodeAdjIndex[v64];
              *uint64_t v63 = v66;
              id v68 = &v24[v67];
              unsigned int v69 = v68->var2;
              uint64_t v63 = &v68->var2;
              unint64_t v64 = v69;
            }
          }
        }
      }
    }

    id v70 = self->_edges;
    if (v70)
    {
      free(v70);
      LODWORD(v18) = self->_edgeCount;
    }

    self->_edges = v24;
    self->_indexedEdges = v18;
  }

  else
  {
    self->_indexedEdges = 0;
  }

  return 1;
}

- (void)_renormalize
{
  unint64_t nextNodeName = self->_nextNodeName;
  uint64_t v4 = malloc(4 * nextNodeName);
  int __pattern4 = -1;
  memset_pattern4(v4, &__pattern4, 4 * nextNodeName);
  size_t v5 = 4LL * self->_nextEdgeName;
  BOOL v6 = malloc(v5);
  int v25 = -1;
  memset_pattern4(v6, &v25, v5);
  uint64_t v7 = calloc(1uLL, ((nextNodeName + 7) >> 3) + 4);
  *uint64_t v7 = nextNodeName;
  if (self->_edgeCount)
  {
    uint64_t v8 = 0LL;
    unint64_t v9 = 0LL;
    do
    {
      edges = self->_edges;
      unint64_t var1 = edges[v8].var1;
      if (nextNodeName > var1)
      {
        *((_BYTE *)v7 + (var1 >> 3) + 4) |= 1 << (var1 & 7);
        edges = self->_edges;
      }

      unint64_t var2 = edges[v8].var2;
      ++v9;
      ++v8;
    }

    while (v9 < self->_edgeCount);
  }

  uint64_t v13 = self->_nextNodeName;
  if ((_DWORD)v13)
  {
    unint64_t v14 = 0LL;
    uint64_t v15 = 0LL;
    deadNodes = (unsigned int *)self->_deadNodes;
    do
    {
      if (!deadNodes
        || v14 >= *deadNodes
        || (uint64_t v17 = (v14 >> 3) + 4LL,
            int v18 = 1 << (v14 & 7),
            (v18 & *((_BYTE *)deadNodes + v17)) == 0)
        || v14 < nextNodeName && (v18 & *((_BYTE *)v7 + v17)) != 0)
      {
        *((_DWORD *)v4 + v14) = v15;
        uint64_t v15 = (v15 + 1);
      }

      ++v14;
    }

    while (v13 != v14);
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  free(v7);
  uint64_t edgeCount = self->_edgeCount;
  if ((_DWORD)edgeCount)
  {
    uint64_t v20 = 0LL;
    unint64_t v21 = self->_edges;
    do
    {
      unsigned int var0 = v21->var0;
      ++v21;
      uint64_t v22 = var0;
      if (var0 <= 0xFFFFFFFA) {
        *((_DWORD *)v6 + v22) = v20;
      }
      ++v20;
    }

    while (edgeCount != v20);
  }

  -[VMUDirectedGraph _renameWithNodeMap:nodeNamespace:edgeMap:edgeNamespace:]( self,  "_renameWithNodeMap:nodeNamespace:edgeMap:edgeNamespace:",  v4,  v15,  v6,  self->_externalEdges);
  free(v4);
  free(v6);
  unsigned int externalEdges = self->_externalEdges;
  self->_unint64_t nextNodeName = v15;
  self->_nextEdgeName = externalEdges;
  if (self->_insideSearch) {
    [MEMORY[0x189603F70] raise:@"VMUDestructiveMutationWhileEnumeratingException" format:@"Destructive mutation attempted while traversing graph!"];
  }
  else {
    self->_indexedEdges = -1;
  }
}

- (void)_renameWithNodeMap:(unsigned int *)a3 nodeNamespace:(unsigned int)a4 edgeMap:(unsigned int *)a5 edgeNamespace:(unsigned int)a6
{
  if (self->_nextEdgeName != a6)
  {
    if (a6 <= 0x10) {
      unsigned int v10 = 16;
    }
    else {
      unsigned int v10 = a6;
    }
    self->_unsigned int edgeCapacity = v10;
    self->_edges = (_VMUDirectedGraphEdge *)realloc(self->_edges, 12LL * v10);
  }

  deadNodes = self->_deadNodes;
  if (deadNodes)
  {
    free(deadNodes);
    self->_deadNodes = 0LL;
  }

  if (self->_edgeCount)
  {
    uint64_t v12 = 0LL;
    unint64_t v13 = 0LL;
    do
    {
      edges = self->_edges;
      if (a3)
      {
        uint64_t v15 = &edges[v12];
        uint64_t var2 = edges[v12].var2;
        v15->unint64_t var1 = a3[edges[v12].var1];
        v15->uint64_t var2 = a3[var2];
      }

      uint64_t var0 = edges[v12].var0;
      if (a5 && var0 <= 0xFFFFFFFA)
      {
        edges[v12].uint64_t var0 = a5[var0];
      }

      else if ((_DWORD)var0 == -2)
      {
        int v18 = (unsigned int *)self->_deadNodes;
        if (v18)
        {
          unsigned int v19 = *v18;
        }

        else
        {
          int v18 = (unsigned int *)calloc(1uLL, ((a4 + 7) >> 3) + 4);
          *int v18 = a4;
          self->_deadNodes = v18;
          edges = self->_edges;
          unsigned int v19 = a4;
        }

        unint64_t v20 = edges[v12].var2;
      }

      ++v13;
      ++v12;
    }

    while (v13 < self->_edgeCount);
  }

- (unsigned)enumerateNodesWithBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, uint64_t, unsigned __int8 *))a3;
  if (v4)
  {
    int insideSearch = self->_insideSearch;
    if (!insideSearch)
    {
      unsigned int indexedEdges = self->_indexedEdges;
      BOOL v7 = indexedEdges != -1 && indexedEdges >= self->_edgeCount;
      if (v7 && self->_indexedNodeSpace >= self->_nextNodeName)
      {
        int insideSearch = 0;
      }

      else
      {
        -[VMUDirectedGraph _adjustAdjacencyMap](self, "_adjustAdjacencyMap");
        int insideSearch = self->_insideSearch;
      }
    }

    self->_int insideSearch = insideSearch + 1;
    unsigned __int8 v16 = 0;
    unsigned int indexedNodeSpace = self->_indexedNodeSpace;
    if (indexedNodeSpace)
    {
      unsigned int nodeCount = 0;
      unsigned int v10 = 1;
      do
      {
        uint64_t v11 = v10 - 1;
        deadNodes = self->_deadNodes;
        if (deadNodes
          && *deadNodes > v11
          && ((*((unsigned __int8 *)deadNodes + ((v10 - 1) >> 3) + 4) >> ((v10 - 1) & 7)) & 1) != 0)
        {
          int v13 = 0;
        }

        else
        {
          v4[2](v4, v11, &v16);
          ++nodeCount;
          unsigned int indexedNodeSpace = self->_indexedNodeSpace;
          int v13 = v16;
        }

        BOOL v7 = v10++ >= indexedNodeSpace;
      }

      while (!v7 && v13 == 0);
      int insideSearch = self->_insideSearch - 1;
    }

    else
    {
      unsigned int nodeCount = 0;
    }

    self->_int insideSearch = insideSearch;
  }

  else
  {
    unsigned int nodeCount = self->_nodeCount;
  }

  return nodeCount;
}

- (unsigned)reverseEnumerateNodesWithBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, uint64_t, char *))a3;
  if (v4)
  {
    LODWORD(v5) = self->_indexedNodeSpace;
    if ((_DWORD)v5)
    {
      int insideSearch = self->_insideSearch;
      if (!insideSearch)
      {
        unsigned int indexedEdges = self->_indexedEdges;
        if (indexedEdges == -1 || indexedEdges < self->_edgeCount || v5 < self->_nextNodeName)
        {
          -[VMUDirectedGraph _adjustAdjacencyMap](self, "_adjustAdjacencyMap");
          int insideSearch = self->_insideSearch;
          LODWORD(v5) = self->_indexedNodeSpace;
        }

        else
        {
          int insideSearch = 0;
        }
      }

      unsigned int nodeCount = 0;
      self->_int insideSearch = insideSearch + 1;
      char v13 = 0;
LABEL_12:
      uint64_t v9 = (v5 - 1);
      while ((_DWORD)v9 != -1)
      {
        uint64_t v5 = v9;
        deadNodes = self->_deadNodes;
        if (deadNodes)
        {
          if (*deadNodes > v5)
          {
            unsigned int v11 = *((unsigned __int8 *)deadNodes + (v5 >> 3) + 4);
            uint64_t v9 = (v5 - 1);
            if (((v11 >> (v5 & 7)) & 1) != 0) {
              continue;
            }
          }
        }

        v4[2](v4, v5, &v13);
        ++nodeCount;
        if (!v13) {
          goto LABEL_12;
        }
        break;
      }

      --self->_insideSearch;
    }

    else
    {
      unsigned int nodeCount = 0;
    }
  }

  else
  {
    unsigned int nodeCount = self->_nodeCount;
  }

  return nodeCount;
}

- (unsigned)enumerateMembersOfGroupNode:(unsigned int)a3 withBlock:(id)a4
{
  uint64_t v6 = (uint64_t)a4;
  uint64_t v9 = (uint64_t (**)(void, void, void))v6;
  int insideSearch = self->_insideSearch;
  if (!insideSearch)
  {
    unsigned int indexedEdges = self->_indexedEdges;
    BOOL v12 = indexedEdges != -1 && indexedEdges >= self->_edgeCount;
    if (v12 && self->_indexedNodeSpace >= self->_nextNodeName)
    {
      int insideSearch = 0;
    }

    else
    {
      uint64_t v6 = -[VMUDirectedGraph _adjustAdjacencyMap](self, "_adjustAdjacencyMap");
      int insideSearch = self->_insideSearch;
    }
  }

  int v13 = 0;
  self->_int insideSearch = insideSearch + 1;
  unsigned __int8 v30 = 0;
  nodeAdjIndex = self->_nodeAdjIndex;
  uint64_t v15 = nodeAdjIndex[a3];
  unsigned int indexedNodeSpace = self->_indexedNodeSpace;
  if (indexedNodeSpace > a3)
  {
    p_unsigned int indexedEdges = &self->_indexedEdges;
    int v18 = &nodeAdjIndex[a3 + 1];
    if (a3 + 1 < indexedNodeSpace) {
      p_unsigned int indexedEdges = v18;
    }
    int v13 = *p_indexedEdges - v15;
  }

  unint64_t v19 = (v13 + v15);
  if (v15 >= v19)
  {
    unsigned int v21 = 0;
  }

  else
  {
    int v20 = 0;
    unsigned int v21 = 0;
    uint64_t v22 = v15;
    unint64_t v23 = v15 + 1;
    do
    {
      edges = self->_edges;
      if (!edges) {
        -[VMUDirectedGraph enumerateMembersOfGroupNode:withBlock:].cold.1(v6, v7, v8);
      }
      int v25 = &edges[v22];
      if (v25->var0 >= 0xFFFFFFFB || !self->_inverted) {
        uint64_t v27 = 8LL;
      }
      else {
        uint64_t v27 = 4LL;
      }
      if (v25->var0 == -2)
      {
        if (v9)
        {
          uint64_t v6 = ((uint64_t (**)(void, void, unsigned __int8 *))v9)[2]( v9,  *(unsigned int *)((char *)&v25->var0 + v27),  &v30);
          int v20 = v30;
        }

        ++v21;
        int v28 = v20;
      }

      else
      {
        int v28 = 0;
      }

      if (v23 >= v19) {
        break;
      }
      ++v22;
      ++v23;
    }

    while (!v28);
    int insideSearch = self->_insideSearch - 1;
  }

  self->_int insideSearch = insideSearch;

  return v21;
}

- (unsigned)parentGroupForNode:(unsigned int)a3
{
  int insideSearch = self->_insideSearch;
  if (!insideSearch)
  {
    unsigned int indexedEdges = self->_indexedEdges;
    BOOL v7 = indexedEdges != -1 && indexedEdges >= self->_edgeCount;
    if (v7 && self->_indexedNodeSpace >= self->_nextNodeName)
    {
      int insideSearch = 0;
    }

    else
    {
      -[VMUDirectedGraph _adjustAdjacencyMap](self, "_adjustAdjacencyMap");
      int insideSearch = self->_insideSearch;
    }
  }

  self->_int insideSearch = insideSearch + 1;
  unsigned int indexedNodeSpace = self->_indexedNodeSpace;
  if (indexedNodeSpace > a3
    && ((nodeAdjIndex = self->_nodeAdjIndex, a3 + 1 >= indexedNodeSpace)
      ? (p_unsigned int indexedEdges = &self->_indexedEdges)
      : (p_unsigned int indexedEdges = &nodeAdjIndex[a3 + 1]),
        (unsigned int v11 = nodeAdjIndex[a3], *p_indexedEdges - v11 >= 2)
     && (edges = self->_edges, unsigned int v13 = v11 + 1, edges[v13].var0 == -3)))
  {
    unsigned int result = edges[v13].var2;
  }

  else
  {
    unsigned int result = -1;
  }

  self->_int insideSearch = insideSearch;
  return result;
}

- (unsigned)edgeCount
{
  if (self->_deadNodes) {
    return -[VMUDirectedGraph enumerateEdgesWithBlock:](self, "enumerateEdgesWithBlock:", 0LL);
  }
  else {
    return self->_edgeCount;
  }
}

- (unsigned)enumerateEdgesWithBlock:(id)a3
{
  uint64_t v4 = (uint64_t)a3;
  BOOL v7 = (uint64_t (**)(void))v4;
  int insideSearch = self->_insideSearch;
  if (!insideSearch)
  {
    unsigned int indexedEdges = self->_indexedEdges;
    BOOL v10 = indexedEdges != -1 && indexedEdges >= self->_edgeCount;
    if (v10 && self->_indexedNodeSpace >= self->_nextNodeName)
    {
      int insideSearch = 0;
    }

    else
    {
      uint64_t v4 = -[VMUDirectedGraph _adjustAdjacencyMap](self, "_adjustAdjacencyMap");
      int insideSearch = self->_insideSearch;
    }
  }

  self->_int insideSearch = insideSearch + 1;
  unint64_t v11 = self->_indexedEdges;
  if (!(_DWORD)v11)
  {
    unsigned int v13 = 0;
    goto LABEL_52;
  }

  uint64_t v12 = 0LL;
  unsigned int v13 = 0;
  for (unint64_t i = 1LL; ; ++i)
  {
    edges = self->_edges;
    if (!edges) {
      -[VMUDirectedGraph enumerateMembersOfGroupNode:withBlock:].cold.1(v4, v5, var2);
    }
    BOOL inverted = self->_inverted;
    p_unint64_t var1 = &edges[v12].var1;
    unsigned int var0 = edges[v12].var0;
    BOOL v19 = var0 < 0xFFFFFFFB;
    BOOL v20 = !inverted || !v19;
    if (inverted && v19) {
      p_uint64_t var2 = &edges[v12].var2;
    }
    else {
      p_uint64_t var2 = &edges[v12].var1;
    }
    uint64_t v22 = *p_var2;
    if (v20) {
      p_unint64_t var1 = &edges[v12].var2;
    }
    uint64_t v23 = *p_var1;
    if (var0 == -2)
    {
      uint64_t var2 = v22;
    }

    else
    {
      nodeAdjIndex = self->_nodeAdjIndex;
      unsigned int indexedNodeSpace = self->_indexedNodeSpace;
      unint64_t v26 = v11;
      uint64_t v27 = nodeAdjIndex[v22];
      if (v26 == v27)
      {
LABEL_25:
        uint64_t var2 = v22;
      }

      else
      {
        uint64_t var2 = v22;
      }

      if (v23 < indexedNodeSpace)
      {
        unint64_t v28 = v11;
        uint64_t v29 = nodeAdjIndex[v23];
        if (v28 != v29 && edges[v29].var0 == -3)
        {
          unsigned int v30 = edges[v29].var2;
          goto LABEL_33;
        }
      }
    }

    unsigned int v30 = v23;
LABEL_33:
    if (v30 == (_DWORD)v23 && (_DWORD)var2 == (_DWORD)v22) {
      unsigned int v32 = edges[v12].var0;
    }
    else {
      unsigned int v32 = -4;
    }
    if ((_DWORD)var2 == v30) {
      uint64_t v5 = v32;
    }
    else {
      uint64_t v5 = var0;
    }
    if (v5 <= 0xFFFFFFFA)
    {
      if (v7)
      {
        uint64_t v4 = v7[2](v7);
        unint64_t v11 = self->_indexedEdges;
      }

      ++v13;
    }

    if (i >= v11) {
      break;
    }
    ++v12;
  }

  int insideSearch = self->_insideSearch - 1;
LABEL_52:
  self->_int insideSearch = insideSearch;

  return v13;
}

- (void)_internalAccessRawEdgesWithBlock:(id)a3
{
  id v4 = a3;
  int insideSearch = self->_insideSearch;
  id v8 = v4;
  if (!insideSearch)
  {
    unsigned int indexedEdges = self->_indexedEdges;
    BOOL v7 = indexedEdges != -1 && indexedEdges >= self->_edgeCount;
    if (v7 && self->_indexedNodeSpace >= self->_nextNodeName)
    {
      int insideSearch = 0;
    }

    else
    {
      -[VMUDirectedGraph _adjustAdjacencyMap](self, "_adjustAdjacencyMap");
      id v4 = v8;
      int insideSearch = self->_insideSearch;
    }
  }

  self->_int insideSearch = insideSearch + 1;
  (*((void (**)(id, _VMUDirectedGraphEdge *, void))v4 + 2))(v4, self->_edges, self->_indexedEdges);
  --self->_insideSearch;
}

- (unsigned)_internalEnumerateEdgesOfNode:(unsigned int)a3 withBlock:(id)a4
{
  unsigned int v4 = a3;
  unsigned int v71 = a3;
  uint64_t v6 = (uint64_t)a4;
  uint64_t v9 = (uint64_t (**)(void))v6;
  if (v4 == -1 || (unsigned int nextNodeName = self->_nextNodeName, nextNodeName <= v4))
  {
    unsigned int v13 = 0;
  }

  else
  {
    int insideSearch = self->_insideSearch;
    if (!insideSearch)
    {
      unsigned int indexedEdges = self->_indexedEdges;
      if (indexedEdges == -1 || indexedEdges < self->_edgeCount || self->_indexedNodeSpace < nextNodeName)
      {
        uint64_t v6 = -[VMUDirectedGraph _adjustAdjacencyMap](self, "_adjustAdjacencyMap");
        int insideSearch = self->_insideSearch;
      }

      else
      {
        int insideSearch = 0;
      }
    }

    self->_int insideSearch = insideSearch + 1;
    deadNodes = (unsigned int *)self->_deadNodes;
    if (deadNodes && *deadNodes > v4 && ((*((unsigned __int8 *)deadNodes + (v4 >> 3) + 4) >> (v4 & 7)) & 1) != 0)
    {
      unsigned int indexedNodeSpace = self->_indexedNodeSpace;
      unsigned int var2 = v4;
      if (indexedNodeSpace > v4)
      {
        nodeAdjIndex = self->_nodeAdjIndex;
        edges = self->_edges;
        BOOL v19 = v4 + 1 >= indexedNodeSpace ? &self->_indexedEdges : &nodeAdjIndex[v4 + 1];
        unsigned int var2 = v4;
        if (edges)
        {
          unsigned int v20 = *v19;
          unsigned int v21 = nodeAdjIndex[v4];
          unsigned int var2 = v4;
          if (v20 != v21)
          {
            unsigned int var2 = v4;
            if (edges[v21].var0 == -3) {
              unsigned int var2 = edges[v21].var2;
            }
          }
        }
      }

      if (var2 == v4) {
        unsigned int v4 = -1;
      }
      unsigned int v71 = v4;
    }

    unsigned int v22 = self->_indexedNodeSpace;
    if (v4 >= v22)
    {
      unsigned int v13 = 0;
    }

    else
    {
      uint64_t v23 = self->_nodeAdjIndex;
      if (v4 + 1 >= v22) {
        p_unsigned int indexedEdges = &self->_indexedEdges;
      }
      else {
        p_unsigned int indexedEdges = &v23[v4 + 1];
      }
      unsigned int v25 = *p_indexedEdges;
      unsigned int v26 = v23[v4];
      if (v25 - v26 >= 2 && (uint64_t v27 = self->_edges, v28 = v26 + 1, v27[v28].var0 == -3)) {
        int v29 = v27[v28].var2;
      }
      else {
        int v29 = -1;
      }
      int v69 = v29;
      unsigned int v70 = 0;
      unsigned int v30 = 0;
      int v31 = &v71;
      unsigned int v32 = 1;
      do
      {
        uint64_t v33 = v31[--v32];
        unsigned int v34 = self->_nodeAdjIndex;
        unint64_t v35 = v34[v33];
        unsigned int v36 = self->_indexedNodeSpace;
        if (v33 >= v36)
        {
          int v41 = 0;
        }

        else
        {
          uint64_t v37 = v33 + 1;
          int8x8_t v38 = &v34[v37];
          BOOL v39 = v37 >= v36;
          int v40 = &self->_indexedEdges;
          if (!v39) {
            int v40 = v38;
          }
          int v41 = *v40 - v35;
        }

        unint64_t v42 = (v41 + v35);
        if (v35 < v42)
        {
          do
          {
            uint64_t v43 = self->_edges;
            if (!v43) {
              -[VMUDirectedGraph enumerateMembersOfGroupNode:withBlock:].cold.1(v6, v7, v8);
            }
            BOOL inverted = self->_inverted;
            uint64_t v45 = &v43[v35];
            p_unsigned int var2 = &v45->var2;
            unsigned int var0 = v45->var0;
            p_unint64_t var1 = &v45->var1;
            uint64_t v7 = var0;
            BOOL v49 = var0 < 0xFFFFFFFB;
            BOOL v50 = !inverted || !v49;
            if (inverted && v49) {
              unsigned int v51 = p_var2;
            }
            else {
              unsigned int v51 = p_var1;
            }
            if (v50) {
              p_unint64_t var1 = p_var2;
            }
            uint64_t v52 = *p_var1;
            if ((_DWORD)v7 == -2)
            {
              if (v32 >= v30)
              {
                uint64_t v53 = v9;
                if (2 * v30 <= 0x10) {
                  unsigned int v54 = 16;
                }
                else {
                  unsigned int v54 = 2 * v30;
                }
                if (v30) {
                  unsigned int v55 = v31;
                }
                else {
                  unsigned int v55 = 0LL;
                }
                uint64_t v6 = (uint64_t)realloc(v55, 4LL * v54);
                int v31 = (unsigned int *)v6;
                unsigned int v30 = v54;
                uint64_t v9 = v53;
              }

              v31[v32++] = v52;
            }

            else if (v7 <= 0xFFFFFFFA)
            {
              uint64_t v8 = *v51;
              unsigned int v56 = self->_indexedNodeSpace;
              __int128 v57 = self->_nodeAdjIndex;
              unsigned int v58 = self->_indexedEdges;
              unsigned int v59 = v57[v52];
              if (v58 - v59 < 2 || v43[v59 + 1].var0 != -3) {
                goto LABEL_68;
              }
              unsigned int v60 = v43[v59 + 1].var2;
              if (v60 == -1 || v60 == v69) {
                goto LABEL_68;
              }
              do
              {
                unsigned int v62 = v60;
                if (v60 >= v56) {
                  break;
                }
                unsigned int v63 = v60 + 1;
                unsigned int v64 = self->_indexedEdges;
                if (v63 < v56) {
                  unsigned int v64 = v57[v63];
                }
                unsigned int v65 = v57[v62];
                if (v64 - v65 < 2 || v43[v65 + 1].var0 != -3) {
                  break;
                }
                unsigned int v60 = v43[v65 + 1].var2;
              }

              while (v60 != -1 && v60 != v69);
              if (v71 != v62 || v62 == (_DWORD)v52)
              {
LABEL_68:
                if (v9) {
                  uint64_t v6 = v9[2](v9);
                }
                ++v70;
              }
            }

            ++v35;
          }

          while (v35 < v42);
        }
      }

      while (v32);
      if (v30) {
        free(v31);
      }
      int insideSearch = self->_insideSearch - 1;
      unsigned int v13 = v70;
    }

    self->_int insideSearch = insideSearch;
  }

  return v13;
}

- (unsigned)enumerateEdgesOfNode:(unsigned int)a3 withBlock:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6)
  {
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __51__VMUDirectedGraph_enumerateEdgesOfNode_withBlock___block_invoke;
    v10[3] = &unk_189E005B0;
    id v11 = v6;
    unsigned int v8 = -[VMUDirectedGraph _internalEnumerateEdgesOfNode:withBlock:]( self,  "_internalEnumerateEdgesOfNode:withBlock:",  v4,  v10);
  }

  else
  {
    unsigned int v8 = -[VMUDirectedGraph _internalEnumerateEdgesOfNode:withBlock:]( self,  "_internalEnumerateEdgesOfNode:withBlock:",  v4,  0LL);
  }

  return v8;
}

uint64_t __51__VMUDirectedGraph_enumerateEdgesOfNode_withBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)withNodeMarkingMap:(id)a3
{
  if (a3)
  {
    unsigned int nextNodeName = self->_nextNodeName;
    uint64_t v4 = (void (**)(id, _DWORD *))a3;
    uint64_t v5 = calloc(1uLL, ((nextNodeName + 7) >> 3) + 4);
    *uint64_t v5 = nextNodeName;
    v4[2](v4, v5);

    free(v5);
  }

- (void)withEdgeMarkingMap:(id)a3
{
  if (a3)
  {
    unsigned int nextEdgeName = self->_nextEdgeName;
    uint64_t v4 = (void (**)(id, _DWORD *))a3;
    uint64_t v5 = calloc(1uLL, ((nextEdgeName + 7) >> 3) + 4);
    *uint64_t v5 = nextEdgeName;
    v4[2](v4, v5);

    free(v5);
  }

- (void)_dfsCore:(unsigned int)a3 colors:(char *)a4 visitBlock:(id)a5 examineBlock:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  unsigned int v65 = (uint64_t (**)(id, uint64_t, void))a5;
  BOOL v10 = (uint64_t (**)(void))a6;
  uint64_t v11 = v65[2](v65, v8, a4[v8]);
  a4[v8] = v11;
  p_unsigned int indexedEdges = &self->_indexedEdges;
  unsigned int indexedEdges = self->_indexedEdges;
  unsigned int indexedNodeSpace = self->_indexedNodeSpace;
  if (indexedNodeSpace > v8)
  {
    nodeAdjIndex = self->_nodeAdjIndex;
    unsigned int v16 = self->_indexedEdges;
    unsigned int v17 = nodeAdjIndex[v8];
    if (v16 != v17)
    {
      if (indexedNodeSpace <= 0x10) {
        uint64_t v18 = 16LL;
      }
      else {
        uint64_t v18 = indexedNodeSpace;
      }
      BOOL v19 = (unsigned int *)malloc(4LL * v18);
      *BOOL v19 = v17;
      if (indexedEdges == -1) {
        -[VMUDirectedGraph _dfsCore:colors:visitBlock:examineBlock:].cold.1();
      }
      unsigned int v22 = v19;
      unsigned int v64 = v10;
      if (v17 >= indexedEdges)
      {
LABEL_84:
        free(v22);
        BOOL v10 = v64;
        goto LABEL_85;
      }

      unsigned int v23 = 0;
      uint64_t v63 = v18;
      while (1)
      {
        unsigned int v24 = v22[v23];
        if (v24 == -1)
        {
          if (!v23) {
            -[VMUDirectedGraph _dfsCore:colors:visitBlock:examineBlock:].cold.2();
          }
          unsigned int v25 = v22[--v23];
        }

        else
        {
          unsigned int v25 = v22[v23];
        }

        edges = self->_edges;
        if (!edges) {
          -[VMUDirectedGraph enumerateMembersOfGroupNode:withBlock:].cold.1((uint64_t)v19, v20, v21);
        }
        uint64_t v27 = self->_nodeAdjIndex;
        BOOL inverted = self->_inverted;
        int v29 = &edges[v25];
        p_unsigned int var2 = &v29->var2;
        unsigned int var0 = v29->var0;
        p_unint64_t var1 = &v29->var1;
        unsigned int v31 = var0;
        BOOL v34 = var0 < 0xFFFFFFFB;
        BOOL v35 = !inverted || !v34;
        if (inverted && v34) {
          unsigned int v36 = p_var2;
        }
        else {
          unsigned int v36 = p_var1;
        }
        uint64_t v37 = *v36;
        if (v35) {
          p_unint64_t var1 = p_var2;
        }
        uint64_t v38 = *p_var1;
        if (v31 == -2)
        {
          uint64_t v39 = v38;
          unsigned int var2 = v37;
        }

        else
        {
          unsigned int v41 = self->_indexedNodeSpace;
          unsigned int v42 = indexedEdges;
          unsigned int v43 = v27[v37];
          if (v42 == v43)
          {
LABEL_29:
            unsigned int var2 = v37;
          }

          else
          {
            unsigned int var2 = v37;
            if (edges[v43].var0 == -3) {
              unsigned int var2 = edges[v43].var2;
            }
          }

          if (v38 < v41)
          {
            unsigned int v44 = v27[v38];
            if (indexedEdges != v44 && edges[v44].var0 == -3)
            {
              uint64_t v39 = edges[v44].var2;
              uint64_t v45 = v39;
              goto LABEL_38;
            }
          }

          uint64_t v39 = v38;
        }

        uint64_t v45 = v38;
LABEL_38:
        uint64_t v46 = var2;
        if (v24 != -1)
        {
          if ((_DWORD)v45 == (_DWORD)v38 && var2 == (_DWORD)v37) {
            unsigned int v48 = v31;
          }
          else {
            unsigned int v48 = -4;
          }
          if (var2 == (_DWORD)v45) {
            uint64_t v20 = v48;
          }
          else {
            uint64_t v20 = v31;
          }
          if (v20 <= 0xFFFFFFFA)
          {
            BOOL v49 = &a4[v39];
            BOOL v19 = (unsigned int *)v64[2]();
            if ((_DWORD)v19)
            {
              BOOL v19 = (unsigned int *)((uint64_t (*)(uint64_t (**)(id, uint64_t, void), uint64_t, void, uint64_t))v65[2])( v65,  v45,  *v49,  12LL);
              uint64_t v21 = (uint64_t)v19;
              char *v49 = (char)v19;
              unsigned int v50 = self->_indexedNodeSpace;
              if (v45 < v50)
              {
                uint64_t v27 = self->_nodeAdjIndex;
                unsigned int v51 = (int)v45 + 1 >= v50 ? &self->_indexedEdges : &v27[(v45 + 1)];
                if (*v51 != v27[v39])
                {
LABEL_77:
                  ++v23;
                  uint64_t v62 = v63;
                  if (v23 >= v63)
                  {
                    uint64_t v62 = (2 * v63);
                    BOOL v19 = (unsigned int *)realloc(v22, 4 * v62);
                    unsigned int v22 = v19;
                    uint64_t v27 = self->_nodeAdjIndex;
                  }

                  uint64_t v63 = v62;
                  int v58 = v27[v39];
                  goto LABEL_80;
                }
              }

              BOOL v19 = (unsigned int *)((uint64_t (*)(uint64_t (**)(id, uint64_t, void), uint64_t, unsigned int *, uint64_t))v65[2])( v65,  v45,  v19,  12LL);
              char *v49 = (char)v19;
            }
          }

          else if ((_DWORD)v20 == -2)
          {
            goto LABEL_77;
          }
        }

        uint64_t v52 = self->_edges;
        if (v25 + 1 >= self->_indexedEdges)
        {
          if (!v52) {
            -[VMUDirectedGraph enumerateMembersOfGroupNode:withBlock:].cold.1((uint64_t)v19, v20, v21);
          }
LABEL_69:
          unsigned int v59 = &v52[v25];
          BOOL v60 = v59->var0 >= 0xFFFFFFFB || !self->_inverted;
          uint64_t v61 = 4LL;
          if (!v60) {
            uint64_t v61 = 8LL;
          }
          if (*(unsigned int *)((char *)&v59->var0 + v61) == (_DWORD)v46)
          {
            BOOL v19 = (unsigned int *)((uint64_t (*)(uint64_t (**)(id, uint64_t, void), uint64_t, void, uint64_t))v65[2])( v65,  v46,  a4[v46],  12LL);
            a4[v46] = (char)v19;
          }

          int v58 = -1;
          goto LABEL_80;
        }

        if (!v52) {
          -[VMUDirectedGraph enumerateMembersOfGroupNode:withBlock:].cold.1((uint64_t)v19, v20, v21);
        }
        uint64_t v53 = &v52[v25 + 1];
        if (self->_inverted && v53->var0 < 0xFFFFFFFB) {
          uint64_t v54 = 8LL;
        }
        else {
          uint64_t v54 = 4LL;
        }
        int v55 = *(unsigned int *)((char *)&v53->var0 + v54);
        unsigned int v56 = &v52[v25];
        if (self->_inverted && v56->var0 < 0xFFFFFFFB) {
          uint64_t v57 = 8LL;
        }
        else {
          uint64_t v57 = 4LL;
        }
        int v58 = v22[v23] + 1;
LABEL_80:
        v22[v23] = v58;
        unsigned int indexedEdges = *p_indexedEdges;
        if (*v22 >= *p_indexedEdges) {
          goto LABEL_84;
        }
      }
    }
  }

  a4[v8] = v65[2](v65, v8, v11);
LABEL_85:
}

- (void)_bfsCore:(unsigned int)a3 colors:(char *)a4 visitBlock:(id)a5 examineBlock:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  uint64_t v52 = (uint64_t (**)(id, uint64_t, void))a5;
  BOOL v10 = (uint64_t (**)(void))a6;
  if (self->_indexedNodeSpace <= 0x10) {
    unsigned int indexedNodeSpace = 16;
  }
  else {
    unsigned int indexedNodeSpace = self->_indexedNodeSpace;
  }
  uint64_t v12 = malloc(4LL * indexedNodeSpace);
  unsigned int v13 = (_DWORD *)v52[2](v52, v8, a4[v8]);
  unsigned int v16 = 0;
  uint64_t v53 = a4;
  a4[v8] = (char)v13;
  _DWORD *v12 = v8;
  unsigned int v17 = 1;
  do
  {
    uint64_t v18 = v12[v16];
    nodeAdjIndex = self->_nodeAdjIndex;
    uint64_t v20 = nodeAdjIndex[v18];
    unsigned int v21 = self->_indexedNodeSpace;
    if (v18 >= v21)
    {
      int v23 = 0;
    }

    else
    {
      p_unsigned int indexedEdges = &self->_indexedEdges;
      int v23 = *p_indexedEdges - v20;
    }

    ++v16;
    uint64_t v24 = (v23 + v20);
    if (v20 < v24)
    {
      uint64_t v51 = v18;
      uint64_t v25 = v20;
      uint64_t v26 = v24 - v20;
      while (1)
      {
        edges = self->_edges;
        if (!edges) {
          -[VMUDirectedGraph enumerateMembersOfGroupNode:withBlock:].cold.1((uint64_t)v13, v14, var2);
        }
        unsigned int v28 = self->_indexedNodeSpace;
        BOOL inverted = self->_inverted;
        p_unint64_t var1 = &edges[v25].var1;
        unsigned int var0 = edges[v25].var0;
        BOOL v32 = var0 < 0xFFFFFFFB;
        BOOL v33 = !inverted || !v32;
        if (inverted && v32) {
          p_uint64_t var2 = &edges[v25].var2;
        }
        else {
          p_uint64_t var2 = &edges[v25].var1;
        }
        uint64_t v35 = *p_var2;
        if (v33) {
          p_unint64_t var1 = &edges[v25].var2;
        }
        uint64_t v36 = *p_var1;
        if (var0 == -2)
        {
          uint64_t var2 = v35;
        }

        else
        {
          uint64_t v37 = self->_nodeAdjIndex;
          unsigned int indexedEdges = self->_indexedEdges;
          unsigned int v39 = self->_indexedEdges;
          unsigned int v40 = v37[v35];
          if (v39 == v40)
          {
LABEL_25:
            uint64_t var2 = v35;
          }

          else
          {
            uint64_t var2 = v35;
            if (edges[v40].var0 == -3) {
              uint64_t var2 = edges[v40].var2;
            }
          }

          if (v36 < v28)
          {
            unsigned int v41 = v37[v36];
            if (indexedEdges != v41 && edges[v41].var0 == -3)
            {
              uint64_t v42 = edges[v41].var2;
              goto LABEL_33;
            }
          }
        }

        uint64_t v42 = v36;
LABEL_33:
        if ((_DWORD)v42 == (_DWORD)v36 && (_DWORD)var2 == (_DWORD)v35) {
          unsigned int v44 = edges[v25].var0;
        }
        else {
          unsigned int v44 = -4;
        }
        if ((_DWORD)var2 == (_DWORD)v42) {
          uint64_t v14 = v44;
        }
        else {
          uint64_t v14 = var0;
        }
        if (v14 >= 0xFFFFFFFB)
        {
          if ((_DWORD)v14 == -2) {
            unsigned int v45 = v42;
          }
          else {
            unsigned int v45 = -1;
          }
LABEL_48:
          if (v45 < v28)
          {
            if (v17 >= indexedNodeSpace)
            {
              if (v16 <= indexedNodeSpace >> 1)
              {
                indexedNodeSpace *= 2;
                unsigned int v13 = realloc(v12, 4LL * indexedNodeSpace);
                uint64_t v12 = v13;
              }

              else
              {
                v17 -= v16;
                unsigned int v13 = memmove(v12, &v12[v16], 4LL * v17);
                unsigned int v16 = 0;
              }
            }

            v12[v17++] = v42;
          }

          goto LABEL_57;
        }

        uint64_t v46 = &v53[v42];
        unsigned int v13 = (_DWORD *)v10[2](v10);
        if ((_DWORD)v13)
        {
          unsigned int v13 = (_DWORD *)v52[2](v52, v42, *v46);
          *uint64_t v46 = (char)v13;
          unsigned int v28 = self->_indexedNodeSpace;
          unsigned int v45 = v42;
          goto LABEL_48;
        }

- (void)_searchMainLoop:(unsigned int)a3 action:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  size_t nextNodeName = self->_nextNodeName;
  if ((_DWORD)nextNodeName)
  {
    id v11 = v6;
    uint64_t v8 = calloc(nextNodeName, 1uLL);
    uint64_t v9 = v8;
    if ((_DWORD)v4 == -1)
    {
      v12[0] = MEMORY[0x1895F87A8];
      v12[1] = 3221225472LL;
      v12[2] = __43__VMUDirectedGraph__searchMainLoop_action___block_invoke;
      v12[3] = &unk_189E005D8;
      uint64_t v14 = v8;
      id v13 = v11;
      -[VMUDirectedGraph enumerateNodesWithBlock:](self, "enumerateNodesWithBlock:", v12);
    }

    else if (self->_indexedNodeSpace > v4)
    {
      deadNodes = self->_deadNodes;
      if (!deadNodes
        || *deadNodes <= v4
        || ((*((unsigned __int8 *)deadNodes + (v4 >> 3) + 4) >> (v4 & 7)) & 1) == 0)
      {
        (*((void (**)(id, uint64_t, void *))v11 + 2))(v11, v4, v8);
      }
    }

    free(v9);
    id v6 = v11;
  }
}

uint64_t __43__VMUDirectedGraph__searchMainLoop_action___block_invoke(uint64_t result, unsigned int a2)
{
  if (!*(_BYTE *)(*(void *)(result + 40) + a2)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16LL))();
  }
  return result;
}

- (void)depthFirstSearch:(unsigned int)a3 nodeVisitBlock:(id)a4 edgeVisitBlock:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v17 = a4;
  id v9 = a5;
  BOOL v10 = v17;
  if (v17 && v9)
  {
    int insideSearch = self->_insideSearch;
    if (!insideSearch)
    {
      unsigned int indexedEdges = self->_indexedEdges;
      if (indexedEdges == -1 || indexedEdges < self->_edgeCount || self->_indexedNodeSpace < self->_nextNodeName)
      {
        -[VMUDirectedGraph _adjustAdjacencyMap](self, "_adjustAdjacencyMap");
        BOOL v10 = v17;
        int insideSearch = self->_insideSearch;
      }

      else
      {
        int insideSearch = 0;
      }
    }

    uint64_t v16 = MEMORY[0x1895F87A8];
    self->_int insideSearch = insideSearch + 1;
    v18[0] = v16;
    v18[1] = 3221225472LL;
    v18[2] = __67__VMUDirectedGraph_depthFirstSearch_nodeVisitBlock_edgeVisitBlock___block_invoke;
    v18[3] = &unk_189E00600;
    v18[4] = self;
    id v19 = v10;
    id v20 = v9;
    -[VMUDirectedGraph _searchMainLoop:action:](self, "_searchMainLoop:action:", v6, v18);
    --self->_insideSearch;
  }

  else
  {
    id v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    Name = sel_getName(a2);
    NSLog(@"-[%@ %s]: %s", v14, Name, "^block parameters must be non-nil.");
  }
}

uint64_t __67__VMUDirectedGraph_depthFirstSearch_nodeVisitBlock_edgeVisitBlock___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  return [*(id *)(a1 + 32) _dfsCore:a2 colors:a3 visitBlock:*(void *)(a1 + 40) examineBlock:*(void *)(a1 + 48)];
}

- (void)breadthFirstSearch:(unsigned int)a3 nodeVisitBlock:(id)a4 edgeVisitBlock:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v17 = a4;
  id v9 = a5;
  BOOL v10 = v17;
  if (v17 && v9)
  {
    int insideSearch = self->_insideSearch;
    if (!insideSearch)
    {
      unsigned int indexedEdges = self->_indexedEdges;
      if (indexedEdges == -1 || indexedEdges < self->_edgeCount || self->_indexedNodeSpace < self->_nextNodeName)
      {
        -[VMUDirectedGraph _adjustAdjacencyMap](self, "_adjustAdjacencyMap");
        BOOL v10 = v17;
        int insideSearch = self->_insideSearch;
      }

      else
      {
        int insideSearch = 0;
      }
    }

    uint64_t v16 = MEMORY[0x1895F87A8];
    self->_int insideSearch = insideSearch + 1;
    v18[0] = v16;
    v18[1] = 3221225472LL;
    v18[2] = __69__VMUDirectedGraph_breadthFirstSearch_nodeVisitBlock_edgeVisitBlock___block_invoke;
    v18[3] = &unk_189E00600;
    v18[4] = self;
    id v19 = v10;
    id v20 = v9;
    -[VMUDirectedGraph _searchMainLoop:action:](self, "_searchMainLoop:action:", v6, v18);
    --self->_insideSearch;
  }

  else
  {
    id v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    Name = sel_getName(a2);
    NSLog(@"-[%@ %s]: %s", v14, Name, "^block parameters must be non-nil.");
  }
}

uint64_t __69__VMUDirectedGraph_breadthFirstSearch_nodeVisitBlock_edgeVisitBlock___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  return [*(id *)(a1 + 32) _bfsCore:a2 colors:a3 visitBlock:*(void *)(a1 + 40) examineBlock:*(void *)(a1 + 48)];
}

- (void)_reorderEdgesNaturally
{
  uint64_t edgeCount = self->_edgeCount;
  if ((_DWORD)edgeCount)
  {
    uint64_t v4 = 0LL;
    int v5 = 0;
    edges = self->_edges;
    char v7 = 1;
    do
    {
      unsigned int var0 = edges->var0;
      ++edges;
      v7 &= v4 == var0;
      if (var0 == 4294967294LL) {
        ++v5;
      }
      ++v4;
    }

    while (edgeCount != v4);
    if ((v7 & 1) == 0)
    {
      unsigned int edgeCapacity = self->_edgeCapacity;
      unsigned int v10 = self->_externalEdges + v5;
      size_t v11 = edgeCapacity <= v10 ? v10 : edgeCapacity;
      self->_unsigned int edgeCapacity = v11;
      if ((_DWORD)v11)
      {
        uint64_t v12 = (_VMUDirectedGraphEdge *)calloc(v11, 0xCuLL);
        if (v12)
        {
          id v13 = v12;
          if (self->_edgeCount)
          {
            uint64_t v14 = 0LL;
            unint64_t v15 = 0LL;
            int v16 = 0;
            do
            {
              id v17 = &self->_edges[v14];
              unsigned int v18 = v17->var0;
              if (v17->var0 != -3)
              {
                if (v18 == -2)
                {
                  id v19 = &v12[v16 + self->_externalEdges - 1];
                  uint64_t v20 = *(void *)&v17->var0;
                  v19->uint64_t var2 = v17->var2;
                  *(void *)&v19->unsigned int var0 = v20;
                  ++v16;
                }

                else
                {
                  uint64_t v21 = *(void *)&v17->var0;
                  unsigned int v22 = &v12[v18];
                  v22->uint64_t var2 = v17->var2;
                  *(void *)&v22->unsigned int var0 = v21;
                }
              }

              ++v15;
              ++v14;
            }

            while (v15 < self->_edgeCount);
          }

          int v23 = self->_edges;
          if (v23) {
            free(v23);
          }
          self->_edges = v13;
        }
      }
    }
  }

- (void)_dumpAdjacencyList
{
  if (self->_nextNodeName)
  {
    unint64_t v3 = 0LL;
    p_unsigned int indexedEdges = &self->_indexedEdges;
    do
    {
      nodeAdjIndex = self->_nodeAdjIndex;
      uint64_t v6 = nodeAdjIndex[v3];
      unint64_t indexedNodeSpace = self->_indexedNodeSpace;
      if (v3 >= indexedNodeSpace)
      {
        int v9 = 0;
      }

      else
      {
        uint64_t v8 = &nodeAdjIndex[v3 + 1];
        if (v3 + 1 >= indexedNodeSpace) {
          uint64_t v8 = p_indexedEdges;
        }
        int v9 = *v8 - v6;
      }

      uint64_t v10 = (v9 + v6);
      uint64_t v11 = printf("node: %d at %d (%d edges leaving)\n", v3, v6, v9);
      if (v6 < v10)
      {
        uint64_t v14 = v6;
        do
        {
          edges = self->_edges;
          if (!edges) {
            -[VMUDirectedGraph enumerateMembersOfGroupNode:withBlock:].cold.1(v11, v12, v13);
          }
          int v16 = &edges[v14];
          p_uint64_t var2 = &v16->var2;
          unsigned int var0 = v16->var0;
          p_unint64_t var1 = &v16->var1;
          unsigned int v19 = var0;
          BOOL inverted = self->_inverted;
          BOOL v22 = var0 < 0xFFFFFFFB;
          BOOL v23 = !inverted || !v22;
          if (inverted && v22) {
            uint64_t v24 = p_var2;
          }
          else {
            uint64_t v24 = p_var1;
          }
          if (v23) {
            p_unint64_t var1 = p_var2;
          }
          if (v19 == -3) {
            uint64_t v25 = " [group up]";
          }
          else {
            uint64_t v25 = "";
          }
          if (v19 == -2) {
            uint64_t v25 = " [group contain]";
          }
          uint64_t v11 = printf("%d: %d -> %d%s\n", v6++, *v24, *p_var1, v25);
          ++v14;
        }

        while (v10 != v6);
      }

      ++v3;
    }

    while (v3 < self->_nextNodeName);
  }

- (void)invertEdges
{
}

- (id)subgraphWithMarkedNodes:(void *)a3
{
  uint64_t v4 = (void *)-[VMUDirectedGraph copy](self, "copy");
  int v5 = v4;
  if (a3)
  {
    int v6 = *(_DWORD *)a3;
    unint64_t v7 = (*(_DWORD *)a3 + 7);
    if (v7 >= 8)
    {
      uint64_t v8 = (char *)a3 + 4;
      uint64_t v9 = v7 >> 3;
      if (v7 >> 3 <= 1) {
        uint64_t v9 = 1LL;
      }
      do
      {
        *uint64_t v8 = ~*v8;
        ++v8;
        --v9;
      }

      while (v9);
    }

    int v10 = v6 & 7;
    if (v10) {
      *((_BYTE *)a3 + (v7 >> 3) + 3) ^= -1 << v10;
    }
    [v4 removeMarkedNodes:a3];
    int v11 = *(_DWORD *)a3;
    unint64_t v12 = (*(_DWORD *)a3 + 7);
    if (v12 >= 8)
    {
      uint64_t v13 = (char *)a3 + 4;
      uint64_t v14 = v12 >> 3;
      if (v12 >> 3 <= 1) {
        uint64_t v14 = 1LL;
      }
      do
      {
        *uint64_t v13 = ~*v13;
        ++v13;
        --v14;
      }

      while (v14);
    }

    int v15 = v11 & 7;
    if (v15) {
      *((_BYTE *)a3 + (v12 >> 3) + 3) ^= -1 << v15;
    }
  }

  return v5;
}

- (id)renormalizedGraph
{
  unint64_t v2 = (void *)-[VMUDirectedGraph copy](self, "copy");
  [v2 _renormalize];
  return v2;
}

- (id)invertedGraph
{
  unint64_t v3 = (void *)-[VMUDirectedGraph copy](self, "copy");
  [v3 setInverted:[self inverted] ^ 1];
  return v3;
}

- (unsigned)nodeCount
{
  return self->_nodeCount;
}

- (unsigned)nodeNamespaceSize
{
  return self->_nextNodeName;
}

- (unsigned)edgeNamespaceSize
{
  return self->_nextEdgeName;
}

- (NSDictionary)additionalProperties
{
  return self->_additionalProperties;
}

- (void)setAdditionalProperties:(id)a3
{
}

- (BOOL)graphIs64bit
{
  return self->_graphIs64bit;
}

- (void).cxx_destruct
{
}

- (void)decapsulateSupplementalData:forTag:.cold.1()
{
  __assert_rtn("-[VMUDirectedGraph decapsulateSupplementalData:forTag:]", "VMUDirectedGraph.m", 252, "strlen(tag) <= 8");
}

- (void)initWithArchived:version:options:diskLogs:error:.cold.1()
{
  *(_WORD *)v0 = 0;
}

- (void)_adjustAdjacencyMap
{
}

- (void)enumerateMembersOfGroupNode:(uint64_t)a3 withBlock:.cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
}

- (void)_dfsCore:colors:visitBlock:examineBlock:.cold.1()
{
}

- (void)_dfsCore:colors:visitBlock:examineBlock:.cold.2()
{
  __assert_rtn( "-[VMUDirectedGraph _dfsCore:colors:visitBlock:examineBlock:]",  "VMUDirectedGraph.m",  1332,  "agendaIdx != 0");
}

@end