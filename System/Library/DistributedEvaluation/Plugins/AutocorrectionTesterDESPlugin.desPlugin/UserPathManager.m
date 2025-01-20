@interface UserPathManager
- (BOOL)buildLookupTree;
- (BOOL)computeTranslations:(id)a3;
- (UserPathManager)initWithPathFile:(id)a3;
- (id)lookup:(id)a3 keyboardController:(id)a4;
- (id)translateLayoutForKeys:(id)a3 keyboardController:(id)a4;
- (void)dealloc;
- (void)setRandomNumberSeed:(unsigned int)a3;
@end

@implementation UserPathManager

- (UserPathManager)initWithPathFile:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___UserPathManager;
  v6 = -[UserPathManager init](&v19, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pathFile, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[TTKTestCaseReader loadFromPath:](&OBJC_CLASS___TTKTestCaseReader, "loadFromPath:", v5));
    source = v7->_source;
    v7->_source = (TTKTestCaseSource *)v8;

    if (!v7->_source)
    {
      fprintf( __stderrp, "Error: Unable to parse user path JSON file '%s'\n\n", (const char *)[v5 cStringUsingEncoding:4]);
      v17 = 0LL;
      goto LABEL_8;
    }

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    transforms = v7->_transforms;
    v7->_transforms = (NSMutableDictionary *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    lookupTree = v7->_lookupTree;
    v7->_lookupTree = (NSMutableDictionary *)v12;

    -[UserPathManager buildLookupTree](v7, "buildLookupTree");
    v14 = operator new(0x9C8uLL);
    unsigned int v15 = 5489;
    _DWORD *v14 = 5489;
    for (uint64_t i = 1LL; i != 624; ++i)
    {
      unsigned int v15 = i + 1812433253 * (v15 ^ (v15 >> 30));
      v14[i] = v15;
    }

    *((void *)v14 + 312) = 0LL;
    v7->m_generator = v14;
    -[UserPathManager setRandomNumberSeed:](v7, "setRandomNumberSeed:", 0LL);
  }

  v17 = v7;
LABEL_8:

  return v17;
}

- (void)dealloc
{
  m_generator = self->m_generator;
  if (m_generator) {
    operator delete(m_generator);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___UserPathManager;
  -[UserPathManager dealloc](&v4, "dealloc");
}

- (void)setRandomNumberSeed:(unsigned int)a3
{
  m_generator = self->m_generator;
  _DWORD *m_generator = a3;
  for (uint64_t i = 1LL; i != 624; ++i)
  {
    a3 = i + 1812433253 * (a3 ^ (a3 >> 30));
    m_generator[i] = a3;
  }

  *((void *)m_generator + 312) = 0LL;
}

- (BOOL)computeTranslations:(id)a3
{
  id v4 = a3;
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[TTKTestCaseSource layouts](self->_source, "layouts"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 keyplane]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = v15;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v10]);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 keys]);
        v13 = (void *)objc_claimAutoreleasedReturnValue( -[UserPathManager translateLayoutForKeys:keyboardController:]( self,  "translateLayoutForKeys:keyboardController:",  v12,  v4));
        if (v13) {
          [v17 setObject:v13 forKey:v10];
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v7);
  }

  -[NSMutableDictionary setObject:forKey:](self->_transforms, "setObject:forKey:", v17, v16);
  return 1;
}

