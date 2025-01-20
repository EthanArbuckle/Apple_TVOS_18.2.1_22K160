@interface BKDirectTouchPerDisplayInfo
- (NSMutableDictionary)serviceToDigitizer;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)dealloc;
- (void)setServiceToDigitizer:(id)a3;
@end

@implementation BKDirectTouchPerDisplayInfo

- (void)dealloc
{
  touchStreams = self->_touchStreams;
  if (touchStreams)
  {
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    id v4 = -[NSMutableArray copy](touchStreams->_clients, "copy");
    id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        v8 = 0LL;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          sub_10006751C(*(id **)(*((void *)&v10 + 1) + 8LL * (void)v8));
          v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }

      while (v6);
    }
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___BKDirectTouchPerDisplayInfo;
  -[BKDirectTouchPerDisplayInfo dealloc](&v9, "dealloc");
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v9 = a3;
  [v9 appendProem:self block:&stru_1000B5590];
  id v4 = sub_100005584((id *)&self->super.isa);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = [v9 appendObject:v5 withName:@"digitizers"];

  id v7 = [v9 appendObject:self->_touchStreams withName:@"touchStreams"];
  id v8 = [v9 appendObject:self->_hitTestRegions withName:@"hitTestRegions"];
}

- (NSMutableDictionary)serviceToDigitizer
{
  return self->_serviceToDigitizer;
}

- (void)setServiceToDigitizer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end