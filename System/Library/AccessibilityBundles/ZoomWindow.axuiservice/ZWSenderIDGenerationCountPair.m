@interface ZWSenderIDGenerationCountPair
- (BOOL)isEqual:(id)a3;
- (ZWSenderIDGenerationCountPair)initWithSenderID:(unint64_t)a3 generationCount:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)generationCount;
- (unint64_t)hash;
- (unint64_t)senderID;
- (void)setGenerationCount:(int64_t)a3;
- (void)setSenderID:(unint64_t)a3;
@end

@implementation ZWSenderIDGenerationCountPair

- (ZWSenderIDGenerationCountPair)initWithSenderID:(unint64_t)a3 generationCount:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ZWSenderIDGenerationCountPair;
  result = -[ZWSenderIDGenerationCountPair init](&v7, "init");
  if (result)
  {
    result->_senderID = a3;
    result->_generationCount = a4;
  }

  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ZWSenderIDGenerationCountPair initWithSenderID:generationCount:]( objc_alloc(&OBJC_CLASS___ZWSenderIDGenerationCountPair),  "initWithSenderID:generationCount:",  self->_senderID,  self->_generationCount);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___ZWSenderIDGenerationCountPair);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = v4;
    id v7 = [v6 senderID];
    if (v7 == (id)-[ZWSenderIDGenerationCountPair senderID](self, "senderID"))
    {
      id v8 = [v6 generationCount];
      BOOL v9 = v8 == (id)-[ZWSenderIDGenerationCountPair generationCount](self, "generationCount");
    }

    else
    {
      BOOL v9 = 0;
    }
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = -[ZWSenderIDGenerationCountPair senderID](self, "senderID");
  return -[ZWSenderIDGenerationCountPair generationCount](self, "generationCount") ^ v3;
}

- (unint64_t)senderID
{
  return self->_senderID;
}

- (void)setSenderID:(unint64_t)a3
{
  self->_senderID = a3;
}

- (int64_t)generationCount
{
  return self->_generationCount;
}

- (void)setGenerationCount:(int64_t)a3
{
  self->_generationCount = a3;
}

@end