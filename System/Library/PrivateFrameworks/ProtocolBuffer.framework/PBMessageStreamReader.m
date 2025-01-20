@interface PBMessageStreamReader
- (Class)classOfNextMessage;
- (PBMessageStreamReader)initWithStream:(id)a3;
- (id)nextMessage;
- (unint64_t)position;
- (void)setClassOfNextMessage:(Class)a3;
@end

@implementation PBMessageStreamReader

- (PBMessageStreamReader)initWithStream:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PBMessageStreamReader;
  v6 = -[PBMessageStreamReader init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_stream, a3);
  }

  return v7;
}

- (id)nextMessage
{
  unint64_t v3 = 0LL;
  uint64_t v19 = *MEMORY[0x1895F89C0];
  while (-[NSInputStream read:maxLength:](self->_stream, "read:maxLength:", v18, 1LL) == 1)
  {
    int v4 = v18[0];
    v18[v3 + 1] = v18[0];
    unint64_t v5 = v3 + 1;
    if (v4 < 0 && v3++ < 9) {
      continue;
    }
    uint64_t v7 = 0LL;
    uint64_t v8 = 0LL;
    uint64_t v9 = 0LL;
    while (v5 != v8)
    {
      v9 |= (unint64_t)(v18[v8 + 1] & 0x7F) << v7;
      if ((v18[v8 + 1] & 0x80) == 0)
      {
        v12 = (void *)[objc_alloc(MEMORY[0x189603FB8]) initWithLength:v9];
        v13 = v12;
        if (v12
          && [v12 length] == v9
          && (stream = self->_stream,
              id v15 = v13,
              -[NSInputStream read:maxLength:](stream, "read:maxLength:", [v15 mutableBytes], v9) == v9))
        {
          self->_position += v9 + v5;
          v16 = -[PBDataReader initWithData:](objc_alloc(&OBJC_CLASS___PBDataReader), "initWithData:", v15);
          if (-[PBMessageStreamReader classOfNextMessage](self, "classOfNextMessage"))
          {
            id v17 = objc_alloc_init(-[PBMessageStreamReader classOfNextMessage](self, "classOfNextMessage"));
            v10 = v17;
            if (v17) {
              [v17 readFrom:v16];
            }
          }

          else
          {
            v10 = 0LL;
          }
        }

        else
        {
          v10 = 0LL;
        }

        return v10;
      }

      ++v8;
      v7 += 7LL;
      if (v7 == 70) {
        return 0LL;
      }
    }

    return 0LL;
  }

  return 0LL;
}

- (Class)classOfNextMessage
{
  return self->_classOfNextMessage;
}

- (void)setClassOfNextMessage:(Class)a3
{
  self->_classOfNextMessage = a3;
}

- (unint64_t)position
{
  return self->_position;
}

- (void).cxx_destruct
{
}

@end