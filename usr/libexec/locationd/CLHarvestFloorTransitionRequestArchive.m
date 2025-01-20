@interface CLHarvestFloorTransitionRequestArchive
- (CLHarvestFloorTransitionRequestArchive)initWithArchive:(id)a3 index:(unsigned int)a4 score:(float)a5 apHarvestCount:(unsigned int)a6 macsNotInALSDatabase:(id)a7;
- (NSMutableSet)macsNotInALSDatabase;
- (id)debugDescription;
- (id)description;
- (unsigned)apHarvestCount;
- (void)dealloc;
- (void)setApHarvestCount:(unsigned int)a3;
- (void)setMacsNotInALSDatabase:(id)a3;
@end

@implementation CLHarvestFloorTransitionRequestArchive

- (CLHarvestFloorTransitionRequestArchive)initWithArchive:(id)a3 index:(unsigned int)a4 score:(float)a5 apHarvestCount:(unsigned int)a6 macsNotInALSDatabase:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CLHarvestFloorTransitionRequestArchive;
  v10 = -[CLHarvestScoredRequestArchive initWithArchive:index:](&v14, "initWithArchive:index:", a3, *(void *)&a4);
  v12 = v10;
  if (v10)
  {
    *(float *)&double v11 = a5;
    -[CLHarvestScoredRequestArchive setScore:](v10, "setScore:", v11);
    -[CLHarvestFloorTransitionRequestArchive setApHarvestCount:](v12, "setApHarvestCount:", v8);
    -[CLHarvestFloorTransitionRequestArchive setMacsNotInALSDatabase:](v12, "setMacsNotInALSDatabase:", a7);
  }

  return v12;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLHarvestFloorTransitionRequestArchive;
  -[CLHarvestScoredRequestArchive dealloc](&v3, "dealloc");
}

- (id)description
{
  uint64_t v3 = -[CLHarvestScoredRequestArchive index](self, "index");
  -[CLHarvestScoredRequestArchive score](self, "score");
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CLHarvestFloorTransitionRequestArchive: index %u, score %.1f, apHarvestCount %d",  v3,  v4,  self->_apHarvestCount);
}

- (id)debugDescription
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  v12 = self;
  macsNotInALSDatabase = self->_macsNotInALSDatabase;
  id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( macsNotInALSDatabase,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v5)
  {
    v6 = &stru_1018A4B00;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(macsNotInALSDatabase);
        }
        nullsub_10([*(id *)(*((void *)&v15 + 1) + 8 * (void)i) unsignedLongLongValue]);
        uint64_t v14 = v9;
        sub_1007EC360(&__p);
        if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
          p_p = &__p;
        }
        else {
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        }
        -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@%@",  v6,  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", p_p));
        v6 = @", ";
      }

      id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( macsNotInALSDatabase,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      v6 = @", ";
    }

    while (v5);
  }

  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@, APs not in ALS database: [%@]",  -[CLHarvestFloorTransitionRequestArchive description](v12, "description"),  v3);
}

- (unsigned)apHarvestCount
{
  return self->_apHarvestCount;
}

- (void)setApHarvestCount:(unsigned int)a3
{
  self->_apHarvestCount = a3;
}

- (NSMutableSet)macsNotInALSDatabase
{
  return self->_macsNotInALSDatabase;
}

- (void)setMacsNotInALSDatabase:(id)a3
{
}

@end