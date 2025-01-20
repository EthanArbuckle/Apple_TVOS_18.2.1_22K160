@interface VOTTextMovementManager
- (NSArray)segments;
- (NSString)localizedSegmentName;
- (NSString)localizedSegmentNameForSelection;
- (VOTTextMovementManager)initWithSegments:(id)a3;
- (id)_localizedStringForKey:(id)a3;
- (int64_t)rotorType;
- (int64_t)segment;
- (unint64_t)segmentIndex;
- (void)nextSegment;
- (void)previousSegment;
- (void)setSegment:(int64_t)a3;
- (void)setSegmentIndex:(unint64_t)a3;
- (void)setSegments:(id)a3;
@end

@implementation VOTTextMovementManager

- (VOTTextMovementManager)initWithSegments:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___VOTTextMovementManager;
  v5 = -[VOTTextMovementManager init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    v5->_segmentIndex = 0LL;
    if ([v4 count])
    {
      v7 = (NSArray *)[v4 copy];
      segments = v6->_segments;
      v6->_segments = v7;
    }

    else
    {
      segments = v6->_segments;
      v6->_segments = (NSArray *)&off_100188FD0;
    }
  }

  return v6;
}

- (int64_t)segment
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTTextMovementManager segments](self, "segments"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v3,  "objectAtIndexedSubscript:",  -[VOTTextMovementManager segmentIndex](self, "segmentIndex")));
  id v5 = [v4 integerValue];

  return (int64_t)v5;
}

- (void)setSegment:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTTextMovementManager segments](self, "segments"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v7 = [v5 indexOfObject:v6];

  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL) {
    id v8 = 0LL;
  }
  else {
    id v8 = v7;
  }
  -[VOTTextMovementManager setSegmentIndex:](self, "setSegmentIndex:", v8);
}

- (NSString)localizedSegmentNameForSelection
{
  v3 = (char *)-[VOTTextMovementManager segment](self, "segment") - 1;
  else {
    uint64_t v4 = (uint64_t)*(&off_100179678 + (void)v3);
  }
  return (NSString *)-[VOTTextMovementManager _localizedStringForKey:](self, "_localizedStringForKey:", v4);
}

- (NSString)localizedSegmentName
{
  v3 = (char *)-[VOTTextMovementManager segment](self, "segment") - 1;
  else {
    uint64_t v4 = (uint64_t)*(&off_1001796B0 + (void)v3);
  }
  return (NSString *)-[VOTTextMovementManager _localizedStringForKey:](self, "_localizedStringForKey:", v4);
}

- (void)nextSegment
{
  unint64_t v3 = -[VOTTextMovementManager segmentIndex](self, "segmentIndex") + 1;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[VOTTextMovementManager segments](self, "segments"));
  -[VOTTextMovementManager setSegmentIndex:](self, "setSegmentIndex:", v3 % (unint64_t)[v4 count]);
}

- (void)previousSegment
{
  unint64_t v3 = (char *)-[VOTTextMovementManager segmentIndex](self, "segmentIndex") - 1;
  if ((uint64_t)v3 < 0)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[VOTTextMovementManager segments](self, "segments", v3));
    -[VOTTextMovementManager setSegmentIndex:](self, "setSegmentIndex:", (char *)[v4 count] - 1);
  }

  else
  {
    -[VOTTextMovementManager setSegmentIndex:](self, "setSegmentIndex:", v3);
  }

- (id)_localizedStringForKey:(id)a3
{
  unint64_t v3 = (void *)VOTSharedWorkspace;
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 selectedLanguage]);
  id v6 = sub_10004A988(off_1001AC148, v4, v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (int64_t)rotorType
{
  return self->_rotorType;
}

- (unint64_t)segmentIndex
{
  return self->_segmentIndex;
}

- (void)setSegmentIndex:(unint64_t)a3
{
  self->_segmentIndex = a3;
}

- (NSArray)segments
{
  return self->_segments;
}

- (void)setSegments:(id)a3
{
}

- (void).cxx_destruct
{
}

@end