- (id)translateLayoutForKeys:(id)a3 keyboardController:(id)a4
{
  id v51 = a3;
  id v5 = a4;
  v65[0] = 0LL;
  v65[1] = v65;
  v65[3] = sub_12CB0;
  v65[4] = nullsub_3;
  v65[5] = &unk_7EC7A;
  v65[2] = 0x5012000000LL;
  CGSize size = CGRectNull.size;
  CGPoint origin = CGRectNull.origin;
  CGSize v67 = size;
  v63[0] = 0LL;
  v63[1] = v63;
  v63[2] = 0x3032000000LL;
  v63[3] = sub_12CC0;
  v63[4] = sub_12CD0;
  id v64 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 keyplane]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 keys]);
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472LL;
  v62[2] = sub_12CD8;
  v62[3] = &unk_88DF0;
  v62[4] = v63;
  v62[5] = v65;
  [v8 enumerateObjectsUsingBlock:v62];

  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  id obj = v51;
  id v9 = [obj countByEnumeratingWithState:&v58 objects:v74 count:16];
  if (v9)
  {
    v53 = 0LL;
    v54 = 0LL;
    v55 = 0LL;
    v56 = 0LL;
    uint64_t v10 = *(void *)v59;
    double v11 = 1000000000.0;
    double v12 = 1000000000.0;
    do
    {
      for (uint64_t i = 0LL; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v59 != v10) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v58 + 1) + 8LL * (void)i);
        unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 string]);
        v16 = (void *)objc_claimAutoreleasedReturnValue([v5 layoutUtils]);
        v17 = (void *)objc_claimAutoreleasedReturnValue([v5 keyplane]);
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v16 exactKeyForString:v15 keyplane:v17]);

        if (v18)
        {
          [v18 frame];
          +[TITesterMathUtils distanceBetween:andPoint:](&OBJC_CLASS___TITesterMathUtils, "distanceBetween:andPoint:");
          double v20 = v19;
          [v18 frame];
          +[TITesterMathUtils distanceBetween:andPoint:](&OBJC_CLASS___TITesterMathUtils, "distanceBetween:andPoint:");
          double v22 = v21;
          if (v12 > v20)
          {
            id v23 = v18;

            id v24 = v14;
            double v12 = v20;
            v54 = v23;
            v56 = v24;
          }

          if (v11 > v22)
          {
            id v25 = v18;

            id v26 = v14;
            double v11 = v22;
            v53 = v25;
            v55 = v26;
          }
        }
      }

      id v9 = [obj countByEnumeratingWithState:&v58 objects:v74 count:16];
    }

    while (v9);

    v27 = 0LL;
    if (v56 && v55)
    {
      [v54 frame];
      double v50 = v28;
      [v54 frame];
      double v49 = v29;
      [v54 frame];
      [v54 frame];
      [v53 frame];
      double v31 = v30;
      [v53 frame];
      double v33 = v32;
      [v53 frame];
      [v53 frame];
      [v56 frame];
      CGFloat x = v75.origin.x;
      CGFloat y = v75.origin.y;
      CGFloat width = v75.size.width;
      CGFloat height = v75.size.height;
      double MidX = CGRectGetMidX(v75);
      v76.origin.CGFloat x = x;
      v76.origin.CGFloat y = y;
      v76.size.CGFloat width = width;
      v76.size.CGFloat height = height;
      objc_msgSend(v55, "frame", CGRectGetMidY(v76));
      CGFloat v39 = v77.origin.x;
      CGFloat v40 = v77.origin.y;
      CGFloat v41 = v77.size.width;
      CGFloat v42 = v77.size.height;
      double v43 = CGRectGetMidX(v77);
      v78.origin.CGFloat x = v39;
      v78.origin.CGFloat y = v40;
      v78.size.CGFloat width = v41;
      v78.size.CGFloat height = v42;
      CGRectGetMidY(v78);
      double v44 = v31 + v33 * 0.5;
      *(float *)&CGFloat v39 = MidX;
      v73[0] = LODWORD(v39);
      v73[1] = 1065353216;
      float v45 = v43;
      *(float *)&v73[2] = v45;
      v73[3] = 1065353216;
      *(float *)&double v31 = v50 + v49 * 0.5;
      float v46 = v44;
      float v71 = *(float *)&v31;
      float v72 = v46;
      if (+[TITesterMathUtils solveSystemOfEquations:withBMatrix:size:]( &OBJC_CLASS___TITesterMathUtils,  "solveSystemOfEquations:withBMatrix:size:",  v73,  &v71,  2LL)
        || (v70[0] = MidX,
            v70[1] = 1.0,
            v70[2] = v45,
            v70[3] = 1.0,
            float v68 = v50 + v49 * 0.5,
            float v69 = v46,
            +[TITesterMathUtils solveSystemOfEquations:withBMatrix:size:]( &OBJC_CLASS___TITesterMathUtils,  "solveSystemOfEquations:withBMatrix:size:",  v70,  &v68,  2LL)))
      {
        v27 = 0LL;
      }

      else
      {
        v57[0] = v71;
        v57[1] = v68;
        v57[2] = v72;
        v57[3] = v69;
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue value:withObjCType:](&OBJC_CLASS___NSValue, "value:withObjCType:", v57, "{?=dddd}"));
      }
    }

    v47 = v53;
  }

  else
  {

    v55 = 0LL;
    v56 = 0LL;
    v54 = 0LL;
    v47 = 0LL;
    v27 = 0LL;
  }

  _Block_object_dispose(v63, 8);
  _Block_object_dispose(v65, 8);

  return v27;
}

