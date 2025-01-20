@interface TableDrivenDecisionTree
- (TableDrivenDecisionTree)initWithComponentControllers:(id)a3 hotspotControllers:(id)a4 decisionTreeTable:(id)a5;
- (id)findCC:(int)a3;
- (int)getMTypeFromComponent:(int)a3;
- (int)getReleaseRateForComponent:(int)a3;
- (void)actionComponentControl;
- (void)evaluateDecisionTree;
- (void)initDecisionTable:(__CFDictionary *)a3;
- (void)readReleaseRateForAllComponents;
@end

@implementation TableDrivenDecisionTree

- (TableDrivenDecisionTree)initWithComponentControllers:(id)a3 hotspotControllers:(id)a4 decisionTreeTable:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TableDrivenDecisionTree;
  v8 = -[TableDrivenDecisionTree init](&v11, "init");
  v9 = (TableDrivenDecisionTree *)v8;
  if (v8)
  {
    *((void *)v8 + 1) = a3;
    *((void *)v8 + 2) = a4;
    *((void *)v8 + 3) = 0LL;
    *((void *)v8 + 4) = 0LL;
    v8[40] = 0;
    *(void *)(v8 + 49) = 0LL;
    *(void *)(v8 + 41) = 0LL;
    v8[57] = 0;
    [v8 initDecisionTable:a5];
  }

  return v9;
}

- (int)getMTypeFromComponent:(int)a3
{
  else {
    return dword_1000480E8[a3];
  }
}

- (void)actionComponentControl
{
  if (byte_10007D4D9)
  {
    if (byte_10007C468) {
      int v11 = 0;
    }
    else {
      int v11 = 10;
    }
    byte_10007C468 = BYTE5(qword_10007D4C8) - self->releaseMaxLoadIndexForComponent[5] > v11;
  }

  uint64_t v3 = 0LL;
  maxLoadIndexForComponent = self->maxLoadIndexForComponent;
  do
  {
    id v5 = -[TableDrivenDecisionTree findCC:]( self,  "findCC:",  -[TableDrivenDecisionTree getMTypeFromComponent:](self, "getMTypeFromComponent:", v3));
    if (v5)
    {
      v6 = v5;
      if (v3 == 3 && [v5 shouldSuppressMitigations])
      {
        v7 = v6;
        uint64_t v8 = 100LL;
        uint64_t v9 = 100LL;
      }

      else
      {
        if (!byte_10007D4D9 || (byte_10007C468 & 1) != 0)
        {
          [v6 setMaxLoadingIndex:maxLoadIndexForComponent[v3] releaseIndex:maxLoadIndexForComponent[v3 + 17]];
          v45[v3] = [v6 getReleaseMaxLI];
          goto LABEL_13;
        }

        uint64_t v8 = *((unsigned __int8 *)&qword_10007D4C8 + v3);
        v7 = v6;
        uint64_t v9 = v8;
      }

      [v7 setMaxLoadingIndex:v8 releaseIndex:v9];
    }

    else
    {
      v45[v3] = 101;
    }

- (int)getReleaseRateForComponent:(int)a3
{
  return objc_msgSend( -[TableDrivenDecisionTree findCC:]( self,  "findCC:",  -[TableDrivenDecisionTree getMTypeFromComponent:]( self,  "getMTypeFromComponent:",  *(void *)&a3)),  "getReleaseRate");
}

- (void)readReleaseRateForAllComponents
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100013F04;
  block[3] = &unk_1000614D0;
  block[4] = self;
  if (qword_10007C470 != -1) {
    dispatch_once(&qword_10007C470, block);
  }
}

- (void)evaluateDecisionTree
{
  uint64_t v3 = 0LL;
  releaseMaxLoadIndexForComponent = self->releaseMaxLoadIndexForComponent;
  maxLoadIndexForComponent = self->maxLoadIndexForComponent;
  int v4 = -[NSArray count](self->_hotspotControllers, "count");
  do
  {
    if (v4 < 1)
    {
      LOBYTE(v7) = 101;
      LOBYTE(v6) = 101;
    }

    else
    {
      uint64_t v5 = 0LL;
      int v6 = 101;
      int v7 = 101;
      do
      {
        id v8 = -[NSArray objectAtIndex:]( self->_hotspotControllers,  "objectAtIndex:",  v5,  releaseMaxLoadIndexForComponent,  maxLoadIndexForComponent);
        signed int v9 = [v8 maxLIForComponent:v3];
        signed int v10 = [v8 releaseMaxLIForComponent:v3 releaseRate:self->releaseRateForComponent[v3]];
        if (v6 >= v9) {
          int v6 = v9;
        }
        if (v7 >= v10) {
          int v7 = v10;
        }
        ++v5;
      }

      while (v4 != v5);
    }

    maxLoadIndexForComponent[v3] = v6;
    releaseMaxLoadIndexForComponent[v3++] = v7;
  }

  while (v3 != 17);
  -[TableDrivenDecisionTree actionComponentControl](self, "actionComponentControl");
}

- (id)findCC:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  componentControllers = self->_componentControllers;
  id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( componentControllers,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (!v5) {
    return 0LL;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0LL;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(componentControllers);
    }
    signed int v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (v6 == (id)++v8)
    {
      id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( componentControllers,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      if (v6) {
        goto LABEL_3;
      }
      return 0LL;
    }
  }

- (void)initDecisionTable:(__CFDictionary *)a3
{
  if (a3 && CFDictionaryGetCount(a3) >= 1)
  {
    uint64_t v5 = 0LL;
    do
    {
      CFIndex v6 = v5 + 1;
      CFStringRef v7 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"HotSpotDecisionTableNormal%d", v5 + 1);
      if (v7)
      {
        CFStringRef v8 = v7;
        Value = CFDictionaryGetValue(a3, v7);
        if (Value)
        {
          objc_msgSend( -[NSArray objectAtIndex:](self->_hotspotControllers, "objectAtIndex:", v5),  "setDecisionTableSection:",  Value);
          -[TableDrivenDecisionTree readReleaseRateForAllComponents](self, "readReleaseRateForAllComponents");
        }

        CFRelease(v8);
      }

      ++v5;
    }

    while (CFDictionaryGetCount(a3) > v6);
  }

@end