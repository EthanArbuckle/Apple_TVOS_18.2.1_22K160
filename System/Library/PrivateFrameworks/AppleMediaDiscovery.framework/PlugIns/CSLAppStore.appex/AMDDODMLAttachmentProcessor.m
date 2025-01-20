@interface AMDDODMLAttachmentProcessor
- (AMDDODMLAttachmentProcessor)initWithAttachmentURLs:(id)a3 withInstructions:(id)a4 error:(id *)a5 errorDomain:(id)a6;
- (AMDDODMLAttachmentProcessor)initWithHashMapDictionary:(id)a3 withDownSampleDictionary:(id)a4 withNegSampleDictionary:(id)a5;
- (id)downSampleDictionaryForKey:(id)a3;
- (id)getURLFromURLArray:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)hashMapForKey:(id)a3;
- (id)negSampleArrayForKey:(id)a3;
- (id)readDownSampleDictionary:(id)a3 withAttachments:(id)a4 error:(id *)a5 errorDomain:(id)a6;
- (id)readDownSampleDictionaryBytes:(id)a3 withAttachments:(id)a4 error:(id *)a5 errorDomain:(id)a6;
- (id)readHashMapDictionary:(id)a3 withAttachments:(id)a4 error:(id *)a5 errorDomain:(id)a6;
- (id)readHashMapDictionaryBytes:(id)a3 withAttachments:(id)a4 error:(id *)a5 errorDomain:(id)a6;
- (id)readNegativeSampleArray:(id)a3 withAttachments:(id)a4 error:(id *)a5 errorDomain:(id)a6;
- (id)readNegativeSampleArrayBytes:(id)a3 withAttachments:(id)a4 error:(id *)a5 errorDomain:(id)a6;
- (id)readWeightsArrayBytes:(id)a3 withAttachments:(id)a4 error:(id *)a5 errorDomain:(id)a6;
- (id)setHashMap:(id)a3 forKey:(id)a4;
- (id)weightsArray;
@end

@implementation AMDDODMLAttachmentProcessor

- (AMDDODMLAttachmentProcessor)initWithHashMapDictionary:(id)a3 withDownSampleDictionary:(id)a4 withNegSampleDictionary:(id)a5
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v13 = 0LL;
  objc_storeStrong(&v13, a4);
  id v12 = 0LL;
  objc_storeStrong(&v12, a5);
  v5 = v15;
  v15 = 0LL;
  v11.receiver = v5;
  v11.super_class = (Class)&OBJC_CLASS___AMDDODMLAttachmentProcessor;
  v10 = -[AMDDODMLAttachmentProcessor init](&v11, "init");
  v15 = v10;
  objc_storeStrong((id *)&v15, v10);
  if (v10)
  {
    objc_storeStrong((id *)&v15->_hashMapAttachments, location[0]);
    objc_storeStrong((id *)&v15->_downSampleAttachments, v13);
    objc_storeStrong((id *)&v15->_negSampleAttachements, v12);
  }

  v7 = v15;
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v15, 0LL);
  return v7;
}

