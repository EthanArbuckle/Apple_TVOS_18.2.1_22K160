@interface IDSAsyncMapper
+ (void)mapArray:(id)a3 onQueue:(id)a4 withBlock:(id)a5 completion:(id)a6 onQueue:(id)a7;
+ (void)mapArray:(id)a3 withBlock:(id)a4 completion:(id)a5 onQueue:(id)a6;
+ (void)mapDictionary:(id)a3 onQueue:(id)a4 withBlock:(id)a5 completion:(id)a6 onQueue:(id)a7;
+ (void)mapDictionary:(id)a3 withBlock:(id)a4 completion:(id)a5 onQueue:(id)a6;
@end

@implementation IDSAsyncMapper

+ (void)mapArray:(id)a3 withBlock:(id)a4 completion:(id)a5 onQueue:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  dispatch_queue_t v14 = sub_1002A5550();
  id v15 = (id)objc_claimAutoreleasedReturnValue(v14);
  [a1 mapArray:v13 onQueue:v15 withBlock:v12 completion:v11 onQueue:v10];
}

+ (void)mapArray:(id)a3 onQueue:(id)a4 withBlock:(id)a5 completion:(id)a6 onQueue:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v13)
  {
    id v24 = a1;
    v25 = v14;
    v17 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    if ([v12 count])
    {
      unint64_t v19 = 0LL;
      do
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null", v24));
        -[NSMutableArray addObject:](v17, "addObject:", v20);

        v21 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:v19]);
        v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v19));
        -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v21, v22);

        ++v19;
      }

      while (v19 < (unint64_t)[v12 count]);
    }

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_1002A5794;
    v29[3] = &unk_1008FF820;
    id v14 = v25;
    id v30 = v25;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_1002A57A8;
    v26[3] = &unk_1008F82D8;
    v27 = v17;
    id v28 = v15;
    v23 = v17;
    [v24 mapDictionary:v18 onQueue:v13 withBlock:v29 completion:v26 onQueue:v16];
  }
}

+ (void)mapDictionary:(id)a3 withBlock:(id)a4 completion:(id)a5 onQueue:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  dispatch_queue_t v14 = sub_1002A5550();
  id v15 = (id)objc_claimAutoreleasedReturnValue(v14);
  [a1 mapDictionary:v13 onQueue:v15 withBlock:v12 completion:v11 onQueue:v10];
}

+ (void)mapDictionary:(id)a3 onQueue:(id)a4 withBlock:(id)a5 completion:(id)a6 onQueue:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v33 = a5;
  id v13 = a6;
  dispatch_queue_t v14 = (dispatch_queue_s *)a7;
  id v15 = v14;
  id v16 = v12;
  if (v12)
  {
    queue = v14;
    v31 = v13;
    dispatch_group_t v17 = dispatch_group_create();
    v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    id v32 = v11;
    id v19 = v11;
    id v20 = [v19 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v45;
      do
      {
        for (i = 0LL; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v45 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v44 + 1) + 8LL * (void)i);
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", v24, queue));
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1002A5C20;
          block[3] = &unk_1008FF870;
          v26 = v17;
          v38 = v26;
          id v43 = v33;
          uint64_t v39 = v24;
          id v40 = v25;
          v27 = v16;
          v41 = v27;
          v42 = v18;
          id v28 = v25;
          dispatch_group_async(v26, v27, block);
        }

        id v21 = [v19 countByEnumeratingWithState:&v44 objects:v48 count:16];
      }

      while (v21);
    }

    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_1002A5E00;
    v34[3] = &unk_1008F6358;
    id v13 = v31;
    v35 = v18;
    id v36 = v31;
    v29 = v18;
    id v15 = queue;
    dispatch_group_notify(v17, queue, v34);

    id v11 = v32;
  }
}

@end