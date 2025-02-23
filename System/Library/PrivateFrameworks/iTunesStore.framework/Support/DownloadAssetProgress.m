@interface DownloadAssetProgress
- (DownloadAssetProgress)init;
- (double)progress;
- (id)_newProgressForMediaSelection:(id)a3;
- (unint64_t)numAudioSelectionsToBeDownloaded;
- (unint64_t)numMediaSelectionsCompleted;
- (unint64_t)numSubtitleSelectionsToBeDownloaded;
- (void)setMediaSelectionDidComplete:(id)a3;
- (void)setNumAudioSelectionsToBeDownloaded:(unint64_t)a3;
- (void)setNumSubtitleSelectionsToBeDownloaded:(unint64_t)a3;
- (void)setProgress:(double)a3 forMediaSelection:(id)a4;
@end

@implementation DownloadAssetProgress

- (DownloadAssetProgress)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DownloadAssetProgress;
  v2 = -[DownloadAssetProgress init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToStrongObjectsMapTable"));
    mediaSelectionToProgressMap = v2->_mediaSelectionToProgressMap;
    v2->_mediaSelectionToProgressMap = (NSMapTable *)v3;
  }

  return v2;
}

- (double)progress
{
  return result;
}

- (void)setProgress:(double)a3 forMediaSelection:(id)a4
{
  id v13 = a4;
  if (!self->_overallProgress)
  {
    objc_super v6 = (NSProgress *)objc_claimAutoreleasedReturnValue( +[NSProgress progressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "progressWithTotalUnitCount:",  100000LL));
    overallProgress = self->_overallProgress;
    self->_overallProgress = v6;
  }

  mediaSelectionToProgressMap = self->_mediaSelectionToProgressMap;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_numMediaSelectionsCompleted));
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](mediaSelectionToProgressMap, "objectForKey:", v9));

  if (!v10)
  {
    id v10 = -[DownloadAssetProgress _newProgressForMediaSelection:](self, "_newProgressForMediaSelection:", v13);
    -[NSProgress addChild:withPendingUnitCount:]( self->_overallProgress,  "addChild:withPendingUnitCount:",  v10,  [v10 totalUnitCount]);
    v11 = self->_mediaSelectionToProgressMap;
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_numMediaSelectionsCompleted));
    -[NSMapTable setObject:forKey:](v11, "setObject:forKey:", v10, v12);
  }

  if (a3 > 1.0) {
    a3 = 1.0;
  }
  objc_msgSend(v10, "setCompletedUnitCount:", (uint64_t)(a3 * (double)(uint64_t)objc_msgSend(v10, "totalUnitCount")));
}

- (void)setMediaSelectionDidComplete:(id)a3
{
}

- (id)_newProgressForMediaSelection:(id)a3
{
  if (self->_numMediaSelectionsCompleted)
  {
    id v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 asset]);
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaSelectionGroupForMediaCharacteristic:AVMediaCharacteristicLegible]);

    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 selectedMediaOptionInMediaSelectionGroup:v6]);
    if (v7)
    {
      unint64_t v8 = -[DownloadAssetProgress numSubtitleSelectionsToBeDownloaded](self, "numSubtitleSelectionsToBeDownloaded");
      BOOL v9 = (uint64_t)v8 < 1;
      unint64_t v10 = 0x7D0 / v8;
    }

    else
    {
      unint64_t v12 = -[DownloadAssetProgress numAudioSelectionsToBeDownloaded](self, "numAudioSelectionsToBeDownloaded");
      BOOL v9 = (uint64_t)(v12 - 1) < 1;
      unint64_t v10 = 0xBB8 / (v12 - 1);
    }

    if (v9) {
      uint64_t v11 = 0LL;
    }
    else {
      uint64_t v11 = v10;
    }
  }

  else
  {
    uint64_t v11 = 95000LL;
  }

  return (id)objc_claimAutoreleasedReturnValue(+[NSProgress progressWithTotalUnitCount:](&OBJC_CLASS___NSProgress, "progressWithTotalUnitCount:", v11));
}

- (unint64_t)numAudioSelectionsToBeDownloaded
{
  return self->_numAudioSelectionsToBeDownloaded;
}

- (void)setNumAudioSelectionsToBeDownloaded:(unint64_t)a3
{
  self->_numAudioSelectionsToBeDownloaded = a3;
}

- (unint64_t)numSubtitleSelectionsToBeDownloaded
{
  return self->_numSubtitleSelectionsToBeDownloaded;
}

- (void)setNumSubtitleSelectionsToBeDownloaded:(unint64_t)a3
{
  self->_numSubtitleSelectionsToBeDownloaded = a3;
}

- (unint64_t)numMediaSelectionsCompleted
{
  return self->_numMediaSelectionsCompleted;
}

- (void).cxx_destruct
{
}

@end