- (AMDDODMLAttachmentProcessor)initWithAttachmentURLs:(id)a3 withInstructions:(id)a4 error:(id *)a5 errorDomain:(id)a6
{
  id v47 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v45 = 0LL;
  objc_storeStrong(&v45, a4);
  v44 = a5;
  id v43 = 0LL;
  objc_storeStrong(&v43, a6);
  id v6 = v47;
  id v47 = 0LL;
  v42.receiver = v6;
  v42.super_class = (Class)&OBJC_CLASS___AMDDODMLAttachmentProcessor;
  v36 = -[AMDDODMLAttachmentProcessor init](&v42, "init");
  id v47 = v36;
  objc_storeStrong(&v47, v36);
  if (v36)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v8 = (void *)*((void *)v47 + 1);
    *((void *)v47 + 1) = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v10 = (void *)*((void *)v47 + 2);
    *((void *)v47 + 2) = v9;

    objc_super v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v12 = (void *)*((void *)v47 + 3);
    *((void *)v47 + 3) = v11;

    for (unint64_t i = 0LL; ; ++i)
    {
      unint64_t v32 = i;
      id v40 = [v45 objectAtIndex:i];
      id v39 = [v40 objectForKey:FunctionName];
      if (!v39)
      {
        id v13 = objc_alloc(&OBJC_CLASS___NSError);
        v14 = -[NSError initWithDomain:code:userInfo:](v13, "initWithDomain:code:userInfo:", v43, 50LL, 0LL);
        id *v44 = v14;
        v48 = 0LL;
        int v38 = 1;
        goto LABEL_25;
      }

      id v37 = 0LL;
      if ([v39 isEqual:HashMapFile])
      {
        id v15 =  [v47 readHashMapDictionary:v40 withAttachments:location[0] error:v44 errorDomain:v43];
        id v16 = v37;
        id v37 = v15;

        goto LABEL_21;
      }

      if ([v39 isEqual:HashMapFileBytes])
      {
        id v17 =  [v47 readHashMapDictionaryBytes:v40 withAttachments:location[0] error:v44 errorDomain:v43];
        id v18 = v37;
        id v37 = v17;

        goto LABEL_21;
      }

      if ([v39 isEqual:NegativeSampleFile])
      {
        id v19 =  [v47 readNegativeSampleArray:v40 withAttachments:location[0] error:v44 errorDomain:v43];
        id v20 = v37;
        id v37 = v19;

        goto LABEL_21;
      }

      if ([v39 isEqual:NegativeSampleFileBytes])
      {
        id v21 =  [v47 readNegativeSampleArrayBytes:v40 withAttachments:location[0] error:v44 errorDomain:v43];
        id v22 = v37;
        id v37 = v21;

        goto LABEL_21;
      }

      if ([v39 isEqual:DownSampleFile])
      {
        id v23 =  [v47 readDownSampleDictionary:v40 withAttachments:location[0] error:v44 errorDomain:v43];
        id v24 = v37;
        id v37 = v23;

        goto LABEL_21;
      }

      if ([v39 isEqual:WeightsFileBytes])
      {
        id v27 =  [v47 readWeightsArrayBytes:v40 withAttachments:location[0] error:v44 errorDomain:v43];
        id v28 = v37;
        id v37 = v27;

LABEL_21:
        if (v37)
        {
          int v38 = 0;
        }

        else
        {
          v48 = 0LL;
          int v38 = 1;
        }

        goto LABEL_24;
      }

      v29 = objc_alloc(&OBJC_CLASS___NSError);
      v30 = -[NSError initWithDomain:code:userInfo:](v29, "initWithDomain:code:userInfo:", v43, 50LL, 0LL);
      id *v44 = v30;
      v48 = 0LL;
      int v38 = 1;
LABEL_24:
      objc_storeStrong(&v37, 0LL);
LABEL_25:
      objc_storeStrong(&v39, 0LL);
      objc_storeStrong(&v40, 0LL);
      if (v38) {
        goto LABEL_28;
      }
    }

    id v25 =  [v47 readDownSampleDictionaryBytes:v40 withAttachments:location[0] error:v44 errorDomain:v43];
    id v26 = v37;
    id v37 = v25;

    goto LABEL_21;
  }

- (id)hashMapForKey:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = -[NSMutableDictionary objectForKey:](v6->_hashMapAttachments, "objectForKey:", location[0]);
  objc_storeStrong(location, 0LL);
  return v4;
}

- (id)setHashMap:(id)a3 forKey:(id)a4
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = 0LL;
  objc_storeStrong(&v7, a4);
  -[NSMutableDictionary setObject:forKey:](v9->_hashMapAttachments, "setObject:forKey:", location[0], v7);
  id v6 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL);
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
  return v6;
}

- (id)downSampleDictionaryForKey:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = -[NSMutableDictionary objectForKey:](v6->_downSampleAttachments, "objectForKey:", location[0]);
  objc_storeStrong(location, 0LL);
  return v4;
}

- (id)negSampleArrayForKey:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = -[NSMutableDictionary objectForKey:](v6->_negSampleAttachements, "objectForKey:", location[0]);
  objc_storeStrong(location, 0LL);
  return v4;
}

- (id)weightsArray
{
  return self->_weightAttachment;
}