- (BOOL)buildLookupTree
{
  v2 = 0LL;
  for (uint64_t i = self; ; self = i)
  {
    double v32 = (void *)objc_claimAutoreleasedReturnValue(-[TTKTestCaseSource getNextTestCase](self->_source, "getNextTestCase", v28));

    if (!v32) {
      break;
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue([v32 records]);
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    id obj = v3;
    id v28 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
    if (v28)
    {
      uint64_t v30 = *(void *)v47;
      do
      {
        for (j = 0LL; j != v28; j = (char *)j + 1)
        {
          if (*(void *)v47 != v30) {
            objc_enumerationMutation(obj);
          }
          id v4 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)j);
          double v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "primaryIntendedText", v28));
          id v5 = objc_alloc(&OBJC_CLASS___TIContinuousPathWithLayoutName);
          id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 layoutName]);
          id v7 = -[TIContinuousPathWithLayoutName initWithLayout:](v5, "initWithLayout:", v6);

          uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 touchDataCollection]);
          __int128 v44 = 0u;
          __int128 v45 = 0u;
          __int128 v42 = 0u;
          __int128 v43 = 0u;
          id v35 = v8;
          id v9 = [v35 countByEnumeratingWithState:&v42 objects:v51 count:16];
          if (v9)
          {
            uint64_t v36 = *(void *)v43;
            float v10 = -1.0;
            do
            {
              id v37 = v9;
              for (k = 0LL; k != v37; k = (char *)k + 1)
              {
                if (*(void *)v43 != v36) {
                  objc_enumerationMutation(v35);
                }
                double v12 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)k);
                __int128 v38 = 0u;
                __int128 v39 = 0u;
                __int128 v40 = 0u;
                __int128 v41 = 0u;
                v13 = (void *)objc_claimAutoreleasedReturnValue([v12 samples]);
                id v14 = [v13 countByEnumeratingWithState:&v38 objects:v50 count:16];
                if (v14)
                {
                  uint64_t v15 = *(void *)v39;
                  do
                  {
                    for (m = 0LL; m != v14; m = (char *)m + 1)
                    {
                      if (*(void *)v39 != v15) {
                        objc_enumerationMutation(v13);
                      }
                      v17 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)m);
                      if (v10 < 0.0)
                      {
                        [*(id *)(*((void *)&v38 + 1) + 8 * (void)m) timeStamp];
                        float v10 = v18;
                      }

                      double v19 = objc_alloc(&OBJC_CLASS___TIContinuousPathSample);
                      [v17 point];
                      double v21 = v20;
                      double v23 = v22;
                      [v17 timeStamp];
                      id v25 = -[TIContinuousPathSample initWithPoint:timeStamp:force:radius:stage:pathIndex:]( v19,  "initWithPoint:timeStamp:force:radius:stage:pathIndex:",  [v17 stage],  objc_msgSend(v17, "pathIndex"),  v21,  v23,  v24 - v10,  0.0,  0.0);
                      -[TIContinuousPath addSample:](v7, "addSample:", v25);
                    }

                    id v14 = [v13 countByEnumeratingWithState:&v38 objects:v50 count:16];
                  }

                  while (v14);
                }
              }

              id v9 = [v35 countByEnumeratingWithState:&v42 objects:v51 count:16];
            }

            while (v9);
          }

          id v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](i->_lookupTree, "objectForKey:", v33));
          if (!v26)
          {
            id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
            -[NSMutableDictionary setObject:forKey:](i->_lookupTree, "setObject:forKey:");
          }

          [v26 addObject:v7];
        }

        id v28 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
      }

      while (v28);
    }

    v2 = v32;
  }

  return 1;
}

- (id)lookup:(id)a3 keyboardController:(id)a4
{
  id v6 = a3;
  id v41 = a4;
  __int128 v39 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_lookupTree, "objectForKey:", v6));
  if (v7
    || (lookupTree = self->_lookupTree,
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v39 lowercaseString]),
        id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](lookupTree, "objectForKey:", v9)),
        v9,
        v7))
  {
    __int128 v40 = v7;
    id v10 = objc_msgSend( v7,  "objectAtIndex:",  sub_11770((uint64_t)self->m_generator) % (unint64_t)objc_msgSend(v7, "count"));
    __int128 v42 = (void *)objc_claimAutoreleasedReturnValue(v10);
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v41 keyplane]);
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 name]);

    __int128 v38 = (void *)v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_transforms, "objectForKey:", v12));
    if (!v13)
    {
      -[UserPathManager computeTranslations:](self, "computeTranslations:", v41);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_transforms, "objectForKey:", v12));
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v42 layout]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v14]);

    id v37 = v15;
    if (v15)
    {
      [v15 getValue:v48];
      v16 = objc_alloc_init(&OBJC_CLASS___TIContinuousPathWithLayoutName);
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      v17 = (void *)objc_claimAutoreleasedReturnValue([v42 samples]);
      id v18 = [v17 countByEnumeratingWithState:&v44 objects:v49 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v45;
        do
        {
          for (uint64_t i = 0LL; i != v18; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v45 != v19) {
              objc_enumerationMutation(v17);
            }
            double v21 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)i);
            [v21 point];
            double v23 = v22;
            double v24 = *(double *)v48;
            double v25 = *(double *)&v48[2];
            [v21 point];
            double v27 = v26;
            double v43 = *(double *)&v48[1];
            double v28 = *(double *)&v48[3];
            double v29 = objc_alloc(&OBJC_CLASS___TIContinuousPathSample);
            [v21 timeStamp];
            double v31 = v30;
            [v21 force];
            double v33 = v32;
            [v21 radius];
            id v35 = -[TIContinuousPathSample initWithPoint:timeStamp:force:radius:stage:pathIndex:]( v29,  "initWithPoint:timeStamp:force:radius:stage:pathIndex:",  [v21 stage],  objc_msgSend(v21, "pathIndex"),  v25 + v23 * v24,  v28 + v27 * v43,  v31,  v33,  v34);
            -[TIContinuousPath addSample:](v16, "addSample:", v35);
          }

          id v18 = [v17 countByEnumeratingWithState:&v44 objects:v49 count:16];
        }

        while (v18);
      }
    }

    else
    {
      v16 = v42;
    }
  }

  else
  {
    v16 = 0LL;
  }

  return v16;
}

- (void).cxx_destruct
{
}

@end