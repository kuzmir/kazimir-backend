var Kzmr = {

  Map: {

    map: null,
    line: null,

    init: function(){
      if($("#map").length === 0) return;
      this.initGoogleMap();
    },

    // load the google map script asynchronously
    initGoogleMap: function(){

      // already initialized
      if(typeof window.google !== 'undefined'){
        this.mapOnLoad();
        return true;
      }

      var script = document.createElement('script');
      script.type = 'text/javascript';
      script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&key= ' + window.google_maps_api_key + '&callback=Kzmr.Map.mapOnLoad'
      document.body.appendChild(script);
    },

    // map load callback
    // when the map script is ready
    // create map, store instance
    mapOnLoad: function(){

      var mapOptions = {
        zoom: 16,
        center: new google.maps.LatLng(50.0491111, 19.9445078), // Kazimierz center
        disableDefaultUI: true
      };

      this.map = new google.maps.Map($('#map').get(0), mapOptions);

      this.initializeEvent();
      this.restorePath();

    },

    initializeEvent: function(){
      $('.js-edit-path').on('click', this.enableEditPath.bind(this));
      $('.js-undo-path').on('click', this.undoPath.bind(this));
      $('.js-finish-path').on('click', this.finishPath.bind(this));
    },

    // restore path from serialized input
    // deserialize, create polyline and push it to map
    restorePath: function(){

      var serializedPath = $('#street_path').val(),
          points, path,
          point, gpoint,
          bounds;

      // if serialized path was not given, just return;
      if(serializedPath === '') return;

      // eg. 50.05321925103421,19.948650598526;50.04923051297238,19.950753450393677;
      // convert string to array (first remove last ;)
      points = serializedPath.slice(0,-1).split(';');


      // initialize polyline
      this.initPolyline();

      // get path (MCVArray from the polyline)
      path = this.line.getPath();

      // we'll also center based on polyline bounds
      bounds = new google.maps.LatLngBounds();

      // iterate over array to create MVCArray of points
      for(var i = 0; i < points.length; i++){
        // point like: 50.05321925103421,19.948650598526
        point = points[i].split(',');

        // create google point and push it to the array
        path.push(new google.maps.LatLng(point[0], point[1]));

        // extend bounds
        bounds.extend(new google.maps.LatLng(point[0], point[1]));

      }

      // assign path to the line
      this.line.setPath(path);

      // center map from line bounds
      this.map.setCenter(bounds.getCenter());

    },

    // starts editing path
    enableEditPath: function(event){

      // hide button
      var el = $(event.target);
      el.hide();

      $('.js-undo-path, .js-finish-path').removeClass('hide').hide().fadeIn()

      // create new Polyline instance
      if(this.line === null){
        this.initPolyline();
      }

      // make it editable
      this.line.setEditable(true);

      // bind the first event to the map
      this.mapClickHandler = google.maps.event.addListener(this.map, 'click', this.addPoints.bind(this));

      event.preventDefault();

    },

    initPolyline: function(){
      this.line = new google.maps.Polyline({
          strokeColor: '#2aa6c9',
          strokeOpacity: 0.8,
          strokeWeight: 10,
          editable: false
      });

      // attach it to the map
      this.line.setMap(this.map);

    },

    // insert polyline
    addPoints: function(e){

      // get path MVC array
      var path = this.line.getPath();

      // first click as element
      path.push(e.latLng);

    },

    // remove last point from the polyline
    undoPath: function(event){
      var path = this.line.getPath();
      // remove last point
      path.pop();

      event.preventDefault();
    },

    // make polyline uneditable, serializes the line to field
    finishPath: function(event){
      this.line.setEditable(false);

      $('.js-undo-path, .js-finish-path').hide();
      $('.js-edit-path').fadeIn();

      this.serializeLine();

      // deregister click listener
      google.maps.event.removeListener(this.mapClickHandler);

    },

    // serialize polyline path to string representation of points separated by ;
    serializeLine: function(){
      var path = this.line.getPath();

      var serializedPath = ''

      path.forEach(function(point){
        serializedPath += "" + point.lat() + ',' + point.lng() + ';'
      });

      $('#street_path').val(serializedPath);
    }


  }
};
