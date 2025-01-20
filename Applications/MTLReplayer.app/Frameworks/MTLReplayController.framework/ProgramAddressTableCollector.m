@interface ProgramAddressTableCollector
- (ProgramAddressTableCollector)init;
- (id).cxx_construct;
- (id)binaries;
- (id)initForHarvestingBinaries;
- (id)mappings;
- (void)addBinaries:(id)a3;
- (void)addBinaryMapping:(id)a3 forEncoder:(unsigned int)a4 atEncoderIndex:(unsigned int)a5 forIndex:(unsigned int)a6;
- (void)addOtherEncoderFunctionIndex:(unint64_t)a3 forEncoder:(unsigned int)a4 atEncoderIndex:(unsigned int)a5 forType:(id)a6;
- (void)addProgramAddressTable:(id)a3 forEncoder:(unsigned int)a4 atEncoderIndex:(unsigned int)a5;
- (void)addSampledCallFunctionIndex:(unint64_t)a3;
- (void)addSampledCallFunctionIndex:(unint64_t)a3 forIndex:(unsigned int)a4 forEncoder:(unsigned int)a5 atEncoderIndex:(unsigned int)a6 forType:(id)a7;
- (void)dealloc;
@end

@implementation ProgramAddressTableCollector

- (ProgramAddressTableCollector)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ProgramAddressTableCollector;
  v2 = -[ProgramAddressTableCollector init](&v14, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    binaryTypes = v2->_binaryTypes;
    v2->_binaryTypes = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    mappings = v2->_mappings;
    v2->_mappings = (NSMutableArray *)v5;

    uint64_t v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v7);
    binaries = v2->_binaries;
    v2->_binaries = (NSMutableDictionary *)v8;

    uint64_t v11 = objc_opt_new(&OBJC_CLASS___NSMutableArray, v10);
    functionIndices = v2->_functionIndices;
    v2->_functionIndices = (NSMutableArray *)v11;

    v2->_drawCallIndex = 0;
  }

  return v2;
}

- (id)initForHarvestingBinaries
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ProgramAddressTableCollector;
  v2 = -[ProgramAddressTableCollector init](&v14, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    binaryTypes = v2->_binaryTypes;
    v2->_binaryTypes = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    mappings = v2->_mappings;
    v2->_mappings = (NSMutableArray *)v5;

    v2->_drawCallIndex = 0;
    uint64_t v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v7);
    binaries = v2->_binaries;
    v2->_binaries = (NSMutableDictionary *)v8;

    uint64_t v11 = objc_opt_new(&OBJC_CLASS___NSMutableArray, v10);
    functionIndices = v2->_functionIndices;
    v2->_functionIndices = (NSMutableArray *)v11;
  }

  return v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___ProgramAddressTableCollector;
  -[ProgramAddressTableCollector dealloc](&v2, "dealloc");
}

- (void)addBinaries:(id)a3
{
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id obj = a3;
  id v4 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v4)
  {
    uint64_t v17 = *(void *)v26;
    do
    {
      uint64_t v5 = 0LL;
      id v18 = v4;
      do
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v25 + 1) + 8 * v5);
        __int128 v21 = 0u;
        __int128 v22 = 0u;
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([obj objectForKeyedSubscript:v6]);
        uint64_t v20 = v5;
        id v8 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v8)
        {
          uint64_t v9 = *(void *)v22;
          do
          {
            for (i = 0LL; i != v8; i = (char *)i + 1)
            {
              if (*(void *)v22 != v9) {
                objc_enumerationMutation(v7);
              }
              uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
              v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%016llx",  [v11 uniqueIdentifier]));
              -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_binaryTypes,  "setObject:forKeyedSubscript:",  v6,  v12);
              binaries = self->_binaries;
              if (binaries)
              {
                objc_super v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( binaries,  "objectForKeyedSubscript:",  v12));
                BOOL v15 = v14 == 0LL;

                if (v15)
                {
                  v16 = (void *)objc_claimAutoreleasedReturnValue([v11 binary]);
                  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_binaries,  "setObject:forKeyedSubscript:",  v16,  v12);
                }
              }
            }

            id v8 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }

          while (v8);
        }

        uint64_t v5 = v20 + 1;
      }

      while ((id)(v20 + 1) != v18);
      id v4 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }

    while (v4);
  }
}

