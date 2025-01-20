@interface _DASPredictionUtilites
+ (id)computeAccuraciesFromSortedPredictions:(id)a3 andObservations:(id)a4 withEqualityOperator:(id)a5;
@end

@implementation _DASPredictionUtilites

+ (id)computeAccuraciesFromSortedPredictions:(id)a3 andObservations:(id)a4 withEqualityOperator:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_alloc_init(&OBJC_CLASS____DASPredictionAccuracy);
  if ([v7 count])
  {
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v20 = v8;
    id obj = v8;
    id v11 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (!v11) {
      goto LABEL_20;
    }
    id v12 = v11;
    uint64_t v13 = *(void *)v25;
    while (1)
    {
      v14 = 0LL;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)v14);
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472LL;
        v22[2] = sub_1000140C4;
        v22[3] = &unk_100115240;
        id v16 = v9;
        v22[4] = v15;
        id v23 = v16;
        id v17 = [v7 indexOfObjectPassingTest:v22];
        if (v17 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          if (!v17)
          {
            -[_DASPredictionAccuracy setTop1Hits:]( v10,  "setTop1Hits:",  -[_DASPredictionAccuracy top1Hits](v10, "top1Hits") + 1);
LABEL_11:
            -[_DASPredictionAccuracy setTop3Hits:]( v10,  "setTop3Hits:",  -[_DASPredictionAccuracy top3Hits](v10, "top3Hits", v20) + 1);
LABEL_12:
            -[_DASPredictionAccuracy setTop5Hits:]( v10,  "setTop5Hits:",  -[_DASPredictionAccuracy top5Hits](v10, "top5Hits", v20) + 1);
LABEL_13:
            -[_DASPredictionAccuracy setTop10Hits:]( v10,  "setTop10Hits:",  -[_DASPredictionAccuracy top10Hits](v10, "top10Hits", v20) + 1);
            goto LABEL_14;
          }
        }

@end