- (id)getURLFromURLArray:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v15 = a4;
  id v14 = 0LL;
  objc_storeStrong(&v14, a5);
  if ([location[0] count])
  {
    if ((unint64_t)[location[0] count] <= 1)
    {
      id v12 = [location[0] firstObject];
      id v17 = v12;
      int v13 = 1;
      objc_storeStrong(&v12, 0LL);
    }

    else
    {
      id v7 = objc_alloc(&OBJC_CLASS___NSError);
      v8 = -[NSError initWithDomain:code:userInfo:](v7, "initWithDomain:code:userInfo:", v14, 95LL, 0LL);
      id *v15 = v8;
      id v17 = 0LL;
      int v13 = 1;
    }
  }

  else
  {
    v5 = objc_alloc(&OBJC_CLASS___NSError);
    id v6 = -[NSError initWithDomain:code:userInfo:](v5, "initWithDomain:code:userInfo:", v14, 94LL, 0LL);
    id *v15 = v6;
    id v17 = 0LL;
    int v13 = 1;
  }

  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
  return v17;
}

- (id)readNegativeSampleArray:(id)a3 withAttachments:(id)a4 error:(id *)a5 errorDomain:(id)a6
{
  v34 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v32 = 0LL;
  objc_storeStrong(&v32, a4);
  v31 = a5;
  id v30 = 0LL;
  objc_storeStrong(&v30, a6);
  id v29 = [location[0] objectForKey:FileBaseName];
  id v28 = [location[0] objectForKey:OutputArray];
  if (v29 && v28)
  {
    id v26 = [v32 attachmentURLsForBasename:v29];
    id v25 =  -[AMDDODMLAttachmentProcessor getURLFromURLArray:error:errorDomain:]( v34,  "getURLFromURLArray:error:errorDomain:",  v26,  v31,  v30);
    if (v25)
    {
      id v24 =  +[NSString stringWithContentsOfURL:encoding:error:]( &OBJC_CLASS___NSString,  "stringWithContentsOfURL:encoding:error:",  v25,  4LL,  v31);
      if ([v24 isEqual:0])
      {
        v35 = 0LL;
        int v27 = 1;
      }

      else
      {
        id v23 = [v24 componentsSeparatedByString:@"\n"];
        id v22 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        memset(__b, 0, sizeof(__b));
        id v15 = v23;
        id v16 = [v15 countByEnumeratingWithState:__b objects:v36 count:16];
        if (v16)
        {
          uint64_t v12 = *(void *)__b[2];
          uint64_t v13 = 0LL;
          id v14 = v16;
          while (1)
          {
            uint64_t v11 = v13;
            if (*(void *)__b[2] != v12) {
              objc_enumerationMutation(v15);
            }
            id v21 = *(id *)(__b[1] + 8 * v13);
            v9 = v22;
            v10 =  +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  [v21 longLongValue]);
            -[NSMutableArray addObject:](v9, "addObject:");

            ++v13;
            if (v11 + 1 >= (unint64_t)v14)
            {
              uint64_t v13 = 0LL;
              id v14 = [v15 countByEnumeratingWithState:__b objects:v36 count:16];
              if (!v14) {
                break;
              }
            }
          }
        }

        -[NSMutableDictionary setObject:forKey:](v34->_negSampleAttachements, "setObject:forKey:", v22, v28);
        v35 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL);
        int v27 = 1;
        objc_storeStrong((id *)&v22, 0LL);
        objc_storeStrong(&v23, 0LL);
      }

      objc_storeStrong(&v24, 0LL);
    }

    else
    {
      v35 = 0LL;
      int v27 = 1;
    }

    objc_storeStrong(&v25, 0LL);
    objc_storeStrong(&v26, 0LL);
  }

  else
  {
    id v6 = objc_alloc(&OBJC_CLASS___NSError);
    id v7 = -[NSError initWithDomain:code:userInfo:](v6, "initWithDomain:code:userInfo:", v30, 51LL, 0LL);
    id *v31 = v7;
    v35 = 0LL;
    int v27 = 1;
  }

  objc_storeStrong(&v28, 0LL);
  objc_storeStrong(&v29, 0LL);
  objc_storeStrong(&v30, 0LL);
  objc_storeStrong(&v32, 0LL);
  objc_storeStrong(location, 0LL);
  return v35;
}

