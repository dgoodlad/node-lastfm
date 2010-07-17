# node-lastfm

Very preliminary wrapper around the last.fm API. Use at your own risk.

Sample usage:

    var lastfm = new LastFmClient('yourapikey');
    var info = {
      artist: 'Chromeo',
      track: 'Call Me Up'
    };
    lastfm.get('track', 'getInfo', info).addListener('complete', function(data) {
      sys.puts(sys.inspect(data));
    });

Results in:

    { track: 
       { id: '95719409'
       , name: 'Call Me Up'
       , mbid: ''
       , url: 'http://www.last.fm/music/Chromeo/_/Call+Me+Up'
       , duration: '251000'
       , streamable: { '#text': '0', fulltrack: '0' }
       , listeners: '51378'
       , playcount: '203306'
       , artist: 
          { name: 'Chromeo'
          , mbid: '647221d0-f6b1-4e03-924c-c59b8059536f'
          , url: 'http://www.last.fm/music/Chromeo'
          }
       , album: 
          { artist: 'Chromeo'
          , title: 'Fancy Footwork'
          , mbid: '0c8adc4a-8bee-4245-b948-f396b3548c42'
          , url: 'http://www.last.fm/music/Chromeo/Fancy+Footwork'
          , image: [Object]
          , '@attr': [Object]
          }
       , toptags: { tag: [Object] }
       }
    }

