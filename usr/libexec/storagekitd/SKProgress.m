@interface SKProgress
+ (SKProgress)progressWithTotalUnitCount:(int64_t)a3;
- (NSMutableArray)children;
- (SKProgress)init;
- (void)chainChildProgress:(id)a3 withPendingUnitCount:(int64_t)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setLocalizedAdditionalDescription:(id)a3;
@end

@implementation SKProgress

- (void)setLocalizedAdditionalDescription:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet newlineCharacterSet](&OBJC_CLASS___NSCharacterSet, "newlineCharacterSet"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByTrimmingCharactersInSet:v5]);

  -[SKProgress setUserInfoObject:forKey:]( self,  "setUserInfoObject:forKey:",  v6,  _NSProgressRemoteLocalizedAdditionalDescriptionKey);
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SKProgress;
  -[SKProgress setLocalizedAdditionalDescription:](&v7, "setLocalizedAdditionalDescription:", v6);
}

+ (SKProgress)progressWithTotalUnitCount:(int64_t)a3
{
  id v4 = (void *)objc_opt_new(&OBJC_CLASS___SKProgress, a2);
  [v4 setTotalUnitCount:a3];
  return (SKProgress *)v4;
}

- (SKProgress)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SKProgress;
  v2 = -[SKProgress init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    -[SKProgress set_adoptChildUserInfo:](v2, "set_adoptChildUserInfo:", 1LL);
    -[SKProgress setLocalizedAdditionalDescription:](v3, "setLocalizedAdditionalDescription:", &stru_100046600);
    uint64_t v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray, v4);
    parent = v3->super._parent;
    v3->super._parent = (NSProgress *)v5;
  }

  return v3;
}

- (void)chainChildProgress:(id)a3 withPendingUnitCount:(int64_t)a4
{
  id v6 = a3;
  -[SKProgress addChild:withPendingUnitCount:](self, "addChild:withPendingUnitCount:", v6, a4);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKProgress children](self, "children"));
  [v7 addObject:v6];

  id v8 = (id)objc_claimAutoreleasedReturnValue([v6 userInfo]);
  [v8 addObserver:self forKeyPath:_NSProgressRemoteLocalizedAdditionalDescriptionKey options:0 context:0];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v7 = _NSProgressRemoteLocalizedAdditionalDescriptionKey;
  if (objc_msgSend( a3,  "isEqualToString:",  _NSProgressRemoteLocalizedAdditionalDescriptionKey,  a4,  a5,  a6))
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[SKProgress userInfo](self, "userInfo"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v7]);
    -[SKProgress setLocalizedAdditionalDescription:](self, "setLocalizedAdditionalDescription:", v8);
  }

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKProgress children](self, "children"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10002B7EC;
  v5[3] = &unk_1000457D8;
  v5[4] = self;
  [v3 enumerateObjectsUsingBlock:v5];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SKProgress;
  -[SKProgress dealloc](&v4, "dealloc");
}

- (NSMutableArray)children
{
  return (NSMutableArray *)self->super._parent;
}

- (void).cxx_destruct
{
}

@end