- (id)readNegativeSampleArrayBytes:(id)a3 withAttachments:(id)a4 error:(id *)a5 errorDomain:(id)a6
{
  id v30 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v28 = 0LL;
  objc_storeStrong(&v28, a4);
  int v27 = a5;
  id v26 = 0LL;
  objc_storeStrong(&v26, a6);
  id v25 = [location[0] objectForKey:FileBaseName];
  id v24 = [location[0] objectForKey:OutputArray];
  if (v25 && v24)
  {
    id v22 = [v28 attachmentURLsForBasename:v25];
    id v21 =  -[AMDDODMLAttachmentProcessor getURLFromURLArray:error:errorDomain:]( v30,  "getURLFromURLArray:error:errorDomain:",  v22,  v27,  v26);
    if (v21)
    {
      id v20 =  +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v21,  1LL,  v27);
      if (v20)
      {
        if ((unint64_t)[v20 length] % 8)
        {
          v8 = objc_alloc(&OBJC_CLASS___NSError);
          v9 = -[NSError initWithDomain:code:userInfo:](v8, "initWithDomain:code:userInfo:", v26, 59LL, 0LL);
          *int v27 = v9;
          v31 = 0LL;
          int v23 = 1;
        }

        else
        {
          id v19 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          for (unint64_t i = 0LL; ; ++i)
          {
            unint64_t v13 = i;
            uint64_t v33 = 8 * i;
            uint64_t v32 = 8LL;
            uint64_t v34 = 8 * i;
            uint64_t v35 = 8LL;
            objc_msgSend(v20, "getBytes:range:", &v17, 8 * i, 8);
            uint64_t v11 = v19;
            uint64_t v12 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v17);
            -[NSMutableArray addObject:](v11, "addObject:");
          }

          -[NSMutableDictionary setObject:forKey:](v30->_negSampleAttachements, "setObject:forKey:", v19, v24);
          v31 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL);
          int v23 = 1;
          objc_storeStrong((id *)&v19, 0LL);
        }
      }

      else
      {
        v31 = 0LL;
        int v23 = 1;
      }

      objc_storeStrong(&v20, 0LL);
    }

    else
    {
      v31 = 0LL;
      int v23 = 1;
    }

    objc_storeStrong(&v21, 0LL);
    objc_storeStrong(&v22, 0LL);
  }

  else
  {
    id v6 = objc_alloc(&OBJC_CLASS___NSError);
    id v7 = -[NSError initWithDomain:code:userInfo:](v6, "initWithDomain:code:userInfo:", v26, 52LL, 0LL);
    *int v27 = v7;
    v31 = 0LL;
    int v23 = 1;
  }

  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(&v25, 0LL);
  objc_storeStrong(&v26, 0LL);
  objc_storeStrong(&v28, 0LL);
  objc_storeStrong(location, 0LL);
  return v31;
}

