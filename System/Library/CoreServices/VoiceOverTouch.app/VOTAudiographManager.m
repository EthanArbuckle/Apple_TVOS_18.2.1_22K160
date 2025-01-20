@interface VOTAudiographManager
- (BOOL)willPlayheadPositionChangePassGridline:(double)a3;
- (VOTElement)currentChartElement;
- (double)lastProgressNotificationTime;
- (void)announceValueForPlayheadPosition;
- (void)dataSonifierPlaybackDidEndAtPosition:(double)a3;
- (void)dataSonifierPlaybackDidPauseAtPosition:(double)a3;
- (void)dataSonifierPlaybackDidResumeAtPosition:(double)a3;
- (void)dataSonifierPlaybackProgressDidChange:(double)a3;
- (void)dataSonifierScrubbingDidBeginAtPosition:(double)a3;
- (void)dataSonifierScrubbingDidEndAtPosition:(double)a3;
- (void)notifyElementOfPlaybackProgress:(double)a3;
- (void)notifyElementOfPlaybackStatusChange;
- (void)scrubToPosition:(double)a3;
- (void)setCurrentChartElement:(id)a3;
- (void)setLastProgressNotificationTime:(double)a3;
- (void)stopSpeaking;
@end

@implementation VOTAudiographManager

- (void)setCurrentChartElement:(id)a3
{
  id v9 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[VOTAudiographManager currentChartElement](self, "currentChartElement"));

  v6 = v9;
  if (v5 != v9)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v9 chartDescriptor]);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXMDataSonifier sharedInstance](&OBJC_CLASS___AXMDataSonifier, "sharedInstance"));
    [v8 setCurrentChartDescriptor:v7];

    objc_storeStrong((id *)&self->_currentChartElement, a3);
    v6 = v9;
  }
}

- (void)scrubToPosition:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___VOTAudiographManager;
  -[VOTAudiographManager scrubToPosition:](&v5, "scrubToPosition:");
  -[VOTAudiographManager willPlayheadPositionChangePassGridline:](self, "willPlayheadPositionChangePassGridline:", a3);
}

- (void)announceValueForPlayheadPosition
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[VOTAudiographManager valueDescriptionForPlayheadPosition](self, "valueDescriptionForPlayheadPosition"));
  if ([v4 length])
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
    id v3 = [v4 copy];
    [v2 speakSimpleString:v3];
  }
}

- (void)stopSpeaking
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
  [v2 stopSpeakingAtBoundary:0];
}

- (void)dataSonifierPlaybackDidPauseAtPosition:(double)a3
{
}

- (void)dataSonifierPlaybackDidResumeAtPosition:(double)a3
{
}

- (void)dataSonifierPlaybackDidEndAtPosition:(double)a3
{
  id v4 = off_1001AC148;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTAudiographManager currentChartElement](self, "currentChartElement", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 language]);
  id v7 = sub_10004A988(v4, @"search.rotor.audiograph.completed.sonification", v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
  [v8 speakSimpleString:v9];

  -[VOTAudiographManager notifyElementOfPlaybackStatusChange](self, "notifyElementOfPlaybackStatusChange");
}

- (void)dataSonifierPlaybackProgressDidChange:(double)a3
{
}

- (void)dataSonifierScrubbingDidBeginAtPosition:(double)a3
{
}

- (void)dataSonifierScrubbingDidEndAtPosition:(double)a3
{
}

- (void)notifyElementOfPlaybackProgress:(double)a3
{
  double Current = CFAbsoluteTimeGetCurrent();
  -[VOTAudiographManager lastProgressNotificationTime](self, "lastProgressNotificationTime");
  if (Current > v6 + 0.01)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTAudiographManager currentChartElement](self, "currentChartElement"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 uiElement]);
    *(float *)&double v9 = a3;
    [v8 setAXAttribute:2708 withFloat:v9];

    -[VOTAudiographManager setLastProgressNotificationTime:](self, "setLastProgressNotificationTime:", Current);
  }

- (void)notifyElementOfPlaybackStatusChange
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[VOTAudiographManager sharedManager](&OBJC_CLASS___VOTAudiographManager, "sharedManager"));
  id v4 = [v3 playbackStatus];

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[VOTAudiographManager currentChartElement](self, "currentChartElement"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v7 uiElement]);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v4));
  [v5 setAXAttribute:2716 withNumber:v6];
}

- (BOOL)willPlayheadPositionChangePassGridline:(double)a3
{
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTAudiographManager xGridlinePositions](self, "xGridlinePositions"));
  id v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0LL;
    BOOL v8 = 1;
    do
    {
      double v9 = (double)v7 / (double)(unint64_t)v6;
      if (v9 != 0.0 && v9 != 1.0)
      {
        -[VOTAudiographManager lastPlayheadPosition](self, "lastPlayheadPosition");
        if (v9 <= a3 && v11 <= v9) {
          break;
        }
        -[VOTAudiographManager lastPlayheadPosition](self, "lastPlayheadPosition");
        if (v9 >= a3 && v13 >= v9) {
          break;
        }
      }

      BOOL v8 = ++v7 < (unint64_t)v6;
    }

    while (v6 != (id)v7);
  }

  else
  {
    return 0;
  }

  return v8;
}

- (VOTElement)currentChartElement
{
  return self->_currentChartElement;
}

- (double)lastProgressNotificationTime
{
  return self->_lastProgressNotificationTime;
}

- (void)setLastProgressNotificationTime:(double)a3
{
  self->_lastProgressNotificationTime = a3;
}

- (void).cxx_destruct
{
}

@end