- (void)addBinaryMapping:(id)a3 forEncoder:(unsigned int)a4 atEncoderIndex:(unsigned int)a5 forIndex:(unsigned int)a6
{
  id v34 = a3;
  unsigned int v7 = 0;
  id v8 = &CATransform3DIdentity_ptr;
  while (1)
  {
    unsigned int v9 = v7;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v34 objectAtIndexedSubscript:v7]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%016llx",  [v10 binaryUniqueId]));
    if (v11)
    {
      v32 = v10;
      uint64_t v12 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_binaryTypes, "objectForKeyedSubscript:", v11));
      v13 = @"unknown";
      if (v12) {
        v13 = (const __CFString *)v12;
      }
      v33 = (__CFString *)v13;
      mappings = self->_mappings;
      v35[0] = @"mappedAddress";
      uint64_t v36 = objc_claimAutoreleasedReturnValue( -[CATransform3D numberWithUnsignedLongLong:]( (id)v8[280],  "numberWithUnsignedLongLong:",  [v10 mappedAddress]));
      v35[1] = @"mappedSize";
      v31 = (void *)v36;
      uint64_t v37 = objc_claimAutoreleasedReturnValue( -[CATransform3D numberWithUnsignedLongLong:]( (id)v8[280],  "numberWithUnsignedLongLong:",  [v10 mappedSize]));
      v38 = v11;
      v35[2] = @"binaryUniqueId";
      v35[3] = @"type";
      v39 = v33;
      v35[4] = @"encID";
      v30 = (void *)v37;
      uint64_t v40 = objc_claimAutoreleasedReturnValue(-[CATransform3D numberWithUnsignedInt:]((id)v8[280], "numberWithUnsignedInt:", a4));
      v35[5] = @"encIndex";
      v29 = (void *)v40;
      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[CATransform3D numberWithUnsignedInt:]((id)v8[280], "numberWithUnsignedInt:", a5));
      v41 = v28;
      v35[6] = @"index";
      BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[CATransform3D numberWithUnsignedInt:]((id)v8[280], "numberWithUnsignedInt:", a6));
      v42 = v15;
      v35[7] = @"drawCallIndex";
      v16 = v8;
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[CATransform3D numberWithUnsignedInt:]( (id)v8[280],  "numberWithUnsignedInt:",  self->_drawCallIndex));
      v43 = v17;
      v35[8] = @"drawFunctionIndex";
      unint64_t drawCallIndex = self->_drawCallIndex;
      id v19 = -[NSMutableArray count](self->_functionIndices, "count");
      uint64_t v20 = &off_5A0958;
      if ((unint64_t)v19 > drawCallIndex)
      {
        __int128 v27 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_functionIndices,  "objectAtIndexedSubscript:",  self->_drawCallIndex));
        uint64_t v20 = v27;
      }

      __int128 v21 = self;
      v44 = v20;
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v36,  v35,  9LL));
      -[NSMutableArray addObject:](mappings, "addObject:", v22);
      BOOL v23 = (unint64_t)v19 > drawCallIndex;

      self = v21;
      id v8 = v16;
      uint64_t v10 = v32;
      if (v23) {
    }
      }

    unsigned int v7 = v9 + 1;
  }
}