- (id)readDownSampleDictionary:(id)a3 withAttachments:(id)a4 error:(id *)a5 errorDomain:(id)a6
{
  id v39 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v37 = 0LL;
  objc_storeStrong(&v37, a4);
  v36 = a5;
  id v35 = 0LL;
  objc_storeStrong(&v35, a6);
  id v34 = [location[0] objectForKey:FileBaseName];
  id v33 = [location[0] objectForKey:OutputDictionary];
  if (v34 && v33)
  {
    id v31 = [v37 attachmentURLsForBasename:v34];
    id v30 =  -[AMDDODMLAttachmentProcessor getURLFromURLArray:error:errorDomain:]( v39,  "getURLFromURLArray:error:errorDomain:",  v31,  v36,  v35);
    if (v30)
    {
      id v29 =  +[NSString stringWithContentsOfURL:encoding:error:]( &OBJC_CLASS___NSString,  "stringWithContentsOfURL:encoding:error:",  v30,  4LL,  v36);
      if ([v29 isEqual:0])
      {
        id v40 = 0LL;
        int v32 = 1;
      }

      else
      {
        id v28 = [v29 componentsSeparatedByString:@"\n"];
        id v27 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        memset(__b, 0, sizeof(__b));
        id v17 = v28;
        id v18 = [v17 countByEnumeratingWithState:__b objects:v41 count:16];
        if (v18)
        {
          uint64_t v14 = *(void *)__b[2];
          uint64_t v15 = 0LL;
          id v16 = v18;
          while (1)
          {
            uint64_t v13 = v15;
            if (*(void *)__b[2] != v14) {
              objc_enumerationMutation(v17);
            }
            id v26 = *(id *)(__b[1] + 8 * v15);
            id v24 = [v26 componentsSeparatedByString:@","];
            if ([v24 count] == (id)2)
            {
              id v11 = [v24 objectAtIndexedSubscript:0];
              int v23 =  +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  [v11 longLongValue]);

              id v12 = [v24 objectAtIndexedSubscript:1];
              [v12 doubleValue];
              id v22 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");

              [v27 setObject:v22 forKey:v23];
              objc_storeStrong((id *)&v22, 0LL);
              objc_storeStrong((id *)&v23, 0LL);
              int v32 = 0;
            }

            else
            {
              v8 = objc_alloc(&OBJC_CLASS___NSError);
              v9 = -[NSError initWithDomain:code:userInfo:](v8, "initWithDomain:code:userInfo:", v35, 14LL, 0LL);
              id *v36 = v9;
              id v40 = 0LL;
              int v32 = 1;
            }

            objc_storeStrong(&v24, 0LL);
            if (v32) {
              break;
            }
            ++v15;
            if (v13 + 1 >= (unint64_t)v16)
            {
              uint64_t v15 = 0LL;
              id v16 = [v17 countByEnumeratingWithState:__b objects:v41 count:16];
              if (!v16) {
                goto LABEL_18;
              }
            }
          }
        }

        else
        {
LABEL_18:
          int v32 = 0;
        }

        if (!v32)
        {
          -[NSMutableDictionary setObject:forKey:](v39->_downSampleAttachments, "setObject:forKey:", v27, v33);
          id v40 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL);
          int v32 = 1;
        }

        objc_storeStrong(&v27, 0LL);
        objc_storeStrong(&v28, 0LL);
      }

      objc_storeStrong(&v29, 0LL);
    }

    else
    {
      id v40 = 0LL;
      int v32 = 1;
    }

    objc_storeStrong(&v30, 0LL);
    objc_storeStrong(&v31, 0LL);
  }

  else
  {
    id v6 = objc_alloc(&OBJC_CLASS___NSError);
    id v7 = -[NSError initWithDomain:code:userInfo:](v6, "initWithDomain:code:userInfo:", v35, 53LL, 0LL);
    id *v36 = v7;
    id v40 = 0LL;
    int v32 = 1;
  }

  objc_storeStrong(&v33, 0LL);
  objc_storeStrong(&v34, 0LL);
  objc_storeStrong(&v35, 0LL);
  objc_storeStrong(&v37, 0LL);
  objc_storeStrong(location, 0LL);
  return v40;
}

