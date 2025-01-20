@interface HMCAMDBlockManager
- (HMCAMDBlockManager)initWithService:(id)a3;
- (id)blockForKey:(id)a3;
- (id)forwardingBlockWithArgumentCount:(unint64_t)a3 forKey:(id)a4;
- (id)keyForBlock:(id)a3;
- (unint64_t)count;
- (void)addBlock:(id)a3 forKey:(id)a4;
- (void)addBlockNoCopy:(id)a3 forKey:(id)a4;
- (void)invokeForwardedBlockWithArguments:(id)a3 forKey:(id)a4;
- (void)removeBlock:(id)a3;
- (void)removeBlockForKey:(id)a3;
@end

@implementation HMCAMDBlockManager

- (HMCAMDBlockManager)initWithService:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___HMCAMDBlockManager;
  v6 = -[HMCAMDBlockManager init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_service, a3);
    v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    blockHandlerMap = v7->_blockHandlerMap;
    v7->_blockHandlerMap = v8;

    dispatch_queue_attr_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v10);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.homed.xpc.HMDCAMDBlockManager.blockQueue", v11);
    blockQueue = v7->_blockQueue;
    v7->_blockQueue = (OS_dispatch_queue *)v12;
  }

  return v7;
}

- (void)addBlockNoCopy:(id)a3 forKey:(id)a4
{
  if (a3) {
    -[NSMutableDictionary setObject:forKey:](self->_blockHandlerMap, "setObject:forKey:", a3, a4);
  }
}

- (void)addBlock:(id)a3 forKey:(id)a4
{
  blockHandlerMap = self->_blockHandlerMap;
  id v6 = a4;
  id v7 = [a3 copy];
  -[NSMutableDictionary setObject:forKey:](blockHandlerMap, "setObject:forKey:", v7, v6);
}

- (void)removeBlock:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HMCAMDBlockManager keyForBlock:](self, "keyForBlock:", a3));
  if (v4)
  {
    -[HMCAMDBlockManager removeBlockForKey:](self, "removeBlockForKey:", v4);
    blockQueue = (dispatch_queue_s *)self->_blockQueue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100012750;
    v6[3] = &unk_100028DD0;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(blockQueue, v6);
  }
}

- (void)removeBlockForKey:(id)a3
{
}

- (id)blockForKey:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->_blockHandlerMap, "objectForKey:", a3);
}

- (id)keyForBlock:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  objc_super v15 = sub_1000126CC;
  v16 = sub_1000126DC;
  id v17 = 0LL;
  blockHandlerMap = self->_blockHandlerMap;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000126E4;
  v9[3] = &unk_100028AE0;
  id v6 = v4;
  id v10 = v6;
  v11 = &v12;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](blockHandlerMap, "enumerateKeysAndObjectsUsingBlock:", v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (unint64_t)count
{
  return (unint64_t)-[NSMutableDictionary count](self->_blockHandlerMap, "count");
}

- (void)invokeForwardedBlockWithArguments:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_blockHandlerMap, "objectForKey:", a4));
  v8 = v7;
  if (v7)
  {
    v9 = +[NSMethodSignature signatureWithObjCTypes:]( &OBJC_CLASS___NSMethodSignature,  "signatureWithObjCTypes:",  _Block_signature(v7));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = [v10 numberOfArguments];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSInvocation invocationWithMethodSignature:]( &OBJC_CLASS___NSInvocation,  "invocationWithMethodSignature:",  v10));
    if ((unint64_t)v11 >= 2)
    {
      for (uint64_t i = 1LL; (id)i != v11; ++i)
      {
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndex:i - 1]);
        id v17 = v14;
        objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));

        if (v14 == v15)
        {
          id v16 = v17;
          id v17 = 0LL;
        }

        [v12 setArgument:&v17 atIndex:i];
      }
    }

    [v12 setTarget:v8];
    [v12 invoke];
  }
}

- (id)forwardingBlockWithArgumentCount:(unint64_t)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100011FE8;
  v33[3] = &unk_100028B30;
  v33[4] = self;
  id v8 = v6;
  id v34 = v8;
  v9 = objc_retainBlock(v33);
  id v10 = v9;
  switch(a3)
  {
    case 0uLL:
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472LL;
      v31[2] = sub_10001207C;
      v31[3] = &unk_100028B58;
      id v11 = (id *)&v32;
      v32 = v9;
      uint64_t v12 = objc_retainBlock(v31);
      goto LABEL_10;
    case 1uLL:
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_10001208C;
      v28[3] = &unk_100028B80;
      id v11 = (id *)&v30;
      v30 = v9;
      id v29 = v7;
      uint64_t v12 = objc_retainBlock(v28);
      v13 = v29;
      goto LABEL_9;
    case 2uLL:
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_100012134;
      v25[3] = &unk_100028BA8;
      id v11 = (id *)&v27;
      v27 = v9;
      id v26 = v7;
      uint64_t v12 = objc_retainBlock(v25);
      v13 = v26;
      goto LABEL_9;
    case 3uLL:
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_1000121FC;
      v22[3] = &unk_100028BD0;
      id v11 = (id *)&v24;
      v24 = v9;
      id v23 = v7;
      uint64_t v12 = objc_retainBlock(v22);
      v13 = v23;
      goto LABEL_9;
    case 4uLL:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_1000122EC;
      v19[3] = &unk_100028BF8;
      id v11 = (id *)&v21;
      v21 = v9;
      id v20 = v7;
      uint64_t v12 = objc_retainBlock(v19);
      v13 = v20;
      goto LABEL_9;
    case 5uLL:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_1000123FC;
      v16[3] = &unk_100028C20;
      id v11 = (id *)&v18;
      v18 = v9;
      id v17 = v7;
      uint64_t v12 = objc_retainBlock(v16);
      v13 = v17;
LABEL_9:

LABEL_10:
      break;
    default:
      uint64_t v12 = 0LL;
      break;
  }

  id v14 = [v12 copy];

  return v14;
}

- (void).cxx_destruct
{
}

@end