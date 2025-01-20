@interface WTVConstraintInterpolator
- (NSArray)constraints;
- (NSArray)endConstants;
- (NSArray)startConstants;
- (WTVConstraintInterpolator)initWithStartConstraints:(id)a3 endConstraints:(id)a4;
- (void)setConstraints:(id)a3;
- (void)setEndConstants:(id)a3;
- (void)setStartConstants:(id)a3;
- (void)updateConstraintConstantsWithTransitionProgress:(double)a3;
@end

@implementation WTVConstraintInterpolator

- (WTVConstraintInterpolator)initWithStartConstraints:(id)a3 endConstraints:(id)a4
{
  id v36 = a3;
  id v6 = a4;
  v47.receiver = self;
  v47.super_class = (Class)&OBJC_CLASS___WTVConstraintInterpolator;
  v7 = -[WTVConstraintInterpolator init](&v47, "init");
  v8 = v7;
  if (v7)
  {
    v29 = v7;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v30 = v6;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    id obj = v6;
    id v37 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (!v37) {
      goto LABEL_25;
    }
    uint64_t v35 = *(void *)v44;
    while (1)
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v44 != v35) {
          objc_enumerationMutation(obj);
        }
        uint64_t v38 = v9;
        v10 = *(void **)(*((void *)&v43 + 1) + 8 * v9);
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        id v11 = v36;
        id v12 = [v11 countByEnumeratingWithState:&v39 objects:v48 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v40;
          do
          {
            v15 = 0LL;
            do
            {
              if (*(void *)v40 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)v15);
              v17 = (void *)objc_claimAutoreleasedReturnValue([v16 firstItem]);
              v18 = (void *)objc_claimAutoreleasedReturnValue([v10 firstItem]);
              if (v17 != v18) {
                goto LABEL_17;
              }
              id v19 = [v16 firstAttribute];
              if (v19 != [v10 firstAttribute]) {
                goto LABEL_17;
              }
              id v20 = [v16 relation];
              if (v20 != [v10 relation]) {
                goto LABEL_17;
              }
              v21 = (void *)objc_claimAutoreleasedReturnValue([v16 secondItem]);
              v22 = (void *)objc_claimAutoreleasedReturnValue([v10 secondItem]);
              if (v21 != v22)
              {

                v18 = v17;
LABEL_17:

                goto LABEL_18;
              }

              id v23 = [v16 secondAttribute];
              id v24 = [v10 secondAttribute];

              if (v23 == v24)
              {
                [v33 addObject:v10];
                [v16 constant];
                v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
                [v32 addObject:v26];

                [v10 constant];
                v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
                [v31 addObject:v27];

                goto LABEL_23;
              }

- (void)updateConstraintConstantsWithTransitionProgress:(double)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConstraintInterpolator constraints](self, "constraints"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_AA64;
  v6[3] = &unk_1C610;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  [v5 enumerateObjectsUsingBlock:v6];
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (NSArray)startConstants
{
  return self->_startConstants;
}

- (void)setStartConstants:(id)a3
{
}

- (NSArray)endConstants
{
  return self->_endConstants;
}

- (void)setEndConstants:(id)a3
{
}

- (void).cxx_destruct
{
}

@end