- (id)readDownSampleDictionaryBytes:(id)a3 withAttachments:(id)a4 error:(id *)a5 errorDomain:(id)a6
{
  int v38 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v36 = 0LL;
  objc_storeStrong(&v36, a4);
  id v35 = a5;
  id v34 = 0LL;
  objc_storeStrong(&v34, a6);
  id v33 = [location[0] objectForKey:FileBaseName];
  id v32 = [location[0] objectForKey:SecondFileBaseName];
  id v31 = [location[0] objectForKey:OutputDictionary];
  if (v33 && v32 && v31)
  {
    id v29 = [v36 attachmentURLsForBasename:v33];
    id v28 = [v36 attachmentURLsForBasename:v32];
    id v27 =  -[AMDDODMLAttachmentProcessor getURLFromURLArray:error:errorDomain:]( v38,  "getURLFromURLArray:error:errorDomain:",  v29,  v35,  v34);
    id v26 =  -[AMDDODMLAttachmentProcessor getURLFromURLArray:error:errorDomain:]( v38,  "getURLFromURLArray:error:errorDomain:",  v28,  v35,  v34);
    if (v27 && v26)
    {
      id v25 =  +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v27);
      id v24 =  +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v26,  1LL,  v35);
      if (v25 && v24)
      {
        id v14 = [v25 length];
        if (v14 == [v24 length])
        {
          if ((unint64_t)[v25 length] % 8)
          {
            v10 = objc_alloc(&OBJC_CLASS___NSError);
            id v11 = -[NSError initWithDomain:code:userInfo:](v10, "initWithDomain:code:userInfo:", v34, 59LL, 0LL);
            id *v35 = v11;
            id v39 = 0LL;
            int v30 = 1;
          }

          else
          {
            int v23 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            for (unint64_t i = 0LL; ; ++i)
            {
              unint64_t v13 = i;
              uint64_t v45 = 8 * i;
              uint64_t v44 = 8LL;
              uint64_t v46 = 8 * i;
              uint64_t v47 = 8LL;
              *(void *)&v20[1] = 8 * i;
              *(void *)&v20[2] = 8LL;
              objc_msgSend(v25, "getBytes:range:", &v21, 8 * i, 8);
              uint64_t v41 = 8 * i;
              uint64_t v40 = 8LL;
              uint64_t v42 = 8 * i;
              uint64_t v43 = 8LL;
              v19[1] = (id)(8 * i);
              v19[2] = (id)8;
              objc_msgSend(v24, "getBytes:range:", v20, 8 * i, 8);
              v19[0] = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v21);
              id v18 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v20[0]);
              -[NSMutableDictionary setObject:forKey:](v23, "setObject:forKey:", v18, v19[0]);
              objc_storeStrong((id *)&v18, 0LL);
              objc_storeStrong(v19, 0LL);
            }

            -[NSMutableDictionary setObject:forKey:](v38->_downSampleAttachments, "setObject:forKey:", v23, v31);
            id v39 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL);
            int v30 = 1;
            objc_storeStrong((id *)&v23, 0LL);
          }
        }

        else
        {
          v8 = objc_alloc(&OBJC_CLASS___NSError);
          v9 = -[NSError initWithDomain:code:userInfo:](v8, "initWithDomain:code:userInfo:", v34, 58LL, 0LL);
          id *v35 = v9;
          id v39 = 0LL;
          int v30 = 1;
        }
      }

      else
      {
        id v39 = 0LL;
        int v30 = 1;
      }

      objc_storeStrong(&v24, 0LL);
      objc_storeStrong(&v25, 0LL);
    }

    else
    {
      id v39 = 0LL;
      int v30 = 1;
    }

    objc_storeStrong(&v26, 0LL);
    objc_storeStrong(&v27, 0LL);
    objc_storeStrong(&v28, 0LL);
    objc_storeStrong(&v29, 0LL);
  }

  else
  {
    id v6 = objc_alloc(&OBJC_CLASS___NSError);
    id v7 = -[NSError initWithDomain:code:userInfo:](v6, "initWithDomain:code:userInfo:", v34, 54LL, 0LL);
    id *v35 = v7;
    id v39 = 0LL;
    int v30 = 1;
  }

  objc_storeStrong(&v31, 0LL);
  objc_storeStrong(&v32, 0LL);
  objc_storeStrong(&v33, 0LL);
  objc_storeStrong(&v34, 0LL);
  objc_storeStrong(&v36, 0LL);
  objc_storeStrong(location, 0LL);
  return v39;
}

