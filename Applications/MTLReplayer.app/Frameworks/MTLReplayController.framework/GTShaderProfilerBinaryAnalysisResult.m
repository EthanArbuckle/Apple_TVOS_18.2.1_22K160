@interface GTShaderProfilerBinaryAnalysisResult
+ (BOOL)supportsSecureCoding;
+ (id)analyzeBinary:(id)a3 targetIndex:(int)a4 isaPrinter:(id)a5;
+ (id)dataFromArchivedDataURL:(id)a3;
- (GTShaderProfilerBinaryAnalysisResult)init;
- (GTShaderProfilerBinaryAnalysisResult)initWithCoder:(id)a3;
- (NSArray)strings;
- (NSData)binaryLocationData;
- (NSData)binaryRangeData;
- (NSData)branchTargetData;
- (NSData)clauseData;
- (NSData)instructionData;
- (NSData)registerInfoData;
- (const)binaryLocations;
- (const)binaryRanges;
- (const)branchTargets;
- (const)clauses;
- (const)instructions;
- (const)lastBinaryLocation;
- (const)lastBinaryRange;
- (const)lastBranchTarget;
- (const)lastClause;
- (const)lastInstruction;
- (const)lastRegisterInfo;
- (const)registerInfo;
- (id).cxx_construct;
- (unint64_t)binaryLocationCount;
- (unint64_t)binaryRangeCount;
- (unint64_t)branchTargetCount;
- (unint64_t)clauseCount;
- (unint64_t)instructionCount;
- (unint64_t)maxOffset;
- (unint64_t)registerInfoCount;
- (unint64_t)registerInfoOffsetForInstructionIndex:(unint64_t)a3;
- (unsigned)version;
- (void)encodeWithCoder:(id)a3;
- (void)setBinaryLocationData:(id)a3;
- (void)setBinaryRangeData:(id)a3;
- (void)setBranchTargetData:(id)a3;
- (void)setClauseData:(id)a3;
- (void)setInstructionData:(id)a3;
- (void)setRegisterInfoData:(id)a3;
- (void)setStrings:(id)a3;
- (void)setVersion:(unsigned int)a3;
@end

@implementation GTShaderProfilerBinaryAnalysisResult

- (GTShaderProfilerBinaryAnalysisResult)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GTShaderProfilerBinaryAnalysisResult;
  result = -[GTShaderProfilerBinaryAnalysisResult init](&v3, "init");
  if (result) {
    result->_version = 2;
  }
  return result;
}

- (GTShaderProfilerBinaryAnalysisResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)&OBJC_CLASS___GTShaderProfilerBinaryAnalysisResult;
  v5 = -[GTShaderProfilerBinaryAnalysisResult init](&v46, "init");
  if (!v5)
  {
LABEL_34:
    v7 = v5;
    goto LABEL_35;
  }

  int v6 = [v4 decodeIntForKey:@"version"];
  if (v6 > 2)
  {
LABEL_3:
    v7 = 0LL;
    goto LABEL_35;
  }

  int v8 = v6;
  if ((v6 - 1) > 1)
  {
LABEL_12:
    v48[0] = objc_opt_class(&OBJC_CLASS___NSData);
    v48[1] = objc_opt_class(&OBJC_CLASS___NSMutableData);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v48, 2LL));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v14));

    uint64_t v16 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v15 forKey:@"instructionData"]);
    instructionData = v5->_instructionData;
    v5->_instructionData = (NSData *)v16;

    uint64_t v18 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v15 forKey:@"clauseData"]);
    clauseData = v5->_clauseData;
    v5->_clauseData = (NSData *)v18;

    uint64_t v20 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v15 forKey:@"branchTargetData"]);
    branchTargetData = v5->_branchTargetData;
    v5->_branchTargetData = (NSData *)v20;

    uint64_t v22 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v15 forKey:@"binaryRangeData"]);
    binaryRangeData = v5->_binaryRangeData;
    v5->_binaryRangeData = (NSData *)v22;

    uint64_t v24 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v15 forKey:@"binaryLocationData"]);
    binaryLocationData = v5->_binaryLocationData;
    v5->_binaryLocationData = (NSData *)v24;

    uint64_t v26 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v15 forKey:@"registerInfoData"]);
    registerInfoData = v5->_registerInfoData;
    v5->_registerInfoData = (NSData *)v26;

    v47[0] = objc_opt_class(&OBJC_CLASS___NSArray);
    v47[1] = objc_opt_class(&OBJC_CLASS___NSMutableArray);
    v47[2] = objc_opt_class(&OBJC_CLASS___NSString);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v47, 3LL));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v28));
    uint64_t v30 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v29 forKey:@"strings"]);
    strings = v5->_strings;
    v5->_strings = (NSArray *)v30;

    if (v8 >= 2)
    {
      if (v5->_registerInfoData)
      {
        v32 = -[GTShaderProfilerBinaryAnalysisResult instructions](v5, "instructions");
        if (v32 < -[GTShaderProfilerBinaryAnalysisResult lastInstruction](v5, "lastInstruction"))
        {
          unint64_t v33 = 0LL;
          do
          {
            end = v5->_registerOffsets.__end_;
            value = v5->_registerOffsets.__end_cap_.__value_;
            if (end >= value)
            {
              begin = v5->_registerOffsets.__begin_;
              uint64_t v38 = end - begin;
              unint64_t v39 = v38 + 1;
              uint64_t v40 = (char *)value - (char *)begin;
              if (v40 >> 2 > v39) {
                unint64_t v39 = v40 >> 2;
              }
              else {
                unint64_t v41 = v39;
              }
              if (v41)
              {
                unint64_t v41 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<unsigned int,unsigned int>>>(v41);
                begin = v5->_registerOffsets.__begin_;
                end = v5->_registerOffsets.__end_;
              }

              else
              {
                uint64_t v42 = 0LL;
              }

              v43 = (unint64_t *)(v41 + 8 * v38);
              unint64_t *v43 = v33;
              v36 = v43 + 1;
              while (end != begin)
              {
                unint64_t v44 = *--end;
                *--v43 = v44;
              }

              v5->_registerOffsets.__begin_ = v43;
              v5->_registerOffsets.__end_ = v36;
              v5->_registerOffsets.__end_cap_.__value_ = (unint64_t *)(v41 + 8 * v42);
              if (begin) {
                operator delete(begin);
              }
            }

            else
            {
              unint64_t *end = v33;
              v36 = end + 1;
            }

            v5->_registerOffsets.__end_ = v36;
            v33 += v32->var7;
            v32 = (const $3FF9FA8D714CB2339D683D7D65AEC080 *)((char *)v32 + 36);
          }

          while (v32 < -[GTShaderProfilerBinaryAnalysisResult lastInstruction](v5, "lastInstruction"));
        }
      }
    }

    goto LABEL_34;
  }

  v9 = (uint32_t *)[v4 decodeIntegerForKey:@"instructionSize"];
  v10 = (segment_command_64 *)[v4 decodeIntegerForKey:@"clauseSize"];
  v11 = (int *)[v4 decodeIntegerForKey:@"branchTargetSize"];
  v12 = (int *)[v4 decodeIntegerForKey:@"binaryRangeSize"];
  v13 = (int *)[v4 decodeIntegerForKey:@"binaryLocationSize"];
  v7 = 0LL;
  if (v9 == &stru_20.cmdsize && v10 == &stru_20 && v11 == &dword_8 && v12 == &dword_18 && v13 == &dword_10)
  {
    if (v8 == 2 && [v4 decodeIntegerForKey:@"registerInfoSize"] != &dword_8) {
      goto LABEL_3;
    }
    goto LABEL_12;
  }

- (void)encodeWithCoder:(id)a3
{
  uint64_t version = self->_version;
  id v5 = a3;
  [v5 encodeInteger:version forKey:@"version"];
  [v5 encodeInteger:36 forKey:@"instructionSize"];
  [v5 encodeInteger:32 forKey:@"clauseSize"];
  [v5 encodeInteger:8 forKey:@"branchTargetSize"];
  [v5 encodeInteger:24 forKey:@"binaryRangeSize"];
  [v5 encodeInteger:16 forKey:@"binaryLocationSize"];
  [v5 encodeInteger:8 forKey:@"registerInfoSize"];
  int v6 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerBinaryAnalysisResult instructionData](self, "instructionData"));
  [v5 encodeObject:v6 forKey:@"instructionData"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerBinaryAnalysisResult clauseData](self, "clauseData"));
  [v5 encodeObject:v7 forKey:@"clauseData"];

  int v8 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerBinaryAnalysisResult branchTargetData](self, "branchTargetData"));
  [v5 encodeObject:v8 forKey:@"branchTargetData"];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerBinaryAnalysisResult binaryRangeData](self, "binaryRangeData"));
  [v5 encodeObject:v9 forKey:@"binaryRangeData"];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerBinaryAnalysisResult binaryLocationData](self, "binaryLocationData"));
  [v5 encodeObject:v10 forKey:@"binaryLocationData"];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerBinaryAnalysisResult registerInfoData](self, "registerInfoData"));
  [v5 encodeObject:v11 forKey:@"registerInfoData"];

  id v12 = (id)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerBinaryAnalysisResult strings](self, "strings"));
  [v5 encodeObject:v12 forKey:@"strings"];
}

