@interface PQLResultSet
- (id)cplChangeAtIndex:(int)a3;
@end

@implementation PQLResultSet

- (id)cplChangeAtIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = objc_autoreleasePoolPush();
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PQLResultSet dataAtIndex:](self, "dataAtIndex:", v3));
  if (v6)
  {
    id v7 = +[CPLArchiver unarchiveObjectWithData:ofClass:]( &OBJC_CLASS___CPLArchiver,  "unarchiveObjectWithData:ofClass:",  v6,  objc_opt_class(&OBJC_CLASS___CPLRecordChange));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }

  else
  {
    v8 = 0LL;
  }

  objc_autoreleasePoolPop(v5);
  return v8;
}

@end