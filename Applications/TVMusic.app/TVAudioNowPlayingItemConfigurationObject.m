@interface TVAudioNowPlayingItemConfigurationObject
- (BOOL)_isStringEqual:(id)a3 rhsString:(id)a4;
- (BOOL)explicit;
- (BOOL)isEqual:(id)a3;
- (BOOL)repeating;
- (BOOL)shuffleEnabled;
- (BOOL)streaming;
- (NSString)albumTitle;
- (NSString)artistName;
- (NSString)artworkIdentifier;
- (NSString)radioStationAttribution;
- (NSString)radioStationName;
- (NSString)trackTitle;
- (TVImageProxy)artworkProxy;
- (double)duration;
- (unint64_t)playlistTrackCount;
- (unint64_t)trackNumber;
- (void)setAlbumTitle:(id)a3;
- (void)setArtistName:(id)a3;
- (void)setArtworkIdentifier:(id)a3;
- (void)setArtworkProxy:(id)a3;
- (void)setDuration:(double)a3;
- (void)setExplicit:(BOOL)a3;
- (void)setPlaylistTrackCount:(unint64_t)a3;
- (void)setRadioStationAttribution:(id)a3;
- (void)setRadioStationName:(id)a3;
- (void)setRepeating:(BOOL)a3;
- (void)setShuffleEnabled:(BOOL)a3;
- (void)setStreaming:(BOOL)a3;
- (void)setTrackNumber:(unint64_t)a3;
- (void)setTrackTitle:(id)a3;
@end