- (id)readHashMapDictionary:(id)a3 withAttachments:(id)a4 error:(id *)a5 errorDomain:(id)a6
{
  id v39 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v37 = 0LL;
  objc_storeStrong(&v37, a4);
  id v36 = a5;
  id v35 = 0LL;
  objc_storeStrong(&v35, a6);
  id v34 = [location[0] objectForKey:FileBaseName];
  id v33 = [location[0] objectForKey:OutputDictionary];
  if (v34 && v33)
  {
    id v31 = [v37 attachmentURLsForBasename:v34];
    id v30 =  -[AMDDODMLAttachmentProcessor getURLFromURLArray:error:errorDomain:]( v39,  "getURLFromURLArray:error:errorDomain:",  v31,  v36,  v35);
    if (v30)
    {
      id v29 =  +[NSString stringWithContentsOfURL:encoding:error:]( &OBJC_CLASS___NSString,  "stringWithContentsOfURL:encoding:error:",  v30,  4LL,  v36);
      if ([v29 isEqual:0])
      {
        uint64_t v40 = 0LL;
        int v32 = 1;
      }

      else
      {
        id v28 = [v29 componentsSeparatedByString:@"\n"];
        id v27 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        memset(__b, 0, sizeof(__b));
        id v17 = v28;
        id v18 = [v17 countByEnumeratingWithState:__b objects:v41 count:16];
        if (v18)
        {
          uint64_t v14 = *(void *)__b[2];
          uint64_t v15 = 0LL;
          id v16 = v18;
          while (1)
          {
            uint64_t v13 = v15;
            if (*(void *)__b[2] != v14) {
              objc_enumerationMutation(v17);
            }
            id v26 = *(id *)(__b[1] + 8 * v15);
            id v24 = [v26 componentsSeparatedByString:@","];
            if ([v24 count] == (id)2)
            {
              id v11 = [v24 objectAtIndexedSubscript:0];
              int v23 =  +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  [v11 longLongValue]);

              id v12 = [v24 objectAtIndexedSubscript:1];
              id v22 =  +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  [v12 longLongValue]);

              [v27 setObject:v22 forKey:v23];
              objc_storeStrong((id *)&v22, 0LL);
              objc_storeStrong((id *)&v23, 0LL);
              int v32 = 0;
            }

            else
            {
              v8 = objc_alloc(&OBJC_CLASS___NSError);
              v9 = -[NSError initWithDomain:code:userInfo:](v8, "initWithDomain:code:userInfo:", v35, 14LL, 0LL);
              id *v36 = v9;
              uint64_t v40 = 0LL;
              int v32 = 1;
            }

            objc_storeStrong(&v24, 0LL);
            if (v32) {
              break;
            }
            ++v15;
            if (v13 + 1 >= (unint64_t)v16)
            {
              uint64_t v15 = 0LL;
              id v16 = [v17 countByEnumeratingWithState:__b objects:v41 count:16];
              if (!v16) {
                goto LABEL_18;
              }
            }
          }
        }

        else
        {
LABEL_18:
          int v32 = 0;
        }

        if (!v32)
        {
          -[NSMutableDictionary setObject:forKey:](v39->_hashMapAttachments, "setObject:forKey:", v27, v33);
          uint64_t v40 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL);
          int v32 = 1;
        }

        objc_storeStrong(&v27, 0LL);
        objc_storeStrong(&v28, 0LL);
      }

      objc_storeStrong(&v29, 0LL);
    }

    else
    {
      uint64_t v40 = 0LL;
      int v32 = 1;
    }

    objc_storeStrong(&v30, 0LL);
    objc_storeStrong(&v31, 0LL);
  }

  else
  {
    id v6 = objc_alloc(&OBJC_CLASS___NSError);
    id v7 = -[NSError initWithDomain:code:userInfo:](v6, "initWithDomain:code:userInfo:", v35, 55LL, 0LL);
    id *v36 = v7;
    uint64_t v40 = 0LL;
    int v32 = 1;
  }

  objc_storeStrong(&v33, 0LL);
  objc_storeStrong(&v34, 0LL);
  objc_storeStrong(&v35, 0LL);
  objc_storeStrong(&v37, 0LL);
  objc_storeStrong(location, 0LL);
  return v40;
}

