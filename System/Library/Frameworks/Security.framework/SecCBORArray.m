@interface SecCBORArray
- (SecCBORArray)init;
- (SecCBORArray)initWith:(id)a3;
- (int)fieldType;
- (void)addObject:(id)a3;
- (void)write:(id)a3;
@end

@implementation SecCBORArray

- (int)fieldType
{
  return 4;
}

- (SecCBORArray)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SecCBORArray;
  v2 = -[SecCBORArray init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    m_data = v2->m_data;
    v2->m_data = v3;
  }

  return v2;
}

- (SecCBORArray)initWith:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SecCBORArray;
  v5 = -[SecCBORArray init](&v9, sel_init);
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x189603FA8]) initWithArray:v4];
    m_data = v5->m_data;
    v5->m_data = (NSMutableArray *)v6;
  }

  return v5;
}

- (void)addObject:(id)a3
{
}

- (void)write:(id)a3
{
  id v6 = a3;
  -[SecCBORValue encodeStartItems:output:]( self,  "encodeStartItems:output:",  -[NSMutableArray count](self->m_data, "count"),  v6);
  if (-[NSMutableArray count](self->m_data, "count"))
  {
    unint64_t v4 = 0LL;
    do
    {
      v5 = -[NSMutableArray objectAtIndexedSubscript:](self->m_data, "objectAtIndexedSubscript:", v4);
      [v5 write:v6];

      ++v4;
    }

    while (v4 < -[NSMutableArray count](self->m_data, "count"));
  }
}

- (void).cxx_destruct
{
}

@end