- (const)instructions
{
  return (const $3FF9FA8D714CB2339D683D7D65AEC080 *)-[NSData bytes](self->_instructionData, "bytes");
}

- (const)clauses
{
  return (const $A0BB0C84700A1F9917ADF19F83391813 *)-[NSData bytes](self->_clauseData, "bytes");
}

- (const)binaryRanges
{
  return (const $6A62C185A4D2045C0BA5E18B70292D31 *)-[NSData bytes](self->_binaryRangeData, "bytes");
}

- (const)binaryLocations
{
  return (const $5E5F304956FB491AF6F034FDF0808287 *)-[NSData bytes](self->_binaryLocationData, "bytes");
}

- (const)branchTargets
{
  return (const $61A80719B04F7407D3E47539F1B23CAA *)-[NSData bytes](self->_branchTargetData, "bytes");
}

- (const)registerInfo
{
  return (const $85CD2974BE96D4886BB301820D1C36C2 *)-[NSData bytes](self->_registerInfoData, "bytes");
}

- (unint64_t)instructionCount
{
  return -[NSData length](self->_instructionData, "length") / 0x24;
}

- (unint64_t)clauseCount
{
  return -[NSData length](self->_clauseData, "length") >> 5;
}

- (unint64_t)binaryRangeCount
{
  return -[NSData length](self->_binaryRangeData, "length") / 0x18;
}

- (unint64_t)binaryLocationCount
{
  return -[NSData length](self->_binaryLocationData, "length") >> 4;
}

- (unint64_t)branchTargetCount
{
  return -[NSData length](self->_branchTargetData, "length") >> 3;
}

- (unint64_t)registerInfoCount
{
  return -[NSData length](self->_registerInfoData, "length") >> 3;
}

- (const)lastInstruction
{
  result = -[GTShaderProfilerBinaryAnalysisResult instructionCount](self, "instructionCount");
  if (result)
  {
    id v4 = -[NSData bytes](self->_instructionData, "bytes");
    return (const $3FF9FA8D714CB2339D683D7D65AEC080 *)&v4[36
                                                        * -[GTShaderProfilerBinaryAnalysisResult instructionCount]( self,  "instructionCount")
                                                        - 36];
  }

  return result;
}

- (const)lastClause
{
  result = -[GTShaderProfilerBinaryAnalysisResult clauseCount](self, "clauseCount");
  if (result)
  {
    id v4 = -[NSData bytes](self->_clauseData, "bytes");
    return (const $A0BB0C84700A1F9917ADF19F83391813 *)&v4[32
                                                        * -[GTShaderProfilerBinaryAnalysisResult clauseCount]( self,  "clauseCount")
                                                        - 32];
  }

  return result;
}

- (const)lastBinaryRange
{
  result = -[GTShaderProfilerBinaryAnalysisResult binaryRangeCount](self, "binaryRangeCount");
  if (result)
  {
    id v4 = -[NSData bytes](self->_binaryRangeData, "bytes");
    return (const $6A62C185A4D2045C0BA5E18B70292D31 *)&v4[24
                                                        * -[GTShaderProfilerBinaryAnalysisResult binaryRangeCount]( self,  "binaryRangeCount")
                                                        - 24];
  }

  return result;
}

- (const)lastBinaryLocation
{
  result = -[GTShaderProfilerBinaryAnalysisResult binaryLocationCount](self, "binaryLocationCount");
  if (result)
  {
    id v4 = -[NSData bytes](self->_binaryLocationData, "bytes");
    return (const $5E5F304956FB491AF6F034FDF0808287 *)&v4[16
                                                        * -[GTShaderProfilerBinaryAnalysisResult binaryLocationCount]( self,  "binaryLocationCount")
                                                        - 16];
  }

  return result;
}