@implementation TVAudioNowPlayingItemConfigurationObject

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  trackTitle = self->_trackTitle;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 trackTitle]);
  if (-[TVAudioNowPlayingItemConfigurationObject _isStringEqual:rhsString:]( self,  "_isStringEqual:rhsString:",  trackTitle,  v6))
  {
    artistName = self->_artistName;
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 artistName]);
    if (!-[TVAudioNowPlayingItemConfigurationObject _isStringEqual:rhsString:]( self,  "_isStringEqual:rhsString:",  artistName,  v8))
    {
      LOBYTE(v20) = 0;
LABEL_46:

      goto LABEL_47;
    }

    albumTitle = self->_albumTitle;
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 albumTitle]);
    if (!-[TVAudioNowPlayingItemConfigurationObject _isStringEqual:rhsString:]( self,  "_isStringEqual:rhsString:",  albumTitle,  v10))
    {
      LOBYTE(v20) = 0;
LABEL_45:

      goto LABEL_46;
    }

    radioStationName = self->_radioStationName;
    v12 = (void *)objc_claimAutoreleasedReturnValue([v4 radioStationName]);
    if (!-[TVAudioNowPlayingItemConfigurationObject _isStringEqual:rhsString:]( self,  "_isStringEqual:rhsString:",  radioStationName,  v12))
    {
      LOBYTE(v20) = 0;
LABEL_44:

      goto LABEL_45;
    }

    radioStationAttribution = self->_radioStationAttribution;
    v14 = (void *)objc_claimAutoreleasedReturnValue([v4 radioStationAttribution]);
    if (!-[TVAudioNowPlayingItemConfigurationObject _isStringEqual:rhsString:]( self,  "_isStringEqual:rhsString:",  radioStationAttribution,  v14))
    {
      LOBYTE(v20) = 0;
LABEL_43:

      goto LABEL_44;
    }

    artworkIdentifier = self->_artworkIdentifier;
    v16 = (void *)objc_claimAutoreleasedReturnValue([v4 artworkIdentifier]);
    if (!-[TVAudioNowPlayingItemConfigurationObject _isStringEqual:rhsString:]( self,  "_isStringEqual:rhsString:",  artworkIdentifier,  v16))
    {
      LOBYTE(v20) = 0;
LABEL_42:

      goto LABEL_43;
    }

    artworkProxy = self->_artworkProxy;
    if (artworkProxy)
    {
      v39 = self->_artworkProxy;
      uint64_t v18 = objc_claimAutoreleasedReturnValue([v4 artworkProxy]);
      v19 = self->_artworkProxy;
      if (v18)
      {
        v38 = (void *)v18;
        uint64_t v20 = objc_claimAutoreleasedReturnValue([v4 artworkProxy]);
        if ((-[TVImageProxy isEqual:](v19, "isEqual:", v20) & 1) != 0)
        {
          v35 = (void *)v20;
          int v37 = 0;
          LODWORD(v20) = 1;
          goto LABEL_24;
        }

        artworkProxy = v39;
        if (self->_artworkProxy)
        {

          LOBYTE(v20) = 0;
          v24 = v38;
          goto LABEL_41;
        }

        uint64_t v36 = v20;
        LODWORD(v20) = 1;
        id v21 = objc_msgSend(v4, "artworkProxy", v36);
LABEL_19:
        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        if (v22)
        {
          BOOL v23 = 0;
          goto LABEL_35;
        }

        v39 = artworkProxy;
        int v37 = 1;
LABEL_24:
        id trackNumber = (id)self->_trackNumber;
        if (trackNumber == objc_msgSend(v4, "trackNumber", v35)
          && (id playlistTrackCount = (id)self->_playlistTrackCount,
              playlistTrackCount == [v4 playlistTrackCount])
          && (double duration = self->_duration, [v4 duration], duration == v28)
          && (int shuffleEnabled = self->_shuffleEnabled, shuffleEnabled == [v4 shuffleEnabled])
          && (int repeating = self->_repeating, repeating == [v4 repeating])
          && (int streaming = self->_streaming, streaming == [v4 streaming]))
        {
          int explicit = self->_explicit;
          BOOL v23 = explicit == [v4 explicit];
          if ((v37 & 1) == 0) {
            goto LABEL_31;
          }
        }

        else
        {
          BOOL v23 = 0;
          if (!v37)
          {
LABEL_31:
            artworkProxy = v39;
            if (!(_DWORD)v20)
            {
LABEL_37:
              LOBYTE(v20) = v23;
              v24 = v38;
              if (!artworkProxy) {
                goto LABEL_42;
              }
              goto LABEL_41;
            }

- (BOOL)_isStringEqual:(id)a3 rhsString:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  id v6 = a4;
  unint64_t v7 = (unint64_t)v6;
  BOOL v8 = v5 && v6 && ([(id)v5 isEqualToString:v6] & 1) != 0 || (v5 | v7) == 0;

  return v8;
}

- (NSString)trackTitle
{
  return self->_trackTitle;
}

- (void)setTrackTitle:(id)a3
{
}

- (NSString)artistName
{
  return self->_artistName;
}

- (void)setArtistName:(id)a3
{
}

- (NSString)albumTitle
{
  return self->_albumTitle;
}

- (void)setAlbumTitle:(id)a3
{
}

- (NSString)radioStationAttribution
{
  return self->_radioStationAttribution;
}

- (void)setRadioStationAttribution:(id)a3
{
}

- (NSString)radioStationName
{
  return self->_radioStationName;
}

- (void)setRadioStationName:(id)a3
{
}

- (NSString)artworkIdentifier
{
  return self->_artworkIdentifier;
}

- (void)setArtworkIdentifier:(id)a3
{
}

- (TVImageProxy)artworkProxy
{
  return self->_artworkProxy;
}

- (void)setArtworkProxy:(id)a3
{
}

- (unint64_t)trackNumber
{
  return self->_trackNumber;
}

- (void)setTrackNumber:(unint64_t)a3
{
  self->_id trackNumber = a3;
}

- (unint64_t)playlistTrackCount
{
  return self->_playlistTrackCount;
}

- (void)setPlaylistTrackCount:(unint64_t)a3
{
  self->_id playlistTrackCount = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_double duration = a3;
}

- (BOOL)shuffleEnabled
{
  return self->_shuffleEnabled;
}

- (void)setShuffleEnabled:(BOOL)a3
{
  self->_int shuffleEnabled = a3;
}

- (BOOL)repeating
{
  return self->_repeating;
}

- (void)setRepeating:(BOOL)a3
{
  self->_int repeating = a3;
}

- (BOOL)streaming
{
  return self->_streaming;
}

- (void)setStreaming:(BOOL)a3
{
  self->_int streaming = a3;
}

- (BOOL)explicit
{
  return self->_explicit;
}

- (void)setExplicit:(BOOL)a3
{
  self->_int explicit = a3;
}

- (void).cxx_destruct
{
}

@end