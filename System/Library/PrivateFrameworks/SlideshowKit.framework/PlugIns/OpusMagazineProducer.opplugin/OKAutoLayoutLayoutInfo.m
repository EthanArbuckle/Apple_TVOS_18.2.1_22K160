@interface OKAutoLayoutLayoutInfo
- (BOOL)isSubtitle;
- (BOOL)isTitle;
- (CGRect)rectForRectName:(id)a3;
- (CGSize)targetScreenSize;
- (NSDictionary)origLayout;
- (NSMutableArray)areaPercentInAppearOrder;
- (NSMutableArray)aspectRatiosInAppearOrder;
- (NSMutableArray)rectNamesInAppearOrder;
- (NSString)name;
- (NSString)textWidgetName;
- (OKAutoLayoutLayoutInfo)initWithLayout:(id)a3;
- (float)baseScore;
- (float)currentScore;
- (unint64_t)numOfMedia;
- (void)_parseLayout;
- (void)dealloc;
- (void)setCurrentScore:(float)a3;
@end

@implementation OKAutoLayoutLayoutInfo

- (void)_parseLayout
{
  origLayout = self->_origLayout;
  if (origLayout)
  {
    objc_msgSend(-[NSDictionary objectForKey:](origLayout, "objectForKey:", @"baseScore"), "doubleValue");
    *(float *)&double v4 = v4;
    self->_currentScore = *(float *)&v4;
    self->_baseScore = *(float *)&v4;
    objc_msgSend(-[NSDictionary objectForKey:](self->_origLayout, "objectForKey:", @"screen rect"), "CGRectValue");
    double v6 = v5;
    double v8 = v7;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v9 = -[NSDictionary objectForKey:](self->_origLayout, "objectForKey:", @"appearOrder", 0LL);
    id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (!v10) {
      goto LABEL_19;
    }
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
    double v13 = v6 * v8;
    while (1)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        v15 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        id v16 = -[NSDictionary objectForKey:](self->_origLayout, "objectForKey:", v15);
        if ([v15 hasPrefix:@"media"])
        {
          objc_msgSend(objc_msgSend(v16, "objectForKey:", @"rect"), "CGRectValue");
          double v18 = v17;
          double v20 = v19;
          -[NSMutableArray addObject:]( self->_areaPercentInAppearOrder,  "addObject:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v17 * v19 / v13));
          -[NSMutableArray addObject:]( self->_aspectRatiosInAppearOrder,  "addObject:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v18 / v20));
          -[NSMutableArray addObject:](self->_rectNamesInAppearOrder, "addObject:", v15);
          continue;
        }

        if (objc_msgSend(objc_msgSend(v16, "objectForKeyedSubscript:", @"isTitle"), "BOOLValue")
          && !self->_isTitle)
        {
          self->_isTitle = 1;
LABEL_15:
          if (!self->_textWidgetName) {
            self->_textWidgetName = (NSString *)v15;
          }
          continue;
        }

        if (objc_msgSend(objc_msgSend(v16, "objectForKeyedSubscript:", @"isSubtitle"), "BOOLValue")
          && !self->_isSubtitle)
        {
          self->_isSubtitle = 1;
          goto LABEL_15;
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (!v11)
      {
LABEL_19:
        self->_numOfMedia = (unint64_t)-[NSMutableArray count](self->_aspectRatiosInAppearOrder, "count");
        return;
      }
    }
  }

- (OKAutoLayoutLayoutInfo)initWithLayout:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___OKAutoLayoutLayoutInfo;
  double v4 = -[OKAutoLayoutLayoutInfo init](&v6, "init");
  if (v4)
  {
    v4->_origLayout = (NSDictionary *)a3;
    v4->_areaPercentInAppearOrder = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    v4->_aspectRatiosInAppearOrder = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    v4->_rectNamesInAppearOrder = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    -[OKAutoLayoutLayoutInfo _parseLayout](v4, "_parseLayout");
  }

  return v4;
}

- (void)dealloc
{
  origLayout = self->_origLayout;
  if (origLayout)
  {

    self->_origLayout = 0LL;
  }

  areaPercentInAppearOrder = self->_areaPercentInAppearOrder;
  if (areaPercentInAppearOrder)
  {

    self->_areaPercentInAppearOrder = 0LL;
  }

  aspectRatiosInAppearOrder = self->_aspectRatiosInAppearOrder;
  if (aspectRatiosInAppearOrder)
  {

    self->_aspectRatiosInAppearOrder = 0LL;
  }

  rectNamesInAppearOrder = self->_rectNamesInAppearOrder;
  if (rectNamesInAppearOrder)
  {

    self->_rectNamesInAppearOrder = 0LL;
  }

  textWidgetName = self->_textWidgetName;
  if (textWidgetName)
  {

    self->_textWidgetName = 0LL;
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___OKAutoLayoutLayoutInfo;
  -[OKAutoLayoutLayoutInfo dealloc](&v8, "dealloc");
}

- (NSString)name
{
  return (NSString *)-[NSDictionary objectForKey:](self->_origLayout, "objectForKey:", @"name");
}

- (CGRect)rectForRectName:(id)a3
{
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGSize)targetScreenSize
{
  double v3 = v2;
  double v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (float)currentScore
{
  return self->_currentScore;
}

- (void)setCurrentScore:(float)a3
{
  self->_currentScore = a3;
}

- (float)baseScore
{
  return self->_baseScore;
}

- (unint64_t)numOfMedia
{
  return self->_numOfMedia;
}

- (NSMutableArray)areaPercentInAppearOrder
{
  return self->_areaPercentInAppearOrder;
}

- (NSMutableArray)aspectRatiosInAppearOrder
{
  return self->_aspectRatiosInAppearOrder;
}

- (NSMutableArray)rectNamesInAppearOrder
{
  return self->_rectNamesInAppearOrder;
}

- (NSDictionary)origLayout
{
  return self->_origLayout;
}

- (BOOL)isTitle
{
  return self->_isTitle;
}

- (BOOL)isSubtitle
{
  return self->_isSubtitle;
}

- (NSString)textWidgetName
{
  return self->_textWidgetName;
}

@end