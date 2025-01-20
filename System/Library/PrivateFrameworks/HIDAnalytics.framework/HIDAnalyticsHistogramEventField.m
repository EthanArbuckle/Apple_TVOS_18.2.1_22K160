@interface HIDAnalyticsHistogramEventField
- (HIDAnalyticsHistogramEventField)initWithAttributes:(id)a3 segments:(_HIDAnalyticsHistogramSegmentConfig *)a4 count:(int64_t)a5;
- (NSString)fieldName;
- (id)value;
- (void)createBuckets:(_HIDAnalyticsHistogramSegmentConfig *)a3 count:(int64_t)a4;
- (void)dealloc;
- (void)setIntegerValue:(unint64_t)a3;
- (void)setValue:(id)a3;
@end

@implementation HIDAnalyticsHistogramEventField

- (HIDAnalyticsHistogramEventField)initWithAttributes:(id)a3 segments:(_HIDAnalyticsHistogramSegmentConfig *)a4 count:(int64_t)a5
{
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___HIDAnalyticsHistogramEventField;
  v10 = -[HIDAnalyticsHistogramEventField init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_fieldName, a3);
    -[HIDAnalyticsHistogramEventField createBuckets:count:](v11, "createBuckets:count:", a4, a5);
    v12 = v11;
  }

  return v11;
}

- (void)dealloc
{
  segments = self->_segments;
  if (segments)
  {
    uint64_t v4 = -1LL;
    uint64_t v5 = 8LL;
    while (++v4 < (unint64_t)self->_segmentCount)
    {
      if (*(void *)(&segments->var0 + v5))
      {
        free(*(void **)(&segments->var0 + v5));
        segments = self->_segments;
      }

      v5 += 16LL;
      if (!segments) {
        goto LABEL_9;
      }
    }

    free(segments);
  }

- (void)setValue:(id)a3
{
  char v4 = [a3 unsignedIntegerValue];
  unsigned int segmentCount = self->_segmentCount;
  if (self->_segmentCount)
  {
    unint64_t v6 = 0LL;
    segments = self->_segments;
    do
    {
      uint64_t var0 = segments[v6].var0;
      if (segments[v6].var0)
      {
        id v9 = (char *)segments[v6].var1 + 4;
        do
        {
          *id v9 = v4;
          v9 += 6;
          --var0;
        }

        while (var0);
        unsigned int segmentCount = self->_segmentCount;
      }

      ++v6;
    }

    while (v6 < segmentCount);
  }

- (void)createBuckets:(_HIDAnalyticsHistogramSegmentConfig *)a3 count:(int64_t)a4
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  self->_unsigned int segmentCount = a4;
  size_t v7 = 16LL * a4;
  v8 = (_HIDAnalyticsHistogramSegment *)malloc(v7);
  self->_segments = v8;
  bzero(v8, v7);
  if (a4 >= 1)
  {
    uint64_t v9 = 0LL;
    v10 = (os_log_s *)MEMORY[0x1895F8DA0];
    do
    {
      v11 = &a3[v9];
      unint64_t var3 = v11->var3;
      if (var3 <= 1) {
        uint64_t v13 = 1LL;
      }
      else {
        uint64_t v13 = v11->var3;
      }
      if (var3 >= 2 && os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        fieldName = self->_fieldName;
        *(_DWORD *)buf = 134218242;
        uint64_t v23 = v13;
        __int16 v24 = 2112;
        v25 = fieldName;
        _os_log_impl( &dword_188802000,  v10,  OS_LOG_TYPE_DEFAULT,  "HIDAnalytics higher value normalizer %llu for field %@ , reduce to 1 ",  buf,  0x16u);
      }

      int var2 = v11->var2;
      uint64_t var0 = v11->var0;
      v17 = &self->_segments[v9];
      v17->uint64_t var0 = var0;
      size_t v18 = 6 * var0;
      v17->int var1 = (_HIDAnalyticsHistogramBucket *)malloc(6 * var0);
      bzero(self->_segments[v9].var1, v18);
      uint64_t v19 = v11->var0;
      if (v11->var0)
      {
        int var1 = a3[v9].var1;
        v21 = (_WORD *)((char *)self->_segments[v9].var1 + 2);
        do
        {
          *(v21 - 1) = var2;
          var2 += var1;
          _WORD *v21 = var2;
          v21 += 3;
          --v19;
        }

        while (v19);
      }

      ++v9;
    }

    while (v9 != a4);
  }

- (void)setIntegerValue:(unint64_t)a3
{
  uint64_t segmentCount = self->_segmentCount;
  if (self->_segmentCount)
  {
    uint64_t v4 = 0LL;
    segments = self->_segments;
    do
    {
      if (segments[v4].var0)
      {
        uint64_t v6 = 0LL;
        int var1 = segments[v4].var1;
        uint64_t v8 = 6LL * segments[v4].var0;
        do
        {
          if (!(_DWORD)v6 && (unsigned __int16)a3 <= *(unsigned __int16 *)((char *)var1 + v6)
            || (_DWORD)v8 - 6 == (_DWORD)v6
            && (unsigned __int16)a3 > *(unsigned __int16 *)((char *)var1 + v6 + 2)
            || (unsigned __int16)a3 > *(unsigned __int16 *)((char *)var1 + v6)
            && (unsigned __int16)a3 <= *(unsigned __int16 *)((char *)var1 + v6 + 2))
          {
            ++*((_BYTE *)var1 + v6 + 4);
          }

          v6 += 6LL;
        }

        while (v8 != v6);
      }

      ++v4;
    }

    while (v4 != segmentCount);
  }

- (id)value
{
  v3 = (void *)MEMORY[0x1895CCE2C](self, a2);
  id v4 = objc_alloc_init(MEMORY[0x189603FA8]);
  uint64_t segmentCount = self->_segmentCount;
  if (self->_segmentCount)
  {
    uint64_t v6 = 0LL;
    segments = self->_segments;
    do
    {
      if (segments[v6].var0)
      {
        unint64_t v8 = 0LL;
        uint64_t v9 = 4LL;
        do
        {
          [MEMORY[0x189607968] numberWithUnsignedChar:*((unsigned __int8 *)segments[v6].var1 + v9)];
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          [v4 addObject:v10];

          ++v8;
          segments = self->_segments;
          v9 += 6LL;
        }

        while (v8 < segments[v6].var0);
      }

      ++v6;
    }

    while (v6 != segmentCount);
  }

  objc_autoreleasePoolPop(v3);
  return v4;
}

- (NSString)fieldName
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void).cxx_destruct
{
}

@end