- (const)lastBranchTarget
{
  result = -[GTShaderProfilerBinaryAnalysisResult branchTargetCount](self, "branchTargetCount");
  if (result)
  {
    id v4 = -[NSData bytes](self->_branchTargetData, "bytes");
    return (const $61A80719B04F7407D3E47539F1B23CAA *)&v4[8
                                                        * -[GTShaderProfilerBinaryAnalysisResult branchTargetCount]( self,  "branchTargetCount")
                                                        - 8];
  }

  return result;
}

- (const)lastRegisterInfo
{
  result = -[GTShaderProfilerBinaryAnalysisResult registerInfoCount](self, "registerInfoCount");
  if (result)
  {
    id v4 = -[NSData bytes](self->_registerInfoData, "bytes");
    return (const $85CD2974BE96D4886BB301820D1C36C2 *)&v4[8
                                                        * -[GTShaderProfilerBinaryAnalysisResult registerInfoCount]( self,  "registerInfoCount")
                                                        - 8];
  }

  return result;
}

- (void)setStrings:(id)a3
{
}

- (void)setClauseData:(id)a3
{
}

- (void)setInstructionData:(id)a3
{
  id v18 = a3;
  objc_storeStrong((id *)&self->_instructionData, a3);
  if (self->_registerInfoData)
  {
    self->_registerOffsets.__end_ = self->_registerOffsets.__begin_;
    id v5 = -[GTShaderProfilerBinaryAnalysisResult instructions](self, "instructions");
    if (v5 < -[GTShaderProfilerBinaryAnalysisResult lastInstruction](self, "lastInstruction"))
    {
      unint64_t v6 = 0LL;
      do
      {
        end = self->_registerOffsets.__end_;
        value = self->_registerOffsets.__end_cap_.__value_;
        if (end >= value)
        {
          begin = self->_registerOffsets.__begin_;
          uint64_t v11 = end - begin;
          unint64_t v12 = v11 + 1;
          uint64_t v13 = (char *)value - (char *)begin;
          if (v13 >> 2 > v12) {
            unint64_t v12 = v13 >> 2;
          }
          else {
            unint64_t v14 = v12;
          }
          if (v14)
          {
            unint64_t v14 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<unsigned int,unsigned int>>>(v14);
            begin = self->_registerOffsets.__begin_;
            end = self->_registerOffsets.__end_;
          }

          else
          {
            uint64_t v15 = 0LL;
          }

          uint64_t v16 = (unint64_t *)(v14 + 8 * v11);
          *uint64_t v16 = v6;
          v9 = v16 + 1;
          while (end != begin)
          {
            unint64_t v17 = *--end;
            *--uint64_t v16 = v17;
          }

          self->_registerOffsets.__begin_ = v16;
          self->_registerOffsets.__end_ = v9;
          self->_registerOffsets.__end_cap_.__value_ = (unint64_t *)(v14 + 8 * v15);
          if (begin) {
            operator delete(begin);
          }
        }

        else
        {
          unint64_t *end = v6;
          v9 = end + 1;
        }

        self->_registerOffsets.__end_ = v9;
        v6 += v5->var7;
        id v5 = (const $3FF9FA8D714CB2339D683D7D65AEC080 *)((char *)v5 + 36);
      }

      while (v5 < -[GTShaderProfilerBinaryAnalysisResult lastInstruction](self, "lastInstruction"));
    }
  }
}

- (void)setBinaryRangeData:(id)a3
{
}

- (void)setBinaryLocationData:(id)a3
{
}

- (void)setBranchTargetData:(id)a3
{
}

