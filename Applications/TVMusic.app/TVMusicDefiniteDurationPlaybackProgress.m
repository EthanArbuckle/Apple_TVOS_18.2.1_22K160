@interface TVMusicDefiniteDurationPlaybackProgress
- (NSValueTransformer)valueTransformer;
- (TVMusicDefiniteDurationPlaybackProgress)init;
- (double)duration;
- (double)elapsedTime;
- (void)_updateTitles;
- (void)setDuration:(double)a3;
- (void)setElapsedTime:(double)a3;
- (void)setValueTransformer:(id)a3;
@end

@implementation TVMusicDefiniteDurationPlaybackProgress

- (TVMusicDefiniteDurationPlaybackProgress)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVMusicDefiniteDurationPlaybackProgress;
  v3 = -[TVMusicPlaybackProgress init](&v7, "init");
  if (v3)
  {
    uint64_t v4 = objc_opt_new(&OBJC_CLASS___TVMusicDurationValueTransformer, v2);
    valueTransformer = v3->_valueTransformer;
    v3->_valueTransformer = (NSValueTransformer *)v4;
  }

  return v3;
}

- (void)_updateTitles
{
  double v4 = *(double *)&v3;
  if (v3 > -1 && ((v3 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000LL) >> 53 < 0x3FF
    || (unint64_t)(v3 - 1) < 0xFFFFFFFFFFFFFLL
    || (v3 & 0x7FFFFFFFFFFFFFFFLL) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicDefiniteDurationPlaybackProgress valueTransformer](self, "valueTransformer"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v4));
    id v20 = (id)objc_claimAutoreleasedReturnValue([v8 transformedValue:v9]);

    -[TVMusicDefiniteDurationPlaybackProgress duration](self, "duration");
    v14 = 0LL;
    double v15 = NAN;
    double v11 = v10;
    if (v10 != TVPDurationUnknown && v10 != TVPDurationIndefinite)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", -(v10 - v4)));
      v14 = (void *)objc_claimAutoreleasedReturnValue([v8 transformedValue:v13]);

      double v15 = v4 / v11;
    }
  }

  else
  {
    v14 = 0LL;
    id v20 = 0LL;
    double v15 = NAN;
  }

  id v16 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackProgress currentTitle](self, "currentTitle"));

  id v17 = v20;
  if (v16 != v20)
  {
    -[TVMusicPlaybackProgress setCurrentTitle:](self, "setCurrentTitle:", v20);
    id v17 = v20;
  }

  id v21 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackProgress lastTitle](self, "lastTitle"));

  if (v18 != v14) {
    -[TVMusicPlaybackProgress setLastTitle:](self, "setLastTitle:", v14);
  }
  -[TVMusicPlaybackProgress progress](self, "progress");
  if (v19 != v15) {
    -[TVMusicPlaybackProgress setProgress:](self, "setProgress:", v15);
  }
}

- (void)setElapsedTime:(double)a3
{
  if (self->_elapsedTime != a3)
  {
    self->_elapsedTime = a3;
    -[TVMusicDefiniteDurationPlaybackProgress _updateTitles](self, "_updateTitles");
  }

- (void)setDuration:(double)a3
{
  if (self->_duration != a3)
  {
    self->_duration = a3;
    -[TVMusicDefiniteDurationPlaybackProgress _updateTitles](self, "_updateTitles");
  }

- (double)elapsedTime
{
  return self->_elapsedTime;
}

- (double)duration
{
  return self->_duration;
}

- (NSValueTransformer)valueTransformer
{
  return self->_valueTransformer;
}

- (void)setValueTransformer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end