- (id)readHashMapDictionaryBytes:(id)a3 withAttachments:(id)a4 error:(id *)a5 errorDomain:(id)a6
{
  int v38 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v36 = 0LL;
  objc_storeStrong(&v36, a4);
  id v35 = a5;
  id v34 = 0LL;
  objc_storeStrong(&v34, a6);
  id v33 = [location[0] objectForKey:FileBaseName];
  id v32 = [location[0] objectForKey:SecondFileBaseName];
  id v31 = [location[0] objectForKey:OutputDictionary];
  if (v33 && v32 && v31)
  {
    id v29 = [v36 attachmentURLsForBasename:v33];
    id v28 =  -[AMDDODMLAttachmentProcessor getURLFromURLArray:error:errorDomain:]( v38,  "getURLFromURLArray:error:errorDomain:",  v29,  v35,  v34);
    id v27 = [v36 attachmentURLsForBasename:v32];
    id v26 =  -[AMDDODMLAttachmentProcessor getURLFromURLArray:error:errorDomain:]( v38,  "getURLFromURLArray:error:errorDomain:",  v27,  v35,  v34);
    if (v28 && v26)
    {
      id v25 =  +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v28);
      id v24 =  +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v26,  1LL,  v35);
      if (v24 && v25)
      {
        id v14 = [v25 length];
        if (v14 == [v24 length])
        {
          if ((unint64_t)[v25 length] % 8)
          {
            v10 = objc_alloc(&OBJC_CLASS___NSError);
            id v11 = -[NSError initWithDomain:code:userInfo:](v10, "initWithDomain:code:userInfo:", v34, 59LL, 0LL);
            id *v35 = v11;
            id v39 = 0LL;
            int v30 = 1;
          }

          else
          {
            int v23 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            for (unint64_t i = 0LL; ; ++i)
            {
              unint64_t v13 = i;
              uint64_t v45 = 8 * i;
              uint64_t v44 = 8LL;
              uint64_t v46 = 8 * i;
              uint64_t v47 = 8LL;
              v20[1] = 8 * i;
              v20[2] = 8LL;
              objc_msgSend(v25, "getBytes:range:", &v21, 8 * i, 8);
              uint64_t v41 = 8 * i;
              uint64_t v40 = 8LL;
              uint64_t v42 = 8 * i;
              uint64_t v43 = 8LL;
              v19[1] = (id)(8 * i);
              v19[2] = (id)8;
              objc_msgSend(v24, "getBytes:range:", v20, 8 * i, 8);
              v19[0] = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v21);
              id v18 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v20[0]);
              -[NSMutableDictionary setObject:forKey:](v23, "setObject:forKey:", v18, v19[0]);
              objc_storeStrong((id *)&v18, 0LL);
              objc_storeStrong(v19, 0LL);
            }

            -[NSMutableDictionary setObject:forKey:](v38->_hashMapAttachments, "setObject:forKey:", v23, v31);
            id v39 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL);
            int v30 = 1;
            objc_storeStrong((id *)&v23, 0LL);
          }
        }

        else
        {
          v8 = objc_alloc(&OBJC_CLASS___NSError);
          v9 = -[NSError initWithDomain:code:userInfo:](v8, "initWithDomain:code:userInfo:", v34, 58LL, 0LL);
          id *v35 = v9;
          id v39 = 0LL;
          int v30 = 1;
        }
      }

      else
      {
        id v39 = 0LL;
        int v30 = 1;
      }

      objc_storeStrong(&v24, 0LL);
      objc_storeStrong(&v25, 0LL);
    }

    else
    {
      id v39 = 0LL;
      int v30 = 1;
    }

    objc_storeStrong(&v26, 0LL);
    objc_storeStrong(&v27, 0LL);
    objc_storeStrong(&v28, 0LL);
    objc_storeStrong(&v29, 0LL);
  }

  else
  {
    id v6 = objc_alloc(&OBJC_CLASS___NSError);
    id v7 = -[NSError initWithDomain:code:userInfo:](v6, "initWithDomain:code:userInfo:", v34, 56LL, 0LL);
    id *v35 = v7;
    id v39 = 0LL;
    int v30 = 1;
  }

  objc_storeStrong(&v31, 0LL);
  objc_storeStrong(&v32, 0LL);
  objc_storeStrong(&v33, 0LL);
  objc_storeStrong(&v34, 0LL);
  objc_storeStrong(&v36, 0LL);
  objc_storeStrong(location, 0LL);
  return v39;
}

- (id)readWeightsArrayBytes:(id)a3 withAttachments:(id)a4 error:(id *)a5 errorDomain:(id)a6
{
  uint64_t v21 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v19 = 0LL;
  objc_storeStrong(&v19, a4);
  id v18 = a5;
  id v17 = 0LL;
  objc_storeStrong(&v17, a6);
  id v16 = [location[0] objectForKey:FileBaseName];
  if (v16)
  {
    id v14 = [v19 attachmentURLsForBasename:v16];
    id v13 =  -[AMDDODMLAttachmentProcessor getURLFromURLArray:error:errorDomain:]( v21,  "getURLFromURLArray:error:errorDomain:",  v14,  v18,  v17);
    if (v13)
    {
      id v12 =  +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v13,  1LL,  v18);
      if (v12)
      {
        objc_storeStrong((id *)&v21->_weightAttachment, v12);
        id v22 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL);
      }

      else
      {
        id v22 = 0LL;
      }

      int v15 = 1;
      objc_storeStrong(&v12, 0LL);
    }

    else
    {
      id v22 = 0LL;
      int v15 = 1;
    }

    objc_storeStrong(&v13, 0LL);
    objc_storeStrong(&v14, 0LL);
  }

  else
  {
    id v6 = objc_alloc(&OBJC_CLASS___NSError);
    id v7 = -[NSError initWithDomain:code:userInfo:](v6, "initWithDomain:code:userInfo:", v17, 113LL, 0LL);
    *id v18 = v7;
    id v22 = 0LL;
    int v15 = 1;
  }

  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(location, 0LL);
  return v22;
}

- (void).cxx_destruct
{
}

@end