- (void)setRegisterInfoData:(id)a3
{
  id v18 = a3;
  objc_storeStrong((id *)&self->_registerInfoData, a3);
  if (self->_instructionData)
  {
    self->_registerOffsets.__end_ = self->_registerOffsets.__begin_;
    id v5 = -[GTShaderProfilerBinaryAnalysisResult instructions](self, "instructions");
    if (v5 < -[GTShaderProfilerBinaryAnalysisResult lastInstruction](self, "lastInstruction"))
    {
      unint64_t v6 = 0LL;
      do
      {
        end = self->_registerOffsets.__end_;
        value = self->_registerOffsets.__end_cap_.__value_;
        if (end >= value)
        {
          begin = self->_registerOffsets.__begin_;
          uint64_t v11 = end - begin;
          unint64_t v12 = v11 + 1;
          uint64_t v13 = (char *)value - (char *)begin;
          if (v13 >> 2 > v12) {
            unint64_t v12 = v13 >> 2;
          }
          else {
            unint64_t v14 = v12;
          }
          if (v14)
          {
            unint64_t v14 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<unsigned int,unsigned int>>>(v14);
            begin = self->_registerOffsets.__begin_;
            end = self->_registerOffsets.__end_;
          }

          else
          {
            uint64_t v15 = 0LL;
          }

          uint64_t v16 = (unint64_t *)(v14 + 8 * v11);
          *uint64_t v16 = v6;
          v9 = v16 + 1;
          while (end != begin)
          {
            unint64_t v17 = *--end;
            *--uint64_t v16 = v17;
          }

          self->_registerOffsets.__begin_ = v16;
          self->_registerOffsets.__end_ = v9;
          self->_registerOffsets.__end_cap_.__value_ = (unint64_t *)(v14 + 8 * v15);
          if (begin) {
            operator delete(begin);
          }
        }

        else
        {
          unint64_t *end = v6;
          v9 = end + 1;
        }

        self->_registerOffsets.__end_ = v9;
        v6 += v5->var7;
        id v5 = (const $3FF9FA8D714CB2339D683D7D65AEC080 *)((char *)v5 + 36);
      }

      while (v5 < -[GTShaderProfilerBinaryAnalysisResult lastInstruction](self, "lastInstruction"));
    }
  }
}

- (void)setVersion:(unsigned int)a3
{
  self->_uint64_t version = a3;
}

- (unint64_t)maxOffset
{
  unint64_t result = -[GTShaderProfilerBinaryAnalysisResult instructionCount](self, "instructionCount");
  if (result)
  {
    uint64_t v4 = *((void *)-[GTShaderProfilerBinaryAnalysisResult lastInstruction](self, "lastInstruction") + 1);
    return *((void *)-[GTShaderProfilerBinaryAnalysisResult lastInstruction](self, "lastInstruction") + 2) + v4;
  }

  return result;
}

- (unint64_t)registerInfoOffsetForInstructionIndex:(unint64_t)a3
{
  begin = self->_registerOffsets.__begin_;
  if (a3 >= self->_registerOffsets.__end_ - begin) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return begin[a3];
  }
}

- (unsigned)version
{
  return self->_version;
}

- (NSArray)strings
{
  return self->_strings;
}

- (NSData)instructionData
{
  return self->_instructionData;
}

- (NSData)clauseData
{
  return self->_clauseData;
}

- (NSData)branchTargetData
{
  return self->_branchTargetData;
}

- (NSData)binaryRangeData
{
  return self->_binaryRangeData;
}

- (NSData)binaryLocationData
{
  return self->_binaryLocationData;
}

- (NSData)registerInfoData
{
  return self->_registerInfoData;
}

- (void).cxx_destruct
{
  begin = self->_registerOffsets.__begin_;
  if (begin)
  {
    self->_registerOffsets.__end_ = begin;
    operator delete(begin);
  }

  objc_storeStrong((id *)&self->_strings, 0LL);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0LL;
  *((void *)self + 4) = 0LL;
  *((void *)self + 5) = 0LL;
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)analyzeBinary:(id)a3 targetIndex:(int)a4 isaPrinter:(id)a5
{
  if (a4 > 4) {
    return 0LL;
  }
  id v5 = GTShaderProfilerAnalyzeBinaryLLVM(a3, *(uint64_t *)&a4, a5);
  return (id)objc_claimAutoreleasedReturnValue(v5);
}

+ (id)dataFromArchivedDataURL:(id)a3
{
  id v10 = 0LL;
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  a3,  0LL,  &v10));
  id v4 = v10;
  if (v4)
  {
    id v5 = v4;
    unint64_t v6 = 0LL;
  }

  else
  {
    id v9 = 0LL;
    id v7 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___GTShaderProfilerBinaryAnalysisResult),  v3,  &v9);
    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
    id v5 = v9;
  }

  return v6;
}

@end