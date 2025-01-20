@interface CLHarvestScoredRequestArchive
- (CLHRequestArchive)archive;
- (CLHarvestScoredRequestArchive)initWithArchive:(id)a3 index:(unsigned int)a4;
- (float)score;
- (unsigned)index;
- (void)dealloc;
- (void)setArchive:(id)a3;
- (void)setScore:(float)a3;
@end

@implementation CLHarvestScoredRequestArchive

- (CLHarvestScoredRequestArchive)initWithArchive:(id)a3 index:(unsigned int)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CLHarvestScoredRequestArchive;
  v6 = -[CLHarvestScoredRequestArchive init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    -[CLHarvestScoredRequestArchive setArchive:](v6, "setArchive:", a3);
    LODWORD(v8) = 0;
    -[CLHarvestScoredRequestArchive setScore:](v7, "setScore:", v8);
    v7->_index = a4;
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLHarvestScoredRequestArchive;
  -[CLHarvestScoredRequestArchive dealloc](&v3, "dealloc");
}

- (float)score
{
  return self->_score;
}

- (void)setScore:(float)a3
{
  self->_score = a3;
}

- (CLHRequestArchive)archive
{
  return self->_archive;
}

- (void)setArchive:(id)a3
{
}

- (unsigned)index
{
  return self->_index;
}

@end