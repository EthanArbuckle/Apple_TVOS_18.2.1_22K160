@interface SACallTreeFrame
+ (id)callTreeFrameWithFrame:(id)a3 startSampleIndex:(unint64_t)a4 sampleCount:(unint64_t)a5 isLeafFrame:(BOOL)a6;
+ (void)enumerateTree:(void *)a3 block:;
- (BOOL)isTruncatedLeafCallstack;
- (NSArray)childFrames;
- (SACallTreeFrame)initWithFrame:(id)a3 startSampleIndex:(unint64_t)a4 sampleCount:(unint64_t)a5 isLeafFrame:(BOOL)a6;
- (SAFrame)frame;
- (void)writeJSONDictionaryEntriesToStream:(id)a3;
@end

@implementation SACallTreeFrame

- (SACallTreeFrame)initWithFrame:(id)a3 startSampleIndex:(unint64_t)a4 sampleCount:(unint64_t)a5 isLeafFrame:(BOOL)a6
{
  id v11 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___SACallTreeFrame;
  v12 = -[SACallTreeNode initWithStartSampleIndex:sampleCount:](&v17, sel_initWithStartSampleIndex_sampleCount_, a4, a5);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_frame, a3);
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    children = v13->_children;
    v13->_children = v14;

    v13->_isLeafFrame = a6;
  }

  return v13;
}

+ (id)callTreeFrameWithFrame:(id)a3 startSampleIndex:(unint64_t)a4 sampleCount:(unint64_t)a5 isLeafFrame:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithFrame:v10 startSampleIndex:a4 sampleCount:a5 isLeafFrame:v6];

  return v11;
}

- (BOOL)isTruncatedLeafCallstack
{
  return 0;
}

- (NSArray)childFrames
{
  return (NSArray *)FilterArrayToCallTreeFrames(self->_children);
}

+ (void)enumerateTree:(void *)a3 block:
{
  id v4 = a2;
  v5 = a3;
  objc_opt_self();
  id v6 = objc_alloc(MEMORY[0x189603FA8]);
  v7 = (void *)[v4 mutableCopy];
  v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, 0);

  if ([v8 count])
  {
    uint64_t v9 = 0LL;
    id v10 = sel_initWithStartSampleIndex_sampleCount_;
    id v11 = &OBJC_IVAR___SASharedCache__slidBaseAddress;
    while (1)
    {
      uint64_t v12 = [v8 lastObject];
      if (!v12) {
        goto LABEL_29;
      }
      v13 = (void *)v12;
      while (![v13 count])
      {
        uint64_t v9 = (v9 - 1);
        [v8 removeLastObject];
        uint64_t v14 = [v8 lastObject];

        v13 = (void *)v14;
        if (!v14) {
          goto LABEL_29;
        }
      }

      [v13 firstObject];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 removeObjectAtIndex:0];
      char v37 = 0;
      v5[2](v5, v15, v9, &v37);
      if (v37)
      {

        goto LABEL_29;
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0) {
        break;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v36 = v10;
        v22 = v15;
        v23 = objc_alloc(&OBJC_CLASS___SACallTreeStateChildren);
        uint64_t v35 = [v22 startSampleIndex];
        uint64_t v34 = [v22 sampleCount];
        if (v22)
        {
          id v25 = objc_getProperty(v22, v24, 88LL, 1);
          id v27 = objc_getProperty(v22, v26, 80LL, 1);
          LODWORD(v32) = v22[10];
          HIDWORD(v32) = v22[9];
        }

        else
        {
          uint64_t v32 = 0LL;
          id v25 = 0LL;
          id v27 = 0LL;
        }

        id obj = v25;
        id v28 = v25;
        id v29 = v27;
        if (v23)
        {
          v38.receiver = v23;
          v38.super_class = (Class)&OBJC_CLASS___SACallTreeStateChildren;
          v30 = (SACallTreeStateChildren *)objc_msgSendSuper2(&v38, v36, v35, v34);
          v23 = v30;
          if (v30)
          {
            objc_storeStrong((id *)&v30->_timeRanges, obj);
            objc_storeStrong((id *)&v23->_ioEvents, v27);
            v23->_originPid = HIDWORD(v32);
            v23->_proximatePid = v32;
          }
        }

        v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithObjects:", v23, 0);
        [v8 addObject:v31];

        uint64_t v9 = (v9 + 1);
        id v10 = (char *)v36;
        id v11 = &OBJC_IVAR___SASharedCache__slidBaseAddress;
        goto LABEL_23;
      }

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  frame = self->_frame;
  id v5 = a3;
  -[SAFrame writeJSONDictionaryEntriesToStream:](frame, "writeJSONDictionaryEntriesToStream:", v5);
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", -[SACallTreeNode sampleCount](self, "sampleCount"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryEntry(v5, @"count", v6);
}

- (SAFrame)frame
{
  return (SAFrame *)objc_getProperty(self, a2, 32LL, 1);
}

- (void).cxx_destruct
{
}

@end