- (void)addProgramAddressTable:(id)a3 forEncoder:(unsigned int)a4 atEncoderIndex:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v16 = a3;
  if (v16 && (dword_5B9DE4 & 0x200) != 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v16 encoderInternalBinaries]);
    -[ProgramAddressTableCollector addBinaries:](self, "addBinaries:", v8);

    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v16 binaryMappingsEncoderInternal]);
    -[ProgramAddressTableCollector addBinaryMapping:forEncoder:atEncoderIndex:forIndex:]( self,  "addBinaryMapping:forEncoder:atEncoderIndex:forIndex:",  v9,  v6,  v5,  0xFFFFFFFFLL);

    unsigned int v10 = 0;
    uint64_t v11 = v6 << 32;
    while (1)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v16 binaryMappingsPerInvocation]);
      id v13 = [v12 count];

      objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v16 binaryMappingsPerInvocation]);
      BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:v10]);

      if ([v15 count])
      {
        if (!std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::find<unsigned long long>( &self->_addresses.__table_.__bucket_list_.__ptr_.__value_,  v11 | v10))
        {
          -[ProgramAddressTableCollector addBinaryMapping:forEncoder:atEncoderIndex:forIndex:]( self,  "addBinaryMapping:forEncoder:atEncoderIndex:forIndex:",  v15,  v6,  v5,  v10);
          ++self->_drawCallIndex;
          std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>( (uint64_t)&self->_addresses,  v11 | v10,  v11 | v10);
        }
      }

      ++v10;
    }
  }
}

- (void)addSampledCallFunctionIndex:(unint64_t)a3
{
  functionIndices = self->_functionIndices;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableArray addObject:](functionIndices, "addObject:");
}

- (void)addSampledCallFunctionIndex:(unint64_t)a3 forIndex:(unsigned int)a4 forEncoder:(unsigned int)a5 atEncoderIndex:(unsigned int)a6 forType:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  uint64_t v8 = *(void *)&a5;
  uint64_t v9 = *(void *)&a4;
  id v12 = a7;
  functionIndices = self->_functionIndices;
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableArray addObject:](functionIndices, "addObject:", v14);

  mappings = self->_mappings;
  v22[0] = @"mappedAddress";
  v22[1] = @"mappedSize";
  v23[0] = &off_5A0970;
  v23[1] = &off_5A0970;
  v22[2] = @"binaryUniqueId";
  v22[3] = @"type";
  v23[2] = @"0";
  v23[3] = v12;
  v22[4] = @"encID";
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v8));
  v23[4] = v16;
  v22[5] = @"encIndex";
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v7));
  v23[5] = v17;
  v22[6] = @"index";
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v9));
  v23[6] = v18;
  v22[7] = @"drawCallIndex";
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_drawCallIndex));
  v23[7] = v19;
  v22[8] = @"drawFunctionIndex";
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_functionIndices,  "objectAtIndexedSubscript:",  self->_drawCallIndex));
  v23[8] = v20;
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  9LL));
  -[NSMutableArray addObject:](mappings, "addObject:", v21);

  ++self->_drawCallIndex;
}

- (void)addOtherEncoderFunctionIndex:(unint64_t)a3 forEncoder:(unsigned int)a4 atEncoderIndex:(unsigned int)a5 forType:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = *(void *)&a4;
  id v9 = a6;
  v14[0] = @"mappedAddress";
  v14[1] = @"mappedSize";
  mappings = self->_mappings;
  v14[2] = @"binaryUniqueId";
  v14[3] = @"index";
  v15[0] = &off_5A0970;
  v15[1] = &off_5A0970;
  v15[2] = @"0";
  v15[3] = &off_5A0970;
  v15[4] = v9;
  v14[4] = @"type";
  v14[5] = @"encID";
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v7));
  v15[5] = v11;
  v14[6] = @"encIndex";
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v6));
  v15[6] = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  7LL));
  -[NSMutableArray addObject:](mappings, "addObject:", v13);
}

- (id)mappings
{
  if ((dword_5B9DE4 & 0x200) != 0) {
    return -[NSMutableArray copy](self->_mappings, "copy");
  }
  else {
    return &__NSArray0__struct;
  }
}

- (id)binaries
{
  if ((dword_5B9DE4 & 0x200) != 0) {
    return -[NSMutableDictionary copy](self->_binaries, "copy");
  }
  else {
    return &__NSDictionary0__struct;
  }
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 20) = 1065353216;
  return self;
}

@end